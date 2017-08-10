//
//  OrderVIPBean.swift
//  harpyframework
//
//  Created by SPJ on 2/17/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderVIPBean: ConfigBean {
    /** Code number */
    public var code_no:                 String = DomainConst.BLANK
    /** Delivery date */
    public var date_delivery:           String = DomainConst.BLANK
    /** Id of customer */
    public var customer_id:             String = DomainConst.BLANK
    /** Name of customer */
    public var customer_name:           String = DomainConst.BLANK
    /** Address of customer */
    public var customer_address:        String = DomainConst.BLANK
    /** Contact of customer */
    public var customer_contact:        String = DomainConst.BLANK
    /** Total gas */
    public var total_gas:               String = DomainConst.BLANK
    /** Total gas du */
    public var total_gas_du:            String = DomainConst.BLANK
    /** Grand total */
    public var grand_total:             String = DomainConst.BLANK
    /** Note about customer */
    public var note_customer:           String = DomainConst.BLANK
    /** Note about employee */
    public var note_employee:           String = DomainConst.BLANK
    /** Created date */
    public var created_date:            String = DomainConst.BLANK
    /** Name of driver */
    public var name_driver:             String = DomainConst.BLANK
    /** Name of car */
    public var name_car:                String = DomainConst.BLANK
    /** Name of employee maintain */
    public var name_employee_maintain:  String = DomainConst.BLANK
    /** Gas information */
    public var info_gas:                [OrderVIPDetailBean] = [OrderVIPDetailBean]()
    /** Cylinder information */
    public var info_vo:                 [OrderVIPDetailBean] = [OrderVIPDetailBean]()
    /** Flag allow update or not */
    public var allow_update:            String = DomainConst.BLANK
    /** Agent name */
    public var agent_name:              String = DomainConst.BLANK
    /** Number of status */
    public var status_number:           String = DomainConst.BLANK
    /** Price information */
    public var info_price:              String = DomainConst.BLANK
    //++ BUG0104-SPJ (NguyenPT 20170607) Update new properties
    /** Mass of gas remain */
    public var total_gas_du_kg:         String = DomainConst.BLANK
    /** Collect money */
    public var show_thu_tien:           Int    = 0
    /** Pay for gas remain */
    public var show_chi_gas_du:         Int    = 0
    /** Debit flag */
    public var show_button_debit:       Int    = 0
    /** Complete flag */
    public var show_button_complete:    Int    = 0
    /** Save flag */
    public var show_button_save:        Int    = 0
    /** Cancel flag */
    public var show_button_cancel:      Int    = 0
    /** Pay direct */
    public var pay_direct:              String = DomainConst.BLANK
    /** List images */
    public var images:                  [UpholdImageInfoItem] = [UpholdImageInfoItem]()
    //-- BUG0104-SPJ (NguyenPT 20170607) Update new properties
    //++ BUG0137-SPJ (NguyenPT 20170727) Show payback field
    /** Show payback */
    public var show_pay_back:           Int    = 0
    /** pay_back */
    public var pay_back:                String = DomainConst.BLANK
    //-- BUG0137-SPJ (NguyenPT 20170727) Show payback field
    //++ BUG0139-SPJ (NguyenPT 20170805) Show discount field
    /** Show discount */
    public var show_discount:           Int    = 0
    /** discount */
    public var discount:                String = DomainConst.BLANK
    //-- BUG0139-SPJ (NguyenPT 20170805) Show discount field
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.code_no            = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.date_delivery      = getString(json: jsonData, key: DomainConst.KEY_DATE_DELIVERY)
        self.customer_id        = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ID)
        self.customer_name      = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_NAME)
        self.customer_address   = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_ADDRESS)
        self.customer_contact   = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_CONTACT)
        self.total_gas          = getString(json: jsonData, key: DomainConst.KEY_TOTAL_GAS)
        self.total_gas_du       = getString(json: jsonData, key: DomainConst.KEY_TOTAL_GAS_DU)
        self.grand_total        = getString(json: jsonData, key: DomainConst.KEY_GRAND_TOTAL)
        self.note_customer      = getString(json: jsonData, key: DomainConst.KEY_NOTE_CUSTOMER)
        self.note_employee      = getString(json: jsonData, key: DomainConst.KEY_NOTE_EMPLOYEE)
        self.created_date       = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        self.name_driver        = getString(json: jsonData, key: DomainConst.KEY_NAME_DRIVER)
        self.name_car           = getString(json: jsonData, key: DomainConst.KEY_NAME_CAR)
        self.name_employee_maintain = getString(json: jsonData, key: DomainConst.KEY_NAME_EMPLOYEE_MAINTAIN)
        let listTotalGas = jsonData[DomainConst.KEY_INFO_GAS] as? [[String: AnyObject]]
        if listTotalGas != nil {
            for item in listTotalGas! {
                self.info_gas.append(OrderVIPDetailBean(jsonData: item))
            }
        }
        let listTotalCylinder = jsonData[DomainConst.KEY_INFO_CYLINDER] as? [[String: AnyObject]]
        if listTotalCylinder != nil {
            for item in listTotalCylinder! {
                self.info_vo.append(OrderVIPDetailBean(jsonData: item))
            }
        }
        self.allow_update       = getString(json: jsonData, key: DomainConst.KEY_ALLOW_UPDATE)
        self.agent_name         = getString(json: jsonData, key: DomainConst.KEY_AGENT_NAME)
        self.status_number      = getString(json: jsonData, key: DomainConst.KEY_STATUS_NUMBER)
        self.info_price         = getString(json: jsonData, key: DomainConst.KEY_INFO_PRICE)
        
        //++ BUG0104-SPJ (NguyenPT 20170607) Update new properties
        self.total_gas_du_kg        = getString(json: jsonData, key: DomainConst.KEY_TOTAL_GAS_DU_KG)
        self.show_thu_tien          = getInt(json: jsonData, key: DomainConst.KEY_SHOW_THU_TIEN)
        self.show_chi_gas_du        = getInt(json: jsonData, key: DomainConst.KEY_SHOW_CHI_GAS_DU)
        self.show_button_debit      = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_DEBIT)
        self.show_button_complete   = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_COMPLETE)
        self.show_button_save       = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_SAVE)
        self.show_button_cancel     = getInt(json: jsonData, key: DomainConst.KEY_SHOW_BUTTON_CANCEL)
        self.pay_direct             = getString(json: jsonData, key: DomainConst.KEY_PAY_DIRECT)
        if let dataArr = jsonData[DomainConst.KEY_LIST_IMAGE] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.images.append(UpholdImageInfoItem(jsonData: listItem))
            }
        }
        //-- BUG0104-SPJ (NguyenPT 20170607) Update new properties
        //++ BUG0137-SPJ (NguyenPT 20170727) Show payback field
        self.show_pay_back      = getInt(json: jsonData, key: DomainConst.KEY_SHOW_PAY_BACK)
        self.pay_back           = getStringFromFloat(json: jsonData, key: DomainConst.KEY_PAY_BACK)
        //-- BUG0137-SPJ (NguyenPT 20170727) Show payback field
        
        //++ BUG0139-SPJ (NguyenPT 20170805) Show discount field
        self.show_discount      = getInt(json: jsonData, key: DomainConst.KEY_SHOW_DISCOUNT)
        self.discount           = getStringFromInt(json: jsonData, key: DomainConst.KEY_DISCOUNT)
        //-- BUG0139-SPJ (NguyenPT 20170805) Show discount field
    }
    
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
