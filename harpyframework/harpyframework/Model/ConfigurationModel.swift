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
}
