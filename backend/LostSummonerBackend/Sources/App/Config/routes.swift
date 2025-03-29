import Fluent
import Vapor

public func routes(_ app: Application) throws {
    /// Public routes (no auth required)
    let auth = app.routes.grouped("auth")
    try app.register(collection: AuthController())
    
    /// Protected routes (auth required)
    let protectedAuth = auth.grouped(AuthUserToken.authenticator(), AuthUser.guardMiddleware())
    
    /// Admin routes (move this to it's own controller eventually)
    let adminOnly = app.routes
        .grouped("admin")
        .grouped(AuthUserToken.authenticator(), AuthUser.guardMiddleware())
        .grouped(RoleGuardMiddleware(.admin))

    adminOnly.get("dashboard") { req in
        return "Welcome, Admin!"
    }
   ///All other protected routes
    let protected = app.routes
            .grouped(AuthUserToken.authenticator(), AuthUser.guardMiddleware())
    try protected.register(collection: PlayerController())
 
}

