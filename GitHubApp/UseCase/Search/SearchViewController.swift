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
        self.setUpNavBar("",true,false)
        searchField.becomeFirstResponder()
    }
    
    

    @IBAction func searchButtonClicked(_ sender: Any) {
        
        let profileView = ProfileViewController(userName: searchField.text ?? "")
        let nav = UINavigationController(rootViewController: profileView)
        nav.view.backgroundColor = .white
        
        
        self.navigationController?.present(nav, animated: true)
    }
}

