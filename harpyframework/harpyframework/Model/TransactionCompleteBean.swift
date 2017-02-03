//
//  TransactionCompleteBean.swift
//  harpyframework
//
//  Created by SPJ on 2/1/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class TransactionCompleteBean: OrderBean {
    /** Id of transaction */
    public var transaction_id:   String = DomainConst.BLANK
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        
        self.transaction_id     = getString(json: jsonData, key: DomainConst.KEY_TRANSACTION_ID)
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
