//
//  UpholdDetailRequest.swift
//  project
//
//  Created by Nixforest on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

class UpholdDetailRequest: BaseRequest {
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
            let model: UpholdDetailRespModel = UpholdDetailRespModel(jsonString: dataString as! String)
            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
                BaseModel.shared.saveCurrentUpholdDetail(model: model.model_uphold)
                // Notify update data on UpholdList view (cross-thread)
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_UPHOLD_DETAIL_VIEW), object: model)
                }
            } else {
                self.showAlert(message: model.message)
                return
            }
            // Hide overlay
            LoadingView.shared.hideOverlayView()
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
    func setData(upholdId: String, replyId: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_UPHOLD_ID, upholdId,
            DomainConst.KEY_REPLY_ID, replyId
        )
    }
}
