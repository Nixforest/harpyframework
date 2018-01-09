//
//  NewsRequest.swift
//  harpyframework
//
//  Created by SPJ on 11/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class NewsRequest: BaseRequest {
    /**
     * Set data content
     * - parameter id:    Id of news
     */
    func setData(id: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":%@}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_ID, id
        )
    }
    
    /**
     * Request news
     * - parameter action:  Action
     * - parameter view:    View controller
     * - parameter id:      Id of news
     */
    public static func request(action: Selector, view: BaseViewController,
                                       id: String) {
        let request = NewsRequest(url: DomainConst.PATH_SUPPORT_NEWS,
                                  reqMethod: DomainConst.HTTP_POST_REQUEST,
                                  view: view)
        request.setData(id: id)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
