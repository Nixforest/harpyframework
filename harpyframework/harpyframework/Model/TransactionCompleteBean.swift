//
//  TransactionCompleteBean.swift
//  harpyframework
//
//  Created by SPJ on 2/1/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class TransactionCompleteBean: OrderBean {
    /** Total quantity */
    public var total_qty:        String = DomainConst.BLANK
    /** Promotion amount */
    public var promotion_amount: String = DomainConst.BLANK
    /** Discount amount */
    public var discount_amount:  String = DomainConst.BLANK
    /** Total */
    public var total:            String = DomainConst.BLANK
    /** Grand total */
    public var grand_total:      String = DomainConst.BLANK
    /** Id of transaction */
    public var transaction_id:   String = DomainConst.BLANK
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        
        self.total_qty          = getString(json: jsonData, key: DomainConst.KEY_TOTAL_QTY)
        self.promotion_amount   = getString(json: jsonData, key: DomainConst.KEY_PROMOTION_AMOUNT)
        self.discount_amount    = getString(json: jsonData, key: DomainConst.KEY_DISCOUNT_AMOUNT)
        self.total              = getString(json: jsonData, key: DomainConst.KEY_TOTAL)
        self.grand_total        = getString(json: jsonData, key: DomainConst.KEY_GRAND_TOTAL)
        self.transaction_id     = getString(json: jsonData, key: DomainConst.KEY_TRANSACTION_ID)
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
