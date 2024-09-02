import Fluent
import FluentMySQLDriver
import Vapor
import GRPC
import NIO

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? MySQLConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .mysql)

    app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
    
    
    // Set up the gRPC server
    let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    let grpcServer: EventLoopFuture<GRPC.Server> = GRPC.Server.insecure(group: group)
        .withServiceProviders([
            UserServiceProviderImpl(), // Your UserService implementation
            DataServiceProviderImpl()  // Your DataService implementation
        ])
        .bind(host: "localhost", port: 50051)  // gRPC server on port 50051

    grpcServer.map { $0.channel.localAddress }
        .whenSuccess { address in
            app.logger.info("gRPC server started on port \(address?.port ?? 0)")
        }

    // Ensure the gRPC server shuts down gracefully when Vapor shuts down
    app.lifecycle.use(CustomLifecycleHandler(eventLoopGroup: group, server: grpcServer))
}

struct CustomLifecycleHandler: LifecycleHandler {
    let eventLoopGroup: EventLoopGroup
    let server: EventLoopFuture<GRPC.Server>  // Explicitly specify GRPC.Server
    
    func shutdown(_ application: Application) {
        server.whenComplete { result in
            switch result {
            case .success(let server):
                server.close().whenComplete { closeResult in
                    switch closeResult {
                    case .success:
                        self.eventLoopGroup.shutdownGracefully { error in
                            if let error = error {
                                application.logger.error("Failed to shutdown gRPC server: \(error)")
                            } else {
                                application.logger.info("gRPC server shut down successfully.")
                            }
                        }
                    case .failure(let error):
                        application.logger.error("Failed to close gRPC server: \(error)")
                    }
                }
            case .failure(let error):
                application.logger.error("Failed to retrieve gRPC server from future: \(error)")
                self.eventLoopGroup.shutdownGracefully { error in
                    if let error = error {
                        application.logger.error("Failed to shutdown gRPC server: \(error)")
                    }
                }
            }
        }
    }
}


