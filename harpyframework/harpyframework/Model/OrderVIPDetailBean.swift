//
//  OrderVIPDetailBean.swift
//  harpyframework
//
//  Created by SPJ on 2/16/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderVIPDetailBean: OrderDetailBean {
    /** Quantity */
    public var qty_real:    String = DomainConst.BLANK
    /** Serial */
    public var seri:        String = DomainConst.BLANK
    /** Quantity */
    public var kg_empty:    String = DomainConst.BLANK
    /** Quantity */
    public var kg_has_gas:  String = DomainConst.BLANK
    //++ BUG0073-SPJ (NguyenPT 20170504) Move to OrderDetailBean class
//    /** Unit */
//    public var unit:        String = DomainConst.BLANK
    //-- BUG0073-SPJ (NguyenPT 20170504) Move to OrderDetailBean class
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.qty_real   = getString(json: jsonData, key: DomainConst.KEY_QUANTITY_REAL)
        self.seri       = getString(json: jsonData, key: DomainConst.KEY_SERI)
        self.kg_empty   = getString(json: jsonData, key: DomainConst.KEY_KG_EMPTY)
        self.kg_has_gas = getString(json: jsonData, key: DomainConst.KEY_KG_HAS_GAS)
        //++ BUG0073-SPJ (NguyenPT 20170504) Move to OrderDetailBean class
//        self.unit       = getString(json: jsonData, key: DomainConst.KEY_UNIT)
        //-- BUG0073-SPJ (NguyenPT 20170504) Move to OrderDetailBean class
    }
    
    //++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
    
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle OrderVIPDetailBean initialize from OrderDetailBean
    /**
     * Constructor
     * - parameter orderDetail: OrderDetail bean
     */
    public init(orderDetail: OrderDetailBean) {
        super.init()
        self.material_id        = orderDetail.material_id
        self.materials_type_id  = orderDetail.materials_type_id
        self.material_name      = orderDetail.material_name
        self.material_price     = orderDetail.material_price
        self.price              = orderDetail.price
        self.material_image     = orderDetail.material_image
        self.qty                = DomainConst.NUMBER_ONE_VALUE
        self.amount             = orderDetail.price
        self.qty_real           = DomainConst.NUMBER_ONE_VALUE
    }
    
    /**
     * Create json data from object
     * - returns: Json string from object data
     */
    public override func createJsonDataForUpdateOrder() -> String {
        var retVal = DomainConst.BLANK
        retVal = String.init(format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
                             DomainConst.KEY_MATERIALS_ID,      self.material_id,
                             DomainConst.KEY_MATERIALS_TYPE_ID, self.materials_type_id,
                             DomainConst.KEY_QUANTITY,          self.qty,
                             DomainConst.KEY_PRICE,             self.price,
                             DomainConst.KEY_AMOUNT,            self.amount,
                             DomainConst.KEY_QUANTITY_REAL,     self.qty_real,
                             DomainConst.KEY_SERI,              self.seri,
                             DomainConst.KEY_KG_EMPTY,          self.kg_empty,
                             DomainConst.KEY_KG_HAS_GAS,        self.kg_has_gas)
        return retVal
    }
    //-- BUG0060-SPJ (NguyenPT 20170426) Handle OrderVIPDetailBean initialize from OrderDetailBean
}
