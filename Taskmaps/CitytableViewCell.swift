//
//  CitytableViewCell.swift
//  Taskmaps
//
//  Created by Sriram Prasad on 12/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class CitytableViewCell: UITableViewCell {

    @IBOutlet weak var photosImgv: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
