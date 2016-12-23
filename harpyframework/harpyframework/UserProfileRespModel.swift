//
//  UserProfileRespModel.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UserProfileRespModel: BaseRespModel {
    var record: UserInfoBean = UserInfoBean()
    /**
     * Initializer
     * - parameter jsonString: JSON data
     */
    override init(jsonString: String) {
        super.init(jsonString: jsonString)
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                // Loop
//                for (key, value) in json {
//                    let keyName = key as String
//                    if let keyValue = value as? String {
//                        // If property exists
//                        if (self.responds(to: NSSelectorFromString(keyName))) {
//                            self.setValue(keyValue, forKey: keyName)
//                        }
//                    } else {
//                        if let keyValueInt = value as? Int {
//                            // If property exists
//                            if (self.responds(to: NSSelectorFromString(keyName))) {
//                                self.setValue(String(keyValueInt), forKey: keyName)
//                            }
//                        } else {
//                            if let keyValueArr = value as? [String: AnyObject] {
//                                record.first_name = keyValueArr["first_name"] as! String as String
//                                record.phone = keyValueArr["phone"] as! String as String
//                                record.address = keyValueArr["address"] as! String as String
//                                record.image_avatar = keyValueArr["image_avatar"] as! String as String
//                            }
//                        }
//                    }
                //                }
                if self.status != "1" {
                    return
                }
                let record = json[DomainConst.KEY_RECORD] as? [String: AnyObject]
                self.record = UserInfoBean(jsonString: record!)
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        } else {
            print("json is of wrong format")
        }
    }
}
