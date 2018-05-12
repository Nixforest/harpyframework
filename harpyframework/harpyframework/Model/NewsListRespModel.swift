//
//  NewsListRespModel.swift
//  harpyframework
//
//  Created by SPJ on 1/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsListRespModel: BaseRespModel {
    /** Total record */
    public var total_record: Int = 0
    /** Total page */
    public var total_page: Int = 0
    /** Record */
    var record: [NewsListBean] = [NewsListBean]()
    
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
                self.total_record = getIntFromString(json: json, key: DomainConst.KEY_TOTAL_RECORD)
                // Total page
                self.total_page = getInt(json: json, key: DomainConst.KEY_TOTAL_PAGE)
                
                // Record
                let recordList = json[DomainConst.KEY_RECORD] as? [[String: AnyObject]]
                for news in recordList! {
                    self.record.append(NewsListBean(jsonData: news))
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
    public func getRecord() -> [NewsListBean] {
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
     * Remove all data
     */
    public func clearData() {
        self.record.removeAll()
        self.total_page     = 0
        self.total_record   = 0
    }
    
    /**
     * Update data
     * - parameter bean: TreatmentListBean
     */
    public func updateData(bean: NewsListRespModel) {
        self.record.append(contentsOf: bean.getRecord())
        self.total_page = bean.getTotalPage()
        self.total_record = bean.getTotalRecord()
    }
}
