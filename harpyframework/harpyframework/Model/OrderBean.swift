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
    /** Phone number */
    public var phone: String = ""
    /** Grand total */
    public var email: String = ""
    /** Status */
    public var agent_id: String = ""
    /** Created date */
    public var agent_name: String = ""
    /** Agent phone */
    public var agent_phone: String = ""
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
//    public var order_detail: [OrderDetailBean] = [OrderDetailBean]()
    public var order_detail:     [OrderVIPDetailBean] = [OrderVIPDetailBean]()
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
    /** Grand total */
    public var order_type_text:     String = DomainConst.BLANK
    /** Grand total */
    public var order_type_amount:   String = DomainConst.BLANK
    /** Grand total */
    public var amount_bu_vo:        String = DomainConst.BLANK
    /** Number of status */
    public var status_number:       String = DomainConst.BLANK
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /** Support type id */
    public var support_id:          String = DomainConst.BLANK
    /** Support type text */
    public var support_text:        String = DomainConst.BLANK
    //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    //++ BUG0103-SPJ (NguyenPT 20170606) Update new flag
    /** Flag show button complete or not */
    public var show_button_complete:    String = DomainConst.BLANK
    /** Flag show button save or not */
    public var show_button_save:        String = DomainConst.BLANK
    /** Created date */
    public var created_date:            String = DomainConst.BLANK
    //-- BUG0103-SPJ (NguyenPT 20170606) Update new flag
    
    //++ BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
    /** CCS code */
    public var ccsCode:                String = DomainConst.BLANK
    //-- BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
    
    //++ BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
    /** Flag show/hide Update customer button */
    public var show_button_update_customer:    Int    = 0
    /** Customer id */
    public var customer_id:            String = DomainConst.BLANK
    //-- BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
    //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    /** Flag show/hide Update agent button */
    public var show_button_change_agent:    Int    = 0
    //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    //++ BUG0103-SPJ (NguyenPT 20171227) Update new flag
    /** Flag show button complete or not */
    public var show_button_cancel:          String = DomainConst.BLANK
    //- BUG0103-SPJ (NguyenPT 20171227) Update new flag
    public var gas_remain_amount:           String = DomainConst.BLANK
    //++ BUG0141-SPJ (KhoiVT 20170805) Đơn hàng hộ GĐ thêm phần up hình + chụp hình giống các form cũ + redesign
    /** List images */
    public var images:                  [UpholdImageInfoItem] = [UpholdImageInfoItem]()
    //-- BUG0141-SPJ (KhoiVT 20170805) Đơn hàng hộ GĐ thêm phần up hình + chụp hình giống các form cũ + redesign
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
        self.agent_phone        = getString(json: jsonData, key: DomainConst.KEY_AGENT_PHONE)
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
//                self.order_detail.append(OrderDetailBean(jsonData: item))
                self.order_detail.append(OrderVIPDetailBean(jsonData: item))
            }
        }
        self.total_qty          = getString(json: jsonData, key: DomainConst.KEY_TOTAL_QTY)
        self.promotion_amount   = getString(json: jsonData, key: DomainConst.KEY_PROMOTION_AMOUNT)
        self.discount_amount    = getString(json: jsonData, key: DomainConst.KEY_DISCOUNT_AMOUNT)
        self.total              = getString(json: jsonData, key: DomainConst.KEY_TOTAL)
        self.grand_total        = getString(json: jsonData, key: DomainConst.KEY_GRAND_TOTAL)
        self.order_type_text    = getString(json: jsonData, key: DomainConst.KEY_ORDER_TYPE_TEXT)
        self.order_type_amount  = getString(json: jsonData, key: DomainConst.KEY_ORDER_TYPE_AMOUNT)
        self.amount_bu_vo       = getString(json: jsonData, key: DomainConst.KEY_AMOUNT_BU_VO)
        self.status_number      = getString(json: jsonData, key: DomainConst.KEY_STATUS_NUMBER)
        //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
        self.support_id         = getString(json: jsonData, key: DomainConst.KEY_SUPPORT_ID)
        self.support_text       = getString(json: jsonData, key: DomainConst.KEY_SUPPORT_TEXT)
        //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
        //++ BUG0103-SPJ (NguyenPT 20170606) Update new flag
        self.show_button_complete   = String(getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_COMPLETE))
        self.show_button_save       = String(getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_SAVE))
        self.created_date           = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        //-- BUG0103-SPJ (NguyenPT 20170606) Update new flag
        
        //++ BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
        self.ccsCode                = getString(json: jsonData, key: DomainConst.KEY_MENU_CCS_CODE)
        //++ BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
        
        //++ BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
        self.show_button_update_customer = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BTN_UPDATE_CUSTOMER)
        self.customer_id = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ID)
        //-- BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
        //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
        self.show_button_change_agent = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_CHANGE_AGENT)
        //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
        //++ BUG0103-SPJ (NguyenPT 20171227) Update new flag
        self.show_button_cancel   = String(getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_CANCEL))
        //-- BUG0103-SPJ (NguyenPT 20171227) Update new flag
        
        self.gas_remain_amount = getString(json: jsonData, key: DomainConst.KEY_GAS_REMAIN_AMOUNT)
        //++ BUG0141-SPJ (KhoiVT 20170805) Đơn hàng hộ GĐ thêm phần up hình + chụp hình giống các form cũ + redesign
        if let dataArr = jsonData[DomainConst.KEY_LIST_IMAGE] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.images.append(UpholdImageInfoItem(jsonData: listItem))
            }
        }
        //-- BUG0141-SPJ (KhoiVT 20170805) Đơn hàng hộ GĐ thêm phần up hình + chụp hình giống các form cũ + redesign
    }
}
