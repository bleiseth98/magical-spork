//
//  LomonService.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor

struct LomonService {
    func createFirstLomonFor(id: UUID) -> LomonEntity {
        let lomon = LomonEntity(
            id: UUID(),
            playerID: id,
            species: "Animal",
            name: "Firmon",
            rank: 1,
            assignedStats: [
                "health": 0,
                "attack": 0,
                "defense": 0,
                "mattack": 0,
                "mdefense": 0,
                "speed": 0,
                "intelligence": 0
            ],
            baseStats: [
                "health": 100,
                "attack": 12,
                "defense": 21,
                "mattack": 26,
                "mdefense": 13,
                "speed": 18,
                "intelligence": 9,
            ],
            statBoosts: [ //from stars
                "attack": 0,
                "defense": 3,
                "mattack": 2,
                "mdefense": 1,
                "speed": 0,
                "intelligence": 0,
                        ])
        print("Lomon created with ID: \(lomon.id!)")
        return lomon
    }
}
