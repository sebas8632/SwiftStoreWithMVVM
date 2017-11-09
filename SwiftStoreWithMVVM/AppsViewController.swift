//
//  ViewController.swift
//  SwiftStoreWithMVVM
//
//  Created by sebastian on 6/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class AppsViewController: UIViewController {

    @IBOutlet var appsTableView: UITableView!
    
    @IBOutlet var appsViewModel : AppsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        appsViewModel.getApps {
            self.appsTableView.reloadData()
        }
    //TODO - Connect with TableView.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK: - UITableView DataSource

extension AppsViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appsViewModel.numberOfItemsToShow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  =  appsTableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! AppCell
        
        cell.nameApp.text = appsViewModel.appTitleToDisplay(for: indexPath)
        
        let urlImage : URL = appsViewModel.appImageToDisplay(for: indexPath)
        
        do {
        let imageData = try Data(contentsOf: urlImage)
            cell.imageApp.image = UIImage(data: imageData)

        } catch {}
//        let session = URLSession(configuration: .default)
//        
//        let downloadPic = session.dataTask(with: urlImage) { (data, response, error) in
//            
//            if let e = error {
//                print(e)
//            }
//            else {
//                if let res = response {
//                    
//                    if let imageData = data {
//                        
//                        DispatchQueue.main.async {
//                            cell.imageApp.image = UIImage(data: imageData)
//                        }
//                }
//            }
//            
//        }
      //  }
      //  cell.imageApp.image = appsViewModel.appImageToDisplay(for: indexPath)
        
        
     //   cell.nameApp.text = appsViewModel.appImageToDisplay(for: indexPath)
        return cell
    }
}

