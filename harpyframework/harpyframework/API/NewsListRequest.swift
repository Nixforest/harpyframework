//
//  NewListRequest.swift
//  harpyframework
//  P0090_GetNewsList_API
//  Created by SPJ on 1/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsListRequest: BaseRequest {
    /**
     * Set data content
     */
    func setData(page: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            DomainConst.KEY_PAGE,       page,
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request news list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter page:        Page index
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               page: String) {
        let request = NewsListRequest(url: DomainConst.PATH_LIST_NEWS,
                                       reqMethod: DomainConst.HTTP_POST_REQUEST,
                                       view: view)
        request.setData(page: page)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
