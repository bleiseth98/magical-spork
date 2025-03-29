//
//  CreateLomon.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//


import Fluent

struct CreateLomon: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("lomons")
            .id()
            .field("player_id", .uuid, .required, .references("players", "id", onDelete: .cascade))
            .field("species", .string, .required)
            .field("nickname", .string, .required)
            .field("level", .int, .required)
            .field("exp", .int, .required)
            .field("rank", .int, .required)
            .field("assigned_stats", .json, .required)
            .field("base_stats", .json, .required)
            .field("stat_boosts", .json, .required)
            .field("rune_id", .uuid)
            .field("talent_id", .uuid)
            .field("ability_id", .uuid)
            .create()
    }

    func revert(on database: any  Database) -> EventLoopFuture<Void> {
        database.schema("lomons").delete()
    }
}
