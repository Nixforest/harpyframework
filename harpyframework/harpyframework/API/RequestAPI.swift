//
//  RequestAPI.swift
//  harpyframework
//
//  Created by SPJ on 12/23/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
public class RequestAPI {
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//    /**
//     * Request login.
//     * - parameter username: Username
//     * - parameter password: Password
//     * - parameter view: View controller
//     */
//    public static func requestLogin(username: String, password: String, view: BaseViewController) {
        //let start = DispatchTime.now()
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = LoginRequest(url: DomainConst.PATH_SITE_LOGIN,
//                                   reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData(username: username, password: password)
//        request.execute()
        //let end = DispatchTime.now()
        //let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds;
        //let timeInterval = nanoTime / 1000000
        //print("Start request -> Start excute: \(timeInterval) miliseconds")
//    }
    
//    /**
//     * Request logout
//     * - parameter view: View controller
//     */
//    public static func requestLogout(view: BaseViewController) {
//        LoadingView.shared.showOverlay(view: view.view)
//        let logoutReq = LogoutRequest(url: DomainConst.PATH_SITE_LOGOUT,
//                                      reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        logoutReq.setData()
//        logoutReq.execute()
//    }
    
//    /**
//     * Request logout
//     * - parameter view: UIView
//     */
//    public static func requestLogout(view: UIView) {
//        LoadingView.shared.showOverlay(view: view)
//        let logoutReq = LogoutRequest(url: DomainConst.PATH_SITE_LOGOUT,
//                                      reqMethod: DomainConst.HTTP_POST_REQUEST)
//        logoutReq.setData()
//        logoutReq.execute()
//    }
    
//    /**
//     * Request user information
//     * - parameter action:  Handler when finish execute task
//     * - parameter view:    View controller
//     */
//    public static func requestUserProfile(action: Selector, view: BaseViewController) {
//        LoadingView.shared.showOverlay(view: view.view)
//        let userProfileReq = UserProfileRequest(url: DomainConst.PATH_USER_PROFILE,
//                                                reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        userProfileReq.setData(token: BaseModel.shared.getUserToken())
//        NotificationCenter.default.addObserver(view, selector: action, name:NSNotification.Name(rawValue: userProfileReq.theClassName), object: nil)
//        userProfileReq.execute()
//    }
//    public static func requestUserProfile(view: BaseViewController) {
//        LoadingView.shared.showOverlay(view: view.view)
//        let userProfileReq = UserProfileRequest(url: DomainConst.PATH_USER_PROFILE,
//                                                reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        userProfileReq.setData(token: BaseModel.shared.getUserToken())
//        userProfileReq.execute()
//    }
    
//    /**
//     * Request change password.
//     * - parameter oldPass: Old password
//     * - parameter newPass: New password
//     * - parameter view:    View controller
//     */
//    public static func requestChangePassword(oldPass: String, newPass: String, view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = ChangePassRequest(url: DomainConst.PATH_USER_CHANGE_PASS,
//                                        reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData(oldPass: oldPass, newPass: newPass)
//        request.execute()
//    }
    
//    /**
//     * Request uphold list
//     * - parameter page:        Page index
//     * - parameter type:        Type uphold (Problem/Periodically)
//     * - parameter customerId:  Id of customer
//     * - parameter status:      Status of item
//     * - parameter view:        View controller
//     */
//    public static func requestUpholdList(page: Int, type: Int, customerId: String, status: String, view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = UpholdListRequest(url: DomainConst.PATH_SITE_UPHOLD_LIST, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        
//        request.setData(page: page, type: type, customerId: customerId, status: status)
//        request.execute()
//    }
    
//    /**
//     * Request search customer
//     * - parameter keyword: Keyword
//     * - parameter view:    View controller
//     */
//    public static func requestSearchCustomer(keyword: String, view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = SearchCustomerRequest(url: DomainConst.PATH_SITE_AUTOCOMPLETE_USER, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        
//        request.setData(keyword: keyword)
//        request.execute()
//    }
    
//    /**
//     * Request uphold detail data
//     * - parameter upholdId:    Id of uphold
//     * - parameter replyId:     Id of reply
//     * - parameter view:        View controller
//     */
//    public static func requestUpholdDetail(upholdId: String, replyId: String,
//                                    view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = UpholdDetailRequest(url: DomainConst.PATH_SITE_UPHOLD_VIEW, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData(upholdId: upholdId, replyId: replyId)
//        request.execute()
//    }
    
//    /**
//     * Request uphold configuration
//     * - parameter view: View controller
//     */
//    public static func requestUpdateConfiguration(view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = UpdateConfigurationRequest(url: DomainConst.PATH_SITE_UPDATE_CONFIG, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData()
//        request.execute()
//    }
    
//    /**
//     * Request count of notification
//     * - parameter view: View controller
//     */
//    public static func requestNotificationCount(view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = NotificationCountRequest(url: DomainConst.PATH_SITE_NOTIFY_COUNT, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData()
//        request.execute()
//    }
    
//    /**
//     * Request create register
//     * - parameter name:    Name
//     * - parameter phone:   Phone
//     * - parameter view:    View controller
//     */
//    public static func requestRegister(name: String,
//                                phone: String,
//                                view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = RegisterRequest(url: DomainConst.PATH_CUSTOMER_REGISTER, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData(name: name,
//                        phone: phone)
//        request.execute()
//    }
    
//    /**
//     * Request confirm register
//     * - parameter code:    Confirm code
//     * - parameter view:    View controller
//     */
//    public static func requestRegisterConfirm(code: String,
//                                       view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
//        let request = RegisterConfirmRequest(url: DomainConst.PATH_CUSTOMER_REGISTER_CONFIRM, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
//        request.setData(code: code)
//        request.execute()        
//    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
