//
//  TransactionSetEventRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/18/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class TransactionSetEventRequest: BaseRequest {
    /**
     * Set data content
     * - parameter actionType:      Buying type
     * - parameter lat:             From date value
     * - parameter long:            To date value
     * - parameter changeType:      Page index
     * - parameter statusCancel:    Buying type
     * - parameter id:              From date value
     * - parameter orderType:       To date value
     * - parameter discountType:    Page index
     * - parameter amountDiscount:  Buying type
     * - parameter typeAmount:      From date value
     * - parameter orderDetail:     To date value
     */
    func setData(actionType: String, lat: String, long: String,
                 changeType: String, statusCancel: String,
                 id: String, orderType: String, discountType: String,
                 amountDiscount: String, typeAmount: String,
                 orderDetail: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":[%@],\"%@\":\"%d\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_ACTION_TYPE,            actionType,
            DomainConst.KEY_LATITUDE,               lat,
            DomainConst.KEY_LONGITUDE,              long,
            DomainConst.KEY_CHANGE_TYPE,            changeType,
            DomainConst.KEY_STATUS_CANCEL,          statusCancel,
            DomainConst.KEY_TRANSACTION_HISTORY_ID, id,
            DomainConst.KEY_ORDER_TYPE,             orderType,
            DomainConst.KEY_DISCOUNT_TYPE,          discountType,
            DomainConst.KEY_AMOUNT_DISCOUNT,        amountDiscount,
            DomainConst.KEY_TYPE_AMOUNT,            typeAmount,
            DomainConst.KEY_ORDER_DETAIL,           orderDetail,
            DomainConst.KEY_PLATFORM, DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request transaction event
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter actionType:      Buying type
     * - parameter lat:             From date value
     * - parameter long:            To date value
     * - parameter changeType:      Page index
     * - parameter statusCancel:    Buying type
     * - parameter id:              From date value
     * - parameter orderType:       To date value
     * - parameter discountType:    Page index
     * - parameter amountDiscount:  Buying type
     * - parameter typeAmount:      From date value
     * - parameter orderDetail:     To date value
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               actionType: String, lat: String, long: String,
                               changeType: String, statusCancel: String,
                               id: String, orderType: String, discountType: String,
                               amountDiscount: String, typeAmount: String,
                               orderDetail: String) {
        // Show overlay
        LoadingView.shared.showOverlay(view: view.view)
        let request = TransactionSetEventRequest(url: DomainConst.PATH_ORDER_TRANSACTION_SET_EVENT,
                                                reqMethod: DomainConst.HTTP_POST_REQUEST,
                                                view: view)
        request.setData(actionType: actionType, lat: lat, long: long,
                        changeType: changeType, statusCancel: statusCancel,
                        id: id, orderType: orderType, discountType: discountType,
                        amountDiscount: amountDiscount, typeAmount: typeAmount,
                        orderDetail: orderDetail)
        NotificationCenter.default.addObserver(view, selector: action, name:NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
