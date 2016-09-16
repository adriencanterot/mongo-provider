import Vapor
import FluentMongo

public class Provider:Vapor.Provider {
    
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
    
    public convenience init(config:Config) throws {
        
    }
    
}
