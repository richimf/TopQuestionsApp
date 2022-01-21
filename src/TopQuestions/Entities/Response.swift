//
//  Response.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

struct Response: Decodable {
    let items: [Item]
    let hasMore: Bool?
    let quotaMax: Int?
    let quotaRemaining: Int?

    private enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}
