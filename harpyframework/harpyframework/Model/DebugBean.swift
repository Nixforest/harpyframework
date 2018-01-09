//
//  File.swift
//  harpyframework
//
//  Created by SPJ on 2/6/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import Foundation
public class DebugBean {
//    public static let DEBUG_DEFAULT_GAS_SERVICE                 = true
    public static let DEBUG_DEFAULT_GAS_SERVICE                 = false
    public static let DEBUG_DEFAULT_TOP_ICON                    = false
    public static let DEBUG_DEFAULT_SHOW_NUMBER_PICKER          = true
    public static let DEBUG_DEFAULT_USE_MATERIAL_NAME_SHORT     = true
    /** Flag set color for all components on View */
    public var _isColorOn:              Bool    = true
    /** Flag show toast message on View */
    public var _isShowToast:            Bool    = false
    /** Zoom value */
    public var _zoomValue:              CGFloat = 13.0
    /** Flag if this app is Gas Service app */
    public var _isGasService:           Bool    = DEBUG_DEFAULT_GAS_SERVICE
    /** Flag show/not show number picker */
    public var _isShowNumberPicker:     Bool    = DEBUG_DEFAULT_SHOW_NUMBER_PICKER
    /** Flag show/not show top icon */
    public var _isShowTopIcon:          Bool    = DEBUG_DEFAULT_TOP_ICON
    /** Flag use material_name or material_name_short */
    public var _isMaterialNameShort:    Bool    = DEBUG_DEFAULT_USE_MATERIAL_NAME_SHORT
    
    /**
     * Default constructor
     */
    public init() {
        
    }
}
