//
//  UpdateConfigurationRequest.swift
//  project
//
//  Created by Nixforest on 11/1/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UpdateConfigurationRequest: BaseRequest {
    //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
//        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {
//            (
//            data, response, error) in
//            // Check error
//            guard error == nil else {
//                //self.showAlert(message: DomainConst.CONTENT00196)
//                self.view.showAlert(message: DomainConst.CONTENT00196,
//                                    okHandler: { (alert: UIAlertAction!) in
//                                        self.execute()
//                })
//                return
//            }
//            guard let data = data else {
//                //self.showAlert(message: DomainConst.CONTENT00196)
//                self.view.showAlert(message: DomainConst.CONTENT00196,
//                                    okHandler: { (alert: UIAlertAction!) in
//                                        self.execute()
//                })
//                return
//            }
//            // Convert to string
//            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            print(dataString ?? "")
//            // Convert to object
//            let model: LoginRespModel = LoginRespModel(jsonString: dataString as! String)
//            if model.status == DomainConst.RESPONSE_STATUS_SUCCESS {
//                BaseModel.shared.saveTempData(loginModel: model)
//            } else {
//                if model.code == "1987" {
//                    BaseModel.shared.logoutSuccess()
//                }
//                self.showAlert(message: model.message)
//                return
//            }
//            // Hide overlay
//            LoadingView.shared.hideOverlayView()
//            DispatchQueue.main.async {
//                //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
////                NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_SET_DATA_HOMEVIEW), object: model)
//                NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
//                //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
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
     */
    func setData() {
        //++ BUG0198-SPJ (NguyenPT 20180530) Get device information
        var identifierForVendor = DomainConst.BLANK
        if let identify = UIDevice.current.identifierForVendor {
            identifierForVendor = identify.description
        }
        //-- BUG0198-SPJ (NguyenPT 20180530) Get device information
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\"}",
            DomainConst.KEY_TOKEN, BaseModel.shared.getUserToken(),
            //++ BUG0198-SPJ (NguyenPT 20180530) Get device information
            DomainConst.KEY_DEVICE_NAME, UIDevice.current.model,
            DomainConst.KEY_DEVICE_IMEI, identifierForVendor,
            DomainConst.KEY_DEVICE_OS_VERSION, "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
            //-- BUG0198-SPJ (NguyenPT 20180530) Get device information
        )
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Request uphold configuration
     * - parameter view: View controller
     */
    public static func requestUpdateConfiguration(action: Selector, view: BaseViewController) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = UpdateConfigurationRequest(url: DomainConst.PATH_SITE_UPDATE_CONFIG, reqMethod: DomainConst.HTTP_POST_REQUEST, view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
}
