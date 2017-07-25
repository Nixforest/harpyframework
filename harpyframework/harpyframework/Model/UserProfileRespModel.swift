//
//  UserProfileRespModel.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

public class UserProfileRespModel: BaseRespModel {
    public var record: UserInfoBean = UserInfoBean()
    /**
     * Initializer
     * - parameter jsonString: JSON data
     */
    override public init(jsonString: String) {
        super.init(jsonString: jsonString)
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                if self.status != DomainConst.RESPONSE_STATUS_SUCCESS {
                    return
                }
                let record = json[DomainConst.KEY_RECORD] as? [String: AnyObject]
                self.record = UserInfoBean(jsonString: record!)
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
}
