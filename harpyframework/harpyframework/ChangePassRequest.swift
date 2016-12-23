//
//  ChangePassRequest.swift
//  project
//
//  Created by Nixforest on 10/8/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class ChangePassRequest: BaseRequest {
    override func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            // Check error
            guard error == nil else {
                self.showAlert(message: GlobalConst.CONTENT00196)
                return
            }
            guard let data = data else {
                self.showAlert(message: GlobalConst.CONTENT00196)
                return
            }
            // Convert to string
            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print(dataString ?? "")
            // Convert to object
            let model: BaseRespModel = BaseRespModel(jsonString: dataString as! String)
            if model.status == "1" {
                // Hide overlay
                LoadingView.shared.hideOverlayView()
                // Back to home page (cross-thread)
                DispatchQueue.main.async {
                    self.view.showAlert(
                        message: model.message,
                        okHandler: {
                            (alert: UIAlertAction!) in
                            _ = self.view.navigationController?.popViewController(animated: true)
                    })
                }
            } else {
                self.showAlert(message: model.message)
                return
            }
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
}
