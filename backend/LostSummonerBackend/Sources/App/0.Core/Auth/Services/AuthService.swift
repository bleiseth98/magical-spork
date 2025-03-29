//
//  AuthService.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

struct AuthService {
    //MARK: Register
    func register(username: String, password: String, db: any Database) async throws -> AuthTokenPairResponse {
        guard username.count >= 3 else {
            throw Abort(.badRequest, reason: "Username must be at least 3 characters.")
        }

        guard password.count >= 6 else {
            throw Abort(.badRequest, reason: "Password must be at least 6 characters.")
        }
        print("Creating user")
        let hash = try Bcrypt.hash(password)
        let user = AuthUser(
            username: username,
            passwordHash: hash,
            role: .player
        )

        try await user.save(on: db)
        print("User created with ID: \(user.id!)") 
        let userID = try user.requireID()
        
        let playerService = PlayerService()
        let player = playerService.createPlayerWith(id: userID, name: username)
        let lomonService = LomonService()
        let lomon = lomonService.createFirstLomonFor(id: player.id!)
        
        player.currentLomonID = lomon.id!
        try await player.save(on: db)
        print("Player saved")
        let accessToken = AuthUserToken(
            value: [UInt8].random(count: 32).base64,
            userID: userID,
            type: .access,
            expiresAt: Date().addingTimeInterval(60 * 60 * 24 * 3) // 3 days
        )

        let refreshToken = AuthUserToken(
            value: [UInt8].random(count: 32).base64,
            userID: userID,
            type: .refresh,
            expiresAt: Date().addingTimeInterval(60 * 60 * 24 * 30) // 30 days
        )

        try await accessToken.save(on: db)
        try await refreshToken.save(on: db)
        print("Tokens saved")
        return AuthTokenPairResponse(accessToken: accessToken.value, refreshToken: refreshToken.value, userID: userID)
    }

    //MARK: Login
    func login(username: String, password: String, db: any Database) async throws -> AuthTokenPairResponse {
        guard let user = try await AuthUser.query(on: db)
            .filter(\.$username == username)
            .first()
        else {
            throw Abort(.unauthorized, reason: "Invalid credentials.")
        }

        guard try Bcrypt.verify(password, created: user.passwordHash) else {
            throw Abort(.unauthorized, reason: "Invalid credentials.")
        }

        let userID = try user.requireID()

        let accessToken = AuthUserToken(
            value: [UInt8].random(count: 32).base64,
            userID: userID,
            type: .access,
            expiresAt: Date().addingTimeInterval(60 * 60 * 24 * 3) // 3 days
        )

        let refreshToken = AuthUserToken(
            value: [UInt8].random(count: 32).base64,
            userID: userID,
            type: .refresh,
            expiresAt: Date().addingTimeInterval(60 * 60 * 24 * 30) // 30 days
        )

        try await accessToken.save(on: db)
        try await refreshToken.save(on: db)

        return AuthTokenPairResponse(accessToken: accessToken.value, refreshToken: refreshToken.value, userID: userID)
    }
    //MARK: Refresh
    func refreshToken(refreshTokenValue: String, db: any Database) async throws -> AuthTokenPairResponse {
        guard let oldToken = try await AuthUserToken.query(on: db)
            .filter(\.$value == refreshTokenValue)
            .filter(\.$type == .refresh)
            .first(),
            oldToken.isValid
        else {
            throw Abort(.unauthorized, reason: "Invalid or expired refresh token.")
        }

        let userID = oldToken.$user.id

        // Invalidate old refresh token
        try await oldToken.delete(on: db)

        // Generate new tokens
        let newAccessToken = AuthUserToken(
            value: [UInt8].random(count: 32).base64,
            userID: userID,
            type: .access,
            expiresAt: Date().addingTimeInterval(60 * 60 * 24 * 3) // 3 days
        )

        let newRefreshToken = AuthUserToken(
            value: [UInt8].random(count: 32).base64,
            userID: userID,
            type: .refresh,
            expiresAt: Date().addingTimeInterval(60 * 60 * 24 * 30) // 30 days
        )

        try await newAccessToken.save(on: db)
        try await newRefreshToken.save(on: db)

        return AuthTokenPairResponse(
            accessToken: newAccessToken.value,
            refreshToken: newRefreshToken.value,
            userID: userID
        )
    }

}
