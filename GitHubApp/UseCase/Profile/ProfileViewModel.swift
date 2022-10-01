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
    
    private var cancellables = Set<AnyCancellable>()
    
    var didFetchRepositories: ((_ data: [Repository]?,_ error: UserServiceError?) -> Void)?
    
    init(service: UserServiceProtocol, userName: String) {
        self.service = service
        getRepostories(searchText: userName)
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
}

