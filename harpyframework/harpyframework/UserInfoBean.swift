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
    /** Addition information */
    var customer_info: [ConfigBean] = [ConfigBean]()
    /** Email */
    var email: String = ""
    /** Email */
    var province_id: String = ""
    /** Email */
    var district_id: String = ""
    /** Email */
    var ward_id: String = ""
    /** Email */
    var street_id: String = ""
    /** Email */
    var house_numbers: String = ""
    
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
        self.first_name     = getString(json: jsonString, key: DomainConst.KEY_FIRST_NAME)
        self.phone          = getString(json: jsonString, key: DomainConst.KEY_PHONE)
        self.address        = getString(json: jsonString, key: DomainConst.KEY_ADDRESS)
        self.image_avatar   = getString(json: jsonString, key: DomainConst.KEY_IMG_AVATAR)
        self.customer_info.append(contentsOf: getListConfig(json: jsonString, key: DomainConst.KEY_CUSTOMER_INFO))
        
        self.email          = getString(json: jsonString, key: DomainConst.KEY_EMAIL)
        self.province_id    = getString(json: jsonString, key: DomainConst.KEY_PROVINCE_ID)
        self.district_id    = getString(json: jsonString, key: DomainConst.KEY_DISTRICT_ID)
        self.ward_id        = getString(json: jsonString, key: DomainConst.KEY_WARD_ID)
        self.street_id      = getString(json: jsonString, key: DomainConst.KEY_STREET)
        self.house_numbers  = getString(json: jsonString, key: DomainConst.KEY_HOUSE_NUMBER)
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
    
    /**
     * Get customer information from key value
     * - parameter key: Key to get information
     * - returns: Value
     */
    public func getCustomerInfo(key: String) -> String {
        for item in self.customer_info {
            if item.id == key {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    
    /**
     * Get boss name
     * - returns: Boss name
     */
    public func getBossName() -> String {
        return self.getCustomerInfo(key: DomainConst.KEY_BOSS_NAME)
    }
    
    /**
     * Get boss phone
     * - returns: Boss phone
     */
    public func getBossPhone() -> String {
        return self.getCustomerInfo(key: DomainConst.KEY_BOSS_PHONE)
    }
    
    /**
     * Get manager name
     * - returns: manager name
     */
    public func getManagerName() -> String {
        return self.getCustomerInfo(key: DomainConst.KEY_MANAGER_NAME)
    }
    
    /**
     * Get manager phone
     * - returns: manager phone
     */
    public func getManagerPhone() -> String {
        return self.getCustomerInfo(key: DomainConst.KEY_MANAGER_PHONE)
    }
    
    /**
     * Get technical name
     * - returns: technical name
     */
    public func getTechnicalName() -> String {
        return self.getCustomerInfo(key: DomainConst.KEY_TECHNICAL_NAME)
    }
    
    /**
     * Get technical phone
     * - returns: technical phone
     */
    public func getTechnicalPhone() -> String {
        return self.getCustomerInfo(key: DomainConst.KEY_TECHNICAL_PHONE)
    }
}
