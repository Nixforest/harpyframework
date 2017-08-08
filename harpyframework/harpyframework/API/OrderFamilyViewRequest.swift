//
//  OrderFamilyViewRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/10/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderFamilyViewRequest: BaseRequest {
    /**
     * Set data content
     * - parameter id:        Id of order
     */
    func setData(id: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%d\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_TRANSACTION_HISTORY_ID, id,
            DomainConst.KEY_PLATFORM, DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request order list function
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter id:          Id of order
     */
    public static func request(action: Selector, view: BaseViewController,
                               id: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = OrderFamilyViewRequest(url: DomainConst.PATH_ORDER_TRANSACTION_VIEW,
                                             reqMethod: DomainConst.HTTP_POST_REQUEST,
                                             view: view)
        request.setData(id: id)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
