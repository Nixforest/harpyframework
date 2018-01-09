//
//  TransactionBean.swift
//  harpyframework
//
//  Created by SPJ on 1/31/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class TransactionBean: ConfigBean {
    /** Last order info */
    var last_order:         OrderBean   = OrderBean()
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject], isSession: Bool = false) {
        super.init()
        if !isSession {
            if let idStr = jsonData[DomainConst.KEY_TRANSACTION_ID] as? String {
                self.id = idStr
            } else {
                if let idInt = jsonData[DomainConst.KEY_TRANSACTION_ID] as? Int {
                    self.id = String(idInt)
                }
            }
            if let nameStr = jsonData[DomainConst.KEY_TRANSACTION_KEY] as? String  {
                self.name = nameStr
            }
            if let data = jsonData[DomainConst.KEY_LAST_ORDER] as? [String: AnyObject] {
                if data != nil {
                    self.last_order = OrderBean(jsonData: data)
                }
            }
        } else {
            if let idStr = jsonData[DomainConst.KEY_SESSION_ID] as? String {
                self.id = idStr
            } else {
                if let idInt = jsonData[DomainConst.KEY_SESSION_ID] as? Int {
                    self.id = String(idInt)
                }
            }
            if let nameStr = jsonData[DomainConst.KEY_SESSION_KEY] as? String  {
                self.name = nameStr
            }
            if let data = jsonData[DomainConst.KEY_LAST_ORDER] as? [String: AnyObject] {
                if data != nil {
                    self.last_order = OrderBean(jsonData: data)
                }
            }
//            self.last_order = OrderBean(jsonData: (jsonData[DomainConst.KEY_LAST_ORDER] as? [String: AnyObject])!)
        }
    }
    
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
    
    /**
     * Get last order information
     * - returns: Last order information
     */
    public func getLastOrderInfo() -> OrderBean {
        return last_order
    }
    
    /**
     * Check if last order info is empty
     * - returns: True if id of last order is empty, False otherwise
     */
    public func isLastOrderEmpty() -> Bool {
        return last_order.id.isEmpty
    }
}
