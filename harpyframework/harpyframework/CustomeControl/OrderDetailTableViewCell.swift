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
    
    /**
     * Setup layout for cell
     * - parameter data:            Data and weight of width in cell
     * - parameter color:           Background color
     * - parameter highlighColumn:  Data and weight of width in cell
     */
    public func setup(data: [(String, Int)], color: UIColor = UIColor.white
        //++ BUG0060-SPJ (NguyenPT 20170426) Update function G05 for Employee
        , highlighColumn: [Int] = [Int]()
        //-- BUG0060-SPJ (NguyenPT 20170426) Update function G05 for Employee
        //++ BUG0073-SPJ (NguyenPT 20170504) Add alignment setting array
        , alignment: [NSTextAlignment] = [NSTextAlignment]()
        //-- BUG0073-SPJ (NguyenPT 20170504) Add alignment setting array
)
    {
        //++ BUG0078-SPJ (NguyenPT 20170508) Fix bug reload table view make data overlapping
        for view in self.subviews {
            view.removeFromSuperview()
        }
        //-- BUG0078-SPJ (NguyenPT 20170508) Fix bug reload table view make data overlapping
        //++ BUG0073-SPJ (NguyenPT 20170504) Check if alignment array not equal element with data
        if (alignment.count != 0)
            && (alignment.count != data.count) {
            return
        }
        //-- BUG0073-SPJ (NguyenPT 20170504) Check if alignment array not equal element with data
        var totalWeight = 0
        // Calculate total of weight
        for item in data {
            totalWeight = totalWeight + item.1
        }
        // Get width of 1 weight
        //++ BUG0073-SPJ (NguyenPT 20170504) Re-calculate width of 1 weight
        //let width: CGFloat = (GlobalConst.SCREEN_WIDTH - GlobalConst.MARGIN_CELL_X * (CGFloat(totalWeight) + 1)) / CGFloat(totalWeight)
        let width: CGFloat = (GlobalConst.SCREEN_WIDTH - GlobalConst.MARGIN_CELL_X * CGFloat(data.count + 1)) / CGFloat(totalWeight)
        //-- BUG0073-SPJ (NguyenPT 20170504) Re-calculate width of 1 weight
        
        // Create labels
        var offset = GlobalConst.MARGIN_CELL_X
        var i = 0
        for item in data {
            let label = UILabel()
            label.frame = CGRect(x: offset, y: 0,
                                 width: CGFloat(item.1) * width,
                                 height: GlobalConst.CONFIGURATION_ITEM_HEIGHT)
            label.text = item.0
            //++ BUG0073-SPJ (NguyenPT 20170504) Set alignment by alignment array
//            if i == 0 {
//                label.textAlignment = .left
//            } else {
//                label.textAlignment = .center
//            }
            if alignment.count == 0 {
                if i == 0 {
                    label.textAlignment = .left
                } else {
                    label.textAlignment = .center
                }
            } else {
                label.textAlignment = alignment[i]
            }
            //-- BUG0073-SPJ (NguyenPT 20170504) Set alignment by alignment array
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
            label.backgroundColor = color
            //++ BUG0060-SPJ (NguyenPT 20170426) Handle highligh column
            if highlighColumn.contains(i) {
                label.font = UIFont.boldSystemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
                label.textColor = GlobalConst.MAIN_COLOR
            }
            //-- BUG0060-SPJ (NguyenPT 20170426) Handle highligh column
            offset = offset + label.frame.width + GlobalConst.MARGIN_CELL_X
            self.addSubview(label)
            i += 1
        }
    }
    
    //++ BUG0060-SPJ (NguyenPT 20170426) Add configuration model to cell
    /**
     * Setup layout for cell
     * - parameter config:            Configuration model
     */
    public func setup(config: ConfigurationModel) {
        //++ BUG0078-SPJ (NguyenPT 20170508) Fix bug reload table view make data overlapping
        for view in self.subviews {
            view.removeFromSuperview()
        }
        //-- BUG0078-SPJ (NguyenPT 20170508) Fix bug reload table view make data overlapping
        /** Left image */
        let _leftImg: UIImageView    = UIImageView()
        /** Name of config item */
        let _name: UILabel           = UILabel()
        // Initialization code
        let contentHeight: CGFloat = self.frame.height - 2 * GlobalConst.MARGIN_CELL_X
        let parentWidth: CGFloat = ConfigurationTableViewCell.PARENT_WIDTH
        // Left image
        _leftImg.translatesAutoresizingMaskIntoConstraints = true
        _leftImg.frame = CGRect(x: GlobalConst.MARGIN + contentHeight / 4,
                                y: GlobalConst.MARGIN_CELL_X + contentHeight / 4,
                                width: contentHeight / 3 * 2,
                                height: contentHeight / 3 * 2)
        _leftImg.contentMode = .scaleAspectFit
        //++ BUG0136-SPJ (NguyenPT 20170727) Handle sum all cylinders
        //_leftImg.setImage(imgPath: config.getIconPath())
        let img = ImageManager.getImage(named: config.getIconPath())
        let tintedImg = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        _leftImg.image = tintedImg
        _leftImg.tintColor = GlobalConst.MAIN_COLOR
        //-- BUG0136-SPJ (NguyenPT 20170727) Handle sum all cylinders
        // Name label
        _name.translatesAutoresizingMaskIntoConstraints = true
        _name.frame = CGRect(x: _leftImg.frame.maxX + GlobalConst.MARGIN,
                             y: GlobalConst.MARGIN_CELL_X,
                             width: parentWidth,
                             height: contentHeight)
        _name.textAlignment = .left
        _name.text          = config.name
        _name.font          = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        _name.textColor     = GlobalConst.MAIN_COLOR
        // Add to cell
        self.addSubview(_leftImg)
        self.addSubview(_name)
    }
    //-- BUG0060-SPJ (NguyenPT 20170426) Add configuration model to cell
}
