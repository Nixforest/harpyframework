//
//  CustomerFamilyBean.swift
//  harpyframework
//
//  Created by SPJ on 3/26/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CustomerFamilyBean: ConfigBean {
    /** Id of Customer Family type */
    var hgd_type_id:            String = DomainConst.BLANK
    /** Serial of material */
    var serial:                 String = DomainConst.BLANK
    /** Id of province */
    var province_id:            String = DomainConst.BLANK
    /** Id of District */
    var district_id:            String = DomainConst.BLANK
    /** Id of Ward */
    var ward_id:                String = DomainConst.BLANK
    /** Id of Street */
    var street_id:              String = DomainConst.BLANK
    /** House numbers */
    var house_numbers:          String = DomainConst.BLANK
    /** Address */
    var address:                String = DomainConst.BLANK
    /** Type of Customer Family */
    var customer_type:          String = DomainConst.BLANK
    /** Brand of Opposite */
    var hgd_doi_thu:            String = DomainConst.BLANK
    /** Created date */
    var created_date:           String = DomainConst.BLANK
    /** Created by */
    var created_by:             String = DomainConst.BLANK
    /** Brand of material */
    var hgd_thuong_hieu:        String = DomainConst.BLANK
    /** Type of working report */
    var hgd_type:               String = DomainConst.BLANK
    /** Phone */
    var phone:                  String = DomainConst.BLANK
    /** Long-Lat */
    var latitude_longitude:     String = DomainConst.BLANK
    /** List material */
    var list_hgd_invest:        [String] = [String]()
    /** Id of agent */
    var agent_id:               String = DomainConst.BLANK
    /** List material text */
    var list_hgd_invest_text:   String = DomainConst.BLANK
    /** Time use */
    var hgd_time_use:           String = DomainConst.BLANK
    /** Flag is can update info */
    var can_update:             String = DomainConst.BLANK
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init(jsonData: jsonData)
        self.hgd_type_id            = getString(json: jsonData, key: DomainConst.KEY_HGD_TYPE_ID)
        self.serial                 = getString(json: jsonData, key: DomainConst.KEY_SERIAL)
        self.province_id            = getString(json: jsonData, key: DomainConst.KEY_PROVINCE_ID)
        self.district_id            = getString(json: jsonData, key: DomainConst.KEY_DISTRICT_ID)
        self.ward_id                = getString(json: jsonData, key: DomainConst.KEY_WARD_ID)
        self.street_id              = getString(json: jsonData, key: DomainConst.KEY_STREET_ID)
        self.house_numbers          = getString(json: jsonData, key: DomainConst.KEY_HOUSE_NUMBER)
        self.address                = getString(json: jsonData, key: DomainConst.KEY_ADDRESS)
        self.customer_type          = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_TYPE)
        self.hgd_doi_thu            = getString(json: jsonData, key: DomainConst.KEY_HGD_DOI_THU)
        self.created_date           = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        self.created_by             = getString(json: jsonData, key: DomainConst.KEY_CREATED_BY)
        self.hgd_thuong_hieu        = getString(json: jsonData, key: DomainConst.KEY_CUSTOMER_FAMILY_BRAND)
        self.hgd_type               = getString(json: jsonData, key: DomainConst.KEY_HGD_TYPE)
        self.phone                  = getString(json: jsonData, key: DomainConst.KEY_PHONE)
        self.latitude_longitude     = getString(json: jsonData, key: DomainConst.KEY_LONG_LAT)
        self.list_hgd_invest        = getListString(json: jsonData, key: DomainConst.KEY_SERIAL)
        self.agent_id               = getString(json: jsonData, key: DomainConst.KEY_AGENT_ID)
        self.list_hgd_invest_text   = getString(json: jsonData, key: DomainConst.KEY_HGD_INVEST_TEXT)
        self.hgd_time_use           = getString(json: jsonData, key: DomainConst.KEY_HGD_TIME_USE)
        self.can_update             = getString(json: jsonData, key: DomainConst.KEY_CAN_UPDATE_FLAG)
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
}
