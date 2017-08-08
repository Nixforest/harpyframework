//
//  SearchCustomerRequest.swift
//  project
//
//  Created by Nixforest on 10/17/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class SearchCustomerRequest: BaseRequest {
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
//            let model: SearchCustomerRespModel = SearchCustomerRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                BaseModel.shared.saveSearchCustomerResult(result: model)
//                // Notify update data on UpholdList view (cross-thread)
//                DispatchQueue.main.async {
//                    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
////                    NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SHOW_SEARCH_BAR_UPHOLDLIST_VIEW), object: model)
//                    NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
//                }
//            } else {
//                self.showAlert(message: model.message)
//                return
//            }
//            // Hide overlay
//            LoadingView.shared.hideOverlayView()
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
     * - parameter keyword: Keyword
     */
    func setData(keyword: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_KEYWORD, keyword
        )
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
    /**
     * Request search customer
     * - parameter keyword: Keyword
     * - parameter view:    View controller
     */
    public static func requestSearchCustomer(action: Selector, view: BaseViewController,
                                             keyword: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = SearchCustomerRequest(url: DomainConst.PATH_SITE_AUTOCOMPLETE_USER, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData(keyword: keyword)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
}
