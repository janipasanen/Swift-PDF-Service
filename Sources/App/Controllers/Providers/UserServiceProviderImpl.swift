//
//  UserServiceProviderImpl.swift
//  
//
//  Created by Jani Pasanen on 2024-09-02.
//

import GRPC
import Vapor

class UserServiceProviderImpl: UserServiceProvider {
    var interceptors: UserServiceServerInterceptorFactoryProtocol?
    
    func login(request: LoginRequest, context: StatusOnlyCallContext) -> EventLoopFuture<LoginResponse> {
        // Example login logic
        let accessToken = "dummyAccessToken"
        let refreshToken = "dummyRefreshToken"
        
        let response = LoginResponse.with {
            $0.accessToken = accessToken
            $0.refreshToken = refreshToken
        }
        return context.eventLoop.makeSucceededFuture(response)
    }

    func changePassword(request: ChangePasswordRequest, context: StatusOnlyCallContext) -> EventLoopFuture<ChangePasswordResponse> {
        // Example change password logic
        let success = true
        
        let response = ChangePasswordResponse.with {
            $0.success = success
        }
        return context.eventLoop.makeSucceededFuture(response)
    }

    func refreshAccessToken(request: RefreshTokenRequest, context: StatusOnlyCallContext) -> EventLoopFuture<RefreshTokenResponse> {
        // Example refresh token logic
        let newAccessToken = "newDummyAccessToken"
        
        let response = RefreshTokenResponse.with {
            $0.accessToken = newAccessToken
        }
        return context.eventLoop.makeSucceededFuture(response)
    }
}
