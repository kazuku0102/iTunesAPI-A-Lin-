//
//  LinTableViewCell.swift
//  iTunesAPI(A-Lin)
//
//  Created by 蕭聿莘 on 2020/4/9.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit

class LinTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        photoImageView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
