//
//  Lomon.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

import Fluent
import Vapor

final class LomonEntity: Model, Content, @unchecked Sendable {
    static let schema = "lomons"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "player_id")
    var player: Player

    @Field(key: "species") ///Humanoid, angel, animal etc
    var species: String

    @Field(key: "name")
    var name: String

    @Field(key: "rank")
    var rank: Int

    // Serialized stat/talent identifiers (optional for MVP)
    @Field(key: "assigned_stats")
    var assignedStats: [String: Int]

    @Field(key: "base_stats")
    var baseStats: [String: Int]

    @Field(key: "stat_boosts")
    var statBoosts: [String: Int]

    @Field(key: "rune_id")
    var runeID: UUID?

    @Field(key: "talent_id")
    var talentID: UUID?

    @Field(key: "ability_id")
    var abilityID: UUID?

    init() {}

    init(
        id: UUID? = nil,
        playerID: UUID,
        species: String,
        name: String,
        rank: Int,
        assignedStats: [String: Int],
        baseStats: [String: Int],
        statBoosts: [String: Int],
        runeID: UUID? = nil,
        talentID: UUID? = nil,
        abilityID: UUID? = nil
    ) {
        self.id = id
        self.$player.id = playerID
        self.species = species
        self.name = name
        self.rank = rank
        self.assignedStats = assignedStats
        self.baseStats = baseStats
        self.statBoosts = statBoosts
        self.runeID = runeID
        self.talentID = talentID
        self.abilityID = abilityID
    }
}
