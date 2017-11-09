//
//  AppCell.swift
//  SwiftStoreWithMVVM
//
//  Created by sebastian on 8/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {
    @IBOutlet var imageApp: UIImageView!

    @IBOutlet var nameApp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
