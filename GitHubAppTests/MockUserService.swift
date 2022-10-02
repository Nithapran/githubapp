//
//  MockUserService.swift
//  WeatherTests
//
//  Created by Nithaparan Francis on 2022-08-19.
//

import Foundation
import Combine

@testable import GitHubApp

class MockUserService: APIClient, UserServiceProtocol, Mockable {
    
    func getProfile(userName: String) -> Future< Profile?, UserServiceError> {
        return Future { promise in
            let data = self.loadJSON(filename: "MockProfile", type: Profile.self)
            promise(.success(data))
        }
    }
    
    func getFollowers(userName: String) -> Future< [Profile]?, Error> {
        return Future { promise in
            let data = self.loadJSON(filename: "MockFollowers", type: [Profile].self)
            promise(.success(data))
        }
    }
    
    func getFollowings(userName: String) -> Future< [Profile]?, Error> {
        return Future { promise in
            let data = self.loadJSON(filename: "MockFollowings", type: [Profile].self)
            promise(.success(data))
        }
    }
    
    func getRepos(userName: String) -> Future< [Repository]?, Error> {
        return Future { promise in
            let data = self.loadJSON(filename: "MockRepositories", type: [Repository].self)
            promise(.success(data))
        }
    }
    
}
