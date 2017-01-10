//
//  OrderDetailBean.swift
//  harpyframework
//
//  Created by SPJ on 12/31/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import UIKit

public class OrderDetailBean: NSObject {
    /** Material type id */
    public var materials_type_id: String = ""
    /** Material id */
    public var material_id: String = ""
    /** Material name */
    public var material_name: String = ""
    /** Material price */
    public var material_price: String = ""
    /** Price */
    public var price: String = ""
    /** Quantity */
    public var qty: String = ""
    /** Amount */
    public var amount: String = ""
    /** Material image */
    public var material_image: String = ""
    
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
        self.qty                = getString(json: jsonData, key: DomainConst.KEY_QUANTITY)
        self.amount             = getString(json: jsonData, key: DomainConst.KEY_AMOUNT)
        self.material_image     = getString(json: jsonData, key: DomainConst.KEY_MATERIAL_IMAGE)
    }
}
