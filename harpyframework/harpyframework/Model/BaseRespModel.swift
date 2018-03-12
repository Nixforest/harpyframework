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
    public var status:      String = DomainConst.RESPONSE_STATUS_FAILED
    /** Code */
    public var code:        String = DomainConst.BLANK
    /** Message */
    public var message:     String = DomainConst.BLANK
    /** User token */
    public var token:       String = DomainConst.BLANK
    /** Record string value */
    public var recordStr:   String = DomainConst.BLANK
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
                
                // Record
                self.recordStr = getString(json: json, key: DomainConst.KEY_RECORD)
                if self.recordStr.isEmpty {
                    self.recordStr = String(describing: getInt(json: json, key: DomainConst.KEY_RECORD))
                }
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
        //++ BUG0175-SPJ (NguyenPT 20171206) Handle response code
//        if self.code == "1987" {
//            BaseModel.shared.logoutSuccess()
//        }
        switch self.code {
        case BaseRequest.ERROR_CODE_LOG_OUT:
            if let currentVC = BaseViewController.getCurrentViewController() {
                currentVC.showAlert(message: self.message,
                                    okHandler: { alert in
                                        BaseModel.shared.logoutSuccess()
                                        currentVC.popToRootView()
                                        currentVC.openLogin()
                    })
                
            }
        case BaseRequest.ERROR_CODE_UNKNOWN:
            break
        case BaseRequest.ERROR_CODE_LOST_CONNECTION:
            break
        case BaseRequest.ERROR_CODE_WRONG_VERSION:
            if let currentVC = BaseViewController.getCurrentViewController() {
                currentVC.showAlert(message: self.message,
                                    okHandler: { alert in
                                        currentVC.updateVersionAppStore()
                })
            }
            break
        default:
            break
        }
        //-- BUG0175-SPJ (NguyenPT 20171206) Handle response code
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
    
    /**
     * Create failed json
     * - parameter msg: Message content
     * - returns: Format {"status":0,"code":0,"message":"Message content"}
     */
    public static func createFailedJson(msg: String) -> String {
        var retVal = String.init(
            format: "{\"%@\":%d,\"%@\":%d,\"%@\":\"%@\"}",
            DomainConst.KEY_STATUS, 0,
            DomainConst.KEY_CODE, 0,
            DomainConst.KEY_MESSAGE, msg)
        return retVal
    }
}
