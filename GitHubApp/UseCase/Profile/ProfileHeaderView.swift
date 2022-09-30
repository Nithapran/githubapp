//
//  ProfileHeaderView.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation
import UIKit


@IBDesignable
final class ProfileHeaderView: UIView {
    
    let nibName = "ProfileHeaderView"
    
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
    
}

