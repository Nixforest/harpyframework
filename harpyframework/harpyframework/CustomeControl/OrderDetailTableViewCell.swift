//
//  OrderDetailTableViewCell.swift
//  harpyframework
//
//  Created by SPJ on 2/19/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderDetailTableViewCell: UITableViewCell {

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func setup(data: [(String, Int)], color: UIColor = UIColor.white) {
        var totalWeight = 0
        // Calculate total of weight
        for item in data {
            totalWeight = totalWeight + item.1
        }
        // Get width of 1 weight
        let width: CGFloat = (GlobalConst.SCREEN_WIDTH - GlobalConst.MARGIN_CELL_X * (CGFloat(totalWeight) + 1)) / CGFloat(totalWeight)
        
        // Create labels
        var offset = GlobalConst.MARGIN_CELL_X
        var i = 0
        for item in data {
            let label = UILabel()
            label.frame = CGRect(x: offset, y: 0,
                                 width: CGFloat(item.1) * width,
                                 height: GlobalConst.CONFIGURATION_ITEM_HEIGHT)
            label.text = item.0
            if i == 0 {
                label.textAlignment = .left
            } else {
                label.textAlignment = .center
            }
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
            label.backgroundColor = color
            offset = offset + label.frame.width + GlobalConst.MARGIN_CELL_X
            self.addSubview(label)
            i += 1
        }
    }
}