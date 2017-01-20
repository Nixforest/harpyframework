//
//  MaterialSelector.swift
//  harpyframework
//
//  Created by SPJ on 1/16/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class MaterialSelector: UIView {
    /** Icon */
    private var _icon       = UIImageView()
    /** Label name */
    private var _lblName    = UILabel()
    /** Label price */
    private var _lblPrice    = UILabel()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    public init(iconPath: String, name: String, price: String,
         width: CGFloat, height: CGFloat) {
        super.init(frame: UIScreen.main.bounds)
        // Icon
        _icon.image = ImageManager.getImage(named: iconPath)
        _icon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                             y: GlobalConst.MARGIN_CELL_X,
                             width: width * 2 / 5,
                             height: height)
        _icon.contentMode = .scaleAspectFit
        self.addSubview(_icon)
        // Name label
        _lblName.frame = CGRect(x: _icon.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                y: GlobalConst.MARGIN_CELL_X,
                                width: width * 3 / 5,
                                height: height * 2 / 3)
        _lblName.text          = name
        _lblName.textColor     = GlobalConst.BUTTON_COLOR_RED
        _lblName.font          = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        _lblName.numberOfLines = 0
        _lblName.lineBreakMode = .byWordWrapping
        self.addSubview(_lblName)
        // Price label
        _lblPrice.frame = CGRect(x: _icon.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                y: _lblName.frame.maxY + GlobalConst.MARGIN_CELL_X,
                                width: width * 3 / 5,
                                height: height / 3)
        _lblPrice.text          = price
        _lblPrice.textColor     = GlobalConst.BUTTON_COLOR_RED
        _lblPrice.font          = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        _lblPrice.numberOfLines = 0
        _lblPrice.lineBreakMode = .byWordWrapping
        self.addSubview(_lblPrice)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
