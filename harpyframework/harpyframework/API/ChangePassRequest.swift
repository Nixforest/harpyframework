//
//  ChangePassRequest.swift
//  project
//
//  Created by Nixforest on 10/8/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class ChangePassRequest: BaseRequest {
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
//            let model: BaseRespModel = BaseRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                // Hide overlay
//                LoadingView.shared.hideOverlayView()
//                // Back to home page (cross-thread)
//                DispatchQueue.main.async {
//                    self.view.showAlert(
//                        message: model.message,
//                        okHandler: {
//                            (alert: UIAlertAction!) in
//                            //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
////                            _ = self.view.navigationController?.popViewController(animated: true)
//                            NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                            //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//                    })
//                }
//            } else {
//                self.showAlert(message: model.message)
//                return
//            }
//        })
//        return task
//    }
//    
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
     * - parameter oldPass: Old password
     * - parameter newPass: New password
     */
    func setData(oldPass: String, newPass: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_OLD_PASSWORD, oldPass,
            DomainConst.KEY_NEW_PASSWORD, newPass,
            DomainConst.KEY_NEW_PASSWORD_CONFIRM, newPass)
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request change password.
     * - parameter action:      Action when request complete
     * - parameter view:        View controller
     * - parameter oldPass:     Old password
     * - parameter newPass:     New password
     */
    public static func requestChangePassword(action: Selector, view: BaseViewController,
                                             oldPass: String, newPass: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = ChangePassRequest(url: DomainConst.PATH_USER_CHANGE_PASS,
                                        reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData(oldPass: oldPass, newPass: newPass)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
