//
//  MaterialBean.swift
//  harpyframework
//
//  Created by SPJ on 1/18/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

//++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
//open class MaterialBean: NSObject {
open class MaterialBean: NSObject, NSCoding {
//-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
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
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new property
    /** Material no */
    public var materials_no     :       String = DomainConst.BLANK
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new property
    //++ BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    /** Price */
    public var price_original:          String = DomainConst.BLANK
    //-- BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    
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
//        if self.materials_name_short.isEmpty {
//            self.materials_name_short = self.material_name
//        }
        self.material_price     = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_PRICE)
        self.price              = getString(json: jsonData, key: DomainConst.KEY_PRICE)
        self.material_image     = getString(json: jsonData, key: DomainConst.KEY_MATERIAL_IMAGE)
        //++ BUG0073-SPJ (NguyenPT 20170504) Add new property
        self.materials_no     = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_NO)
        //-- BUG0073-SPJ (NguyenPT 20170504) Add new property
        //++ BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
        self.price_original     = getString(json: jsonData, key: DomainConst.KEY_PRICE_ORIGINAL)
        if self.price_original.isEmpty {
            self.price_original     = getStringFromInt(json: jsonData, key: DomainConst.KEY_PRICE_ORIGINAL)
        }
        //-- BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    }
    public override init() {
        
    }
    
    /**
     * Check if material is Gas type
     * - returns: True if "materials_type_id" equal 4/7/9/11/19, False otherwise
     */
    public func isGas() -> Bool {
        if self.materials_type_id == DomainConst.GAS_TYPE_ID_6KG ||
            self.materials_type_id == DomainConst.GAS_TYPE_ID_12KG ||
            self.materials_type_id == DomainConst.GAS_TYPE_ID_45KG ||
            self.materials_type_id == DomainConst.GAS_TYPE_ID_50KG {
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
        if self.materials_type_id == DomainConst.PROMOTION_TYPE_ID {
            return true
        }
        return false
    }
    
    /**
     * Check if material is Cylinder type
     * - returns: True if "materials_type_id" equal 1/12/10/14, False otherwise
     */
    public func isCylinder() -> Bool {
        if self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_6KG ||
            self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_12KG ||
            self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_45KG ||
            self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_50KG ||
            self.materials_type_id == DomainConst.GAS_TYPE_ID_4KG {
            return true
        }
        return false
    }
    
    //++ BUG0135-SPJ (NguyenPT 20170758) Add new cylinder Order VIP customer
    /**
     * Check if material is Cylinder type 1 (4kg, 6kg, 12kg)
     * - returns: True if "materials_type_id" equal 1/14, False otherwise
     */
    public func isCylinderType1() -> Bool {
        if self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_6KG ||
            self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_12KG {
            return true
        }
        return false
    }
    
    /**
     * Check if material is Cylinder type 2 (45kg, 50kg)
     * - returns: True if "materials_type_id" equal 10/12, False otherwise
     */
    public func isCylinderType2() -> Bool {
        if self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_45KG ||
            self.materials_type_id == DomainConst.CYLINDER_TYPE_ID_50KG {
            return true
        }
        return false
    }
    //-- BUG0135-SPJ (NguyenPT 20170758) Add new cylinder Order VIP customer
    
    /**
     * Check if object is empty
     * - returns: self.material_id.isEmpty
     */
    public func isEmpty() -> Bool {
        return self.material_id.isEmpty
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    
    //++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
    /**
     * Initialize with decoder
     * - parameter decoder: NSCoder
     */
    required public init(coder decoder: NSCoder) {
        self.material_id = decoder.decodeObject(forKey: DomainConst.KEY_MATERIALS_ID) as? String ?? DomainConst.BLANK
        self.materials_type_id = decoder.decodeObject(forKey: DomainConst.KEY_MATERIALS_TYPE_ID) as? String ?? DomainConst.BLANK
        self.material_name = decoder.decodeObject(forKey: DomainConst.KEY_MATERIALS_NAME) as? String ?? DomainConst.BLANK
        self.materials_name_short = decoder.decodeObject(forKey: DomainConst.KEY_MATERIALS_NAME_SHORT) as? String ?? DomainConst.BLANK
        self.material_price = decoder.decodeObject(forKey: DomainConst.KEY_MATERIALS_PRICE) as? String ?? DomainConst.BLANK
        self.price = decoder.decodeObject(forKey: DomainConst.KEY_PRICE) as? String ?? DomainConst.BLANK
        self.material_image = decoder.decodeObject(forKey: DomainConst.KEY_MATERIAL_IMAGE) as? String ?? DomainConst.BLANK
        //++ BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
        self.price_original = decoder.decodeObject(forKey: DomainConst.KEY_PRICE_ORIGINAL) as? String ?? DomainConst.BLANK
        //-- BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    }
    
    /**
     * Encode data
     * - parameter aCoder: NSCoder
     */
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(material_id,          forKey: DomainConst.KEY_MATERIALS_ID)
        aCoder.encode(materials_type_id,    forKey: DomainConst.KEY_MATERIALS_TYPE_ID)
        aCoder.encode(material_name,        forKey: DomainConst.KEY_MATERIALS_NAME)
        aCoder.encode(materials_name_short, forKey: DomainConst.KEY_MATERIALS_NAME_SHORT)
        aCoder.encode(material_price,       forKey: DomainConst.KEY_MATERIALS_PRICE)
        aCoder.encode(price,                forKey: DomainConst.KEY_PRICE)
        aCoder.encode(material_image,       forKey: DomainConst.KEY_MATERIAL_IMAGE)
        //++ BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
        aCoder.encode(price_original,       forKey: DomainConst.KEY_PRICE_ORIGINAL)
        //-- BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    }
    //-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
}
