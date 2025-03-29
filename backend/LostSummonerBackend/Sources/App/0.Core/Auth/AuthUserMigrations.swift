//
//  UserMigrations.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Fluent

struct CreateUser: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("auth_users")
            .id()
            .field("username", .string, .required)
            .field("passwordHash", .string, .required)
            .unique(on: "username")
            .field("role", .string, .required, .sql(.default("'player'")))
            .field("feature_flags", .array(of: .string))
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("auth_users").delete()
    }
}

struct CreateUserToken: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("auth_user_tokens")
            .id()
            .field("value", .string, .required)
            .field("type", .string, .required)
            .field("user_id", .uuid, .required, .references("auth_users", "id", onDelete: .cascade))
            .field("expires_at", .datetime)
            .unique(on: "value")
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("auth_user_tokens").delete()
    }
}

/*
 {
     "username": "testAdmin",
     "password": "adminPass
 }

 {
     "userID": "85D6CCDA-35AC-45A1-8DD5-FDCBF44DB05C",
     "refreshToken": "8546OcHjmchKH4TD0RRYFmxTnLDeFUwfi3xZlcVVHuQ=",
     "accessToken": "Mwtlf+/Qpdqy4lObRgxsDAHS1V71moPqQYj8exqW4O8="
 }
 */
