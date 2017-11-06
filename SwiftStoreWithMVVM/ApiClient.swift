//
//  ApiClient.swift
//  SwiftStoreWithMVVM
//
//  Created by sebastian on 6/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import Alamofire


class ApiClient : NSObject {
    
    //MARK: - Variables
    
    let apiEndPoint : String = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    
    
  
    func fetchAppList(completion: @escaping ([NSDictionary]?, NSError? ) -> Void){
        
        guard let url = URL(string: "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json") else { print("Error unwrapping URL"); return}
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<300)
        .responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                do {
                    if let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? NSDictionary {
                        
                        if let apps = responseJSON.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                            completion(apps, nil)                        }
                    }
                } catch {
                    completion(nil,error as NSError?)
                    //print("Error getting API data: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                completion(nil,error as NSError?)

                //print("Failure")
            }
            
        }

    }
    
}
