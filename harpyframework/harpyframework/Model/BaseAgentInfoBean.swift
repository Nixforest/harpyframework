//
//  AgentInfoBean.swift
//  harpyframework
//
//  Created by SPJ on 1/18/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class BaseAgentInfoBean: NSObject {
    /** Agent id */
    public var agent_id             : String = DomainConst.BLANK
    /** Agent name */
    public var agent_name           : String = DomainConst.BLANK
    /** Agent phone */
    public var agent_phone          : String = DomainConst.BLANK
    /** Agent cell phone */
    public var agent_cell_phone     : String = DomainConst.BLANK
    /** Agent phone support */
    public var agent_phone_support  : String = DomainConst.BLANK
    /** Agent address */
    public var agent_address        : String = DomainConst.BLANK
    /** Agent latitude */
    public var agent_latitude       : String = DomainConst.BLANK
    /** Agent longitude */
    public var agent_longitude      : String = DomainConst.BLANK
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        self.agent_id               = getString(json: jsonData, key: DomainConst.KEY_AGENT_ID)
        self.agent_name             = getString(json: jsonData, key: DomainConst.KEY_AGENT_NAME)
        self.agent_phone            = getString(json: jsonData, key: DomainConst.KEY_AGENT_PHONE)
        self.agent_cell_phone       = getString(json: jsonData, key: DomainConst.KEY_AGENT_CELL_PHONE)
        self.agent_phone_support    = getString(json: jsonData, key: DomainConst.KEY_AGENT_PHONE_SUPPORT)
        self.agent_address          = getString(json: jsonData, key: DomainConst.KEY_AGENT_ADDRESS)
        self.agent_latitude         = getString(json: jsonData, key: DomainConst.KEY_AGENT_LAT)
        self.agent_longitude        = getString(json: jsonData, key: DomainConst.KEY_AGENT_LONG)
    }
    
    /**
     * Default initializer
     */
    public override init() {
        
    }
    
    /**
     * Check if object has data or not
     * - returns: True if agent id is empty, False otherwise
     */
    public func isEmpty() -> Bool {
        return self.agent_id == DomainConst.BLANK
    }
    
    //++ BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    /**
     * Initializer by id
     * - parameter id: Id of object
     */
    public init(id: String) {
        self.agent_id = id
    }
    //-- BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
}
