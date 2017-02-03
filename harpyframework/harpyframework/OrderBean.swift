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
    /** Total quantity */
    public var total_qty:        String = DomainConst.BLANK
    /** Promotion amount */
    public var promotion_amount: String = DomainConst.BLANK
    /** Discount amount */
    public var discount_amount:  String = DomainConst.BLANK
    /** Total */
    public var total:            String = DomainConst.BLANK
    /** Grand total */
    public var grand_total:      String = DomainConst.BLANK
    
    public override init() {
        super.init()
    }
    
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
        self.first_name         = getString(json: jsonData, key: DomainConst.KEY_FIRST_NAME)
        self.phone              = getString(json: jsonData, key: DomainConst.KEY_PHONE)
        self.email              = getString(json: jsonData, key: DomainConst.KEY_EMAIL)
        self.agent_id           = getString(json: jsonData, key: DomainConst.KEY_AGENT_ID)
        self.agent_name         = getString(json: jsonData, key: DomainConst.KEY_AGENT_NAME)
        self.note               = getString(json: jsonData, key: DomainConst.KEY_NOTE)
        self.address            = getString(json: jsonData, key: DomainConst.KEY_ADDRESS)
        self.code_no            = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.allow_update       = getString(json: jsonData, key: DomainConst.KEY_ALLOW_UPDATE)
        self.province_id        = getString(json: jsonData, key: DomainConst.KEY_PROVINCE_ID)
        self.district_id        = getString(json: jsonData, key: DomainConst.KEY_DISTRICT_ID)
        self.ward_id            = getString(json: jsonData, key: DomainConst.KEY_WARD_ID)
        self.street_id          = getString(json: jsonData, key: DomainConst.KEY_STREET)
        self.house_numbers      = getString(json: jsonData, key: DomainConst.KEY_HOUSE_NUMBER)
        self.latitude           = getString(json: jsonData, key: DomainConst.KEY_LATITUDE)
        self.longitude          = getString(json: jsonData, key: DomainConst.KEY_LONGITUDE)
        self.employee_name      = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_NAME)
        self.employee_code      = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_CODE)
        self.employee_phone     = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_PHONE)
        self.employee_image     = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_IMG)
        self.order_type         = getString(json: jsonData, key: DomainConst.KEY_ORDER_TYPE)
        self.type_amount        = getString(json: jsonData, key: DomainConst.KEY_TYPE_AMOUNT)
        self.amount_discount    = getString(json: jsonData, key: DomainConst.KEY_AMOUNT_DISCOUNT)
        self.discount_type      = getString(json: jsonData, key: DomainConst.KEY_DISCOUNT_TYPE)
        self.status_cancel      = getString(json: jsonData, key: DomainConst.KEY_STATUS_CANCEL)
        if let dataArr = jsonData[DomainConst.KEY_ORDER_DETAIL] as? [[String: AnyObject]] {
            for item in dataArr {
                self.order_detail.append(OrderDetailBean(jsonData: item))
            }
        }
        self.total_qty          = getString(json: jsonData, key: DomainConst.KEY_TOTAL_QTY)
        self.promotion_amount   = getString(json: jsonData, key: DomainConst.KEY_PROMOTION_AMOUNT)
        self.discount_amount    = getString(json: jsonData, key: DomainConst.KEY_DISCOUNT_AMOUNT)
        self.total              = getString(json: jsonData, key: DomainConst.KEY_TOTAL)
        self.grand_total        = getString(json: jsonData, key: DomainConst.KEY_GRAND_TOTAL)
    }
}
