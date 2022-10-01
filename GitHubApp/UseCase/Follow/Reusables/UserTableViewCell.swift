//
//  UserTableViewCell.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-10-01.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userAvatarView: UIImageView!
    
    @IBOutlet weak var container: UIView!
    var profile: Profile? {
        didSet {
            setUpView(data: profile)
        }
    }
    
    func setUpView(data: Profile?) {
        self.userName.text = data?.login ?? "No Name"
        self.userAvatarView.sd_setImage(with: URL(string: data?.avatar_url ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.userAvatarView.layer.cornerRadius = 8
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
