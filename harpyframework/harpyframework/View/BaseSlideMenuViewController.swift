//
//  BaseSlideMenuViewController.swift
//  harpyframework
//
//  Created by SPJ on 3/7/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class BaseSlideMenuViewController: SlideMenuController {
    override open func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Main") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Left") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
}
