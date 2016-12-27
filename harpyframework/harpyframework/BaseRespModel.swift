//
//  BaseRespModel.swift
//  project
//
//  Created by Nixforest on 9/22/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class BaseRespModel : NSObject {
    /** Status */
    public var status: String = "0"
    /** Code */
    public var code: String = ""
    /** Message */
    public var message: String = ""
    /** User token */
    public var token: String = ""
    /**
     * Initializer
     */
    override init() {
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
                let statusInt = json[DomainConst.KEY_STATUS] as? Int ?? 0
                if statusInt != 0 {
                    self.status = String(statusInt)
                }
                // Code
                let codeInt = json[DomainConst.KEY_CODE] as? Int ?? 0
                if codeInt != 0 {
                    self.code = String(codeInt)
                }
                // Message
                self.message = json[DomainConst.KEY_MESSAGE] as? String ?? ""
                
                // Token
                self.token = json[DomainConst.KEY_TOKEN] as? String ?? ""
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        } else {
            print("json is of wrong format")
        }
    }
}
