//
//  OrderFamilyConfirmRequest.swift
//  project
//
//  Created by SPJ on 4/19/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

public class OrderFamilyConfirmRequest: TransactionSetEventRequest {
    /**
     * Request confirm order
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     * - parameter id:          Id of order
     */
    public static func requestConfirm(action: Selector,
                                      view: BaseViewController,
                                      lat: String, long: String,
                                      id: String) {
        TransactionSetEventRequest.request(action: action, view: view,
                                           actionType: ActionTypeEnum.EMPLOYEE_NHAN_GIAO_HANG.rawValue,
                                           lat: lat, long: long,
                                           changeType: "0",
                                           statusCancel: "0",
                                           id: id,
                                           orderType: "0",
                                           discountType: "0",
                                           amountDiscount: "0",
                                           typeAmount: "0",
                                           orderDetail: "")
    }
    /**
     * Request cancel
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     * - parameter id:          Id of order
     */
    public static func requestCancel(action: Selector,
                                      view: BaseViewController,
                                      lat: String, long: String,
                                      id: String) {
        TransactionSetEventRequest.request(action: action, view: view,
                                           actionType: ActionTypeEnum.EMPLOYEE_HUY_GIAO_HANG.rawValue,
                                           lat: lat, long: long,
                                           changeType: "0",
                                           statusCancel: "0",
                                           id: id,
                                           orderType: "0",
                                           discountType: "0",
                                           amountDiscount: "0",
                                           typeAmount: "0",
                                           orderDetail: "")
    }
}
