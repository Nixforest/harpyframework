//
//  UpholdListRespModel.swift
//  project
//
//  Created by Nixforest on 10/14/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UpholdListRespModel: BaseRespModel {
    /** Total record */
    public var total_record: Int = 0
    /** Total page */
    public var total_page: Int = 0
    /** Record */
    var record: [UpholdBean] = [UpholdBean]()
    
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
    
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
                // Total record
                //++ BUG0070-SPJ (NguyenPT 20170426) Handle convert String -> Int
//                let totalRecord = getString(json: json, key: DomainConst.KEY_TOTAL_RECORD)
//                if totalRecord != DomainConst.BLANK {
//                    self.total_record = Int(totalRecord)!
//                }                
                self.total_record = getIntFromString(json: json, key: DomainConst.KEY_TOTAL_RECORD)
                // Total page
//                self.total_page = getInt(json: json, key: DomainConst.KEY_TOTAL_PAGE)
                self.total_page = getInt(json: json, key: DomainConst.KEY_TOTAL_PAGE)
                //-- BUG0070-SPJ (NguyenPT 20170426) Handle convert String -> Int
                
                // Record
                self.record.append(contentsOf: getListUphold(json: json, key: DomainConst.KEY_RECORD))
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
    
    /**
     * Get record value.
     * - returns: Record value
     */
    public func getRecord() -> [UpholdBean] {
        return self.record
    }
    
    /**
     * Get total page.
     * - returns: Total page value
     */
    public func getTotalPage() -> Int {
        return self.total_page
    }
    
    /**
     * Get total record.
     * - returns: Total record value
     */
    public func getTotalRecord() -> Int {
        return self.total_record
    }
    
    /**
     * Update status by id
     * - parameter id: Id of uphold item
     * - parameter status: Status of uphold item
     */
    public func updateStatus(id: String, status: String) {
        for item in self.record {
            if item.id == id {
                item.status = status
            }
        }
    }
    
    /**
     * Append list of record
     * - parameter contentOf: List of record
     */
    public func append(contentOf: [UpholdBean]) {
        self.record.append(contentsOf: contentOf)
    }
    
    /**
     * Remove all data
     */
    public func clearData() {
        self.record.removeAll()
        self.total_page = 0
        self.total_record = 0
    }
}
