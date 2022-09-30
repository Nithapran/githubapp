//
//  APIPath.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation

public enum APIPath: Equatable {
    case getProfile(String)
    case getFollowers(String)
    case getFollowings(String)
    case getRepositories(String)
    case empty
    
    
    var toString: String {
        switch self {
        case .getProfile (let userName):
            return "users/\(userName)"
        case .getFollowers (let userName):
            return "users/\(userName)/followers"
        case .getFollowings (let userName):
            return "users/\(userName)/following"
        case .getRepositories (let userName):
            return "users/\(userName)/repos"
        case .empty: return ""
        }
    }
}
