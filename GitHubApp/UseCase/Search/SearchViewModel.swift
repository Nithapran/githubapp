//
//  SearchViewModel.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation
import Combine

class SearchViewModel {
    let service: UserServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    var didFetchProfile: ((_ data: Profile?,_ error: UserServiceError?) -> Void)?
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func getGitHubProfile(searchText: String) {
        let profile = service.getProfile(userName: searchText)
        
        profile
            .receive(on: RunLoop.main)
            .sink { error in
                
                
            } receiveValue: { result in
                
                self.didFetchProfile?(result,nil)
            }.store(in: &self.cancellables)
    }
}



