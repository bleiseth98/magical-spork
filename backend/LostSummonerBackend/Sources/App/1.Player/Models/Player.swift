//
//  Player.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

final class Player: Model, Content, @unchecked Sendable {
    static let schema = "players"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: AuthUser

    @Field(key: "nickname")
    var nickname: String

    @Field(key: "level")
    var level: Int

    @Field(key: "exp")
    var exp: Int
    
    @Field(key: "maxExp")
    var maxExp: Int
    
    @Field(key: "battle_points")
    var bp: Int
    
    @Field(key: "max_battle_points")
    var maxBp: Int
    
    @Field(key: "stamina_points")
    var sp: Int
    
    @Field(key: "max_stamina_points")
    var maxSp: Int
    
    @Field(key: "money")
    var money: Int
    
    @Field(key: "coins")
    var coins: Int
    
    @Field(key: "vip_end_timestamp")
    var vipEndTimestamp: Double
    
    @Field(key: "reputation")
    var reputation: Int
    
    @Field(key: "current_lomon_id")
    var currentLomonID: UUID

    @Field(key: "last_login")
    var lastLogin: Date
    
    

    init() {}

    init(userID: UUID, id: UUID? = nil, nickname: String, level: Int, exp: Int, maxExp: Int, bp: Int, maxBp:Int, sp: Int, maxSp: Int, money: Int, coins: Int, vipEndTimestamp: Double, reputation: Int, currentLomonID: UUID, lastLogin: Date) {
        self.$user.id = userID
        self.id = id
        self.nickname = nickname
        self.level = level
        self.exp = exp
        self.maxExp = maxExp
        self.bp = bp
        self.maxBp = maxBp
        self.sp = sp
        self.maxSp = maxSp
        self.money = money
        self.coins = coins
        self.vipEndTimestamp = vipEndTimestamp
        self.reputation = reputation
        self.currentLomonID = currentLomonID
        self.lastLogin = lastLogin
    }
}
