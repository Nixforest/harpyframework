//
//  SearchCustomerRespModel.swift
//  project
//
//  Created by Nixforest on 10/17/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class SearchCustomerRespModel: BaseRespModel {
    /** Record */
    var record: [ConfigBean] = [ConfigBean]()
    
    /**
     * Initializer
     */
    override init(jsonString: String) {
        // Call super initializer
        super.init(jsonString: jsonString)
        
        // Start parse
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                if self.status != "1" {
                    return
                }
                // Menu
                let records = json[DomainConst.KEY_RECORD] as? [[String: AnyObject]]
                for item in records! {
                    self.record.append(ConfigBean(jsonData: item))
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        } else {
            print("json is of wrong format")
        }
    }
    
    /**
     * Initializer
     */
    override init() {
        super.init()
    }
}
