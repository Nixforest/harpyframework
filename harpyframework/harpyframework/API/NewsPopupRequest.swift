//
//  NewsPopupRequest.swift
//  harpyframework
//  P0091_GetNewsPopup_API
//  Created by SPJ on 1/31/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsPopupRequest: BaseRequest {
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request news list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     */
    public static func request(action: Selector,
                               view: BaseViewController) {
        let request = NewsPopupRequest(url: DomainConst.PATH_NEWS_POPUP,
                                      reqMethod: DomainConst.HTTP_POST_REQUEST,
                                      view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
