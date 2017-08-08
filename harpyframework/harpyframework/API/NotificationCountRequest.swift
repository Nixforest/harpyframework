//
//  NotifyCountRequest.swift
//  project
//
//  Created by Nixforest on 11/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class NotificationCountRequest: BaseRequest {
    //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            // Check error
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            // Convert to string
            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            // Convert to object
//            let model: NotificationCountRespModel = NotificationCountRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                BaseModel.shared.setNotificationCountText(text: model.NotifyCountText)
//                BaseModel.shared.setOtherInfo(data: model.otherInfo)
//            } else {
//                self.showAlert(message: model.message)
//                return
//            }
//            //++ BUG0049-SPJ (NguyenPT 20170325) Remove loading view
////            // Hide overlay
////            LoadingView.shared.hideOverlayView()
//            //-- BUG0049-SPJ (NguyenPT 20170325) Remove loading view
//            DispatchQueue.main.async {
//                //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
////                NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_UPDATE_NOTIFY_HOMEVIEW), object: model)
////                self.view.updateNotificationStatus()
//                NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
//            }
            if self.completionBlock != nil {
                // Call complete handler
                DispatchQueue.main.async {
                    self.completionBlock!(dataString)
                }
            } else {
                self.handleCompleteTask(model: dataString)
            }
        })
        return task
    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
//    /**
//     * Initializer
//     * - parameter url: URL
//     * - parameter reqMethod: Request method
//     * - parameter view: Root view
//     */
//    override init(url: String, reqMethod: String, view: BaseViewController) {
//        super.init(url: url, reqMethod: reqMethod, view: view)
//    }
    
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken()
        )
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request count of notification
     * - parameter view: View controller
     */
    public static func requestNotificationCount(action: Selector, view: BaseViewController) {
        //++ BUG0049-SPJ (NguyenPT 20170325) Remove loading view
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        //-- BUG0049-SPJ (NguyenPT 20170325) Remove loading view
        let request = NotificationCountRequest(url: DomainConst.PATH_SITE_NOTIFY_COUNT, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        //request.execute()
        request.execute(isShowLoadingView: false)
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
