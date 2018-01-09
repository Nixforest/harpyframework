//
//  UserProfileRequest.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UserProfileRequest: BaseRequest {
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
//            let model: UserProfileRespModel = UserProfileRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                LoadingView.shared.hideOverlayView()
//                // Update user information
//                BaseModel.shared.setUserInfo(userInfo: model.record)
//                // Notify update data on Account view (cross-thread)
//                DispatchQueue.main.async {
//                    //NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_ACCOUNTVIEW), object: nil)
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: nil)
//                    // Remove observer
//                    NotificationCenter.default.removeObserver(self.view, name: Notification.Name(rawValue: self.theClassName), object: nil)
//                    
//                }
//            } else {
//                self.showAlert(message: model.message)
//                return
//            }
//        })
//        return task
//    }
//    /**
//     * Initializer
//     * - parameter url: URL
//     */
//    override init(url: String, reqMethod: String, view: BaseViewController) {
//        super.init(url: url, reqMethod: reqMethod, view: view)
//    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request user information
     * - parameter action:  Handler when finish execute task
     * - parameter view:    View controller
     */
    public static func requestUserProfile(action: Selector, view: BaseViewController) {
//        LoadingView.shared.showOverlay(view: view.view)
        let request = UserProfileRequest(url: DomainConst.PATH_USER_PROFILE,
                                         reqMethod: DomainConst.HTTP_POST_REQUEST,
                                         view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
