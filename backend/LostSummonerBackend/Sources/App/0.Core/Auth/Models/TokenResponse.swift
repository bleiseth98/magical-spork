//
//  TokenResponse.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor

struct RegisterRequest: Content {
    let username: String
    let password: String
}

struct LoginRequest: Content {
    let username: String
    let password: String
}

struct TokenResponse: Content {
    let token: String
    let userID: UUID
}

struct RefreshRequest: Content {
    let refreshToken: String
}


struct AuthTokenPairResponse: Content {
    let accessToken: String
    let refreshToken: String
    let userID: UUID
}


