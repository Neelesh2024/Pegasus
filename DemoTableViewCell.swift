//
//  DemoTableViewCell.swift
//  Pegasus
//
//  Created by Choudary Rayani on 9/9/20.
//  Copyright © 2020 Neel Rayani. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    print("monkey")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)

        // Configure the view for the selected state
    }
    
}
