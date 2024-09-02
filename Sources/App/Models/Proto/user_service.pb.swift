// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Sources/App/Models/Proto/user_service.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct LoginRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var username: String = String()

  var password: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct LoginResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var accessToken: String = String()

  var refreshToken: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ChangePasswordRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var userID: String = String()

  var oldPassword: String = String()

  var newPassword: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ChangePasswordResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var success: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct RefreshTokenRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var refreshToken: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct RefreshTokenResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var accessToken: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension LoginRequest: @unchecked Sendable {}
extension LoginResponse: @unchecked Sendable {}
extension ChangePasswordRequest: @unchecked Sendable {}
extension ChangePasswordResponse: @unchecked Sendable {}
extension RefreshTokenRequest: @unchecked Sendable {}
extension RefreshTokenResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension LoginRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "LoginRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "username"),
    2: .same(proto: "password"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.username) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.password) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.username.isEmpty {
      try visitor.visitSingularStringField(value: self.username, fieldNumber: 1)
    }
    if !self.password.isEmpty {
      try visitor.visitSingularStringField(value: self.password, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: LoginRequest, rhs: LoginRequest) -> Bool {
    if lhs.username != rhs.username {return false}
    if lhs.password != rhs.password {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension LoginResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "LoginResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "accessToken"),
    2: .same(proto: "refreshToken"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.accessToken) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.refreshToken) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.accessToken.isEmpty {
      try visitor.visitSingularStringField(value: self.accessToken, fieldNumber: 1)
    }
    if !self.refreshToken.isEmpty {
      try visitor.visitSingularStringField(value: self.refreshToken, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: LoginResponse, rhs: LoginResponse) -> Bool {
    if lhs.accessToken != rhs.accessToken {return false}
    if lhs.refreshToken != rhs.refreshToken {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ChangePasswordRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ChangePasswordRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "userId"),
    2: .same(proto: "oldPassword"),
    3: .same(proto: "newPassword"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.oldPassword) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.newPassword) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if !self.oldPassword.isEmpty {
      try visitor.visitSingularStringField(value: self.oldPassword, fieldNumber: 2)
    }
    if !self.newPassword.isEmpty {
      try visitor.visitSingularStringField(value: self.newPassword, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ChangePasswordRequest, rhs: ChangePasswordRequest) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.oldPassword != rhs.oldPassword {return false}
    if lhs.newPassword != rhs.newPassword {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ChangePasswordResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ChangePasswordResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "success"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.success) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.success != false {
      try visitor.visitSingularBoolField(value: self.success, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ChangePasswordResponse, rhs: ChangePasswordResponse) -> Bool {
    if lhs.success != rhs.success {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension RefreshTokenRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "RefreshTokenRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "refreshToken"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.refreshToken) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.refreshToken.isEmpty {
      try visitor.visitSingularStringField(value: self.refreshToken, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: RefreshTokenRequest, rhs: RefreshTokenRequest) -> Bool {
    if lhs.refreshToken != rhs.refreshToken {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension RefreshTokenResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "RefreshTokenResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "accessToken"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.accessToken) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.accessToken.isEmpty {
      try visitor.visitSingularStringField(value: self.accessToken, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: RefreshTokenResponse, rhs: RefreshTokenResponse) -> Bool {
    if lhs.accessToken != rhs.accessToken {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
