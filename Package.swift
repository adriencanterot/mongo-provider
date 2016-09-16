import PackageDescription

let package = Package(
    name: "MongoProvider",
    dependencies: [
        .Package(url:"https://github.com/vapor/vapor.git", majorVersion:0, minor:18),
        .Package(url:"https://github.com/vapor/mongo-driver.git", majorVersion:0, minor:2)
    ]
)
