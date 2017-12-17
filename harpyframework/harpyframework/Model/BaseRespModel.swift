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
                //print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
                handleSerializationException(error: error, jsonString: jsonString)
            }
            
        } else {
            //print(DomainConst.JSON_ERR_WRONG_FORMAT)
            handleEncodeException(jsonString: jsonString)
        }
    }
    
    /**
     * Check if response is success
     * - returns: True if status is "1", False otherwise
     */
    public func isSuccess() -> Bool {
        //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
        if self.status == DomainConst.RESPONSE_STATUS_SUCCESS {
            return true
        }
        if self.code == "1987" {
            BaseModel.shared.logoutSuccess()
        }
        //return self.status == DomainConst.RESPONSE_STATUS_SUCCESS
        return false
        //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    }
    
    /**
     * Handle exception happen when serialization json string
     * - parameter error:       Error object
     * - parameter jsonString:  Json string
     */
    public func handleSerializationException(error: NSError, jsonString: String) {
        let message = DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)"
        self.message = message
        BaseModel.shared.setErrorDetail(detail: jsonString)
    }
    
    /**
     * Handle exception happen when encoding json string
     * - parameter error:       Error object
     * - parameter jsonString:  Json string
     */
    public func handleEncodeException(jsonString: String) {
        self.message = DomainConst.JSON_ERR_WRONG_FORMAT
        BaseModel.shared.setErrorDetail(detail: jsonString)
    }
    
    //++ BUG0158-SPJ (NguyenPT 20171113) Refactor BaseRequest class
    /**
     * Create failed json
     * - parameter msg: Message content
     * - returns: Format {"status":0,"code":0,"message":"Message content"}
     */
    public static func createFailedJson(msg: String) -> String {
        let retVal = String.init(
            format: "{\"%@\":%d,\"%@\":%d,\"%@\":\"%@\"}",
            DomainConst.KEY_STATUS, 0,
            DomainConst.KEY_CODE, 0,
            DomainConst.KEY_MESSAGE, msg)
        return retVal
    }
    //-- BUG0158-SPJ (NguyenPT 20171113) Refactor BaseRequest class
}
