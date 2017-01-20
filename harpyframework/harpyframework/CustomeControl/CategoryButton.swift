//
//  CategoryButton.swift
//  harpyframework
//
//  Created by SPJ on 1/16/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CategoryButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    public init(frame: CGRect, icon: String, iconActive: String,
                title: String, id: String) {
        super.init(frame: UIScreen.main.bounds)
        self.frame                      = frame
        self.accessibilityIdentifier    = id
        self.backgroundColor            = UIColor.white
        self.titleLabel?.font           = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.setTitle(title, for: UIControlState())
        self.setTitleColor(UIColor.darkText, for: UIControlState.normal)
        self.setTitleColor(GlobalConst.BUTTON_COLOR_RED_TRUE, for: UIControlState.selected)
        self.setImage(ImageManager.getImage(named: icon), for: UIControlState.normal)
        self.setImage(ImageManager.getImage(named: iconActive), for: UIControlState.selected)
        self.imageView?.contentMode = .scaleAspectFit
        self.centerVertically()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}