//
//  NewsRespModel.swift
//  harpyframework
//
//  Created by SPJ on 11/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class NewsRespModel: BaseRespModel {
    /** Record */
    var record: NewsBean = NewsBean()
    
    override public init() {
        super.init()
    }
    
    /**
     * Initializer
     */
    override public init(jsonString: String) {
        // Call super initializer
        super.init(jsonString: jsonString)
        
        // Start parse
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                if self.status != DomainConst.RESPONSE_STATUS_SUCCESS {
                    return
                }
                
                // Record
                if let data = json[DomainConst.KEY_RECORD] as? [String: AnyObject] {
                    self.record = NewsBean(jsonData: data)
                }
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
    
    /**
     * Get record value.
     * - returns: Record value
     */
    public func getRecord() -> NewsBean {
        return self.record
    }
}
