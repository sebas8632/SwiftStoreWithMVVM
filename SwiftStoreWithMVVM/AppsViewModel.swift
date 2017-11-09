//
//  AppsViewModel.swift
//  SwiftStoreWithMVVM
//
//  Created by sebastian on 6/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class AppsViewModel : NSObject {

    
    @IBOutlet var apiClient : ApiClient!
    
    var apps : [NSDictionary]?
    
    /**
     Function that get all AppStore Api Data.
     */
    func getApps(completion: @escaping () -> Void) {
        
        apiClient.fetchAppList { (appsDictionary, error) in
            if error == nil {
                
                //It's execute in the main threat to avoid affect th UI on the TableView.
                DispatchQueue.main.async {
                    self.apps = appsDictionary
                    completion()
                }
            }
        }
    }
    
    //MARK: - Values to display in our tableViewController.
    
    /**
     Number of items to show in our tableView.
     */
    func numberOfItemsToShow (in section: Int) -> Int {
        return self.apps?.count ?? 0
    }
    /**
     Function to get the app's name.
     */
    func appTitleToDisplay(for indexPath: IndexPath) -> String {
        return apps?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
    
    /**
     Function to convert the imageUrl to UIImage.
     */
    func appImageToDisplay (for indexPath: IndexPath) -> URL {
        let arrayImages = apps?[indexPath.row].value(forKeyPath: "im:image") as? [NSDictionary]
        
        let stringImage = arrayImages?[2].value(forKeyPath: "label") as? String ?? ""
        
        let urlImage : URL = URL(string: stringImage)!
        
        
//        let session = URLSession(configuration: .default)
//        
//        var imageData : Data?
//        
//        let downloadPicTask = session.dataTask(with: urlImage!) { (data, response, error) in
//            
//            if let e = error {
//                print(e)
//            } else {
//                
//                if let res = response as? HTTPURLResponse {
//                    
//                    if let imageDataFromURL = data {
//                        
//                        print("Se descargo bien")
//
//                        DispatchQueue.main.async {
//                            imageData = imageDataFromURL
//                        }
////                        DispatchQueue.main.async {
////                            
////                            imageToShow = image
////                        }
//                }
//            }
//        }
        
//        
   //     }
        
  //      downloadPicTask.resume()

        return urlImage
    }
    
    /**
     Function to get the app's Description.
     */
    func appDescriptionToDisplay (for indexPath: IndexPath) -> String{
        return apps?[indexPath.row].value(forKeyPath: "summary.label") as? String ?? ""
    }
    
    
    
}
