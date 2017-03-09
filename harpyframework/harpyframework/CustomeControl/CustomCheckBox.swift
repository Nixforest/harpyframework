//
//  CustomCheckBox.swift
//  harpyframework
//
//  Created by SPJ on 12/17/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
public class CustomCheckBox: UIButton {
    /** Check changed delegate */
    public var checkChangedDelegate: CheckBoxDelegate?
    /** Image */
    let imgUnchecked    = ImageManager.getImage(named: DomainConst.UNCHECK_IMG_NAME)
    let imgChecked      = ImageManager.getImage(named: DomainConst.CHECKED_IMG_NAME)
    /** Bool value to show Image */
    public var bChecked: Bool = false {
        didSet {
            if (bChecked == true) {
                self.setImage(imgChecked, for: UIControlState())
            } else {
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
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
        self.makeComponentsColor()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /**
     * Handle click event.
     */
    public func buttonClicked(_ sender: UIButton) {
        if (sender == self) {
            if (bChecked == false) {
                bChecked = true
            }else {
                bChecked = false
            }
        }
        checkChangedDelegate?.checkChanged(sender)
    }
    
    override public func layoutSubviews()
    {
        super.layoutSubviews()
        
        let imageFrame = self.imageView?.frame;
        let labelFrame = self.titleLabel?.frame;
        
        let inset: CGFloat = 5
        
        if var imageFrame = imageFrame
        {
            if var labelFrame = labelFrame
            {
                //let cumulativeWidth = imageFrame.width + labelFrame.width + inset
                //let excessiveWidth = self.bounds.width - cumulativeWidth
                //labelFrame.origin.x = excessiveWidth / 2
                imageFrame.origin.x = 0
                labelFrame.origin.x = imageFrame.maxX + inset
                
                self.imageView?.frame = imageFrame
                self.titleLabel?.frame = labelFrame
            }
        }
    }
}
