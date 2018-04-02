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
    /** code_no */
    public var code_no: String = ""
    /** show_huy_giao_hang */
    public var allow_update: String = ""
    /** change_qty */
    public var change_qty:          String = DomainConst.BLANK
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
    /** employee_latitude */
    public var employee_latitude:       String = DomainConst.BLANK
    /** employee_longitude */
    public var employee_longitude:      String = DomainConst.BLANK
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
    /** Number of status */
    public var status_number:           String = DomainConst.BLANK
    /** rating */
    public var rating:                  String = DomainConst.BLANK
    /** rating_comment */
    public var rating_comment:          String = DomainConst.BLANK
    /** show_nhan_giao_hang */
    public var show_nhan_giao_hang:     String = DomainConst.BLANK
    /** show_huy_giao_hang */
    public var show_huy_giao_hang:      String = DomainConst.BLANK
    
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /** Support type id */
    public var support_id:              String = DomainConst.BLANK
    /** Support type text */
    public var support_text:            String = DomainConst.BLANK
    //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    
    //++ BUG0103-SPJ (NguyenPT 20170606) Update new flag
    /** Created date */
    public var created_date:            String = DomainConst.BLANK
    /** Flag show button complete or not */
    public var show_button_complete:    String = DomainConst.BLANK
    /** Flag show button save or not */
    public var show_button_save:        String = DomainConst.BLANK
    //-- BUG0103-SPJ (NguyenPT 20170606) Update new flag
    
    /** List images */
    public var images:                  [UpholdImageInfoItem] = [UpholdImageInfoItem]()
    
    //++ BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
    /** CCS code */
    public var ccsCode:                 String = DomainConst.BLANK
    //-- BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
    
    //++ BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
    /** Flag show/hide Update customer button */
    public var show_button_update_customer:     Int    = 0
    //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    /** Flag show/hide Update agent button */
    public var show_button_change_agent:        Int    = 0
    //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    /** Customer id */
    public var customer_id:                     String = DomainConst.BLANK
    //-- BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
    
    /** show_button_cancel */
    public var show_button_cancel:              Int    = 0
    /** show_input_promotion_amount */
    public var show_input_promotion_amount:     Int    = 0
    
    /** show_huy_giao_hang */
    public var order_detail:            [OrderDetailBean] = [OrderDetailBean]()
    /** Total quantity */
    public var total_qty:               String = DomainConst.BLANK
    /** Promotion amount */
    public var promotion_amount:        String = DomainConst.BLANK
    /** Discount amount */
    public var discount_amount:         String = DomainConst.BLANK
    /** Total */
    public var total:                   String = DomainConst.BLANK
    /** Grand total */
    public var grand_total:             String = DomainConst.BLANK
    /** Grand total */
    public var order_type_text:         String = DomainConst.BLANK
    /** Grand total */
    public var order_type_amount:       String = DomainConst.BLANK
    /** Grand total */
    public var amount_bu_vo:            String = DomainConst.BLANK
    /** input_promotion_amount */
    public var input_promotion_amount:  String = DomainConst.BLANK
    //++ BUG0192-SPJ (NguyenPT 20180402) Add gas remain
    /** Gas remain */
    public var gas_remain_amount:       String = DomainConst.BLANK
    //-- BUG0192-SPJ (NguyenPT 20180402) Add gas remain
    
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
        self.change_qty         = getString(json: jsonData, key: DomainConst.KEY_CHANGE_QTY)
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
        self.employee_latitude  = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_LAT)
        self.employee_longitude = getString(json: jsonData, key: DomainConst.KEY_EMPLOYEE_LONG)
        self.order_type         = getString(json: jsonData, key: DomainConst.KEY_ORDER_TYPE)
        self.type_amount        = getString(json: jsonData, key: DomainConst.KEY_TYPE_AMOUNT)
        self.amount_discount    = getString(json: jsonData, key: DomainConst.KEY_AMOUNT_DISCOUNT)
        self.discount_type      = getString(json: jsonData, key: DomainConst.KEY_DISCOUNT_TYPE)
        self.status_cancel      = getString(json: jsonData, key: DomainConst.KEY_STATUS_CANCEL)
        self.status_number      = getString(json: jsonData, key: DomainConst.KEY_STATUS_NUMBER)
        self.rating             = getString(json: jsonData, key: DomainConst.KEY_RATING)
        self.rating_comment     = getString(json: jsonData, key: DomainConst.KEY_RATING_COMMENT)
        self.show_nhan_giao_hang    = getString(json: jsonData, key: DomainConst.KEY_SHOW_NHAN_GH)
        self.show_huy_giao_hang     = getString(json: jsonData, key: DomainConst.KEY_SHOW_HUY_GH)
        
        //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
        self.support_id         = getString(json: jsonData, key: DomainConst.KEY_SUPPORT_ID)
        self.support_text       = getString(json: jsonData, key: DomainConst.KEY_SUPPORT_TEXT)
        //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
        
        //++ BUG0103-SPJ (NguyenPT 20170606) Update new flag
        self.created_date           = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        self.show_button_complete   = String(getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_COMPLETE))
        self.show_button_save       = String(getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_SAVE))
        //-- BUG0103-SPJ (NguyenPT 20170606) Update new flag
        
        if let dataArr = jsonData[DomainConst.KEY_LIST_IMAGE] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.images.append(UpholdImageInfoItem(jsonData: listItem))
            }
        }
        
        //++ BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
        self.ccsCode                = getString(json: jsonData, key: DomainConst.KEY_MENU_CCS_CODE)
        //++ BUG0111-SPJ (NguyenPT 20170619) Add new field CCS code
        
        //++ BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
        self.show_button_update_customer = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BTN_UPDATE_CUSTOMER)
        //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
        self.show_button_change_agent = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_CHANGE_AGENT)
        //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
        self.customer_id = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ID)
        //-- BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
        
        self.show_button_cancel = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_CANCEL)
        self.show_input_promotion_amount    = getInt(json: jsonData, key: DomainConst.KEY_SHOW_INPUT_PROMOTION_AMOUNT)
        
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
        self.order_type_text    = getString(json: jsonData, key: DomainConst.KEY_ORDER_TYPE_TEXT)
        self.order_type_amount  = getString(json: jsonData, key: DomainConst.KEY_ORDER_TYPE_AMOUNT)
        self.amount_bu_vo       = getString(json: jsonData, key: DomainConst.KEY_AMOUNT_BU_VO)
        self.input_promotion_amount = getString(json: jsonData, key: DomainConst.KEY_INPUT_PROMOTION_AMOUNT)
        //++ BUG0192-SPJ (NguyenPT 20180402) Add gas remain
        self.gas_remain_amount = getString(json: jsonData, key: DomainConst.KEY_GAS_REMAIN_AMOUNT)
        //-- BUG0192-SPJ (NguyenPT 20180402) Add gas remain
    }
    
    //++ BUG0156-SPJ (NguyenPT 20170926) Re-design Gas24h
    /**
     * Check if this object is empty
     * - returns: True if id is empty, false otherwise
     */
    public func isEmpty() -> Bool {
        return self.id.isEmpty
    }
    //-- BUG0156-SPJ (NguyenPT 20170926) Re-design Gas24h
}
