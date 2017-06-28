//
//  OrderVIPListBean.swift
//  harpyframework
//
//  Created by SPJ on 2/18/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderVIPListBean: ConfigBean {
    /** Code number */
    public var code_no:             String = DomainConst.BLANK
    /** Delivery date */
    public var date_delivery:       String = DomainConst.BLANK
    /** Name of customer */
    public var customer_name:       String = DomainConst.BLANK
    /** Address of customer */
    public var customer_address:    String = DomainConst.BLANK
    /** Phone of customer */
    public var customer_phone:      String = DomainConst.BLANK
    /** Grand total */
    public var grand_total:         String = DomainConst.BLANK
    /** Note about customer */
    public var note_customer:       String = DomainConst.BLANK
    /** Note about employee */
    public var note_employee:       String = DomainConst.BLANK
    /** Name of gas */
    public var name_gas:            String = DomainConst.BLANK
    /** Number of status */
    public var status_number:       String = DomainConst.BLANK
    /** Created date */
    public var created_date:        String = DomainConst.BLANK
    /** show_nhan_giao_hang */
    public var show_nhan_giao_hang: String = DomainConst.BLANK
    /** show_huy_giao_hang */
    public var show_huy_giao_hang:  String = DomainConst.BLANK
    
    //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    /** customer_name_chain */
    public var customer_name_chain: String = DomainConst.BLANK
    /** app_status_text */
    public var app_status_text:     String = DomainConst.BLANK
    //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.code_no                = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.date_delivery          = getString(json: jsonData, key: DomainConst.KEY_DATE_DELIVERY)
        self.customer_name          = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_NAME)
        self.customer_address       = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ADDRESS)
        self.customer_phone         = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_PHONE)
        self.grand_total            = getString(json: jsonData, key: DomainConst.KEY_GRAND_TOTAL)
        self.note_customer          = getString(json: jsonData, key: DomainConst.KEY_NOTE_CUSTOMER)
        self.note_employee          = getString(json: jsonData, key: DomainConst.KEY_NOTE_EMPLOYEE)
        self.name_gas               = getString(json: jsonData, key: DomainConst.KEY_NAME_GAS)
        self.status_number          = getString(json: jsonData, key: DomainConst.KEY_STATUS_NUMBER)
        self.created_date           = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        self.show_nhan_giao_hang    = getString(json: jsonData, key: DomainConst.KEY_SHOW_NHAN_GH)
        self.show_huy_giao_hang     = getString(json: jsonData, key: DomainConst.KEY_SHOW_HUY_GH)
        
        //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        self.customer_name_chain    = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_NAME_CHAIN)
        self.app_status_text        = getString(json: jsonData, key: DomainConst.KEY_APP_STATUS_TEXT)
        //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    }
}
