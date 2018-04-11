//
//  NewsListBean.swift
//  harpyframework
//
//  Created by SPJ on 1/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsListBean: ConfigBean {
    /** Type */
    public var type:               Int = 0
    /** Code number */
    public var code_no:            String = DomainConst.BLANK
    /** Code number text */
    public var code_no_text:       String = DomainConst.BLANK
    /** Title */
    public var title:              String = DomainConst.BLANK
    /** Url */
    public var link_web:           String = DomainConst.BLANK
    /** Url text */
    public var link_web_text:      String = DomainConst.BLANK
    /** Banner image */
    public var url_banner_popup:   String = DomainConst.BLANK
    /** Banner image */
    public var url_banner:         String = DomainConst.BLANK
    //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
    /** List title */
    public var list_title:         String = DomainConst.BLANK
    /** Created date */
    public var created_date:       String = DomainConst.BLANK
    //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
    
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
        if let nameStr = jsonData[DomainConst.KEY_NEWS_CONTENT] as? String  {
            self.name = nameStr
        }
        self.type               = getInt(json: jsonData, key: DomainConst.KEY_NEWS_TYPE)
        self.code_no            = getString(json: jsonData, key: DomainConst.KEY_CODE_NO)
        self.code_no_text       = getString(json: jsonData, key: DomainConst.KEY_CODE_NO_TEXT)
        self.title              = getString(json: jsonData, key: DomainConst.KEY_TITLE)
        self.link_web           = getString(json: jsonData, key: DomainConst.KEY_URL_WEB)
        self.link_web_text      = getString(json: jsonData, key: DomainConst.KEY_URL_TEXT)
        self.url_banner_popup   = getString(json: jsonData, key: DomainConst.KEY_URL_BANNER_POPUP)
        self.url_banner         = getString(json: jsonData, key: DomainConst.KEY_URL_BANNER)
        //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
        self.list_title         = getString(json: jsonData, key: DomainConst.KEY_LIST_TITLE)
        self.created_date       = getString(json: jsonData, key: DomainConst.KEY_CREATED_DATE)
        //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
    }
    
    public override init() {
        super.init()
    }
}
