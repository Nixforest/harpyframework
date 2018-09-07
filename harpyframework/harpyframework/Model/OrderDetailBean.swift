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
    public var qty              : String = DomainConst.BLANK
    /** Amount */
    public var amount           : String = DomainConst.BLANK
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new property
    /** Unit */
    public var unit             : String = DomainConst.BLANK
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new property
    //++ BUG0218-SPJ (KhoiVT 20180906) Gasservice - Update Screen. Change Select Material by Pop Up, add field action invest of Customer Request Function
    /** Id */
    public var id               : String = DomainConst.BLANK
    /** name */
    public var name             : String = DomainConst.BLANK
    /** data */
    public var data             : [OrderDetailBean] = [OrderDetailBean]()
    /** module type */
    public var module_type      : String = DomainConst.BLANK
    /** module id */
    public var module_id        : String = DomainConst.BLANK
    /** module name */
    public var module_name      : String = DomainConst.BLANK
    /** enable */
    public var enabled                 : Bool   = false
    //-- BUG0218-SPJ (KhoiVT 20180906) Gasservice - Update Screen. Change Select Material by Pop Up, add field action invest of Customer Request Function
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.qty                = getString(json: jsonData, key: DomainConst.KEY_QUANTITY)
        self.amount             = getString(json: jsonData, key: DomainConst.KEY_AMOUNT)
        //++ BUG0073-SPJ (NguyenPT 20170504) Add new property
        self.unit               = getString(json: jsonData, key: DomainConst.KEY_UNIT)
        //++ BUG0218-SPJ (KhoiVT 20180906) Gasservice - Update Screen. Change Select Material by Pop Up, add field action invest of Customer Request Function
        self.id                 = getString(json: jsonData, key: DomainConst.KEY_ID)
        self.name               = getString(json: jsonData, key: DomainConst.KEY_NAME)
        if let dataArr = jsonData[DomainConst.KEY_DATA] as? [[String: AnyObject]] {
            
            for item in dataArr {
                let module: OrderDetailBean = OrderDetailBean(jsonData: item)
                module.qty      = "1"
                self.data.append(module)
            }
        }
        self.module_type               = getString(json: jsonData, key: DomainConst.KEY_MODULE_TYPE)
        self.module_id               = getString(json: jsonData, key: DomainConst.KEY_MODULE_ID)
        self.module_name               = getString(json: jsonData, key: DomainConst.KEY_MODULE_NAME)
        //-- BUG0218-SPJ (KhoiVT 20180906) Gasservice - Update Screen. Change Select Material by Pop Up, add field action invest of Customer Request Function
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
     * Check if object is empty
     * - returns: self.material_id.isEmpty
     */
    public func isIdEmpty() -> Bool {
        return self.id.isEmpty
    }

    /**
     * Create json data from object
     * - returns: Json string from object data
     */
    public func createJsonDataForUpdateOrder() -> String {
        var retVal = DomainConst.BLANK
        retVal = String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_MATERIALS_ID,      self.material_id,
            DomainConst.KEY_MATERIALS_TYPE_ID, self.materials_type_id,
            DomainConst.KEY_QUANTITY,          self.qty,
            DomainConst.KEY_PRICE,             self.price,
            DomainConst.KEY_AMOUNT,            self.amount,
            DomainConst.KEY_SERI,              DomainConst.BLANK/*,
            DomainConst.KEY_KG_EMPTY,          */)
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
     * Create json data from object
     * - returns: Json string from object data
     */
    
    /**
     * Create json data from object for Customer Request
     * - returns: Json string from object data
     */
    //++ BUG0218-SPJ (KhoiVT 20180906) Gasservice - Update Screen. Change Select Material by Pop Up, add field action invest of Customer Request Function
    //Pop Up Select Material By Module
    public func createJsonDataForCustomerRequest() -> String {
        var retVal = DomainConst.BLANK
//        retVal = String.init(format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
//                             DomainConst.KEY_MATERIALS_ID,      self.material_id,
//                             DomainConst.KEY_MATERIALS_TYPE_ID, self.materials_type_id,
//                             DomainConst.KEY_QUANTITY,          self.qty)
        retVal = String.init(format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
                             DomainConst.KEY_MODULE_TYPE,       self.module_type,
                             DomainConst.KEY_MODULE_ID,         self.module_id,
                             DomainConst.KEY_QUANTITY,          self.qty)
        return retVal
    }
    //-- BUG0218-SPJ (KhoiVT 20180906) Gasservice - Update Screen. Change Select Material by Pop Up, add field action invest of Customer Request Function
    //Pop Up Select Material By Module
    /**
     * Create json data from object for Customer Request
     * - returns: Json string from object data
     */
    
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
        self.material_price     = data.material_price
        self.price              = data.price
        self.material_image     = data.material_image
        //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
        //self.qty                = DomainConst.NUMBER_ONE_VALUE
        self.amount             = data.price
        //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
        self.qty                = qty
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
