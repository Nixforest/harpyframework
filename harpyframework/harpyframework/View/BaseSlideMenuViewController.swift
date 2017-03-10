//
//  BaseSlideMenuViewController.swift
//  harpyframework
//
//  Created by SPJ on 3/9/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class BaseSlideMenuViewController: SlideMenuController {
    /**
     * Override awake from nib
     */
    override open func awakeFromNib() {
        // Get main controller
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main") {
            self.mainViewController = controller
        }
        // Get left controller
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Left") {
            self.leftViewController = controller
        }
    }
}
