//
//  ConfigurationModel.swift
//  harpyframework
//
//  Created by SPJ on 1/30/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class ConfigurationModel: ConfigBean {
    /** Path of icon image */
    private var _iconPath:  String = DomainConst.BLANK
    /** Value of model */
    private var _value:     String = DomainConst.BLANK
    
    /**
     * Constructor
     * - parameter id:          Id of model
     * - parameter name:        Name of model
     * - parameter iconPath:    Path of icon
     * - parameter value:       Value of model
     */
    public init(id: String, name: String, iconPath: String, value: String) {
        super.init(id: id, name: name)
        self._iconPath  = iconPath
        self._value     = value
    }
    
    /**
     * Get icon path
     * - returns: value of icon path
     */
    public func getIconPath() -> String {
        return self._iconPath
    }
    
    /**
     * Get Value
     * - returns: Value of model
     */
    public func getValue() -> String {
        return self._value
    }
    
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    /**
     * Initialize from material bean
     * - parameter material: Material bean
     */
    public init(material: MaterialBean) {
        var price = material.material_price
        if price == DomainConst.NUMBER_ZERO_VALUE {
            // Make price is blank if price = "0"
            price = DomainConst.BLANK
        }
        super.init(id: material.material_id, name: material.materials_name_short)
        self._iconPath  = material.material_image
        self._value     = price
    }
    
    /**
     * Initialize from Order detail
     * - parameter orderDetail: Order detail
     */
    public init(orderDetail: OrderDetailBean) {
        let qty = orderDetail.qty
        var value = orderDetail.material_price
        if (value == DomainConst.NUMBER_ZERO_VALUE)
                || value.isEmpty {
            // Make price is blank if price = "0"
            value = DomainConst.BLANK
            if !qty.isEmpty && qty != DomainConst.NUMBER_ONE_VALUE {
                value = "x " + qty
            }
        } else {
            if !qty.isEmpty && qty != DomainConst.NUMBER_ONE_VALUE {
                value = qty + " x " + value
            }
        }
        var name = orderDetail.materials_name_short
        if name.isEmpty {
            name = orderDetail.material_name
        }
        super.init(id: orderDetail.material_id, name: name)
        self._iconPath  = orderDetail.material_image
        //++ BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
        let originalPrice = orderDetail.price_original
        if originalPrice.isEmpty || originalPrice == DomainConst.NUMBER_ZERO_VALUE {
            self._value     = value
        } else {
            self._value     = value + DomainConst.LINE_FEED + "\(originalPrice)"
        }
        //-- BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /**
     * Update data
     * - parameter id:          Id of model
     * - parameter name:        Name of model
     * - parameter iconPath:    Path of icon
     * - parameter value:       Value of model
     */
    public func updateData(id: String, name: String, iconPath: String, value: String) {
        self.id         = id
        self.name       = name
        self._iconPath  = iconPath
        self._value     = value
    }
    //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    
    /**
     * Set value
     * - parameter value: Value to set
     */
    public func setValue(value: String) {
        self._value = value
    }
}
