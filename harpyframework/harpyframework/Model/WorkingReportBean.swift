//
//  WorkingReportListBean.swift
//  harpyframework
//
//  Created by SPJ on 3/26/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class WorkingReportBean: ConfigBean {
    /** Code no */
    private var code_no:        String = DomainConst.BLANK
    /** Content */
    private var content:        String = DomainConst.BLANK
    /** Created date */
    private var created_date:   String = DomainConst.BLANK
    /** List images */
    public var images:          [UpholdImageInfoItem] = [UpholdImageInfoItem]()
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    override public init(jsonData: [String: AnyObject]) {
        super.init()
        if let idStr = jsonData[DomainConst.KEY_ID] as? String {
            self.id = idStr
        } else {
            if let idInt = jsonData[DomainConst.KEY_ID] as? Int {
                self.id = String(idInt)
            }
        }
        if let nameStr = jsonData[DomainConst.KEY_FULL_NAME] as? String  {
            self.name = nameStr
        }
        code_no      = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        content      = getString(json: jsonData, key: DomainConst.KEY_CONTENT)
        created_date = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        if let dataArr = jsonData[DomainConst.KEY_IMAGES] as? [[String: AnyObject]] {
            for listItem in dataArr {
                self.images.append(UpholdImageInfoItem(jsonData: listItem))
            }
        }
    }
    /**
     * Default constructor
     */
    override public init() {
        super.init()
    }
    /**
     * Get created date
     * - returns: Created date
     */
    public func getCreatedDate() -> String {
        return self.created_date
    }
    
    /**
     * Get report content
     * - returns: Report content
     */
    public func getReportContent() -> String {
        return self.content
    }
    
    /**
     * Get code no
     * - returns: Code no
     */
    public func getCode() -> String {
        return self.code_no
    }
}
