//
//  BottomMsgCell.swift
//  harpyframework
//
//  Created by SPJ on 11/29/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class BottomMsgCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

/**
 * Type of bottom message cell enum
 */
enum BottomMsgCellTypeEnum {
    case shareCode          // Share refer code
    case usingCode          // Using refer code
    case news               // View news
    case type_num           // Number of items
}
