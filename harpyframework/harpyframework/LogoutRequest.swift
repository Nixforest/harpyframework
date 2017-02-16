//
//  LogoutRequest.swift
//  project
//
//  Created by Nixforest on 10/8/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class LogoutRequest: BaseRequest {
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
            // Convert to object
            let model: BaseRespModel = BaseRespModel(jsonString: dataString as! String)
            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
                // Handle logout is success
                BaseModel.shared.logoutSuccess()
            } else {
                if model.code == "1987" {
                    BaseModel.shared.logoutSuccess()
                }
                self.showAlert(message: model.message)
                return
            }
            // Hide overlay
            LoadingView.shared.hideOverlayView()
            // Back to home page (cross-thread)
            DispatchQueue.main.async {
                _ = self.view.popToRootView()
                NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_HOMEVIEW), object: model)
            }
        })
        return task
    }
    /**
     * Initializer
     * - parameter url: URL
     * - parameter reqMethod: Request method Get/Post
     * - parameter view: current view
     */
    override init(url: String, reqMethod: String, view: BaseViewController) {
        super.init(url: url, reqMethod: reqMethod, view: view)
    }
    /**
     * Initializer
     * - parameter url: URL
     * - parameter reqMethod: Request method Get/Post
     *
     */
    override init(url: String, reqMethod: String) {
        super.init(url: url, reqMethod: reqMethod)
    }
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(format: "{\"token\":\"%@\"}", BaseModel.shared.getUserToken())
    }
}
