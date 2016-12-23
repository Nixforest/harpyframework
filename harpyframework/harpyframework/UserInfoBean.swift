//
//  UserInfoBean.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UserInfoBean: NSObject {
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
    
    /**
     * Get first name of user info bean.
     * - returns: Name of user info bean
     */
    public func getName() -> String {
        return self.first_name
    }
    
    /**
     * Set first name of user info bean.
     * - parameter name: Name value to set
     */
    public func setName(name: String) {
        self.first_name = name
    }
    
    /**
     * Get phone of user info bean.
     * - returns: Phone of user info bean
     */
    public func getPhone() -> String {
        return self.phone
    }
    
    /**
     * Set phone of user info bean.
     * - parameter phone: Phone value to set
     */
    public func setPhone(phone: String) {
        self.phone = phone
    }
    
    /**
     * Get address of user info bean.
     * - returns: Address of user info bean
     */
    public func getAddress() -> String {
        return self.address
    }
    
    /**
     * Set address of user info bean.
     * - parameter address: Address value to set
     */
    public func setAddress(address: String) {
        self.address = address
    }
    
    /**
     * Get avatar image of user info bean.
     * - returns: Avatar image of user info bean
     */
    public func getAvatarImage() -> String {
        return self.image_avatar
    }
    
    /**
     * Set avatar image of user info bean.
     * - parameter image_avatar: Avatar image value to set
     */
    public func setAvatarImage(image_avatar: String) {
        self.image_avatar = image_avatar
    }
}
