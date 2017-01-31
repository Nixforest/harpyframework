//
//  TransactionBean.swift
//  harpyframework
//
//  Created by SPJ on 1/31/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class TransactionBean: ConfigBean {
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init()
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
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
