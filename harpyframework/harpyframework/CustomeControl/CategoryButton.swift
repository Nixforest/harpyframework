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
    
    /**
     * Constructor
     * - parameter frame:       Frame of button
     * - parameter icon:        Icon of button
     * - parameter iconActive:  Active icon of button
     * - parameter title:       Title of button
     * - parameter id:          Id of button
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
        //++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
//        self.setImage(ImageManager.getImage(named: icon), for: UIControlState.normal)
//        self.setImage(ImageManager.getImage(named: iconActive), for: UIControlState.selected)
        handleImage(icon: icon, iconActive: iconActive)
        //-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
        self.imageView?.contentMode = .scaleAspectFit
        self.centerVertically()
        self.makeComponentsColor()
    }
    
    /**
     * Constructor
     * - parameter frame:       Frame of button
     * - parameter icon:        Icon of button
     * - parameter iconActive:  Active icon of button
     * - parameter title:       Title of button
     * - parameter id:          Id of button
     * - parameter font:        Font of button
     */
    public init(frame: CGRect, icon: String, iconActive: String,
                title: String, id: String, font: CGFloat) {
        super.init(frame: UIScreen.main.bounds)
        self.frame                      = frame
        self.accessibilityIdentifier    = id
        self.backgroundColor            = UIColor.white
        self.titleLabel?.font           = UIFont.systemFont(ofSize: font)
        self.setTitle(title, for: UIControlState())
        self.setTitleColor(UIColor.darkText, for: UIControlState.normal)
        self.setTitleColor(GlobalConst.BUTTON_COLOR_RED_TRUE, for: UIControlState.selected)
        //++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
//        self.setImage(ImageManager.getImage(named: icon), for: UIControlState.normal)
//        self.setImage(ImageManager.getImage(named: iconActive), for: UIControlState.selected)
        handleImage(icon: icon, iconActive: iconActive)
        //-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
        self.imageView?.contentMode = .scaleAspectFit
        self.centerVerticallyRect()
        self.makeComponentsColor()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    //++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
    /**
     * Handle image on button
     * - parameter icon:        Icon of button
     * - parameter iconActive:  Active icon of button
     */
    private func handleImage(icon: String, iconActive: String) {
        self.setImage(ImageManager.getImage(named: icon), for: UIControlState.normal)
        if icon == iconActive {
            let active = ImageManager.getImage(named: iconActive)
            let tinted = active?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self.tintColor = GlobalConst.BUTTON_COLOR_RED
            self.setImage(tinted, for: UIControlState.selected)
        } else {
            self.setImage(ImageManager.getImage(named: iconActive), for: UIControlState.selected)
        }
    }
    //-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
}
