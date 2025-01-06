//
//  Payload.swift
//  ZakFitServer
//
//  Created by Apprenant 122 on 1/6/25.
//


import Vapor
import JWT

struct Payload: JWTPayload, Authenticatable, Content {
    enum CodingKeys: String, CodingKey {
        case expiration = "exp"
        case userId = "uid"
    }

    var expiration: ExpirationClaim
    var userId: UUID

    func verify(using algorithm: some JWTAlgorithm) throws {
        try self.expiration.verifyNotExpired()
    }
}