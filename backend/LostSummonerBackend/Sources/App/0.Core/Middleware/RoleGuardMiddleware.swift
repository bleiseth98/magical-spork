//
//  RoleGuardMiddleware.swift
//  LostSummonerBackend
//
//  Created by Bailey Leiseth on 3/29/25.
//

import Vapor

struct RoleGuardMiddleware: Middleware {
    let allowedRoles: [UserRole]

    init(_ roles: UserRole...) {
        self.allowedRoles = roles
    }

    func respond(to request: Request, chainingTo next: any Responder) -> EventLoopFuture<Response> {
        do {
            let user = try request.auth.require(AuthUser.self)

            guard allowedRoles.contains(user.role) else {
                return request.eventLoop.makeFailedFuture(
                    Abort(.forbidden, reason: "You do not have permission to access this route.")
                )
            }

            return next.respond(to: request)
        } catch {
            return request.eventLoop.makeFailedFuture(error)
        }
    }
}

