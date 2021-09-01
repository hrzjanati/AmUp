//
//  ExploreModel.swift
//  AmUp
//
//  Created by 𝙷𝚘𝚜𝚎𝚒𝚗 𝙹𝚊𝚗𝚊𝚝𝚒  on 8/29/21.
//
import Foundation

// MARK: - Welcome

struct Explore: Decodable {
    let post: [PostExplore]?
    let user: [UserExplore]?
}

// MARK: - Post
struct PostExplore: Decodable {
    let id: Int
    let latitude, longitude, caption, eventDateTime: String
    let isCommentEnabled: Bool
    let expirationDateTime: String
    let user: UserExplore?

    enum CodingKeys: String, CodingKey {
        case id, latitude, longitude, caption
        case eventDateTime
        case isCommentEnabled
        case expirationDateTime
        case user
    }
}

// MARK: - User
struct UserExplore: Decodable {
    let username: String
    let profileDetails: ProfileDetailsExplore?
    let fullName: String
    let isValid: Bool

    enum CodingKeys: String, CodingKey {
        case username
        case profileDetails
        case fullName
        case isValid
    }
}

// MARK: - ProfileDetails
struct ProfileDetailsExplore: Decodable {
    let id: Int
    let avatarURL: String?
    let bio: String?
    let user: String?

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL
        case bio, user
    }
}
