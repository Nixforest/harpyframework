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
    var menu: [ConfigBean] = [ConfigBean]()
    /** List data uphold */
    var data_uphold: [ConfigBean] = [ConfigBean]()
    /** Max upload */
    var max_upload: String = ""
    /** List data issue */
    var data_issue: [ConfigBean] = [ConfigBean]()
    /** Id of role */
    var role_id: String = ""
    /** Id of user */
    var user_id: String = ""
    /** List user info */
    var user_info: [ConfigBean] = [ConfigBean]()
    /** List check menu */
    var check_menu: [ConfigBean] = [ConfigBean]()
    /** Flag need change pass */
    var need_change_pass: String = ""
    /** Flag need update app */
    var need_update_app: String = ""
    /** Name of role */
    var role_name: String = ""
    /** List streets */
    var list_street: [ConfigBean] = [ConfigBean]()
    /** List agents */
    var list_agent: [ConfigBean] = [ConfigBean]()
    /** List family type */
    var list_hgd_type: [ConfigBean] = [ConfigBean]()
    /** List family type */
    var list_hgd_invest: [ConfigBean] = [ConfigBean]()
    /** Call center uphold */
    var call_center_uphold: String = DomainConst.BLANK
    /** Hotline */
    var hotline: String = DomainConst.BLANK
    
    /**
     * Initializer
     */
    override init(jsonString: String) {
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
                
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
}
