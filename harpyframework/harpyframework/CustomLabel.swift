//
//  CustomLabel.swift
//  harpyframework
//
//  Created by SPJ on 12/29/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import UIKit

open class CustomLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    open func updateLayout() {
        let height: CGFloat = (self.text?.heightWithConstrainedWidth(width: self.frame.width, font: self.font))!
        let currentHeight: CGFloat = self.frame.height
        //if currentHeight < height {
            var frame = self.frame
            frame.size.height = height
            //self.frame = frame
            self.numberOfLines = 0
            self.lineBreakMode = .byWordWrapping
        //}
    }
}
