//
//  OrderFamilyHandleRequest.swift
//  project
//
//  Created by SPJ on 4/19/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

public class OrderFamilyHandleRequest: TransactionSetEventRequest {
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
                                           support_id: "0",
                                           orderDetail: DomainConst.BLANK,
                                           //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                           ccsCode: DomainConst.BLANK)
                                           //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
    }
    /**
     * Request cancel
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     * - parameter id:          Id of order
     */
    public static func requestCancelConfirm(action: Selector,
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
                                           support_id: "0",
                                           orderDetail: DomainConst.BLANK,
                                           //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                           ccsCode: DomainConst.BLANK)
                                           //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
    }
    
    /**
     * Request update
     * - parameter action:          Action execute when finish this task
     * - parameter view:            Current view
     * - parameter lat:             Latitude
     * - parameter long:            Longitude
     * - parameter id:              Id of order
     * - parameter orderType:       Type of order
     * - parameter discountType:    Type of discount
     * - parameter orderDetail:     Detail of order
     * - parameter ccsCode:         CCS code
     */
    public static func requestUpdate(action: Selector,
                                     view: BaseViewController,
                                     lat: String, long: String,
                                     id: String,
                                     statusCancel: String,
                                     orderType: String,
                                     discountType: String,
                                     amountDiscount: String,
                                     typeAmount: String,
                                     support_id: String,
                                     orderDetail: String,
                                     //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                     ccsCode: String) {
                                     //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
        TransactionSetEventRequest.request(action: action, view: view,
                                           actionType: ActionTypeEnum.EMPLOYEE_CHANGE.rawValue,
                                           lat: lat, long: long,
                                           changeType: "0",
                                           statusCancel: statusCancel,
                                           id: id,
                                           orderType: orderType,
                                           discountType: discountType,
                                           amountDiscount: amountDiscount,
                                           typeAmount: typeAmount,
                                           support_id: support_id,
                                           orderDetail: orderDetail,
                                           //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                           ccsCode: ccsCode)
                                           //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
    }
    
    /**
     * Request complete
     * - parameter action:          Action execute when finish this task
     * - parameter view:            Current view
     * - parameter lat:             Latitude
     * - parameter long:            Longitude
     * - parameter id:              Id of order
     * - parameter orderType:       Type of order
     * - parameter discountType:    Type of discount
     * - parameter orderDetail:     Detail of order
     * - parameter ccsCode:         CCS code
     */
    public static func requestComplete(action: Selector,
                                       view: BaseViewController,
                                       lat: String, long: String,
                                       id: String,
                                       statusCancel: String,
                                       orderType: String,
                                       discountType: String,
                                       amountDiscount: String,
                                       typeAmount: String,
                                       support_id: String,
                                       orderDetail: String,
                                       //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                       ccsCode: String) {
                                       //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
        TransactionSetEventRequest.request(action: action, view: view,
                                           actionType: ActionTypeEnum.EMPLOYEE_COMPLETE.rawValue,
                                           lat: lat, long: long,
                                           changeType: "0",
                                           statusCancel: statusCancel,
                                           id: id,
                                           orderType: orderType,
                                           discountType: discountType,
                                           amountDiscount: amountDiscount,
                                           typeAmount: typeAmount,
                                           support_id: support_id,
                                           orderDetail: orderDetail,
                                           //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                           ccsCode: ccsCode)
                                           //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
    }
    
    /**
     * Request cancel
     * - parameter action:          Action execute when finish this task
     * - parameter view:            Current view
     * - parameter lat:             Latitude
     * - parameter long:            Longitude
     * - parameter id:              Id of order
     * - parameter orderType:       Type of order
     * - parameter discountType:    Type of discount
     * - parameter orderDetail:     Detail of order
     */
    public static func requestCancelOrder(action: Selector,
                                       view: BaseViewController,
                                       lat: String, long: String,
                                       id: String,
                                       statusCancel: String) {
        TransactionSetEventRequest.request(action: action, view: view,
                                           actionType: ActionTypeEnum.EMPLOYEE_DROP.rawValue,
                                           lat: lat, long: long,
                                           changeType: "0",
                                           statusCancel: statusCancel,
                                           id: id,
                                           orderType: "0",
                                           discountType: "0",
                                           amountDiscount: "0",
                                           typeAmount: "0",
                                           support_id: "0",
                                           orderDetail: DomainConst.BLANK,
                                           //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
                                           ccsCode: DomainConst.BLANK)
                                           //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
    }
}
