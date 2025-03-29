//
//  AuthServiceTests.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

@testable import App
import Foundation
import XCTest
import XCTVapor
import Fluent

final class AuthServiceTests: XCTestCase {
    var app: Application!
    var service: AuthService!

    func setUpAsync() async throws {
        app = try await Application.make(.testing)
        try await configure(app)
        try await app.autoMigrate()
        service = AuthService()
    }

    func tearDownAsync() async throws {
        try await AuthUserToken.query(on: app.db).delete()
        try await AuthUser.query(on: app.db).delete()
        try await app.asyncShutdown()
    }

    //MARK: Register
    func testRegisterUser() async throws {
        let uniqueUsername = "user_\(UUID().uuidString.prefix(8))"
        let response = try await service.register(username: uniqueUsername, password: "password123", db: app.db)

        XCTAssertNotNil(UUID(uuidString: response.userID.uuidString))
        XCTAssertFalse(response.token.isEmpty)

        let userCount = try await AuthUser.query(on: app.db).count()
        XCTAssertEqual(userCount, 1)
    }
    //MARK: Login Valid
    func testLoginWithValidCredentials() async throws {
        // First register
        let uniqueUsername = "user_\(UUID().uuidString.prefix(8))"
        let response = try await service.register(username: uniqueUsername, password: "password123", db: app.db)

        // Then login
        let responseLogin = try await service.login(username: uniqueUsername, password: "password123", db: app.db)
        XCTAssertFalse(responseLogin.token.isEmpty)
    }
    //MARK: Login Invalid
    func testLoginWithInvalidCredentialsFails() async throws {
        let uniqueUsername = "user_\(UUID().uuidString.prefix(8))"
        let response = try await service.register(username: uniqueUsername, password: "password123", db: app.db)
        do {
            _ = try await service.login(username: uniqueUsername, password: "wrongpass", db: app.db)
            XCTFail("Expected login to fail, but it succeeded.")
        } catch {
            // Expected
        }
    }
    //MARK: Token Expires
    func testTokenExpiresCorrectly() async throws {
        let uniqueUsername = "user_\(UUID().uuidString.prefix(8))"
        let response = try await service.register(username: uniqueUsername, password: "password123", db: app.db)

        guard let token = try await AuthUserToken.query(on: app.db)
            .filter(\.$value == response.token)
            .first()
        else {
            XCTFail("Token not found in database.")
            return
        }

        XCTAssertNotNil(token.expiresAt)
        XCTAssertTrue(token.isValid)
    }



}
