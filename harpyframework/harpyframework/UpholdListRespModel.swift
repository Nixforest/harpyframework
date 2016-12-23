//
//  UpholdListRespModel.swift
//  project
//
//  Created by Nixforest on 10/14/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UpholdListRespModel: BaseRespModel {
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
                
                if self.status != "1" {
                    return
                }
                // Total record
                let totalRecord = json[DomainConst.KEY_TOTAL_RECORD] as? String ?? ""
                if totalRecord != "" {
                    self.total_record = Int(totalRecord)!
                }
                // Total page
                self.total_page = json[DomainConst.KEY_TOTAL_PAGE] as? Int ?? 0
                
                // Record
                let recordList = json[DomainConst.KEY_RECORD] as? [[String: AnyObject]]
                for uphold in recordList! {
                    self.record.append(UpholdBean(jsonData: uphold))
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        } else {
            print("json is of wrong format")
        }
    }
    
    /**
     * Initializer
     */
    override init() {
        super.init()
    }
}
