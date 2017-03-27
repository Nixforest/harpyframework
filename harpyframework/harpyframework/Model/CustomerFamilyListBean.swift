//
//  CustomerFamilyListModel.swift
//  harpyframework
//
//  Created by SPJ on 3/26/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CustomerFamilyListBean: ConfigBean {
    /** Phone */
    private var _phone:         String = DomainConst.BLANK
    /** Address */
    private var _address:       String = DomainConst.BLANK
    /** Created date */
    private var _created_date:  String = DomainConst.BLANK
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self._phone         = getString(json: jsonData, key: DomainConst.KEY_PHONE)
        self._address       = getString(json: jsonData, key: DomainConst.KEY_ADDRESS)
        self._created_date  = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
    
    /**
     * Get phone number
     * - returns: Phone number
     */
    public func getPhone() -> String {
        return self._phone
    }
    /**
     * Get address
     * - returns: Address
     */
    public func getAddress() -> String {
        return self._address
    }
    /**
     * Get created date
     * - returns: Created date
     */
    public func getCreatedDate() -> String {
        return self._created_date
    }
}
