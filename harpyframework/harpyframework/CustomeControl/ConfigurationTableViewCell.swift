//
//  ConfigurationTableViewCell.swift
//  harpyframework
//
//  Created by SPJ on 1/29/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ConfigurationTableViewCell: UITableViewCell {
    // MARK: Properties
    /** Left image */
    private var _leftImg: UIImageView    = UIImageView()
    /** Name of config item */
    private var _name: UILabel           = UILabel()
    /** Value of config at switch */
    private var _switchValue: UISwitch   = UISwitch()
    /** Value of config at text */
    private var _value: UILabel          = UILabel()
    /** Right image */
    private var _rightImg: UIImageView   = UIImageView()
    public static var PARENT_WIDTH       = GlobalConst.SCREEN_WIDTH
    
    // MARK: Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        // Initialization code
        let contentHeight: CGFloat = self.frame.height - 2 * GlobalConst.MARGIN_CELL_X
        let parentWidth: CGFloat = ConfigurationTableViewCell.PARENT_WIDTH
        // Left image
        _leftImg.translatesAutoresizingMaskIntoConstraints = true
        _leftImg.frame = CGRect(x: GlobalConst.MARGIN,
                                y: GlobalConst.MARGIN_CELL_X,
                                width: contentHeight,
                                height: contentHeight)
        _leftImg.contentMode = .scaleAspectFit
        // Name label
        _name.translatesAutoresizingMaskIntoConstraints = true
        _name.frame = CGRect(x: _leftImg.frame.maxX + GlobalConst.MARGIN,
                             y: GlobalConst.MARGIN_CELL_X,
                             width: parentWidth,
                             height: contentHeight)
        _name.textAlignment = .left
        _name.textColor     = UIColor.black
        _name.font          = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        // Right image
        _rightImg.translatesAutoresizingMaskIntoConstraints = true
        let size: CGFloat = GlobalConst.CONFIGURATION_ITEM_RIGHT_SIZE
        _rightImg.frame = CGRect(x: parentWidth - GlobalConst.MARGIN - size,
                                 y: GlobalConst.MARGIN_CELL_X * 2,
                                 width: size,
                                 height: contentHeight - GlobalConst.MARGIN_CELL_X * 2)
        _rightImg.contentMode = .scaleAspectFit
        _rightImg.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(M_PI)) / 180.0)
        _rightImg.tintColor = UIColor.gray
        // Switch control
        _switchValue.translatesAutoresizingMaskIntoConstraints = true
        _switchValue.frame = CGRect(x: parentWidth - GlobalConst.MARGIN - _switchValue.frame.width,
                                    y: (self.frame.height - _switchValue.frame.height) / 2,
                                    width: _switchValue.frame.width,
                                    height: _switchValue.frame.height)
        // Value label
        _value.translatesAutoresizingMaskIntoConstraints = true
        _value.frame = CGRect(x: _leftImg.frame.maxX + GlobalConst.MARGIN,
                              y: GlobalConst.MARGIN_CELL_X,
                              width: parentWidth - 4 * GlobalConst.MARGIN - _leftImg.frame.width - size,
                              height: contentHeight)
        _value.textAlignment = .right
        _value.textColor     = UIColor.gray
        _value.font          = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        // Add to cell
        self.addSubview(_leftImg)
        self.addSubview(_name)
        self.addSubview(_rightImg)
        self.addSubview(_value)
        self.addSubview(_switchValue)
        self.frame = CGRect(x: 0, y: 0,
                            width: ConfigurationTableViewCell.PARENT_WIDTH,
                            height: self.frame.height)
        self.makeComponentsColor()
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /**
     * Set data for cell, switch control is visible
     * - parameter leftImg:     Left image file path
     * - parameter name:        Name of item
     * - parameter swichValue:  Value of switch control
     * - parameter action:      Event switch change value handler
     * - parameter target:      Target of event handler
     */
    public func setData(leftImg: String, name: String, switchValue: Bool, action: Selector, target: Any?) {
        self._leftImg.setImage(imgPath: leftImg)
        self._switchValue.isHidden  = false
        self._name.isHidden         = false
        self._name.text             = name
        self._value.isHidden        = true
        self._switchValue.isOn      = switchValue
        self._switchValue.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
    }
    
    /**
     * Set data for cell, switch control is invisible
     * - parameter leftImg:         Left image file path
     * - parameter name:            Name of item
     * - parameter value:           Value of item
     * - parameter isHideRightImg:  Flag hide/show right image
     */
    public func setData(leftImg: String, name: String, value: String, isHideRightImg: Bool = false) {
        self._leftImg.setImage(imgPath: leftImg)
        self._switchValue.isHidden  = true
        self._name.text             = name
        let size = _name.text?.widthOfString(usingFont: _name.font)
        var frame = self._name.frame
        frame.size = CGSize(width: size!, height: frame.height)
        self._name.frame = frame
        
        self._value.text            = value
        if isHideRightImg {
            self._rightImg.isHidden = true
            self._value.frame       = CGRect(x: self._name.frame.maxX,
                                             y: self._value.frame.origin.y,
                                             width: ConfigurationTableViewCell.PARENT_WIDTH - self._name.frame.maxX - GlobalConst.MARGIN,
                                             height: self._value.frame.height)
        } else {
            let back                = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
            let tintedBack          = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            self._rightImg.image    = tintedBack
            
            self._value.frame       = CGRect(x: self._name.frame.maxX,
                                             y: self._value.frame.origin.y,
                                             width: self._rightImg.frame.minX - self._name.frame.maxX,
                                             height: self._value.frame.height)
        }
    }
    
    /**
     * Set data for cell, with data is Configuration model
     * - parameter data: ConfigurationModel
     */
    public func setData(data: ConfigurationModel) {
        self.setData(leftImg: data.getIconPath(),
                     name: data.name,
                     value: data.getValue(),
                     isHideRightImg: true)
        let contentHeight = self.frame.height - 2 * GlobalConst.MARGIN_CELL_X
        _leftImg.frame = CGRect(x: GlobalConst.MARGIN + contentHeight / 4,
                                y: GlobalConst.MARGIN_CELL_X + contentHeight / 4,
                                width: contentHeight / 2,
                                height: contentHeight / 2 )
        _leftImg.contentMode = .scaleAspectFit
        let size = _name.text?.widthOfString(usingFont: _name.font)
        _value.frame = CGRect(x: _leftImg.frame.maxX + GlobalConst.MARGIN + contentHeight / 4 + size!,
                              y: GlobalConst.MARGIN_CELL_X,
                              width: ConfigurationTableViewCell.PARENT_WIDTH - 4 * GlobalConst.MARGIN - _leftImg.frame.width - GlobalConst.CONFIGURATION_ITEM_RIGHT_SIZE - size!,
                              height: contentHeight)
    }
    
    /**
     * Set data for OrderDetail object
     * - parameter material: OrderDetailBean
     */
    public func setData(material: OrderDetailBean) {
        self.setData(leftImg: material.material_image, name: material.material_name,
                     value: material.material_price + DomainConst.VIETNAMDONG, isHideRightImg: true)
        let contentHeight = self.frame.height - 2 * GlobalConst.MARGIN_CELL_X
        _leftImg.frame = CGRect(x: GlobalConst.MARGIN + contentHeight / 4,
                                y: GlobalConst.MARGIN_CELL_X + contentHeight / 4,
                                width: contentHeight / 2,
                                height: contentHeight / 2 )
        _leftImg.contentMode = .scaleAspectFit
        let size = _name.text?.widthOfString(usingFont: _name.font)
        _value.frame = CGRect(x: _leftImg.frame.maxX + GlobalConst.MARGIN + contentHeight / 4 + size!,
                              y: GlobalConst.MARGIN_CELL_X,
                              width: ConfigurationTableViewCell.PARENT_WIDTH - 4 * GlobalConst.MARGIN - _leftImg.frame.width - GlobalConst.CONFIGURATION_ITEM_RIGHT_SIZE - size!,
                              height: contentHeight)
    }
    
    /**
     * Highlight value string
     */
    public func highlightValue() {
        highlighText(control: _value)
    }
    
    /**
     * Highlight name string
     */
    public func highlightName() {
        highlighText(control: _name)
    }
    
    /**
     * Highlight control label
     * - parameter control: Control to highlight
     */
    private func highlighText(control: UILabel) {
        control.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        control.textColor = GlobalConst.MAIN_COLOR
    }
}