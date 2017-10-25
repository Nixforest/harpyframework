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
    var first_name:         String      = DomainConst.BLANK
    /** Phone */
    var phone:              String      = DomainConst.BLANK
    /** Address */
    var address:            String      = DomainConst.BLANK
    /** Avatar image */
    var image_avatar:       String      = DomainConst.BLANK
    /** Addition information */
    var customer_info:      [ConfigBean] = [ConfigBean]()
    /** Email */
    var email:              String      = DomainConst.BLANK
    /** Email */
    var province_id:        String      = DomainConst.BLANK
    /** Email */
    var district_id:        String      = DomainConst.BLANK
    /** Email */
    var ward_id:            String      = DomainConst.BLANK
    /** Email */
    var street_id:          String      = DomainConst.BLANK
    /** Email */
    var house_numbers:      String      = DomainConst.BLANK
    //++ BUG0008-SPJ (NguyenPT 20170616) Update G00Account
    /** Id of agent */
    var agent_id:           String      = DomainConst.BLANK
    /** Name of agent */
    var agent_name:         String      = DomainConst.BLANK
    //-- BUG0008-SPJ (NguyenPT 20170616) Update G00Account
    
    /**
     * Initializer
     */
    override public init() {
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
        self.street_id      = getString(json: jsonString, key: DomainConst.KEY_STREET_ID)
        self.house_numbers  = getString(json: jsonString, key: DomainConst.KEY_HOUSE_NUMBER)
        //++ BUG0008-SPJ (NguyenPT 20170616) Update G00Account
        self.agent_id       = getString(json: jsonString, key: DomainConst.KEY_AGENT_ID)
        self.agent_name     = getString(json: jsonString, key: DomainConst.KEY_AGENT_NAME)
        //-- BUG0008-SPJ (NguyenPT 20170616) Update G00Account
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
     * Get email of user info bean.
     * - returns: Email of user info bean
     */
    public func getEmail() -> String {
        return self.email
    }
    
    /**
     * Get Province id of user info bean.
     * - returns: Province id of user info bean
     */
    public func getProvinceId() -> String {
        return self.province_id
    }
    
    /**
     * Get District id of user info bean.
     * - returns: District id of user info bean
     */
    public func getDistrictId() -> String {
        return self.district_id
    }
    
    /**
     * Get Ward id of user info bean.
     * - returns: Ward id of user info bean
     */
    public func getWardId() -> String {
        return self.ward_id
    }
    
    /**
     * Get Street id of user info bean.
     * - returns: Street id of user info bean
     */
    public func getStreetId() -> String {
        return self.street_id
    }
    
    /**
     * Get House number of user info bean.
     * - returns: House number of user info bean
     */
    public func getHouseNumber() -> String {
        return self.house_numbers
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
    
    //++ BUG0008-SPJ (NguyenPT 20170616) Update G00Account
    /**
     * Get agent id
     * - returns: Agent id
     */
    public func getAgentId() -> String {
        return self.agent_id
    }
    
    /**
     * Get agent name
     * - returns: Agent name
     */
    public func getAgentName() -> String {
        return self.agent_name
    }
    //-- BUG0008-SPJ (NguyenPT 20170616) Update G00Account
    
    /**
     * Check if user info is empty
     * - returns: True if phone and first_name are empty, False otherwise
     */
    public func isEmpty() -> Bool {
        if self.phone.isEmpty && self.first_name.isEmpty {
            return true
        }
        return false
    }
}
