//
//  DataServiceProviderImpl.swift
//  
//
//  Created by Jani Pasanen on 2024-09-02.
//

import GRPC
import Vapor

class DataServiceProviderImpl: DataServiceProvider {
    var interceptors: DataServiceServerInterceptorFactoryProtocol?
    
    func getDevice(request: GetDeviceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Device> {
        // Example device retrieval logic
        let device = Device.with {
            $0.deviceID = request.deviceID
            $0.name = "DeviceName"
            $0.notes = "DeviceNotes"
        }
        return context.eventLoop.makeSucceededFuture(device)
    }

    func setDevice(request: SetDeviceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Device> {
        // Example device setting logic
        let device = Device.with {
            $0.deviceID = request.deviceID
            $0.name = request.name
            $0.notes = request.notes
        }
        return context.eventLoop.makeSucceededFuture(device)
    }
}
