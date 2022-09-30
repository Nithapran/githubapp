//
//  Repository.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation

struct Repository: Codable {
    var id: Int
    var name: String
    var full_name: String
    var isPrivate: Bool
    var owner: Profile
    var description: String?
    
    enum CodingKeys: String, CodingKey {
            case isPrivate = "private"
        
            case id
            case name
            case full_name
            case owner
            case description
        }
}
