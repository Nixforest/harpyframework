//
//  SearchBarTableViewCell.swift
//  project
//
//  Created by Lâm Phạm on 9/21/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

public class SearchBarTableViewCell: UITableViewCell {
    /** Result label */
    @IBOutlet weak public var result: UILabel!
    
    /**
     * Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
     */
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        result.translatesAutoresizingMaskIntoConstraints = true
        result.backgroundColor = UIColor.white
        result.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                              y: GlobalConst.MARGIN_CELL_X,
                              width: GlobalConst.SCREEN_WIDTH - GlobalConst.PARENT_BORDER_WIDTH * 2 - GlobalConst.MARGIN_CELL_X * 2,
                              height: self.frame.height - 1)
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
