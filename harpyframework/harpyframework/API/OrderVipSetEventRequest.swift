//
//  OrderVipSetEventRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/21/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderVipSetEventRequest: BaseRequest {
    /**
     * Set data content
     * - parameter actionType:      Action type
     * - parameter lat:             Latitude
     * - parameter long:            Longitude
     * - parameter id:              Id of order
     * - parameter note:            Note of employee
     */
    func setData(actionType: Int, lat: String, long: String,
                 id: String, note: String, statusCancel: String,
                 orderDetail: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":%d,\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":[%@],\"%@\":%d}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_ACTION_TYPE,            actionType,
            DomainConst.KEY_LATITUDE,               lat,
            DomainConst.KEY_LONGITUDE,              long,
            DomainConst.KEY_APP_ORDER_ID,           id,
            DomainConst.KEY_NOTE_EMPLOYEE,          note,
            DomainConst.KEY_STATUS_CANCEL,          statusCancel,
            DomainConst.KEY_ORDER_DETAIL,           orderDetail,
            DomainConst.KEY_PLATFORM,               DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request transaction event
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter actionType:      Action type
     * - parameter lat:             Latitude
     * - parameter long:            Longitude
     * - parameter id:              Id of order
     * - parameter note:            Note of employee
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               actionType: Int, lat: String, long: String,
                               id: String, note: String, statusCancel: String = DomainConst.NUMBER_ZERO_VALUE,
                               orderDetail: String = DomainConst.BLANK) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = OrderVipSetEventRequest(url: DomainConst.PATH_ORDER_VIP_SET_EVENT,
                                                 reqMethod: DomainConst.HTTP_POST_REQUEST,
                                                 view: view)
        request.setData(actionType: actionType, lat: lat, long: long,
                        id: id, note: note, statusCancel: statusCancel,
                        orderDetail: orderDetail)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
