//
//  ConfigBean.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class ConfigBean: NSObject {
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
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    init(jsonData: [String: AnyObject]) {
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
}
