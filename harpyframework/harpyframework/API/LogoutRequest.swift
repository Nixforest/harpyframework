//
//  LogoutRequest.swift
//  project
//
//  Created by Nixforest on 10/8/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class LogoutRequest: BaseRequest {
    //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
//        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
//            (
//            data, response, error) in
//            // Check error
//            guard error == nil else {
//                //++ BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
////                self.showAlert(message: DomainConst.CONTENT00196)
//                self.handleErrorTask()
//                //-- BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
//                return
//            }
//            guard let data = data else {
//                //++ BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
////                self.showAlert(message: DomainConst.CONTENT00196)                
//                self.handleErrorTask()
//                //-- BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
//                return
//            }
//            // Convert to string
//            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            // Convert to object
//            let model: BaseRespModel = BaseRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                // Handle logout is success
//                BaseModel.shared.logoutSuccess()
//            } else {
//                if model.code == "1987" {
//                    BaseModel.shared.logoutSuccess()
//                }
//                self.showAlert(message: model.message)
//                return
//            }
//            // Hide overlay
//            LoadingView.shared.hideOverlayView()
//            // Back to home page (cross-thread)
//            DispatchQueue.main.async {
//                //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
////                _ = self.view.popToRootView()
////                NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_HOMEVIEW), object: model)
//                NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//                //++ BUG0087-SPJ (NguyenPT 20170516) Remove message Logout success
//                // Remove observer
//                NotificationCenter.default.removeObserver(self.view, name: Notification.Name(rawValue: self.theClassName), object: nil)
//                //-- BUG0087-SPJ (NguyenPT 20170516) Remove message Logout success
//            }
//        })
//        return task
//    }
//    /**
//     * Initializer
//     * - parameter url: URL
//     * - parameter reqMethod: Request method Get/Post
//     * - parameter view: current view
//     */
//    override init(url: String, reqMethod: String, view: BaseViewController) {
//        super.init(url: url, reqMethod: reqMethod, view: view)
//    }
//    /**
//     * Initializer
//     * - parameter url: URL
//     * - parameter reqMethod: Request method Get/Post
//     *
//     */
//    override init(url: String, reqMethod: String) {
//        super.init(url: url, reqMethod: reqMethod)
//    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(format: "{\"token\":\"%@\"}", BaseModel.shared.getUserToken())
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request logout
     * - parameter action:      Action when request complete
     * - parameter view:        Current screen
     */
    public static func requestLogout(action: Selector, view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = LogoutRequest(url: DomainConst.PATH_SITE_LOGOUT,
                                   reqMethod: DomainConst.HTTP_POST_REQUEST,
                                   view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
