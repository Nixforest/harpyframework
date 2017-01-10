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
        super.init()
        // Id
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        self.title                  = getString(json: jsonData, key: DomainConst.KEY_TITLE)
        self.code_no                = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.grand_total            = getString(json: jsonData, key: DomainConst.KEY_GRAND_TOTAL)
        self.status                 = getString(json: jsonData, key: DomainConst.KEY_STATUS)
        self.created_date           = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        self.phone                  = getString(json: jsonData, key: DomainConst.KEY_PHONE)
        self.address                = getString(json: jsonData, key: DomainConst.KEY_ADDRESS)
        self.show_nhan_giao_hang    = getString(json: jsonData, key: DomainConst.KEY_SHOW_NHAN_GH)
        self.show_huy_giao_hang     = getString(json: jsonData, key: DomainConst.KEY_SHOW_HUY_GH)
    }
}
