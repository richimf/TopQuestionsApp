//
//  Tags.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

struct Owner: Decodable {
    let reputation: Int?
    let userId: Int?
    let userType: String?
    let profileImage: String?
    let displayName: String?
    let link: String?

    private enum CodingKeys: String, CodingKey {
        case reputation
        case userId = "user_id"
        case userType = "user_type"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}
