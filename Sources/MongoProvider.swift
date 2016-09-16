import Vapor
import FluentMongo

public class Provider:Vapor.Provider {
    
    public enum Error:Swift.Error {
        case noConfigFile
        case missingConfig(String)
    }
    
    public var provided:Providable
    
    public let driver:MongoDriver
    
    public let database:Database
    
    public init(database:String,
                user:String,
                password:String,
                host:String,
                port:Int) throws
    {
        self.driver = try MongoDriver(database: database, user: user, password: password, host: host, port: port)
        self.database = Database(self.driver)
        
        self.provided = Providable(database:self.database)
    }
    
    public convenience required init(config:Config) throws {
        
        guard let mongodb = config["mongodb"]?.object else {
            throw Error.noConfigFile
        }
        
        guard let database = mongodb["database"]?.string else {
            throw Error.missingConfig("database")
        }
        
        guard let user = mongodb["user"]?.string else {
            throw Error.missingConfig("user")
        }
        
        guard let password = mongodb["password"]?.string else {
            throw Error.missingConfig("password")
        }
        
        let host = mongodb["host"]?.string ?? "localhost"
        let port = mongodb["port"]?.int ?? 27017
        
        try self.init(database:database, user:user, password:password, host:host, port:port)
        
    }
    
    public func afterInit(_: Droplet) { }
    public func beforeServe(_: Droplet) { }
}
