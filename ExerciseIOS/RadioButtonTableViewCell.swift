//
//  RadioButtonTableViewCell.swift
//  ExerciseIOS
//
//  Created by Song Seaktheng on 12/20/16.
//  Copyright © 2016 Song Seaktheng. All rights reserved.
//

import UIKit

class RadioButtonTableViewCell: UITableViewCell {

    var isCheck : Bool = false
    @IBOutlet weak var radioImageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isCheck = selected
        // Configure the view for the selected state
    }

}
