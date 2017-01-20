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
}
