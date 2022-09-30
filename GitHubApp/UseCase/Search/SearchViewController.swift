//
//  SearchViewController.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchField: UITextField!
    
    var viwModel = SearchViewModel(service: UserService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchField.becomeFirstResponder()
        viwModel.didFetchProfile = didFetch
    }
    
    func didFetch(_ data: Profile?,_ error: UserServiceError?) {
        let profileView = ProfileViewController()
        self.navigationController?.pushViewController(profileView, animated: true)
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
        
        viwModel.getGitHubProfile(searchText: searchField.text ?? "")
    }
}

