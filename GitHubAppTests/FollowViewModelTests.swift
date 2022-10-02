//
//  FollowViewModelTests.swift
//  GitHubAppTests
//
//  Created by Nithaparan Francis on 2022-10-01.
//

import Foundation
import XCTest
import Combine
@testable import GitHubApp

class FollowViewModelTests: XCTestCase,Mockable {
    var viewModel1: FollowViewModel!
    var viewModel2: FollowViewModel!
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        let profile = self.loadJSON(filename: "MockProfile", type: Profile.self)
        viewModel1 = FollowViewModel(service: MockUserService(), profile: profile, type: .Follower)
        viewModel2 = FollowViewModel(service: MockUserService(), profile: profile, type: .Follwing)
        cancellables = []
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testGetFollowers() {
        let expectation = XCTestExpectation(description: "response")
        viewModel1.didFetch = didFetch
        viewModel1.getFollowers(searchText: "")
        func didFetch(_ data: [Profile]?,_ error: UserServiceError?) {
            expectation.fulfill()
            XCTAssertEqual((self.viewModel1.follows.first?.login)!, "Razielini")
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetFollowings() {
        let expectation = XCTestExpectation(description: "response2")
        viewModel2.didFetch = didFetch
        viewModel2.getFollowings(searchText: "")
        func didFetch(_ data: [Profile]?,_ error: UserServiceError?) {
            expectation.fulfill()
            XCTAssertEqual((self.viewModel2.follows.first?.login)!, "julianduque")
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetNavigationTitle() {
        XCTAssertEqual(self.viewModel1.getNavigationTitle(), "Samuel Burbano's followers")
        XCTAssertEqual(self.viewModel2.getNavigationTitle(), "Samuel Burbano's followings")
    }
    
}
