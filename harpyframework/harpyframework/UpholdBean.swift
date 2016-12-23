//
//  UpholdBean.swift
//  project
//
//  Created by Nixforest on 10/14/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UpholdBean: NSObject {
    /** Id */
    var id: String = ""
    /** Uphold type */
    var uphold_type: String = ""
    /** Code number */
    var code_no: String = ""
    /** Customer name */
    var customer_name: String = ""
    /** Customer address */
    var customer_address: String = ""
    /** Level type */
    var level_type: String = ""
    /** Type uphold */
    var type_uphold: String = ""
    /** Content */
    var content: String = ""
    /** Contact person */
    var contact_person: String = ""
    /** Contact phone */
    var contact_tel: String = ""
    /** Status */
    var status: String = ""
    /** Created date */
    var created_date: String = ""
    /** Sale name */
    var sale_name: String = ""
    /** Created by */
    var created_by: String = ""
    /** Schedule month */
    var schedule_month: String = ""
    /** List reply items */
    //var reply_item: [UpholdReplyBean]
    /** Employee name */
    var employee_name: String = ""
    /** Employee phone */
    var employee_phone: String = ""
    /** Last reply message */
    var last_reply_message: String = ""
    /** Report wrong */
    var report_wrong: String = ""
    /** Reply Id */
    var reply_id: String = ""
    /** Status number */
    var status_number: String = ""
    /** Customer id */
    var customer_id: String = ""
    /** Rating status */
    var rating_status: String = ""
    /** Rating note */
    var rating_note: String = ""
    /** Rating type */
    var rating_type: [ConfigBean] = [ConfigBean]()
    /** Schedule type */
    var schedule_type: String = ""
    /** Reply items */
    var reply_item: [UpholdReplyBean] = [UpholdReplyBean]()
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    init(jsonData: [String: AnyObject]) {
        // Id
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        self.uphold_type        = jsonData[DomainConst.KEY_UPHOLD_TYPE_IDX] as? String ?? ""
        self.code_no            = jsonData[DomainConst.KEY_CODE_NO] as? String ?? ""
        self.customer_name      = jsonData[DomainConst.KEY_CUSTOMER_NAME] as? String ?? ""
        self.customer_address   = jsonData[DomainConst.KEY_CUSTOMER_ADDRESS] as? String ?? ""
        self.level_type         = jsonData[DomainConst.KEY_LEVEL_TYPE] as? String ?? ""
        self.type_uphold        = jsonData[DomainConst.KEY_UPHOLD_TYPE] as? String ?? ""
        self.content            = jsonData[DomainConst.KEY_CONTENT] as? String ?? ""
        self.contact_person     = jsonData[DomainConst.KEY_CONTACT_PERSON] as? String ?? ""
        self.contact_tel        = jsonData[DomainConst.KEY_CONTACT_TEL] as? String ?? ""
        self.status             = jsonData[DomainConst.KEY_STATUS] as? String ?? ""
        self.created_date       = jsonData[DomainConst.KEY_CREATED_DATE] as? String ?? ""
        self.sale_name          = jsonData[DomainConst.KEY_SALE_NAME] as? String ?? ""
        self.created_by         = jsonData[DomainConst.KEY_CREATED_BY] as? String ?? ""
        self.schedule_month     = jsonData[DomainConst.KEY_SCHEDULE_MONTH] as? String ?? ""
        self.employee_name      = jsonData[DomainConst.KEY_EMPLOYEE_NAME] as? String ?? ""
        self.employee_phone     = jsonData[DomainConst.KEY_EMPLOYEE_PHONE] as? String ?? ""
        self.last_reply_message = jsonData[DomainConst.KEY_LAST_REPLY_MESSAGE] as? String ?? ""
        self.report_wrong       = jsonData[DomainConst.KEY_REPORT_WRONG] as? String ?? ""
        self.reply_id           = jsonData[DomainConst.KEY_REPLY_ID] as? String ?? ""
        self.status_number      = jsonData[DomainConst.KEY_STATUS_NUMBER] as? String ?? ""
        self.customer_id        = jsonData[DomainConst.KEY_CUSTOMER_ID] as? String ?? ""
        self.rating_status      = jsonData[DomainConst.KEY_RATING_STATUS] as? String ?? ""
        self.rating_note        = jsonData[DomainConst.KEY_RATING_NOTE] as? String ?? ""
        self.schedule_type      = jsonData[DomainConst.KEY_SCHEDULE_TYPE] as? String ?? ""
        if let dataArr = jsonData[DomainConst.KEY_RATING_TYPE] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.rating_type.append(ConfigBean(jsonData: listItem))
            }
        }
        if let dataArr = jsonData[DomainConst.KEY_REPLY_ITEM] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.reply_item.append(UpholdReplyBean(jsonData: listItem))
            }
        }
    }
    override init() {
        
    }
}
