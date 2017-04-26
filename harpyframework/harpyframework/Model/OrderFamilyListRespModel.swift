//
//  OrderFamilyListRespModel.swift
//  project
//
//  Created by SPJ on 12/28/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

public class OrderFamilyListRespModel: BaseRespModel {
    /** Total record */
    public var total_record: Int = 0
    /** Total page */
    public var total_page: Int = 0
    /** Record */
    var record: [OrderListBean] = [OrderListBean]()
    
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
//                let totalRecord = json[DomainConst.KEY_TOTAL_RECORD] as? String ?? ""
//                if totalRecord != "" {
//                    self.total_record = Int(totalRecord)!
//                }
                self.total_record = getIntFromString(json: json, key: DomainConst.KEY_TOTAL_RECORD)
                // Total page
//                self.total_page = json[DomainConst.KEY_TOTAL_PAGE] as? Int ?? 0
                self.total_page = getInt(json: json, key: DomainConst.KEY_TOTAL_PAGE)
                //-- BUG0070-SPJ (NguyenPT 20170426) Handle convert String -> Int
                
                // Record
                let recordList = json[DomainConst.KEY_RECORD] as? [[String: AnyObject]]
                for uphold in recordList! {
                    self.record.append(OrderListBean(jsonData: uphold))
                }
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
    public func getRecord() -> [OrderListBean] {
        return self.record
    }
    
    /**
     * Append list of record
     * - parameter contentOf: List of record
     */
    public func append(contentOf: [OrderListBean]) {
        self.record.append(contentsOf: contentOf)
    }
    
    /**
     * Remove all data
     */
    public func clearData() {
        self.record.removeAll()
        self.total_page     = 0
        self.total_record   = 0
    }
}
