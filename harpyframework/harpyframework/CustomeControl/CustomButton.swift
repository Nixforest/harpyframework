//
//  CustomButton.swift
//  harpyframework
//
//  Created by SPJ on 9/19/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CustomButton: UIButton {
    override public func layoutSubviews() {
        super.layoutSubviews()
        contentHorizontalAlignment = .left
        let availableSpace = UIEdgeInsetsInsetRect(bounds,
                                                   contentEdgeInsets)
        let availableWidth = availableSpace.width
            - imageEdgeInsets.right - (imageView?.frame.width ?? 0)
            - (titleLabel?.frame.width ?? 0)
        titleEdgeInsets = UIEdgeInsets(
            top: 0, left: availableWidth / 1.5,
            bottom: 0, right: 0)
    }
    // Add image on left view
    public func leftImage(image: UIImage) {
        self.setImage(image, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -image.size.width / 3, bottom: 0, right: image.size.width / 2)
    }
}
