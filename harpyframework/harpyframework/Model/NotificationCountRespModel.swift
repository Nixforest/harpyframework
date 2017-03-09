//
//  NotificationCountRespModel.swift
//  project
//
//  Created by Nixforest on 11/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class NotificationCountRespModel: BaseRespModel {
    /** Notification count text */
    var NotifyCountText: String = ""
    /** Version code */
    var app_version_code = ""
    /** Other information */
    var otherInfo: [ConfigBean] = [ConfigBean]()
    
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
                
                if self.status != DomainConst.RESPONSE_STATUS_SUCCESS {
                    return
                }
                self.NotifyCountText = getString(json: json, key: DomainConst.KEY_NOTIFY_COUNT_TEXT)
                self.app_version_code = getString(json: json, key: DomainConst.KEY_APP_VERSION_CODE)
                // Other information
                self.otherInfo.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_OTHER_INFO))
                
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
}
