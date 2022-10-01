//
//  Profile.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation

struct Profile: Codable {
    var login: String
    var id: Int
    var avatar_url: String?
    var name: String?
    var location: String?
    var bio: String?
    var public_repos: Int?
    var followers: Int?
    var following: Int?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try values.decode(String.self, forKey: .login)
        self.id = try values.decode(Int.self, forKey: .id)
        
        if values.contains(.avatar_url) {
            self.avatar_url = try values.decode(String?.self, forKey: .avatar_url)
        } else {
            self.avatar_url = nil
        }
        
        if values.contains(.name) {
            self.name = try values.decode(String?.self, forKey: .name)
        } else {
            self.name = nil
        }
        
        if values.contains(.followers) {
            self.followers = try values.decode(Int?.self, forKey: .followers)
        } else {
            self.followers = nil
        }
        
        if values.contains(.following) {
            self.following = try values.decode(Int?.self, forKey: .following)
        } else {
            self.following = nil
        }
        
        if values.contains(.public_repos) {
            self.public_repos = try values.decode(Int?.self, forKey: .public_repos)
        } else {
            self.public_repos = nil
        }
        
        if values.contains(.location) {
            self.location = try values.decode(String?.self, forKey: .location)
        } else {
            self.location = nil
        }
        
        if values.contains(.bio) {
            self.bio = try values.decode(String?.self, forKey: .bio)
        } else {
            self.bio = nil
        }
        
    }
        
}
