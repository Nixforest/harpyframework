//
//  NotifyCountRequest.swift
//  project
//
//  Created by Nixforest on 11/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class NotificationCountRequest: BaseRequest {
    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            // Check error
            guard error == nil else {
                self.showAlert(message: DomainConst.CONTENT00196)
                return
            }
            guard let data = data else {
                self.showAlert(message: DomainConst.CONTENT00196)
                return
            }
            // Convert to string
            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print(dataString ?? "")
            // Convert to object
            let model: NotificationCountRespModel = NotificationCountRespModel(jsonString: dataString as! String)
            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
                BaseModel.shared.setNotificationCountText(text: model.NotifyCountText)
                BaseModel.shared.setOtherInfo(data: model.otherInfo)
            } else {
                self.showAlert(message: model.message)
                return
            }
            // Hide overlay
            LoadingView.shared.hideOverlayView()
            DispatchQueue.main.async {
                //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
//                NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_UPDATE_NOTIFY_HOMEVIEW), object: model)
//                self.view.updateNotificationStatus()
                NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
                //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
            }
        })
        return task
    }
    
    /**
     * Initializer
     * - parameter url: URL
     * - parameter reqMethod: Request method
     * - parameter view: Root view
     */
    override init(url: String, reqMethod: String, view: BaseViewController) {
        super.init(url: url, reqMethod: reqMethod, view: view)
    }
    
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
        // Show overlay
        LoadingView.shared.showOverlay(view: view.view)
        let request = NotificationCountRequest(url: DomainConst.PATH_SITE_NOTIFY_COUNT, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name:NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
