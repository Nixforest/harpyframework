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
     * - parameter page:    Page index
     */
    func setData(page: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_PAGE, page
        )
    }
    
    /**
     * Request order list function
     * - parameter page:    Page index
     */
    public static func request(action: Selector, view: BaseViewController, page: String) {
        // Show overlay
        LoadingView.shared.showOverlay(view: view.view)
        let request = OrderFamilyListRequest(url: DomainConst.PATH_ORDER_TRANSACTION_LIST,
                                       reqMethod: DomainConst.HTTP_POST_REQUEST,
                                       view: view)
        request.setData(page: page)
        NotificationCenter.default.addObserver(view, selector: action, name:NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
