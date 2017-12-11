//
//  LoginRespModel.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

public class LoginRespModel : BaseRespModel {
    /** List menu */
    var menu:                               [ConfigBean]        = [ConfigBean]()
    /** List data uphold */
    var data_uphold:                        [ConfigBean]        = [ConfigBean]()
    /** Max upload */
    var max_upload:                         String              = DomainConst.BLANK
    /** List data issue */
    var data_issue:                         [ConfigBean]        = [ConfigBean]()
    /** Id of role */
    var role_id:                            String              = DomainConst.BLANK
    /** Id of user */
    var user_id:                            String              = DomainConst.BLANK
    /** List user info */
    var user_info:                          [ConfigBean]        = [ConfigBean]()
    /** List check menu */
    var check_menu:                         [ConfigBean]        = [ConfigBean]()
    /** Flag need change pass */
    var need_change_pass:                   String              = DomainConst.BLANK
    /** Flag need update app */
    var need_update_app:                    String              = DomainConst.BLANK
    /** Name of role */
    var role_name:                          String              = DomainConst.BLANK
    /** List streets */
    var list_street:                        [ConfigBean]        = [ConfigBean]()
    /** List agents */
    var list_agent:                         [ConfigBean]        = [ConfigBean]()
    /** List family type */
    var list_hgd_type:                      [ConfigBean]        = [ConfigBean]()
    /** List family type */
    var list_hgd_invest:                    [ConfigBean]        = [ConfigBean]()
    /** Call center uphold */
    var call_center_uphold:                 String              = DomainConst.BLANK
    /** Hotline */
    var hotline:                            String              = DomainConst.BLANK
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    /** Cylinder info */
    public var info_cylinder:               [MaterialBean]      = [MaterialBean]()
    /** Other material info */
    public var info_otherMaterial:          [MaterialBean]      = [MaterialBean]()
    /** List Cancel order reasons */
    var list_cancelOrderReasons:            [ConfigBean]        = [ConfigBean]()
    /** List types of order */
    var list_OrderTypes:                    [ConfigBean]        = [ConfigBean]()
    /** List types of order discount */
    var list_OrderDiscountTypes:            [ConfigBean]        = [ConfigBean]()
    /** List Cancel order reasons (VIP customer) */
    var list_cancelVIPOrderReasons:         [ConfigBean]        = [ConfigBean]()
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
    var info_materialGas:                   [MaterialBean]      = [MaterialBean]()
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /** Number of max favourite items */
    var limit_favorite:                     Int                 = 0
    /** List support types fo employee */
    var list_support_employee:              [ConfigBean]        = [ConfigBean]()
    //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    var customer_chain_store:               [ConfigBean]        = [ConfigBean]()
    //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    var gas24h_time_check_order:            Int                 = 5
    /** Invite code */
    var my_invite_code:                     String              = DomainConst.BLANK
    /** gas24h_menu_text */
    var gas24h_menu_text:                   String              = DomainConst.BLANK    
    
    /**
     * Initializer
     */
    override public init(jsonString: String) {
        // Call super initializer
        super.init(jsonString: jsonString)
        
        // Start parse
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                if self.status != DomainConst.RESPONSE_STATUS_SUCCESS {
                    return
                }
                // Menu
                self.menu.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_MENU))
                
                // Data uphold
                self.data_uphold.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_DATA_UPHOLD))
                
                // Max upload
                self.max_upload = getStringFromInt(json: json, key: DomainConst.KEY_MAX_UPLOAD)
                
                // Data issue
                self.data_issue.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_DATA_ISSUE))
                
                // Role id
                self.role_id = getString(json: json, key: DomainConst.KEY_ROLE_ID)
                
                // User id
                self.user_id = getString(json: json, key: DomainConst.KEY_USER_ID)
                
                // User information
                self.user_info.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_USER_INFO))
                
                // Check menu
                self.check_menu.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_CHECK_MENU))
                
                // Flag need change password
                self.need_change_pass = getString(json: json, key: DomainConst.KEY_NEED_CHANGE_PASS)
                
                // Flag need update application
                self.need_update_app = getStringFromInt(json: json, key: DomainConst.KEY_NEED_UPDATE_APP)
                
                // Role name
                self.role_name = getString(json: json, key: DomainConst.KEY_ROLE_NAME)
                
                // List streets
                self.list_street.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_LIST_STREET))
                
                // List agents
                self.list_agent.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_LIST_AGENT))
                
                // List agentd family
                self.list_hgd_type.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_LIST_HGD_TYPE))
                
                // List agentd family invest
                self.list_hgd_invest.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_LIST_HGD_INVEST))
                
                // Call center
                self.call_center_uphold = getString(json: json, key: DomainConst.KEY_CALL_CENTER_UPHOLD)
                self.hotline = getString(json: json, key: DomainConst.KEY_HOTLINE)
                //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
                // List cylinder
                if let data = json[DomainConst.KEY_MATERIAL_VO] as? [[String: AnyObject]] {
                    for item in data {
                        self.info_cylinder.append(MaterialBean(jsonData: item))
                    }
                }
                // List other material
                if let data = json[DomainConst.KEY_MATERIAL_HGD] as? [[String: AnyObject]] {
                    for item in data {
                        self.info_otherMaterial.append(MaterialBean(jsonData: item))
                    }
                }
                // List cancel order reasons
                self.list_cancelOrderReasons.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_ORDER_STATUS_CANCEL))
                // List types of order
                self.list_OrderTypes.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_ORDER_LIST_TYPE))
                // List types of order discount
                self.list_OrderDiscountTypes.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_ORDER_LIST_DISCOUNT_TYPE))
                // List Cancel order reasons (VIP customer)
                self.list_cancelVIPOrderReasons.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_STORECARD_STATUS_CANCEL))
                //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
                //++ BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
                // List material gas
                if let data = json[DomainConst.KEY_MATERIAL_GAS] as? [[String: AnyObject]] {
                    for item in data {
                        self.info_materialGas.append(MaterialBean(jsonData: item))
                    }
                }
                //-- BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
                
                //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
                self.limit_favorite = getInt(json: json, key: DomainConst.KEY_LIMIT_FAVORITE)
                /** List support types fo employee */
                self.list_support_employee.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_LIST_SUPPORT_EMPLOYEE))
                //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
                
                //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
                self.customer_chain_store = getListConfig(json: json, key: DomainConst.KEY_CUSTOMER_CHAIN_STORE)
                //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
                
                self.gas24h_time_check_order = getInt(json: json, key: DomainConst.KEY_GAS24H_TIME_INTERVAL)
                self.my_invite_code = getString(json: json, key: DomainConst.KEY_MY_INVITE_CODE)
                self.gas24h_menu_text = getString(json: json, key: DomainConst.KEY_GAS24H_MENU_TEXT)
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
}
