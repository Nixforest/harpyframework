//
//  UpholdReplyBean.swift
//  project
//
//  Created by Nixforest on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UpholdReplyBean: NSObject {
    /** Id */
    var id: String = ""
    /** Hours handle */
    var hours_handle: String = ""
    /** Contact phone */
    var contact_phone: String = ""
    /** Note */
    var note: String = ""
    /** UID login */
    var uid_login: String = ""
    /** Status */
    var status: String = ""
    /** Created date */
    var created_date: String = ""
    /** Date time handle */
    var date_time_handle: String = ""
    /** Report wrong */
    var report_wrong: String = ""
    /** Note internal */
    var note_internal: String = ""
    /** List images */
    var images: [UpholdImageInfoItem] = [UpholdImageInfoItem]()
    
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
        self.hours_handle       = jsonData[DomainConst.KEY_HOURS_HANDLE] as? String ?? ""
        self.contact_phone      = jsonData[DomainConst.KEY_CONTACT_PHONE] as? String ?? ""
        self.note               = jsonData[DomainConst.KEY_NOTE] as? String ?? ""
        self.uid_login          = jsonData[DomainConst.KEY_UID_LOGIN] as? String ?? ""
        self.status             = jsonData[DomainConst.KEY_STATUS] as? String ?? ""
        self.created_date       = jsonData[DomainConst.KEY_CREATED_DATE] as? String ?? ""
        self.date_time_handle   = jsonData[DomainConst.KEY_DATE_TIME_HANDLE] as? String ?? ""
        self.report_wrong       = jsonData[DomainConst.KEY_REPORT_WRONG] as? String ?? ""
        self.note_internal      = jsonData[DomainConst.KEY_NOTE_INTERNAL] as? String ?? ""
        if let dataArr = jsonData[DomainConst.KEY_IMAGES] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.images.append(UpholdImageInfoItem(jsonData: listItem))
            }
        }
    }
    override init() {
        
    }
}
