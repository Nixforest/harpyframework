//
//  BaseRespModel.swift
//  project
//
//  Created by Nixforest on 9/22/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
open class BaseRespModel: NSObject {
    /** Status */
    public var status: String = DomainConst.RESPONSE_STATUS_FAILED
    /** Code */
    public var code: String = ""
    /** Message */
    public var message: String = ""
    /** User token */
    public var token: String = ""
    /**
     * Initializer
     */
    override public init() {
    }
  
    /**
     * Initializer
     * - parameter jsonString: String of json
     */
    public init(jsonString: String) {
        super.init()
        
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                // Status
                self.status = getStringFromInt(json: json, key: DomainConst.KEY_STATUS)
                // Code
                self.code = getStringFromInt(json: json, key: DomainConst.KEY_CODE)
                
                // Message
                self.message = getString(json: json, key: DomainConst.KEY_MESSAGE)
                
                // Token
                self.token = getString(json: json, key: DomainConst.KEY_TOKEN)
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
    
    /**
     * Check if response is success
     * - returns: True if status is "1", False otherwise
     */
    public func isSuccess() -> Bool {
        return self.status == DomainConst.RESPONSE_STATUS_SUCCESS
    }
}
