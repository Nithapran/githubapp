//
//  UserService.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation
import Combine

protocol UserServiceProtocol{
    func getProfile(userName: String) -> Future< Profile?, Error>
    func getFollowers(userName: String) -> Future< [Profile]?, Error>
    func getFollowings(userName: String) -> Future< [Profile]?, Error>
    func getRepos(userName: String) -> Future< [Repository]?, Error>
}

class UserService: APIClient, UserServiceProtocol {
    
    func getProfile(userName: String) -> Future< Profile?, Error> {
        return Future { promise in
            let request = self.getBuilder().path(.getProfile(userName)).method(.get)
            RequestMiddleware.request(request: request){ (data: Profile?,error)  in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data))
                }
            }
        }
    }
    
    func getFollowers(userName: String) -> Future< [Profile]?, Error> {
        return Future { promise in
            let request = self.getBuilder().path(.getFollowers(userName)).method(.get)
            RequestMiddleware.request(request: request){ (data: [Profile]?,error)  in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data))
                }
            }
        }
    }
    
    func getFollowings(userName: String) -> Future< [Profile]?, Error> {
        return Future { promise in
            let request = self.getBuilder().path(.getFollowings(userName)).method(.get)
            RequestMiddleware.request(request: request){ (data: [Profile]?,error)  in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data))
                }
            }
        }
    }
    
    func getRepos(userName: String) -> Future< [Repository]?, Error> {
        return Future { promise in
            let request = self.getBuilder().path(.getRepositories(userName)).method(.get)
            RequestMiddleware.request(request: request){ (data: [Repository]?,error)  in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data))
                }
            }
        }
    }
}



