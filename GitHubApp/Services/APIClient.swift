//
//  APIClient.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation


class APIClient {
    var netWorkConfiguration: NetWorkConfiguration
    
    init() {
        var baseURL = ""
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
                        if let dic = NSDictionary(contentsOfFile: path) {
                            baseURL = dic["BASE_URL"] as! String
                        }
                    }
        self.netWorkConfiguration = NetWorkConfiguration(baseURL: baseURL)
        
    }
    
    func getBuilder() -> RequestBuilder {
        let req = RequestBuilder(netWorkConfiguration: netWorkConfiguration)
        return req
    }
}
