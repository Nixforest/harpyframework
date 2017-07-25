//
//  ConfirmNotifyRequest.swift
//  project
//
//  Created by Nixforest on 11/27/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class ConfirmNotifyRequest: BaseRequest {
    //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
//        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
//            (
//            data, response, error) in
//            // Check error
//            guard error == nil else {
//                return
//            }
//            guard (data != nil) else {
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
//    override init(url: String, reqMethod: String) {
//        super.init(url: url, reqMethod: reqMethod)
//    }
    //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    
    /**
     * Set data content
     * - parameter notifyId : Id of notify
     * - parameter type     : Type of notify
     * - parameter objId    : Id of object
     */
    func setData(notifyId: String, type: String, objId: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            DomainConst.KEY_NOTIFY_ID, notifyId,
            DomainConst.KEY_TYPE, type,
            DomainConst.KEY_OBJECT_ID, objId
        )
    }
    /**
     * Request confirm notify.
     * - parameter notifyId : Id of notify
     * - parameter type     : Type of notify
     * - parameter objId    : Id of object
     */
    public static func requestConfirmNotify(notifyId: String, type: String, objId: String) {
        let request = ConfirmNotifyRequest(url: DomainConst.PATH_SITE_CONFIRM_NOTIFY,
                                           reqMethod: DomainConst.HTTP_POST_REQUEST)
        request.setData(notifyId: notifyId, type: type, objId: objId)
        request.execute()
    }
}
