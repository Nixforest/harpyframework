//
//  OrderBean.swift
//  harpyframework
//
//  Created by SPJ on 12/31/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import UIKit

public class OrderBean: NSObject {
    /** Id */
    public var id: String = ""
    /** Title */
    public var first_name: String = ""
    /** Code number */
    public var phone: String = ""
    /** Grand total */
    public var email: String = ""
    /** Status */
    public var agent_id: String = ""
    /** Created date */
    public var agent_name: String = ""
    /** Phone */
    public var note: String = ""
    /** Address */
    public var address: String = ""
    /** show_nhan_giao_hang */
    public var code_no: String = ""
    /** show_huy_giao_hang */
    public var allow_update: String = ""
    /** show_huy_giao_hang */
    public var province_id: String = ""
    /** show_huy_giao_hang */
    public var district_id: String = ""
    /** show_huy_giao_hang */
    public var ward_id: String = ""
    /** show_huy_giao_hang */
    public var street_id: String = ""
    /** show_huy_giao_hang */
    public var house_numbers: String = ""
    /** show_huy_giao_hang */
    public var latitude: String = ""
    /** show_huy_giao_hang */
    public var longitude: String = ""
    /** show_huy_giao_hang */
    public var employee_name: String = ""
    /** show_huy_giao_hang */
    public var employee_code: String = ""
    /** show_huy_giao_hang */
    public var employee_phone: String = ""
    /** show_huy_giao_hang */
    public var employee_image: String = ""
    /** show_huy_giao_hang */
    public var order_type: String = ""
    /** show_huy_giao_hang */
    public var type_amount: String = ""
    /** show_huy_giao_hang */
    public var amount_discount: String = ""
    /** show_huy_giao_hang */
    public var discount_type: String = ""
    /** show_huy_giao_hang */
    public var status_cancel: String = ""
    /** show_huy_giao_hang */
    public var order_detail: [OrderDetailBean] = [OrderDetailBean]()
    
    public override init() {
        super.init()
    }
    
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
        self.first_name         = jsonData[DomainConst.KEY_FIRST_NAME] as? String ?? ""
        self.phone              = jsonData[DomainConst.KEY_PHONE] as? String ?? ""
        self.email              = jsonData[DomainConst.KEY_EMAIL] as? String ?? ""
        self.agent_id           = jsonData[DomainConst.KEY_AGENT_ID] as? String ?? ""
        self.agent_name         = jsonData[DomainConst.KEY_AGENT_NAME] as? String ?? ""
        self.note               = jsonData[DomainConst.KEY_NOTE] as? String ?? ""
        self.address            = jsonData[DomainConst.KEY_ADDRESS] as? String ?? ""
        self.code_no            = jsonData[DomainConst.KEY_CODE_NO] as? String ?? ""
        self.allow_update       = jsonData[DomainConst.KEY_ALLOW_UPDATE] as? String ?? ""
        self.province_id        = jsonData[DomainConst.KEY_PROVINCE_ID] as? String ?? ""
        self.district_id        = jsonData[DomainConst.KEY_DISTRICT_ID] as? String ?? ""
        self.ward_id            = jsonData[DomainConst.KEY_WARD_ID] as? String ?? ""
        self.street_id          = jsonData[DomainConst.KEY_STREET] as? String ?? ""
        self.house_numbers      = jsonData[DomainConst.KEY_HOUSE_NUMBER] as? String ?? ""
        self.latitude           = jsonData[DomainConst.KEY_LATITUDE] as? String ?? ""
        self.longitude          = jsonData[DomainConst.KEY_LONGITUDE] as? String ?? ""
        self.employee_name      = jsonData[DomainConst.KEY_EMPLOYEE_NAME] as? String ?? ""
        self.employee_code      = jsonData[DomainConst.KEY_EMPLOYEE_CODE] as? String ?? ""
        self.employee_phone     = jsonData[DomainConst.KEY_EMPLOYEE_PHONE] as? String ?? ""
        self.employee_image     = jsonData[DomainConst.KEY_EMPLOYEE_IMG] as? String ?? ""
        self.order_type         = jsonData[DomainConst.KEY_ORDER_TYPE] as? String ?? ""
        self.type_amount        = jsonData[DomainConst.KEY_TYPE_AMOUNT] as? String ?? ""
        self.amount_discount    = jsonData[DomainConst.KEY_AMOUNT_DISCOUNT] as? String ?? ""
        self.discount_type      = jsonData[DomainConst.KEY_DISCOUNT_TYPE] as? String ?? ""
        self.status_cancel      = jsonData[DomainConst.KEY_STATUS_CANCEL] as? String ?? ""
        if let dataArr = jsonData[DomainConst.KEY_ORDER_DETAIL] as? [[String: AnyObject]] {
            for item in dataArr {
                self.order_detail.append(OrderDetailBean(jsonData: item))
            }
        }
    }
}
