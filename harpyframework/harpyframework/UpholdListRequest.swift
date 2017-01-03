//
//  UpholdListRequest.swift
//  project
//
//  Created by Nixforest on 10/11/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UpholdListRequest: BaseRequest {
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
            let model: UpholdListRespModel = UpholdListRespModel(jsonString: dataString as! String)
            if model.status == "1" {
                // Hide overlay
                LoadingView.shared.hideOverlayView()
                BaseModel.shared.saveUpholdList(upholdListModel: model)
                // Notify update data on UpholdList view (cross-thread)
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_UPHOLDLIST_VIEW), object: model)
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
     * - parameter page: Page of list
     * - parameter type: Type of uphold
     * - parameter customerId: Id of customer
     * - parameter status: Status of uphold item
     */
    func setData(page: Int, type: Int, customerId: String, status: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%d\",\"%@\":\"%d\",\"%@\":\"%@\",\"%@\":\"%@\"}",
                DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
                DomainConst.KEY_PAGE, page,
                DomainConst.KEY_TYPE, type,
                DomainConst.KEY_CUSTOMER_ID, customerId,
                DomainConst.KEY_STATUS, status
        )
    }
}
