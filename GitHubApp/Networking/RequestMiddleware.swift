//
//  RequestMiddleware.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation

class RequestMiddleware {
    static func request<T: Codable>(request: APIRequest, onCompletion: @escaping(T?, Error?) -> ()) {
        
        request.makeRequest{ (data: T? ,error) in
            if let err = error {
                switch err {
                
                case .noInternet:
                    break
                case .apiFailure:
                    break
                case .invalidResponse:
                    break
                case .decodingError:
                    break
                case .JSONSerializationError:
                    onCompletion(nil,error)
                case .badRequest:
                    break
                case .unauthorized:
                    print("unauthorised")
                    break
                case .forbidden:
                    break
                case .notFound:
                    break
                case .serverError:
                    break
                case .otherError(let statusCode):
                    let error = NSError(domain: "", code: statusCode, userInfo: nil) as Error
                    onCompletion(nil,error)
                    break
                }
            } else {
                onCompletion(data, nil)
            }
            
        }
        
    }
}
