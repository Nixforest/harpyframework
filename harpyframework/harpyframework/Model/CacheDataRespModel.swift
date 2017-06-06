//
//  CacheDataRespModel.swift
//  harpyframework
//
//  Created by SPJ on 5/7/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CacheDataRespModel: BaseRespModel {
    /** Record */
    public static var record: CacheDataModel = CacheDataModel()    
    
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
                let order = json[DomainConst.KEY_RECORD] as? [String: AnyObject]
                
                CacheDataRespModel.record = CacheDataModel(jsonData: order!)
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
    public func getRecord() -> CacheDataModel {
        return CacheDataRespModel.record
    }
}
