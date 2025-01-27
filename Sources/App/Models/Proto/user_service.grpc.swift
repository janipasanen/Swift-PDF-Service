//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Sources/App/Models/Proto/user_service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `UserServiceClient`, then call methods of this protocol to make API calls.
internal protocol UserServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: UserServiceClientInterceptorFactoryProtocol? { get }

  func login(
    _ request: LoginRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<LoginRequest, LoginResponse>

  func changePassword(
    _ request: ChangePasswordRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<ChangePasswordRequest, ChangePasswordResponse>

  func refreshAccessToken(
    _ request: RefreshTokenRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<RefreshTokenRequest, RefreshTokenResponse>
}

extension UserServiceClientProtocol {
  internal var serviceName: String {
    return "UserService"
  }

  /// Unary call to Login
  ///
  /// - Parameters:
  ///   - request: Request to send to Login.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func login(
    _ request: LoginRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<LoginRequest, LoginResponse> {
    return self.makeUnaryCall(
      path: "/UserService/Login",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLoginInterceptors() ?? []
    )
  }

  /// Unary call to ChangePassword
  ///
  /// - Parameters:
  ///   - request: Request to send to ChangePassword.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func changePassword(
    _ request: ChangePasswordRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<ChangePasswordRequest, ChangePasswordResponse> {
    return self.makeUnaryCall(
      path: "/UserService/ChangePassword",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeChangePasswordInterceptors() ?? []
    )
  }

  /// Unary call to RefreshAccessToken
  ///
  /// - Parameters:
  ///   - request: Request to send to RefreshAccessToken.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func refreshAccessToken(
    _ request: RefreshTokenRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<RefreshTokenRequest, RefreshTokenResponse> {
    return self.makeUnaryCall(
      path: "/UserService/RefreshAccessToken",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefreshAccessTokenInterceptors() ?? []
    )
  }
}

internal protocol UserServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'login'.
  func makeLoginInterceptors() -> [ClientInterceptor<LoginRequest, LoginResponse>]

  /// - Returns: Interceptors to use when invoking 'changePassword'.
  func makeChangePasswordInterceptors() -> [ClientInterceptor<ChangePasswordRequest, ChangePasswordResponse>]

  /// - Returns: Interceptors to use when invoking 'refreshAccessToken'.
  func makeRefreshAccessTokenInterceptors() -> [ClientInterceptor<RefreshTokenRequest, RefreshTokenResponse>]
}

internal final class UserServiceClient: UserServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: UserServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol UserServiceProvider: CallHandlerProvider {
  var interceptors: UserServiceServerInterceptorFactoryProtocol? { get }

  func login(request: LoginRequest, context: StatusOnlyCallContext) -> EventLoopFuture<LoginResponse>

  func changePassword(request: ChangePasswordRequest, context: StatusOnlyCallContext) -> EventLoopFuture<ChangePasswordResponse>

  func refreshAccessToken(request: RefreshTokenRequest, context: StatusOnlyCallContext) -> EventLoopFuture<RefreshTokenResponse>
}

extension UserServiceProvider {
  internal var serviceName: Substring { return "UserService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Login":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<LoginRequest>(),
        responseSerializer: ProtobufSerializer<LoginResponse>(),
        interceptors: self.interceptors?.makeLoginInterceptors() ?? [],
        userFunction: self.login(request:context:)
      )

    case "ChangePassword":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<ChangePasswordRequest>(),
        responseSerializer: ProtobufSerializer<ChangePasswordResponse>(),
        interceptors: self.interceptors?.makeChangePasswordInterceptors() ?? [],
        userFunction: self.changePassword(request:context:)
      )

    case "RefreshAccessToken":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<RefreshTokenRequest>(),
        responseSerializer: ProtobufSerializer<RefreshTokenResponse>(),
        interceptors: self.interceptors?.makeRefreshAccessTokenInterceptors() ?? [],
        userFunction: self.refreshAccessToken(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol UserServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'login'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLoginInterceptors() -> [ServerInterceptor<LoginRequest, LoginResponse>]

  /// - Returns: Interceptors to use when handling 'changePassword'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeChangePasswordInterceptors() -> [ServerInterceptor<ChangePasswordRequest, ChangePasswordResponse>]

  /// - Returns: Interceptors to use when handling 'refreshAccessToken'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRefreshAccessTokenInterceptors() -> [ServerInterceptor<RefreshTokenRequest, RefreshTokenResponse>]
}
