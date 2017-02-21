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
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public override init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.code_no            = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.date_delivery      = getString(json: jsonData, key: DomainConst.KEY_DATE_DELIVERY)
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
        self.allow_update      = getString(json: jsonData, key: DomainConst.KEY_ALLOW_UPDATE)
    }
    
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
