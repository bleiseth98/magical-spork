//
//  AuthUser.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

enum UserRole: String, Codable {
    case player
    case moderator
    case admin
}

final class AuthUser: Model, Content, @unchecked Sendable {
    static let schema = "auth_users"
   
    @ID(key: .id)
    var id: UUID?

    @Field(key: "username")
    var username: String

    @Field(key: "passwordHash")
    var passwordHash: String
    
    @Field(key: "role")
    var role: UserRole
    
    @OptionalField(key: "feature_flags")
    var featureFlags: [String]? // e.g., ["beta_shop", "pvp_3v3", "new_ui"]
    
    //@OptionalField(key: "ab_buckets")
    //var abBuckets: [String: String]? // ["shop_redesign": "B"]


    init() {}

    init(id: UUID? = nil, username: String, passwordHash: String, role: UserRole = .player) {
        self.id = id
        self.username = username
        self.passwordHash = passwordHash
        self.role = role
    }

}

extension AuthUser: ModelAuthenticatable {
    static var usernameKey: KeyPath<AuthUser, Field<String>> { \AuthUser.$username }
    
    static var passwordHashKey: KeyPath<AuthUser, Field<String>> { \AuthUser.$passwordHash }
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
}

