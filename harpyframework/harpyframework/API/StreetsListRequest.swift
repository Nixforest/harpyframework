//
//  StreetsListRequest.swift
//  harpyframework
//
//  Created by SPJ on 2/7/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class StreetsListRequest: BaseRequest {
    /**
     * Set data content
     * - parameter id:    Id of city
     * - parameter page:  Page index
     */
    func setData(id: String, page: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            DomainConst.KEY_ID,         id,
            DomainConst.KEY_PAGE,       page,
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request news
     * - parameter action:  Action
     * - parameter view:    View controller
     * - parameter id:      Id of city
     * - parameter page:    Page index
     */
    public static func request(action: Selector, view: BaseViewController,
                               id: String, page: String = "-1") {
        let request = StreetsListRequest(url: DomainConst.PATH_LIST_STREETS,
                                  reqMethod: DomainConst.HTTP_POST_REQUEST,
                                  view: view)
        request.setData(id: id, page: page)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
