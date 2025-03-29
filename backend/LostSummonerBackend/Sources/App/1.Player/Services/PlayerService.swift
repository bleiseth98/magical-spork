//
//  PlayerService.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

/*
 {
 "username": "player1",
 "password": "passwords"
 }
 
 {
 "refreshToken": "RdYibzCCCv7Xuv6YjTC2/amhQdn+yj28/QPfqt8yrGA=",
 "userID": "B954AB7B-C25D-488B-8349-EE0BEE57DE84",
 "accessToken": "mV8AK4tXdeuw1R5Zzej8ZhHHXE11YxmZZLgQzDCvfN8="
 }
 */

struct PlayerService {
    //MARK: Create
    func createPlayerWith(id: UUID, name: String) -> Player {
        let vipDurationInSeconds: TimeInterval = 60 * 60 * 24 * 10 // 10 days
        let vipEnd = Date().addingTimeInterval(vipDurationInSeconds).timeIntervalSince1970
        
        let player = Player(
            userID: id,
            id: UUID(),
            nickname: name.capitalized,
            level: 1,
            exp: 0,
            maxExp: 100,
            bp: 5,
            maxBp: 5,
            sp: 10,
            maxSp: 10,
            money: 0,
            coins: 0,
            vipEndTimestamp: vipEnd,
            reputation: 0,
            currentLomonID: UUID(),
            lastLogin: Date()
        )
        print("Player created with ID: \(player.id!)")
        return player
    }
    //MARK: Nickname
    func updateNickname(for user: AuthUser, to newNickname: String, db: any Database) async throws {
        guard let player = try await Player.query(on: db)
            .filter(\.$user.$id == user.requireID())
            .first() else {
            throw Abort(.notFound, reason: "Player not found.")
        }
        
        player.nickname = newNickname
        try await player.save(on: db)
    }
    //MARK: Level Up
    func checkForLevelUp(for user: AuthUser, db: any Database) async throws -> Player {
        guard let player = try await Player.query(on: db)
            .filter(\.$user.$id == user.requireID())
            .first() else {
            throw Abort(.notFound, reason: "Player not found.")
        }
        
        if player.exp >= player.maxExp {
            player.exp -= player.maxExp
            player.level += 1
            player.maxExp = Int(Double(player.maxExp) * 1.25) // example scaling
            try await player.save(on: db)
        }
        
        return player
    }
    //MARK: Daily Reward
    func claimDailyReward(for user: AuthUser, db: any Database) async throws -> Player {
        guard let player = try await Player.query(on: db)
            .filter(\.$user.$id == user.requireID())
            .first() else {
            throw Abort(.notFound, reason: "Player not found.")
        }
        
        let now = Date()
        let lastLogin = player.lastLogin
        
        if now.timeIntervalSince(lastLogin) >= 86400 { // 24 hours
            player.coins += 1
            player.lastLogin = now
            try await player.save(on: db)
        }
        
        return player
    }
}
