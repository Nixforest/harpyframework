//
//  MaterialBean.swift
//  harpyframework
//
//  Created by SPJ on 1/18/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class MaterialBean: NSObject {
    /** Material type id */
    public var materials_type_id:       String = DomainConst.BLANK
    /** Material id */
    public var material_id      :       String = DomainConst.BLANK
    /** Material name */
    public var material_name    :       String = DomainConst.BLANK
    /** Material name */
    public var materials_name_short:    String = DomainConst.BLANK
    /** Material price */
    public var material_price   :       String = DomainConst.BLANK
    /** Price */
    public var price            :       String = DomainConst.BLANK
    /** Material image */
    public var material_image   :       String = DomainConst.BLANK
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        self.materials_type_id  = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_TYPE_ID)
        self.material_id        = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_ID)
        self.material_name      = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_NAME)
        self.materials_name_short      = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_NAME_SHORT)
        self.material_price     = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_PRICE)
        self.price              = getString(json: jsonData, key: DomainConst.KEY_PRICE)
        self.material_image     = getString(json: jsonData, key: DomainConst.KEY_MATERIAL_IMAGE)
    }
    public override init() {
        
    }
    
    /**
     * Check if material is Gas type
     * - returns: True if "materials_type_id" equal 4/19/11/7, False otherwise
     */
    public func isGas() -> Bool {
        if self.materials_type_id == "4" ||
            self.materials_type_id == "11" ||
            self.materials_type_id == "19" ||
            self.materials_type_id == "7" {
            return true
        }
        return false
    }
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    /**
     * Check if material is Promotion type
     * - returns: True if "materials_type_id" equal 6, False otherwise
     */
    public func isPromotion() -> Bool {
        if self.materials_type_id == "6" {
            return true
        }
        return false
    }
    
    /**
     * Check if material is Cylinder type
     * - returns: True if "materials_type_id" equal 1/12/10/14, False otherwise
     */
    public func isCylinder() -> Bool {
        if self.materials_type_id == "1" ||
            self.materials_type_id == "12" ||
            self.materials_type_id == "10" ||
            self.materials_type_id == "14" {
            return true
        }
        return false
    }
    
    /**
     * Check if object is empty
     * - returns: self.material_id.isEmpty
     */
    public func isEmpty() -> Bool {
        return self.material_id.isEmpty
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
}
