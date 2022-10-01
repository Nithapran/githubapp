//
//  RepostoryTableViewCell.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import UIKit

class RepostoryTableViewCell: UITableViewCell {
    @IBOutlet weak var repositoryName: UILabel!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var repositoryDescription: UILabel!
    var repository: Repository? {
        didSet {
            setUpView(data: repository)
        }
    }
    
    func setUpView(data: Repository?) {
        self.repositoryName.text = data?.name ?? "No title"
        self.repositoryDescription.text = data?.description ?? "No description"
        container.layer.cornerRadius = 15
        container.addStandardShadow()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
