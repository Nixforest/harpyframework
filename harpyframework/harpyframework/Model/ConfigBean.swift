//
//  ConfigBean.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
open class ConfigBean: NSObject {
    /** Id of item */
    public var id: String = ""
    /** Name of item */
    public var name: String = ""
    /** Data of item */
    public var data = [ConfigBean]()
    
    /**
     * Initializer
     * - parameter id: Id of item
     * - parameter name: Name of item
     */
    public init(id: String, name: String) {
        super.init()
        self.id = id
        self.name = name
    }
    
    /**
     * Initializer
     * - parameter id: Id of item
     * - parameter name: Name of item
     * - parameter data: List of data
     */
    public init(id: String, name: String, data: [ConfigBean]) {
        super.init()
        self.id = id
        self.name = name
        self.data = data
    }
    
    /**
     * Initializer
     * - parameter jsonString: Json string to parse
     */
    public init(jsonString: String) {
        super.init()
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                // Id
                if let idStr = json[DomainConst.KEY_ID] as? String {
                    self.id = idStr
                } else {
                    if let idInt = json[DomainConst.KEY_ID] as? Int {
                        self.id = String(idInt)
                    }
                }
                
                // Name
                if let nameStr = json[DomainConst.KEY_NAME] as? String  {
                    self.name = nameStr
                }
                
                // Data
                self.data.append(contentsOf: getListConfig(json: json, key: DomainConst.KEY_DATA))
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
    override public init() {
        super.init()
    }
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        if let nameStr = jsonData[DomainConst.KEY_NAME] as? String  {
            self.name = nameStr
        }
        
        self.data.append(contentsOf: getListConfig(json: jsonData, key: DomainConst.KEY_DATA))
    }
    
    //++ BUG0050-SPJ (NguyenPT 20170405) Add new function G06
    /**
     * Check if id of config bean is empty
     * - returns: Return true if id is empty, false otherwise
     */
    public func isEmpty() -> Bool {
        return self.id.isEmpty
    }
    //-- BUG0050-SPJ (NguyenPT 20170405) Add new function G06
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07
    /**
     * Check if object is not Material type
     * - returns: True if id containt DomainConst.ORDER_INFO_MATERIAL_ID, false otherwise
     */
    public func isNotMaterial() -> Bool {
        let prefix = self.id.substring(to: DomainConst.ORDER_INFO_MATERIAL_ID.characters.count)
        if prefix == DomainConst.ORDER_INFO_MATERIAL_ID {
            return true
        }
        return false
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07
}
