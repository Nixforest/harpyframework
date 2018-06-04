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
    public var qty      : String = DomainConst.BLANK
    /** Amount */
    public var amount   : String = DomainConst.BLANK
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new property
    /** Unit */
    public var unit     : String = DomainConst.BLANK
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new property
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.qty                = getString(json: jsonData, key: DomainConst.KEY_QUANTITY)
        self.amount             = getString(json: jsonData, key: DomainConst.KEY_AMOUNT)
        //++ BUG0073-SPJ (NguyenPT 20170504) Add new property
        self.unit             = getString(json: jsonData, key: DomainConst.KEY_UNIT)
        //-- BUG0073-SPJ (NguyenPT 20170504) Add new property
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
     * Create json data from object
     * - returns: Json string from object data
     */
    public func createJsonDataForUpdateOrder() -> String {
        var retVal = DomainConst.BLANK
        retVal = String.init(format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
                             DomainConst.KEY_MATERIALS_ID,      self.material_id,
                             DomainConst.KEY_MATERIALS_TYPE_ID, self.materials_type_id,
                             DomainConst.KEY_QUANTITY,          self.qty,
                             DomainConst.KEY_PRICE,             self.price,
                             DomainConst.KEY_AMOUNT,            self.amount,
                             DomainConst.KEY_SERI,              DomainConst.BLANK)
        return retVal
    }
    
    /**
     * Create json data from object
     * - returns: Json string from object data
     */
    public func createJsonDataForStoreCard() -> String {
        var retVal = DomainConst.BLANK
        retVal = String.init(format: "{\"%@\":\"%@\",\"%@\":\"%@\"}",
                             DomainConst.KEY_MATERIALS_ID,      self.material_id,
                             DomainConst.KEY_QUANTITY,          self.qty)
        return retVal
    }
    
    /**
     * Constructor
     * - parameter data: Material bean
     * - parameter qty: Quantity
     */
    //public init(data: MaterialBean) {
    public init(data: MaterialBean, qty: String = DomainConst.NUMBER_ONE_VALUE) {
        super.init()
        self.material_id        = data.material_id
        self.materials_type_id  = data.materials_type_id
        self.material_name      = data.material_name
        self.materials_name_short      = data.materials_name_short
        self.material_price     = data.material_price
        self.price              = data.price
        self.material_image     = data.material_image
        //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
        //self.qty                = DomainConst.NUMBER_ONE_VALUE
        self.amount             = data.price
        //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
        self.qty                = qty
        //++ BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
        self.price_original     = data.price_original
        //-- BUG0200-SPJ (NguyenPT 20180604) Gas24h - Price original
    }
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    public override init() {
        super.init()
        
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    
    //++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
}
