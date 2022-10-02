//
//  Helper.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-10-01.
//

import Foundation
import UIKit

class Helper {
    static let shared = Helper()
    
    private init() {}
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (actin) in
            alertController.dismiss(animated: true, completion: nil)

                
               }))
        
        if let currentScene = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .first as? UIWindowScene
        {
            let root = currentScene.keyWindow?.rootViewController
            
            root?.present(alertController, animated: true, completion: nil)
        }
        
    }
}
