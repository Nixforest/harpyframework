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
    public var materials_type_id: String = DomainConst.BLANK
    /** Material id */
    public var material_id      : String = DomainConst.BLANK
    /** Material name */
    public var material_name    : String = DomainConst.BLANK
    /** Material price */
    public var material_price   : String = DomainConst.BLANK
    /** Price */
    public var price            : String = DomainConst.BLANK
    /** Material image */
    public var material_image   : String = DomainConst.BLANK
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        self.materials_type_id  = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_TYPE_ID)
        self.material_id        = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_ID)
        self.material_name      = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_NAME)
        self.material_price     = getString(json: jsonData, key: DomainConst.KEY_MATERIALS_PRICE)
        self.price              = getString(json: jsonData, key: DomainConst.KEY_PRICE)
        self.material_image     = getString(json: jsonData, key: DomainConst.KEY_MATERIAL_IMAGE)
    }
    public override init() {
        
    }
}
