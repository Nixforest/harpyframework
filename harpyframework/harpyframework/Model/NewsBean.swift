//
//  NewsBean.swift
//  harpyframework
//
//  Created by SPJ on 11/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class NewsBean: ConfigBean {
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init()
        if let idStr = jsonData[DomainConst.KEY_TITLE] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_TITLE] as? Int {
                self.id = String(idInt)
            }
        }
        if let nameStr = jsonData[DomainConst.KEY_CONTENT] as? String  {
            self.name = nameStr
        }
    }
    
    public override init() {
        super.init()
    }
}
