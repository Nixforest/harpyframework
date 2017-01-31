//
//  AgentInfoBean.swift
//  harpyframework
//
//  Created by SPJ on 1/19/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class AgentInfoBean: NSObject {
    /** Agent info */
    public var info_agent       : BaseAgentInfoBean = BaseAgentInfoBean()
    /** Gas info */
    public var info_gas         : [MaterialBean] = [MaterialBean]()
    /** Promotion info */
    public var info_promotion   : [MaterialBean] = [MaterialBean]()
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        let data = jsonData[DomainConst.KEY_INFO_AGENT] as? [String: AnyObject]
        if data != nil {
            self.info_agent = BaseAgentInfoBean(jsonData: data!)
        }
        let data1 = jsonData[DomainConst.KEY_INFO_GAS] as? [[String: AnyObject]]
        if data1 != nil {
            for item in data1! {
                self.info_gas.append(MaterialBean(jsonData: item))
            }
        }
        let data2 = jsonData[DomainConst.KEY_INFO_PROMOTION] as? [[String: AnyObject]]
        if data2 != nil {
            for item in data2! {
                self.info_promotion.append(MaterialBean(jsonData: item))
            }
        }
    }
    public override init() {
        
    }
    
    /**
     * Check if object had data or not
     * - returns: True if agent information is empty, False otherwise
     */
    public func isEmpty() -> Bool {
        return self.info_agent.isEmpty()
    }
}
