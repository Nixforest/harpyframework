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
    /** Unit */
    public var unit:        String = DomainConst.BLANK
    
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
        self.unit       = getString(json: jsonData, key: DomainConst.KEY_UNIT)
    }
    
    //++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
}
