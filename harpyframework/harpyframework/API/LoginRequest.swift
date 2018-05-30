//
//  LoginRequest.swift
//  project
//
//  Created by Nixforest on 9/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
//import UIKit

public class LoginRequest: BaseRequest {
    //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
//        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
//            (
//            data, response, error) in
//            // Check error
//            guard error == nil else {
//                self.showAlert(message: DomainConst.CONTENT00196)
//                return
//            }
//            guard let data = data else {
//                self.showAlert(message: DomainConst.CONTENT00196)
//                return
//            }
//            // Convert to string
//            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            print(dataString ?? "")
//            // Convert to object
//            let model: LoginRespModel = LoginRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                // Handle login is success
//                BaseModel.shared.loginSuccess(model.token)
//                BaseModel.shared.saveTempData(loginModel: model)
//            } else {
//                self.showAlert(message: model.message)
//                return
//            }
//            // Hide overlay
//            LoadingView.shared.hideOverlayView()
//            // Back to home page (cross-thread)
//            DispatchQueue.main.async {
//                //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//                //_ = self.view.popToRootView()
//                NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//            }
//        })
//        return task
//    }
//    
//    /**
//     * Initializer
//     * - parameter url: URL
//     * - parameter reqMethod: Request method
//     * - parameter view: Root view
//     */
//    override init(url: String, reqMethod: String, view: BaseViewController) {
//        super.init(url: url, reqMethod: reqMethod, view: view)
//    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
    /**
     * Set data content
     * - parameter username: Username
     * - parameter password: Password
     */
    func setData(username: String, password: String, token: String) {
        //++ BUG0198-SPJ (NguyenPT 20180530) Get device information
        var identifierForVendor = DomainConst.BLANK
        if let identify = UIDevice.current.identifierForVendor {
            identifierForVendor = identify.description
        }
        //-- BUG0198-SPJ (NguyenPT 20180530) Get device information
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%@,\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_USERNAME, username,
            DomainConst.KEY_PASSWORD, password,
            DomainConst.KEY_GCM_DEVICE_TOKEN, DomainConst.BLANK,
            DomainConst.KEY_APNS_DEVICE_TOKEN,
                    BaseModel.shared.checkDeviceTokenExist() ? BaseModel.shared.getDeviceToken() : "A7CA1E1F8434EE8D5E62264B22D29D64B7A3AC04E03899E6926503643FD07EC6",
            DomainConst.KEY_TYPE, "3",
            //++ BUG0156-SPJ (NguyenPT 20171005) Re-design Gas 24h
            DomainConst.KEY_OTP_CODE, password,
            //-- BUG0156-SPJ (NguyenPT 20171005) Re-design Gas 24h
            DomainConst.KEY_FLAG_GAS_24H, BaseModel.shared.getAppType(),
            DomainConst.KEY_TOKEN, token,
            //++ BUG0198-SPJ (NguyenPT 20180530) Get device information
            DomainConst.KEY_DEVICE_NAME, UIDevice.current.model,
            DomainConst.KEY_DEVICE_IMEI, identifierForVendor,
            DomainConst.KEY_DEVICE_OS_VERSION, "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)",
            //-- BUG0198-SPJ (NguyenPT 20180530) Get device information
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request login
     * - parameter action:      Action when request complete
     * - parameter view:        Current screen
     * - parameter username:    Username
     * - parameter password:    Password
     */
    public static func requestLogin(action: Selector, view: BaseViewController,
                                    username: String, password: String,
                                    token: String = DomainConst.BLANK) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = LoginRequest(url: DomainConst.PATH_SITE_LOGIN,
                                   reqMethod: DomainConst.HTTP_POST_REQUEST,
                                   view: view)
        request.setData(username: username, password: password, token: token)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
