//
//  UpholdReplyBean.swift
//  project
//
//  Created by Nixforest on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UpholdReplyBean: NSObject {
    /** Id */
    public var id: String = ""
    /** Hours handle */
    public var hours_handle: String = ""
    /** Contact phone */
    public var contact_phone: String = ""
    /** Note */
    public var note: String = ""
    /** UID login */
    public var uid_login: String = ""
    /** Status */
    public var status: String = ""
    /** Created date */
    public var created_date: String = ""
    /** Date time handle */
    public var date_time_handle: String = ""
    /** Report wrong */
    public var report_wrong: String = ""
    /** Note internal */
    public var note_internal: String = ""
    /** List images */
    public var images: [UpholdImageInfoItem] = [UpholdImageInfoItem]()
    
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
    override public init() {
        
    }
}
