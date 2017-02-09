//
//  PromotionBean.swift
//  harpyframework
//
//  Created by SPJ on 2/8/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class PromotionBean: ConfigBean {
    /** Note */
    public var note:        String = DomainConst.BLANK
    /** Expiration date */
    public var expiry_date: String = DomainConst.BLANK
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init()
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        if let nameStr = jsonData[DomainConst.KEY_TITLE] as? String  {
            self.name = nameStr
        }
        
        self.note        = getString(json: jsonData, key: DomainConst.KEY_NOTE)
        self.expiry_date = getString(json: jsonData, key: DomainConst.KEY_EXPIRY_DATE)
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
