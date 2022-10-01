//
//  FollowViewController.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import UIKit

enum FollowViewType {
    case Follower
    case Follwing
}

class FollowViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let type: FollowViewType
    let viewModel: FollowViewModel
    
    init(type: FollowViewType, profile: Profile?) {
        self.type = type
        self.viewModel = FollowViewModel(service: UserService(), profile: profile, type: type)
        super.init(nibName: "FollowViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel.didFetch = didFetch
    }
    
    func didFetch(_ data: [Profile]?,_ error: UserServiceError?) {
        self.tableView.reloadData()
    }
    
    func setUpView() {
        self.setUpNavBar(self.viewModel.getNavigationTitle())
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        
    }

}

extension FollowViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.follows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.profile = self.viewModel.follows[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileView = ProfileViewController(userName: self.viewModel.follows[indexPath.row].login)
        
        
        self.navigationController?.pushViewController(profileView, animated: true)
    }
}
