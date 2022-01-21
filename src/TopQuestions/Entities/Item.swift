//
//  Item.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 20/01/22.
//

import Foundation

struct Item: Decodable {
    let tags: [String]?
    let owner: Owner?
    let isAnswered: Bool?
    let viewCount: Int?
    let acceptedAnswerId: Int?
    let answerCount: Int?
    let score: Int?
    let lastActivityDate: Int?
    let creationDate: Int?
    let lastEditDate: Int?
    let questionId: Int?
    let contentLicense: String?
    let link: String?
    let title: String?
    let body: String?

    private enum CodingKeys: String, CodingKey {
        case tags
        case owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case acceptedAnswerId = "accepted_answer_id"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case questionId = "question_id"
        case contentLicense = "content_license"
        case link
        case title
        case body
    }
}
