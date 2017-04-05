//
//  ProvincesListRespModel.swift
//  harpyframework
//
//  Created by SPJ on 4/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class ProvincesListRespModel: BaseRespModel {
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
                // Record
                self.record.append(contentsOf: getListConfig(json: (json[DomainConst.KEY_RECORD] as? [String: AnyObject])!, key: DomainConst.KEY_PROVINCE_LIST))
                
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
    override public init() {
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
