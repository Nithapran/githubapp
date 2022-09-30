//
//  UIViewController+Extension.swift
//  SpiritsBar
//
//  Created by Nithaparan Francis on 2022-09-28.
//

import Foundation
import UIKit

extension UIViewController {
    func setUpNavBar(_ title: String = "",_ isHidden: Bool = false,_ prefersLargeTitles: Bool = false) {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if !prefersLargeTitles {
            navigationItem.largeTitleDisplayMode = .never
        }
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = title
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.6470588235, blue: 0.8862745098, alpha: 1)
            appearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor : UIColor.white]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            self.navigationController?.navigationBar.standardAppearance = appearance;
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        }
    }
}
