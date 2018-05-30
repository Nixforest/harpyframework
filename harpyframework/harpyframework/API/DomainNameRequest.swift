//
//  DomainNameRequest.swift
//  harpyframework
//
//  Created by Pham Trung Nguyen on 5/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class DomainNameRequest: BaseRequest {
    override public func execute(isShowLoadingView: Bool = true) {
        if isShowLoadingView {
            LoadingView.shared.showOverlay(view: self.view.view, className: self.theClassName)
        }
        let serverUrl: URL = URL(string: Info.MAIN_URL + self.url)!
        let request = NSMutableURLRequest(url: serverUrl)
        request.httpMethod = self.reqMethod
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        // Make data string
        request.httpBody = self.data.data(using: String.Encoding.utf8)
        let task = completetionHandler(request: request)
        task.resume()
    }
    /**
     * Set data content
     * - parameter bundleId:    Bundle id value
     */
    func setData(bundleId: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\"}",
            DomainConst.KEY_BUNDLE_ID, bundleId
        )
    }
    
    /**
     * Request order list function
     * - parameter bundleId:    Bundle id value
     */
    public static func request(view: BaseViewController,
                               bundleId: String,
                               completionHandler: ((Any?) -> Void)?) {
        let request = DomainNameRequest(url: Info.MAIN_PATH_GET_DOMAIN_NAME,
                                         reqMethod: DomainConst.HTTP_POST_REQUEST,
                                         view: view)
        request.setData(bundleId: bundleId)
        request.completionBlock = completionHandler
        request.execute()
    }
}
