//
//  MaterialSelector.swift
//  harpyframework
//
//  Created by SPJ on 1/16/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class MaterialSelector: UIView {
    /** Icon */
    private var _icon       = UIImageView()
    /** Label name */
    private var _lblName    = UILabel()
    /** Label price */
    private var _lblPrice    = UILabel()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    /**
     * Constructor
     * - parameter iconPath:    Path of icon image
     * - parameter name:        Name of material
     * - parameter price:       Price of material
     * - parameter width:       Width of control
     * - parameter height:      Height of control
     */
    public init(iconPath: String, name: String, price: String,
         width: CGFloat, height: CGFloat) {
        super.init(frame: UIScreen.main.bounds)
        let contentHeight = height - 2 * GlobalConst.MARGIN_CELL_X
        // Icon
        _icon.image = ImageManager.getImage(named: iconPath)
        _icon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                             y: GlobalConst.MARGIN_CELL_X,
                             width: width * 2 / 5 - GlobalConst.MARGIN_CELL_X,
                             height: contentHeight)
        _icon.contentMode = .scaleAspectFit
        //_icon.backgroundColor = UIColor.blue
        self.addSubview(_icon)
        // Name label
        _lblName.frame = CGRect(x: _icon.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                y: GlobalConst.MARGIN_CELL_X,
                                width: width * 3 / 5 - GlobalConst.MARGIN_CELL_X,
                                height: contentHeight * 2 / 3)
        _lblName.text          = name
        _lblName.textColor     = GlobalConst.BUTTON_COLOR_RED
        _lblName.font          = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        _lblName.numberOfLines = 0
        _lblName.lineBreakMode = .byWordWrapping
        self.addSubview(_lblName)
        // Price label
        _lblPrice.frame = CGRect(x: _icon.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                y: _lblName.frame.maxY,
                                width: width * 3 / 5 - GlobalConst.MARGIN_CELL_X,
                                height: contentHeight / 3)
        let priceText = price
        //++ BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
        //if !priceText.isEmpty {
        //    priceText = priceText + DomainConst.VIETNAMDONG
        //}
        //-- BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
        _lblPrice.text          = priceText
        _lblPrice.textColor     = GlobalConst.BUTTON_COLOR_RED
        _lblPrice.font          = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        _lblPrice.numberOfLines = 0
        _lblPrice.lineBreakMode = .byWordWrapping
        self.addSubview(_lblPrice)
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    /**
     * Set name of material
     * - parameter name:        Name of material
     */
    public func setName(name: String) {
        _lblName.text          = name
    }
    
    /**
     * Set icon image of material
     * - parameter img:        Image path
     */
    public func setImage(img: String) {
        if img.isEmpty {
            _icon.image = ImageManager.getImage(named: DomainConst.DEFAULT_MATERIAL_IMG_NAME)
            return
        }
        // Download image from path
        _icon.getImgFromUrl(link: img, contentMode: _icon.contentMode)
    }
    
    /**
     * Set price of material
     * - parameter price:        Price of material
     */
    public func setPrice(price: String) {
        let priceText = price
        if priceText == DomainConst.NUMBER_ZERO_VALUE ||
            priceText.isEmpty {
            _lblPrice.isHidden = true
            _lblName.frame = CGRect(x: _icon.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                    y: GlobalConst.MARGIN_CELL_X + _lblPrice.frame.height / 2,
                                    width: self.frame.width * 3 / 5 - GlobalConst.MARGIN_CELL_X,
                                    height: (self.frame.height - 2 * GlobalConst.MARGIN_CELL_X) * 2 / 3)
        } else {
            _lblPrice.isHidden = false
            _lblName.frame = CGRect(x: _icon.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                    y: GlobalConst.MARGIN_CELL_X,
                                    width: self.frame.width * 3 / 5 - GlobalConst.MARGIN_CELL_X,
                                    height: (self.frame.height - 2 * GlobalConst.MARGIN_CELL_X) * 2 / 3)
        }
        //++ BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
        //if !priceText.isEmpty {
        //    priceText = priceText + DomainConst.VIETNAMDONG
        //}
        //-- BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
        _lblPrice.text          = priceText
    }
    
    /**
     * Update content of material
     * - parameter iconPath:    Path of icon image
     * - parameter name:        Name of material
     * - parameter price:       Price of material
     */
    public func updateContent(iconPath: String, name: String, price: String) {
        // In the case not found material data
        if iconPath.isEmpty && price.isEmpty {
            _icon.image = ImageManager.getImage(named: DomainConst.DEFAULT_MATERIAL_IMG_NAME)
            setName(name: name)
            setPrice(price: DomainConst.BLANK)
            return
        }
        setImage(img: iconPath)
        setName(name: name)
        setPrice(price: price)
    }
    
    public func updateFont() {
        self._lblName.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        self._lblPrice.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
