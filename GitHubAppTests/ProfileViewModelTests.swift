//
//  ProfileViewModelTests.swift
//  GitHubAppTests
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation
import XCTest
import Combine
@testable import GitHubApp

class ProfileViewModelTests: XCTestCase {
    var viewModel: ProfileViewModel!
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        viewModel = ProfileViewModel(service: MockUserService(), userName: "")
        cancellables = []
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testGetProfile() {
        let expectation = XCTestExpectation(description: "response")
        viewModel.didFetchProfile = didFetchProfile
        viewModel.getGitHubProfile(searchText: "")
        func didFetchProfile(_ data: Profile?,_ error: UserServiceError?) {
            expectation.fulfill()
            XCTAssertEqual((self.viewModel.profile?.login)!, "iosamuel")
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    
    func testGetRepostories() {
        let expectation = XCTestExpectation(description: "response")
        viewModel.didFetchRepositories = didFetch
        viewModel.getRepostories(searchText: "")
    
        
        func didFetch(_ data: [Repository]?,_ error: UserServiceError?) {
            expectation.fulfill()
            XCTAssertEqual((self.viewModel.reposotories.first?.name)!, "algorithms")
        }
        wait(for: [expectation], timeout: 1)
        
    }
}
