//
//  ProfileViewController.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var repositoryLabel: UILabel!
    
    @IBOutlet weak var repositoriesCountLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileHeaderView: ProfileHeaderView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    var viewModel: ProfileViewModel
    
    init(userName: String) {
        self.viewModel = ProfileViewModel(service: UserService(), userName: userName)
        super.init(nibName: "ProfileViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileHeaderView.becomeFirstResponder()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.didFetchRepositories = didFetch
        viewModel.didFetchProfile = didFetchProfile
        
    }
    
    func didFetch(_ data: [Repository]?,_ error: UserServiceError?) {
        self.tableView.reloadData()
        setUpView()
    }
    
    func didFetchProfile(_ data: Profile?,_ error: UserServiceError?) {
        profileHeaderView.profile = data
        setUpView()
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepostoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepostoryTableViewCell")
        self.tableView.reloadData()
        
        profileHeaderView.delegate = self
        self.setUpNavBar(viewModel.profile?.login ?? "null")
        self.bioLabel.text = viewModel.profile?.bio ?? "No bio"
        self.repositoriesCountLabel.text = "(\(viewModel.reposotories.count))"
        profileHeaderView.profile = viewModel.profile
        
    }

    @IBAction func butclic(_ sender: Any) {
        print("asdasd")
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reposotories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepostoryTableViewCell", for: indexPath) as! RepostoryTableViewCell
        cell.repository = viewModel.reposotories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapFollowerButton() {
        let profileView = FollowViewController(type: .Follower, profile: self.viewModel.profile)
        self.navigationController?.pushViewController(profileView, animated: true)
    }
    
    func didTapFollowingButton() {
        let profileView = FollowViewController(type: .Follwing, profile: self.viewModel.profile)
        self.navigationController?.pushViewController(profileView, animated: true)
    }
    
    
}
