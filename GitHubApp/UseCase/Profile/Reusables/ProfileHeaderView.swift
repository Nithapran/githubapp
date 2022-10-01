//
//  ProfileHeaderView.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation
import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapFollowerButton()
    func didTapFollowingButton()
}


@IBDesignable
final class ProfileHeaderView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    weak var delegate: ProfileHeaderViewProtocol?
    
    let nibName = "ProfileHeaderView"
    
    var profile: Profile? {
        didSet {
            setUpView(data: profile)
        }
    }
    
    @IBOutlet weak var container: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: ProfileHeaderView.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setUpView(data: Profile?) {
        self.nameLabel.text = profile?.name
        self.followerLabel.text = String(profile?.followers ?? 0)
        self.followingLabel.text = String(profile?.following ?? 0)
        self.imageView.layer.cornerRadius = 15
    }
    
    
    @IBAction func followerButtonClicked(_ sender: Any) {
        delegate?.didTapFollowerButton()
    }
    
    @IBAction func followingButtonClicked(_ sender: Any) {
        delegate?.didTapFollowingButton()
    }
    
    @IBAction func buttsdfsf(_ sender: Any) {
        print("asdasd")
    }
}

