//
//  CreatePlayer.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//


import Fluent

struct CreatePlayer: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("players")
            .id()
            .field("user_id", .uuid, .required, .references("auth_users", "id", onDelete: .cascade))
            .field("nickname", .string, .required)
            .field("level", .int, .required)
            .field("exp", .int, .required)
            .field("maxExp", .int, .required)
            .field("battle_points", .int, .required)
            .field("max_battle_points", .int, .required)
            .field("stamina_points", .int, .required)
            .field("max_stamina_points", .int, .required)
            .field("money", .int, .required)
            .field("coins", .int, .required)
            .field("vip_end_timestamp", .double, .required)
            .field("reputation", .int, .required)
            .field("current_lomon_id", .uuid, .required)
            .field("last_login", .datetime, .required)
            .unique(on: "user_id")
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("players").delete()
    }
}
