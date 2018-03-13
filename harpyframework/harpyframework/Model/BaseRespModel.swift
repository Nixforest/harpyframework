//
//  BaseRespModel.swift
//  project
//
//  Created by Nixforest on 9/22/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

open class ResponseModel: NSObject {
    var status = 0
    var message = "Lỗi"
    var data : Any!
    var code  = 0
    var isDisconnected = false
    var Error = true
    
    public init(dictionary : NSDictionary) {
        super.init()
        var allKey = self.propertyNames()
        for  i in 0..<allKey.count {
            let key = allKey[i]
            if(dictionary[key] != nil) {
                if let value = dictionary[key] {
                    if(!(value  is NSNull)) {
                        self.setValue(value , forKey: key )
                    }
                }
            }
        }
    }
    
    public func dictionary() -> Dictionary<String, Any> {
        var dict = Dictionary<String, Any>()
        let allKey = propertyNames()
        for  i in 0..<allKey.count {
            dict[allKey[i]] = value(forKey: allKey[i])
        }
        return dict;
    }
    
    public func dictionarySkipKey(skipKey: [String]) -> Dictionary<String, Any> {
        var dict = Dictionary<String, Any>()
        let allKey = propertyNames()
        for  i in 0..<allKey.count {
            if((skipKey.index{$0 == allKey[i]}) != nil) {
                continue
            }
            dict[allKey[i]] = value(forKey: allKey[i])
        }
        return dict;
    }
    
    public func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.flatMap { $0.label }
    }
}


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
