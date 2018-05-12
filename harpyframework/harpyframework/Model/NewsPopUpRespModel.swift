//
//  NewsPopUpRespModel.swift
//  harpyframework
//
//  Created by SPJ on 1/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsPopUpRespModel: BaseRespModel {
    /** Record */
    var record: NewsListBean = NewsListBean()
    
    /**
     * Default constructor
     */
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
                let recordList = json[DomainConst.KEY_RECORD] as? [String: AnyObject]
                if let news = recordList {
                    self.record = NewsListBean(jsonData: news)
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
    public func getRecord() -> NewsListBean {
        return self.record
    }
}
