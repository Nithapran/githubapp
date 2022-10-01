//
//  FollowViewModel.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-10-01.
//

import Foundation
import Combine

class FollowViewModel {
    let service: UserServiceProtocol
    
    var follows: [Profile] = []
    
    var type: FollowViewType
    
    var profile: Profile?
    
    private var cancellables = Set<AnyCancellable>()
    
    var didFetch: ((_ data: [Profile]?,_ error: UserServiceError?) -> Void)?
    
    init(service: UserServiceProtocol, profile: Profile?, type: FollowViewType) {
        self.type = type
        self.profile = profile
        self.service = service
        switch self.type {
        case .Follower:
            self.getFollowers(searchText: self.profile?.login ?? "")
            break
        case .Follwing:
            self.getFollowings(searchText: self.profile?.login ?? "")
            break
        }
    }
    
    func getFollowers(searchText: String) {
        let profile = service.getFollowers(userName: searchText)
        
        profile
            .receive(on: RunLoop.main)
            .sink { error in
                
                
            } receiveValue: { result in
                self.follows = result ?? []
                self.didFetch?(result,nil)
            }.store(in: &self.cancellables)
    }
    
    func getNavigationTitle() -> String {
        return self.type == .Follwing ? "\(self.profile?.name ?? "No name")'s followings" : "\(self.profile?.name ?? "No name")'s followers"
    }
    
    func getFollowings(searchText: String) {
        let profile = service.getFollowings(userName: searchText)
        
        profile
            .receive(on: RunLoop.main)
            .sink { error in
                
                
            } receiveValue: { result in
                self.follows = result ?? []
                self.didFetch?(result,nil)
            }.store(in: &self.cancellables)
    }
    
    
}
