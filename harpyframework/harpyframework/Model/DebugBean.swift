//
//  File.swift
//  harpyframework
//
//  Created by SPJ on 2/6/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import Foundation
public class DebugBean {
    public static let DEBUG_DEFAULT_GAS_SERVICE = true
    public static let DEBUG_DEFAULT_TOP_ICON    = false
    /** Flag set color for all components on View */
    public var _isColorOn:          Bool    = false
    /** Flag show toast message on View */
    public var _isShowToast:        Bool    = false
    /** Zoom value */
    public var _zoomValue:          CGFloat = 13.0
    /** Flag if this app is Gas Service app */
    public var _isGasService:       Bool    = DEBUG_DEFAULT_GAS_SERVICE
    /** Flag show/not show number picker */
    public var _isShowNumberPicker: Bool    = false
    /** Flag show/not show top icon */
    public var _isShowTopIcon:      Bool    = DEBUG_DEFAULT_TOP_ICON
    
    /**
     * Default constructor
     */
    public init() {
        
    }
}
