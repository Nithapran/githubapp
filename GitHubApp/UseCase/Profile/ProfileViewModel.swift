//
//  ProfileViewModel.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation
import Combine

class ProfileViewModel {
    let service: UserServiceProtocol
    
    var reposotories: [Repository] = []
    
    var profile: Profile?
    
    private var cancellables = Set<AnyCancellable>()
    
    var didFetchRepositories: ((_ data: [Repository]?,_ error: UserServiceError?) -> Void)?
    var didFetchProfile: ((_ data: Profile?,_ error: UserServiceError?) -> Void)?
    
    init(service: UserServiceProtocol, userName: String) {
        self.service = service
        getRepostories(searchText: userName)
        getGitHubProfile(searchText: userName)
    }
    
    func getRepostories(searchText: String) {
        let profile = service.getRepos(userName: searchText)
        
        profile
            .receive(on: RunLoop.main)
            .sink { error in
                
                
            } receiveValue: { result in
                self.reposotories = result ?? []
                self.didFetchRepositories?(result,nil)
            }.store(in: &self.cancellables)
    }
    
    func getGitHubProfile(searchText: String) {
        let profile = service.getProfile(userName: searchText)
        
        profile
            .receive(on: RunLoop.main)
            .sink { error in
                
                
            } receiveValue: { result in
                self.profile = result
                self.didFetchProfile?(result,nil)
            }.store(in: &self.cancellables)
    }
}

