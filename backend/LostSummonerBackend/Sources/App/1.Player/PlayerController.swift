//
//  PlayerController.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

struct PlayerController: RouteCollection {
    let service = PlayerService()
    func boot(routes: any RoutesBuilder) throws {
        let player = routes
            .grouped("player")
            .grouped(AuthUserToken.authenticator(), AuthUser.guardMiddleware())
        
        player.get("", use: getProfile)
        player.patch("nickname", use: changeNickname)
        player.post("levelup", use: checkLevelUp)
        player.post("daily", use: claimDailyReward)
    }
    
    func getProfile(req: Request) async throws -> Player {
        let user = try req.auth.require(AuthUser.self)
        
        guard let player = try await Player.query(on: req.db)
            .filter(\.$user.$id == user.requireID())
            .first()
        else {
            throw Abort(.notFound, reason: "Player profile not found.")
        }
        
        return player
    }
    
    func changeNickname(req: Request) async throws -> Player {
        let user = try req.auth.require(AuthUser.self)
        struct Input: Content { let nickname: String }
        let input = try req.content.decode(Input.self)
        try await service.updateNickname(for: user, to: input.nickname, db: req.db)
        return try await getProfile(req: req)
    }
    
    func checkLevelUp(req: Request) async throws -> Player {
        let user = try req.auth.require(AuthUser.self)
        return try await service.checkForLevelUp(for: user, db: req.db)
    }
    
    func claimDailyReward(req: Request) async throws -> Player {
        let user = try req.auth.require(AuthUser.self)
        return try await service.claimDailyReward(for: user, db: req.db)
    }
    
}
