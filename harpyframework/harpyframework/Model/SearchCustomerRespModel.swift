//
//  SearchCustomerRespModel.swift
//  project
//
//  Created by Nixforest on 10/17/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class SearchCustomerRespModel: BaseRespModel {
    /** Record */
    var record: [ConfigBean] = [ConfigBean]()
    
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
                // Menu
                self.record.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_RECORD))
                
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
    
    /**
     * Initializer
     */
    override init() {
        super.init()
    }
    
    /**
     * Get record value.
     * - returns: Record value
     */
    public func getRecord() -> [ConfigBean] {
        return self.record
    }
}
