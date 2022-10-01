//
//  UIView+Extension.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation
import UIKit

extension UIView {
    func addStandardShadow() {
        self.layer.shadowOffset = CGSize(width: 0,height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.10
        
    }
}
