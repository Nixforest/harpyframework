//
//  UserInfoBean.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UserInfoBean: NSObject {
    /** First name */
    var first_name: String = ""
    /** Phone */
    var phone: String = ""
    /** Address */
    var address: String = ""
    /** Avatar image */
    var image_avatar: String = ""
    
    /**
     * Initializer
     */
    override init() {
        // Not implement
    }
    
    /**
     * Initializer
     * - parameter jsonString: List of object
     */
    init(jsonString: [String: AnyObject]) {
        super.init()
        self.first_name     = jsonString[DomainConst.KEY_FIRST_NAME] as? String ?? ""
        self.phone          = jsonString[DomainConst.KEY_PHONE] as? String ?? ""
        self.address        = jsonString[DomainConst.KEY_ADDRESS] as? String ?? ""
        self.image_avatar   = jsonString[DomainConst.KEY_IMG_AVATAR] as? String ?? ""
    }
}
