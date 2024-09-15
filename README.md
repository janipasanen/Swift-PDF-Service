# Swift PDF Service
A Swift gRPC PDF generation service

Generate swift code from proto files using protoc

```
protoc --swift_out=./ --grpc-swift_out=./ ./Sources/App/Models/Proto/user_service.proto 
protoc --swift_out=./ --grpc-swift_out=./ ./Sources/App/Models/Proto/data_service.proto
```
