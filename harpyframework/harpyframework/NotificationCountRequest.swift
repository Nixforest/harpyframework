//
//  NotifyCountRequest.swift
//  project
//
//  Created by Nixforest on 11/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class NotificationCountRequest: BaseRequest {
    override func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
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
            if model.status == "1" {
                BaseModel.shared.setNotificationCountText(text: model.NotifyCountText)
                BaseModel.shared.setOtherInfo(data: model.otherInfo)
            } else {
                self.showAlert(message: model.message)
                return
            }
            // Hide overlay
            LoadingView.shared.hideOverlayView()
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_UPDATE_NOTIFY_HOMEVIEW), object: model)
                self.view.updateNotificationStatus()
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
}
