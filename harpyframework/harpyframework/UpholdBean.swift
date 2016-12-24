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
