//
//  ListBean.swift
//  harpyframework
//
//  Created by SPJ on 2/2/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

open class ListBean: NSObject {
    // MARK: Properties
    /** Number of record */
    var total_record:           Int          = 0
    /** Number of page */
    var total_page:             Int          = 0    
    
    public override init() {
        super.init()
    }
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        // Number of record
        self.total_record = getIntFromString(json: jsonData, key: DomainConst.KEY_TOTAL_RECORD)
        // Number of record
        self.total_page = getInt(json: jsonData, key: DomainConst.KEY_TOTAL_PAGE)
    }
    
    /**
     * Set total value
     * - parameter record: Number of record
     * - parameter page:   Number of page
     */
    public func setTotal(record: Int, page: Int) {
        self.total_record = record
        self.total_page = page
    }
    
    /**
     * Get total record
     * - returns: Number of record
     */
    public func getTotalRecord() -> Int {
        return self.total_record
    }
    
    /**
     * Get total page
     * - returns: Number of page
     */
    public func getTotalPage() -> Int {
        return self.total_page
    }
}
