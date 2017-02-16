//
//  File.swift
//  harpyframework
//
//  Created by SPJ on 2/6/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import Foundation
public class DebugBean {
    /** Flag set color for all components on View */
    public var _isColorOn:      Bool    = false
    /** Flag show toast message on View */
    public var _isShowToast:    Bool    = false
    /** Zoom value */
    public var _zoomValue:      CGFloat = 13.0
    /** Flag if this app is Gas Service app */
    public var _isGasService:   Bool    = true
    
    /**
     * Default constructor
     */
    public init() {
        
    }
}
