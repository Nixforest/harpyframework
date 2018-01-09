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
    }
    
    override open func drawText(in rect: CGRect) {
        
        guard text != nil else {
            return super.drawText(in: rect)
        }
        
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y + rect.height - height
        super.drawText(in: CGRect(x: 0, y: y, width: rect.width, height: height))
    }
}
