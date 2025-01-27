//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Sources/App/Models/Proto/data_service.proto
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


/// Usage: instantiate `DataServiceClient`, then call methods of this protocol to make API calls.
internal protocol DataServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: DataServiceClientInterceptorFactoryProtocol? { get }

  func getDevice(
    _ request: GetDeviceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<GetDeviceRequest, Device>

  func setDevice(
    _ request: SetDeviceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<SetDeviceRequest, Device>
}

extension DataServiceClientProtocol {
  internal var serviceName: String {
    return "DataService"
  }

  /// Unary call to GetDevice
  ///
  /// - Parameters:
  ///   - request: Request to send to GetDevice.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getDevice(
    _ request: GetDeviceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<GetDeviceRequest, Device> {
    return self.makeUnaryCall(
      path: "/DataService/GetDevice",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetDeviceInterceptors() ?? []
    )
  }

  /// Unary call to SetDevice
  ///
  /// - Parameters:
  ///   - request: Request to send to SetDevice.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func setDevice(
    _ request: SetDeviceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SetDeviceRequest, Device> {
    return self.makeUnaryCall(
      path: "/DataService/SetDevice",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSetDeviceInterceptors() ?? []
    )
  }
}

internal protocol DataServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'getDevice'.
  func makeGetDeviceInterceptors() -> [ClientInterceptor<GetDeviceRequest, Device>]

  /// - Returns: Interceptors to use when invoking 'setDevice'.
  func makeSetDeviceInterceptors() -> [ClientInterceptor<SetDeviceRequest, Device>]
}

internal final class DataServiceClient: DataServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: DataServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the DataService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: DataServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol DataServiceProvider: CallHandlerProvider {
  var interceptors: DataServiceServerInterceptorFactoryProtocol? { get }

  func getDevice(request: GetDeviceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Device>

  func setDevice(request: SetDeviceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Device>
}

extension DataServiceProvider {
  internal var serviceName: Substring { return "DataService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "GetDevice":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<GetDeviceRequest>(),
        responseSerializer: ProtobufSerializer<Device>(),
        interceptors: self.interceptors?.makeGetDeviceInterceptors() ?? [],
        userFunction: self.getDevice(request:context:)
      )

    case "SetDevice":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SetDeviceRequest>(),
        responseSerializer: ProtobufSerializer<Device>(),
        interceptors: self.interceptors?.makeSetDeviceInterceptors() ?? [],
        userFunction: self.setDevice(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol DataServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'getDevice'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetDeviceInterceptors() -> [ServerInterceptor<GetDeviceRequest, Device>]

  /// - Returns: Interceptors to use when handling 'setDevice'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSetDeviceInterceptors() -> [ServerInterceptor<SetDeviceRequest, Device>]
}
