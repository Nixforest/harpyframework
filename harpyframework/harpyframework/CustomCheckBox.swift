//
//  CustomCheckBox.swift
//  harpyframework
//
//  Created by SPJ on 12/17/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
public class CustomCheckBox: UIButton {
    /** Image */
    let imgUnchecked    = UIImage(named: GlobalConst.UNCHECK_IMG_NAME)
    let imgChecked      = UIImage(named: GlobalConst.CHECKED_IMG_NAME)
    /** Bool value to show Image */
    var bChecked:Bool = false {
        didSet {
            if (bChecked == true) {
                self.setImage(imgChecked, for: UIControlState())
            }else {
                self.setImage(imgUnchecked, for: UIControlState())
            }
        }
    }
    /**
     * Awake from nib
     */
    override public func awakeFromNib() {
        self.addTarget(self, action: #selector(CustomCheckBox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
        self.bChecked = false
        
    }
    
    /**
     * Handle click event.
     */
    func buttonClicked(_ sender: UIButton) {
        if (sender == self) {
            if (bChecked == false) {
                bChecked = true
            }else {
                bChecked = false
            }
        }
    }
    
}
