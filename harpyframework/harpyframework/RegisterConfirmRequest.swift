//
//  RegisterConfirmRequest.swift
//  harpyframework
//
//  Created by SPJ on 12/26/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation

class RegisterConfirmRequest: BaseRequest {
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
                BaseModel.shared.resetTempToken()
                // Back to home page (cross-thread)
                DispatchQueue.main.async {
                    let loginVC = self.view.mainStoryboard.instantiateViewController(withIdentifier: GlobalConst.G00_LOGIN_VIEW_CTRL)
                    self.view.navigationController?.pushViewController(loginVC, animated: true)
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
     * - parameter reqMethod: Request method
     * - parameter view: Root view
     */
    override init(url: String, reqMethod: String, view: BaseViewController) {
        super.init(url: url, reqMethod: reqMethod, view: view)
    }
    
    /**
     * Set data content
     * - parameter upholdId:    Id of uphold
     * - parameter replyId:     Id of uphold
     */
    func setData(code: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getTempToken(),
            DomainConst.KEY_CONFIRM_CODE, code
        )
    }
}
