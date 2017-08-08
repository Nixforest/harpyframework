//
//  UpholdDetailRequest.swift
//  project
//
//  Created by Nixforest on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation

public class UpholdDetailRequest: BaseRequest {
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
//            let model: UpholdDetailRespModel = UpholdDetailRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                BaseModel.shared.saveCurrentUpholdDetail(model: model.model_uphold)
//                // Notify update data on UpholdList view (cross-thread)
//                DispatchQueue.main.async {
//                    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
////                    NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_UPHOLD_DETAIL_VIEW), object: model)
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
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request uphold detail data
     * - parameter upholdId:    Id of uphold
     * - parameter replyId:     Id of reply
     * - parameter view:        View controller
     */
    public static func requestUpholdDetail(action: Selector, view: BaseViewController,
                                           upholdId: String, replyId: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = UpholdDetailRequest(url: DomainConst.PATH_SITE_UPHOLD_VIEW, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData(upholdId: upholdId, replyId: replyId)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
