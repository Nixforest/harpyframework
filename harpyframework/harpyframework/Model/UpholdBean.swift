//
//  UpholdBean.swift
//  project
//
//  Created by Nixforest on 10/14/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UpholdBean: NSObject {
    /** Id */
    public var id: String = ""
    /** Uphold type */
    public var uphold_type: String = ""
    /** Code number */
    public var code_no: String = ""
    /** Customer name */
    public var customer_name: String = ""
    /** Customer address */
    public var customer_address: String = ""
    /** Level type */
    public var level_type: String = ""
    /** Type uphold */
    public var type_uphold: String = ""
    /** Content */
    public var content: String = ""
    /** Contact person */
    public var contact_person: String = ""
    /** Contact phone */
    public var contact_tel: String = ""
    /** Status */
    public var status: String = ""
    /** Created date */
    public var created_date: String = ""
    /** Sale name */
    public var sale_name: String = ""
    /** Created by */
    public var created_by: String = ""
    /** Schedule month */
    public var schedule_month: String = ""
    /** List reply items */
    //var reply_item: [UpholdReplyBean]
    /** Employee name */
    public var employee_name: String = ""
    /** Employee phone */
    public var employee_phone: String = ""
    /** Last reply message */
    public var last_reply_message: String = ""
    /** Report wrong */
    public var report_wrong: String = ""
    /** Reply Id */
    public var reply_id: String = ""
    /** Status number */
    public var status_number: String = ""
    /** Customer id */
    public var customer_id: String = ""
    /** Rating status */
    public var rating_status: String = ""
    /** Rating note */
    public var rating_note: String = ""
    /** Rating type */
    public var rating_type: [ConfigBean] = [ConfigBean]()
    /** Schedule type */
    public var schedule_type: String = ""
    /** Reply items */
    public var reply_item: [UpholdReplyBean] = [UpholdReplyBean]()
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    init(jsonData: [String: AnyObject]) {
        super.init()
        // Id
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        self.uphold_type        = getString(json: jsonData, key: DomainConst.KEY_UPHOLD_TYPE_IDX)
        self.code_no            = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.customer_name      = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_NAME)
        self.customer_address   = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ADDRESS)
        self.level_type         = getString(json: jsonData, key: DomainConst.KEY_LEVEL_TYPE)
        self.type_uphold        = getString(json: jsonData, key: DomainConst.KEY_UPHOLD_TYPE)
        self.content            = getString(json: jsonData, key: DomainConst.KEY_CONTENT)
        self.contact_person     = getString(json: jsonData, key: DomainConst.KEY_CONTACT_PERSON)
        self.contact_tel        = getString(json: jsonData, key: DomainConst.KEY_CONTACT_TEL)
        self.status             = getString(json: jsonData, key: DomainConst.KEY_STATUS)
        self.created_date       = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        self.sale_name          = getString(json: jsonData, key: DomainConst.KEY_SALE_NAME)
        self.created_by         = getString(json: jsonData, key: DomainConst.KEY_CREATED_BY)
        self.schedule_month     = getString(json: jsonData, key: DomainConst.KEY_SCHEDULE_MONTH)
        self.employee_name      = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_NAME)
        self.employee_phone     = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_PHONE)
        self.last_reply_message = getString(json: jsonData, key: DomainConst.KEY_LAST_REPLY_MESSAGE)
        self.report_wrong       = getString(json: jsonData, key: DomainConst.KEY_REPORT_WRONG)
        self.reply_id           = getString(json: jsonData, key: DomainConst.KEY_REPLY_ID)
        self.status_number      = getString(json: jsonData, key: DomainConst.KEY_STATUS_NUMBER)
        self.customer_id        = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ID)
        self.rating_status      = getString(json: jsonData, key: DomainConst.KEY_RATING_STATUS)
        self.rating_note        = getString(json: jsonData, key: DomainConst.KEY_RATING_NOTE)
        self.schedule_type      = getString(json: jsonData, key: DomainConst.KEY_SCHEDULE_TYPE)
        self.rating_type.append(contentsOf: getListConfig(json: jsonData, key: DomainConst.KEY_RATING_TYPE))
        self.reply_item.append(contentsOf: getListUpholdReply(json: jsonData, key: DomainConst.KEY_REPLY_ITEM))
    }
    override init() {
        
    }
}
