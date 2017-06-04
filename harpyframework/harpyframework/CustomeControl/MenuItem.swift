//
//  MenuItem.swift
//  harpyframework
//
//  Created by SPJ on 12/27/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
class MenuItem: UIView {
    /** Icon */
    private var icon: UIImageView = UIImageView()
    /** Button */
    private var button: UIButton = UIButton()
    
    /**
     * Initialize
     * - parameter title:       Title string
     * - parameter id:          Id of item
     * - parameter iconPath:    Path of icon
     * - parameter action:      Action
     */
    init(title: String, id: String, iconPath: String, action: Selector) {
        super.init(frame: UIScreen.main.bounds)
        // Icon
        let img = ImageManager.getImage(named: iconPath)
        let tinted = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        icon.tintColor = UIColor.white
        icon.image = tinted//ImageManager.getImage(named: iconPath)
        icon.translatesAutoresizingMaskIntoConstraints = true
        icon.frame = CGRect(x: GlobalConst.MARGIN,
                            y: GlobalConst.MARGIN,
                            width: GlobalConst.BUTTON_HEIGHT - 2 * GlobalConst.MARGIN,
                            height: GlobalConst.BUTTON_HEIGHT - 2 * GlobalConst.MARGIN)
        self.addSubview(icon)
        // Button
        button.translatesAutoresizingMaskIntoConstraints = true
        button.frame = CGRect(x: GlobalConst.MARGIN + icon.frame.maxX,
                              y: 0,
                              width: GlobalConst.POPOVER_WIDTH,
                              height: GlobalConst.BUTTON_HEIGHT)
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont.systemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE)
        button.accessibilityIdentifier = id
        button.addTarget(nil, action: action, for: .touchUpInside)
        button.layer.addBorder(edge: .bottom, color: GlobalConst.BUTTON_COLOR_RED_TRUE,
                               thickness: 1.0)
        self.addSubview(button)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
