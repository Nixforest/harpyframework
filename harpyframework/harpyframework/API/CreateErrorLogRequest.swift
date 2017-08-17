//
//  CreateErrorLogRequest.swift
//  harpyframework
//  P0076_CreateErrorLog_API
//  Created by SPJ on 8/17/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CreateErrorLogRequest: BaseRequest {
    /**
     * Set data content
     * - parameter msg: Message content
     */
    func setData(msg: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            DomainConst.KEY_MESSAGE,    msg,
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request transaction event
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter msg:         Message content
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               msg: String) {
        let request = CreateErrorLogRequest(url: DomainConst.PATH_SUPPORT_APPLOG,
                                       reqMethod: DomainConst.HTTP_POST_REQUEST,
                                       view: view)
        request.setData(msg: msg)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute(isShowLoadingView: false)
    }
}
