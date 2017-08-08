//
//  DataLabelRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class ProvincesListRequest: BaseRequest {
    /**
     * Set data content
     */
    func setData() {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%d\"}",
            DomainConst.KEY_SIGN_UP_CODE, DomainConst.BLANK,
            DomainConst.KEY_PLATFORM, DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request provinces list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     */
    public static func request(action: Selector,
                               view: BaseViewController) {
        // Show overlay
        //LoadingView.shared.showOverlay(view: view.view)
        let request = ProvincesListRequest(url: DomainConst.PATH_SITE_PROVINCES_LIST,
                                                reqMethod: DomainConst.HTTP_POST_REQUEST,
                                                view: view)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        //request.execute()
        request.execute(isShowLoadingView: false)
    }
    
    //++ BUG0109-SPJ (NguyenPT 20170617) Request provinces list on custom UIView
    /**
     * Request provinces list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     */
    public static func requestProvinces(action: Selector,
                               view: UIView) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view)
        let request = ProvincesListRequest(url: DomainConst.PATH_SITE_PROVINCES_LIST,
                                           reqMethod: DomainConst.HTTP_POST_REQUEST)
        request.setData()
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0109-SPJ (NguyenPT 20170617) Request provinces list on custom UIView
}
