//
//  UserProfileRequest.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UserProfileRequest: BaseRequest {
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
            let model: UserProfileRespModel = UserProfileRespModel(jsonString: dataString as! String)
            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
                // Update user information
                BaseModel.shared.setUserInfo(userInfo: model.record)
                // Notify update data on Account view (cross-thread)
                DispatchQueue.main.async {
                    //NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_ACCOUNTVIEW), object: nil)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: nil)
                }
            } else {
                self.showAlert(message: model.message)
                return
            }
            
            LoadingView.shared.hideOverlayView()
        })
        return task
    }
    /**
     * Initializer
     * - parameter url: URL
     */
    override init(url: String, reqMethod: String, view: BaseViewController) {
        super.init(url: url, reqMethod: reqMethod, view: view)
    }
    /**
     * Set data content
     * - parameter token: User token
     */
    func setData(token: String) {
        self.data = "q=" + String.init(format: "{\"token\":\"%@\"}", token)
    }
}
