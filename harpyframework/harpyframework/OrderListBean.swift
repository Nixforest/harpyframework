//
//  OrderListBean.swift
//  harpyframework
//
//  Created by SPJ on 12/28/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation

public class OrderListBean: NSObject {
    /** Id */
    public var id: String = ""
    /** Title */
    public var title: String = ""
    /** Code number */
    public var code_no: String = ""
    /** Grand total */
    public var grand_total: String = ""
    /** Status */
    public var status: String = ""
    /** Created date */
    public var created_date: String = ""
    /** Phone */
    public var phone: String = ""
    /** Address */
    public var address: String = ""
    /** show_nhan_giao_hang */
    public var show_nhan_giao_hang: String = ""
    /** show_huy_giao_hang */
    public var show_huy_giao_hang: String = ""
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        // Id
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        self.title              = jsonData[DomainConst.KEY_TITLE] as? String ?? ""
        self.code_no            = jsonData[DomainConst.KEY_CODE_NO] as? String ?? ""
        self.grand_total        = jsonData[DomainConst.KEY_GRAND_TOTAL] as? String ?? ""
        self.status             = jsonData[DomainConst.KEY_STATUS] as? String ?? ""
        self.created_date       = jsonData[DomainConst.KEY_CREATED_DATE] as? String ?? ""
        self.phone              = jsonData[DomainConst.KEY_PHONE] as? String ?? ""
        self.address            = jsonData[DomainConst.KEY_ADDRESS] as? String ?? ""
        self.show_nhan_giao_hang    = jsonData[DomainConst.KEY_SHOW_NHAN_GH] as? String ?? ""
        self.show_huy_giao_hang      = jsonData[DomainConst.KEY_SHOW_HUY_GH] as? String ?? ""
    }
}
