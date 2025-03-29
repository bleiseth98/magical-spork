//
//  AuthController.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

import Vapor

struct AuthController: RouteCollection {
    let authService = AuthService()

    func boot(routes: any RoutesBuilder) throws {
        let auth = routes.grouped("auth")
        auth.post("register", use: register)
        auth.post("login", use: login)
        auth.post("refresh", use: refresh)
        auth.post("logout", use: logout)
    }
    //MARK: Register
    func register(req: Request) async throws -> AuthTokenPairResponse {
        let register = try req.content.decode(RegisterRequest.self)
        return try await authService.register(username: register.username, password: register.password, db: req.db)
    }
    //MARK: Login
    func login(req: Request) async throws -> AuthTokenPairResponse {
        let login = try req.content.decode(LoginRequest.self)
        return try await authService.login(username: login.username, password: login.password, db: req.db)
    }
    //MARK: Refresh
    func refresh(req: Request) async throws -> AuthTokenPairResponse {
        let refresh = try req.content.decode(RefreshRequest.self)
        return try await authService.refreshToken(refreshTokenValue: refresh.refreshToken, db: req.db)
    }
    //MARK: Logout
    func logout(req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(AuthUser.self)

        // Get the token from the header and delete it
        guard let token = req.auth.get(AuthUserToken.self) else {
            throw Abort(.unauthorized, reason: "No token found in request.")
        }

        try await token.delete(on: req.db)
        return .ok
    }


}

/*
 func boot(routes: RoutesBuilder) throws {
     let authRoutes = routes.grouped("account")
     let protected = authRoutes.grouped(UserToken.authenticator(), User.guardMiddleware())

     protected.get("<#route#>", use: <#handler#>)
 }

 */

