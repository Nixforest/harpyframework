//
//  CacheDataRequest.swift
//  harpyframework
//
//  Created by SPJ on 5/7/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CacheDataRequest: BaseRequest {
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_PLATFORM,               DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request transaction event
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     */
    public static func request(action: Selector,
                               view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = CacheDataRequest(url: DomainConst.PATH_SITE_CACHE_DATA,
                                              reqMethod: DomainConst.HTTP_POST_REQUEST,
                                              view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    
    /**
     * Request transaction event
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     */
    public static func requestCashBook(action: Selector,
                               view: UIView) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view)
        let request = CacheDataRequest(url: DomainConst.PATH_SITE_CACHE_DATA,
                                       reqMethod: DomainConst.HTTP_POST_REQUEST)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
