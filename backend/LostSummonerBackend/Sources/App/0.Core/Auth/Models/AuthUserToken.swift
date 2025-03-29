//
//  AuthUserToken.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor
import Fluent

enum TokenType: String, Codable {
    case access
    case refresh
}

final class AuthUserToken: Model, Content, @unchecked Sendable {
    static let schema = "auth_user_tokens"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "value")
    var value: String
    
    @Field(key: "type")
    var type: TokenType

    @Parent(key: "user_id")
    var user: AuthUser

    @Timestamp(key: "expires_at", on: .none)
    var expiresAt: Date?

    init() {}

    init(id: UUID? = nil, value: String, userID: UUID, type: TokenType, expiresAt: Date? = nil) {
        self.id = id
        self.value = value
        self.type = type
        self.$user.id = userID
        self.expiresAt = expiresAt
    }

}

extension AuthUserToken: ModelTokenAuthenticatable {
    typealias User = AuthUser
    static var userKey: KeyPath<AuthUserToken, Parent<AuthUser>> { \AuthUserToken.$user }
    
    static var valueKey: KeyPath<AuthUserToken, Field<String>> { \AuthUserToken.$value }

    var isValid: Bool {
        guard let expiry = expiresAt else { return true }
        return expiry > Date()
    }
}
