//
//  OrderDetailBean.swift
//  harpyframework
//
//  Created by SPJ on 12/31/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import UIKit

public class OrderDetailBean: MaterialBean {
    /** Quantity */
    public var qty: String = ""
    /** Amount */
    public var amount: String = ""
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.qty                = getString(json: jsonData, key: DomainConst.KEY_QUANTITY)
        self.amount             = getString(json: jsonData, key: DomainConst.KEY_AMOUNT)
    }
    
    /**
     * Create json data from object
     * - returns: Json string from object data
     */
    public func createJsonData() -> String {
        var retVal = DomainConst.BLANK
        retVal = String.init(format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"},",
                             DomainConst.KEY_MATERIALS_ID,      self.material_id,
                             DomainConst.KEY_MATERIALS_TYPE_ID, self.materials_type_id,
                             DomainConst.KEY_QUANTITY,          self.qty,
                             DomainConst.KEY_PRICE,             self.price)
        return retVal
    }
    
    /**
     * Constructor
     * - parameter data: Material bean
     */
    public init(data: MaterialBean) {
        super.init()
        self.material_id        = data.material_id
        self.materials_type_id  = data.materials_type_id
        self.material_name      = data.material_name
        self.material_price     = data.material_price
        self.price              = data.price
        self.material_image     = data.material_image
        self.qty                = "0"
        self.amount             = "0"
    }
}