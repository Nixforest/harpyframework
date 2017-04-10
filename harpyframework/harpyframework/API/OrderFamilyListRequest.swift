//
//  OrderCustomerFamilyListRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/7/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderFamilyListRequest: BaseRequest {
    /**
     * Set data content
     * - parameter page:        Page index
     * - parameter status:      Status of request
     */
    func setData(page: String, status: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%d\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_PAGE, page,
            DomainConst.KEY_STATUS, status,
            DomainConst.KEY_PLATFORM, DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request order list function
     * - parameter page:    Page index
     * - parameter status:      Status of request
     */
    public static func request(action: Selector, view: BaseViewController,
                               page: String, status: String) {
        // Show overlay
        LoadingView.shared.showOverlay(view: view.view)
        let request = OrderFamilyListRequest(url: DomainConst.PATH_ORDER_TRANSACTION_LIST,
                                       reqMethod: DomainConst.HTTP_POST_REQUEST,
                                       view: view)
        request.setData(page: page, status: status)
        NotificationCenter.default.addObserver(view, selector: action, name:NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
