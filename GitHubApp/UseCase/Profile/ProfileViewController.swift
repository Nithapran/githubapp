//
//  ProfileViewController.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var repositoryLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileHeaderView: ProfileHeaderView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    var viewModel: ProfileViewModel?
    
    var profile: Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProfileViewModel(service: UserService(), userName: profile?.login ?? "")
        profileHeaderView.becomeFirstResponder()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.didFetchRepositories = didFetch
        
    }
    
    func didFetch(_ data: [Repository]?,_ error: UserServiceError?) {
        self.tableView.reloadData()
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepostoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepostoryTableViewCell")
        self.tableView.reloadData()
        
        profileHeaderView.delegate = self
        self.setUpNavBar(profile?.login ?? "null")
        self.bioLabel.text = profile?.bio
        profileHeaderView.profile = profile
        
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
        return viewModel?.reposotories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepostoryTableViewCell", for: indexPath) as! RepostoryTableViewCell
        cell.repository = viewModel?.reposotories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapFollowerButton() {
        let profileView = FollowViewController()
        self.navigationController?.pushViewController(profileView, animated: true)
    }
    
    func didTapFollowingButton() {
        
    }
    
    
}
