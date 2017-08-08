//
//  UpholdListRequest.swift
//  project
//
//  Created by Nixforest on 10/11/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UpholdListRequest: BaseRequest {
    //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
//        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
//            (
//            data, response, error) in
//            // Check error
//            guard error == nil else {
//                self.showAlert(message: DomainConst.CONTENT00196)
//                return
//            }
//            guard let data = data else {
//                self.showAlert(message: DomainConst.CONTENT00196)
//                return
//            }
//            // Convert to string
//            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            print(dataString ?? "")
//            // Convert to object
//            let model: UpholdListRespModel = UpholdListRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                // Hide overlay
//                LoadingView.shared.hideOverlayView()
//                BaseModel.shared.saveUpholdList(upholdListModel: model)
//                // Notify update data on UpholdList view (cross-thread)
//                DispatchQueue.main.async {
//                    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
////                    NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_UPHOLDLIST_VIEW), object: model)
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
//                }
//            } else {
//                self.showAlert(message: model.message)
//                return
//            }
//        })
//        return task
//    }
//    
//    /**
//     * Initializer
//     * - parameter url: URL
//     * - parameter reqMethod: Request method
//     * - parameter view: Root view
//     */
//    override init(url: String, reqMethod: String, view: BaseViewController) {
//        super.init(url: url, reqMethod: reqMethod, view: view)
//    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
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
    
    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
    /**
     * Request uphold list
     * - parameter page:        Page index
     * - parameter type:        Type uphold (Problem/Periodically)
     * - parameter customerId:  Id of customer
     * - parameter status:      Status of item
     * - parameter view:        View controller
     */
    public static func requestUpholdList(action: Selector, view: BaseViewController,
                                         page: Int, type: Int,
                                         customerId: String, status: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = UpholdListRequest(url: DomainConst.PATH_SITE_UPHOLD_LIST,
                                        reqMethod: DomainConst.HTTP_POST_REQUEST,
                                        view: view)
        request.setData(page: page, type: type, customerId: customerId, status: status)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
}
