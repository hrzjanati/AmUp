//
//  File.swift
//  AmUp
//
//  Created by 𝙷𝚘𝚜𝚎𝚒𝚗 𝙹𝚊𝚗𝚊𝚝𝚒  on 8/23/21.
//

import Foundation

// MARK: - home model json
struct Home: Decodable {
    let id: Int
    let latitude, longitude, caption, eventDateTime: String
    let isCommentEnabled: Bool
    let expirationDateTime: String
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, latitude, longitude, caption
        case eventDateTime = "event_date_time"
        case isCommentEnabled = "is_comment_enabled"
        case expirationDateTime = "expiration_date_time"
        case user
    }
}


// MARK: - User
struct User: Decodable {
    let username: String
    let profileDetails: ProfileDetails?
    let fullName: String
    let isValid: Bool

    enum CodingKeys: String, CodingKey {
        case username
        case profileDetails = "profile_details"
        case fullName = "full_name"
        case isValid = "is_valid"
    }
}
// MARK: - ProfileDetails
struct ProfileDetails: Decodable {
    let id: Int
    let avatarURL: String?
    let bio: String?
    let user: String?

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatar_url"
        case bio
        case user
    }
}
