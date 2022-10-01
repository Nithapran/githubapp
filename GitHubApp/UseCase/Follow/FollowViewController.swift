//
//  FollowViewController.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import UIKit

class FollowViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    func setUpView() {
        tableView.register(UINib(nibName: "RepostoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepostoryTableViewCell")
        
    }

}

extension FollowViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepostoryTableViewCell", for: indexPath) as! RepostoryTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
