//
//  RegisterRequest.swift
//  harpyframework
//
//  Created by SPJ on 12/26/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation

public class RegisterRequest: BaseRequest {
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
//                BaseModel.shared.setTempToken(token: model.token)
//                // Back to home page (cross-thread)
//                DispatchQueue.main.async {
//                    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
////                    self.view.processInputConfirmCode(message: model.message)
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
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
//     * - parameter reqMethod: Request method
//     * - parameter view: Root view
//     */
//    override init(url: String, reqMethod: String, view: BaseViewController) {
//        super.init(url: url, reqMethod: reqMethod, view: view)
//    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
    /**
     * Set data content
     * - parameter upholdId:    Id of uphold
     * - parameter replyId:     Id of uphold
     */
    func setData(name: String, phone: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_FIRST_NAME, name,
            DomainConst.KEY_PHONE, phone
        )
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request create register
     * - parameter name:    Name
     * - parameter phone:   Phone
     * - parameter view:    View controller
     */
    public static func requestRegister(action: Selector, view: BaseViewController,
                                       name: String,
                                       phone: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = RegisterRequest(url: DomainConst.PATH_CUSTOMER_REGISTER, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData(name: name, phone: phone)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
