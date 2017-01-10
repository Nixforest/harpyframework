//
//  LoginRequest.swift
//  project
//
//  Created by Nixforest on 9/29/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class LoginRequest: BaseRequest {
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
            let model: LoginRespModel = LoginRespModel(jsonString: dataString as! String)
            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
                // Handle login is success
                BaseModel.shared.loginSuccess(model.token)
                BaseModel.shared.saveTempData(loginModel: model)
            } else {
                self.showAlert(message: model.message)
                return
            }
            // Hide overlay
            LoadingView.shared.hideOverlayView()
            // Back to home page (cross-thread)
            DispatchQueue.main.async {
                _ = self.view.navigationController?.popToRootViewController(animated: true)
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
     * - parameter username: Username
     * - parameter password: Password
     */
    func setData(username: String, password: String) {
        self.data = "q=" + String.init(
            format: "{\"username\":\"%@\",\"password\":\"%@\",\"gcm_device_token\":\"\",\"apns_device_token\":\"%@\",\"type\":\"3\"}",
            //format: "{\"username\":\"%@\",\"password\":\"%@\",\"gcm_device_token\":\"1\",\"apns_device_token\":\"1\"}",
                                       username, password,
                                       BaseModel.shared.checkDeviceTokenExist() ? BaseModel.shared.getDeviceToken() : "A7CA1E1F8434EE8D5E62264B22D29D64B7A3AC04E03899E6926503643FD07EC6"
                                        //Singleton.shared.checkDeviceTokenExist() ? Singleton.shared.getDeviceToken() : ""
        )
    }
}
