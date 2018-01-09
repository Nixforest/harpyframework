//
//  OrderConfigBean.swift
//  harpyframework
//
//  Created by SPJ on 1/19/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderConfigBean: NSObject {
    /** Agent id */
    public var agent        : [AgentInfoBean] = [AgentInfoBean]()
    /** Agent id */
    public var distance_1   : Double = 0
    /** Agent id */
    public var distance_2   : Double = 0
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        let data = jsonData[DomainConst.KEY_AGENT] as? [[String: AnyObject]]
        if data != nil {
            for item in data! {
                self.agent.append(AgentInfoBean(jsonData: item))
            }
        }
//        self.distance_1 = (getString(json: jsonData, key: DomainConst.KEY_DISTANCE_1) as NSString).doubleValue
//        self.distance_2 = (getString(json: jsonData, key: DomainConst.KEY_DISTANCE_2) as NSString).doubleValue
        self.distance_1 = Double(getString(json: jsonData, key: DomainConst.KEY_DISTANCE_1))!
        self.distance_2 = Double(getString(json: jsonData, key: DomainConst.KEY_DISTANCE_2))!
    }
    public override init() {
        
    }
    
    //++ BUG0156-SPJ (NguyenPT 20170925) Re-design Gas24h
    /**
     * Check if object's content is exist
     * - returns: True if agent list is not empty, False otherwise
     */
    public func isExist() -> Bool {
        return !agent.isEmpty
    }
    //-- BUG0156-SPJ (NguyenPT 20170925) Re-design Gas24h
}
