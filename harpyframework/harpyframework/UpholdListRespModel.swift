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
    var total_record: Int = 0
    /** Total page */
    var total_page: Int = 0
    /** Record */
    var record: [UpholdBean] = [UpholdBean]()
    
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
                // Total record
                let totalRecord = getString(json: json, key: DomainConst.KEY_TOTAL_RECORD)
                if totalRecord != DomainConst.BLANK {
                    self.total_record = Int(totalRecord)!
                }
                // Total page
                self.total_page = getInt(json: json, key: DomainConst.KEY_TOTAL_PAGE)
                
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
     * Initializer
     */
    override init() {
        super.init()
    }
    
    /**
     * Get record value.
     * - returns: Record value
     */
    public func getRecord() -> [UpholdBean] {
        return self.record
    }
}
