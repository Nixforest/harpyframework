//
//  DistrictsListRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class DistrictsListRequest: BaseRequest {
    /**
     * Set data content
     * - parameter provinceId: Id of province
     */
    func setData(provinceId: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%d\"}",
            DomainConst.KEY_PROVINCE_ID, provinceId,
            DomainConst.KEY_PLATFORM, DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request districts list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter provinceId: Id of province
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               provinceId: String) {
        //++ BUG0059-SPJ (NguyenPT 20170420) Check list district is existed
//        if BaseModel.shared.getListDistricts(provinceId: provinceId) != nil
//            && BaseModel.shared.getListDistricts(provinceId: provinceId)?.count != 0 {
//            return
//        }
        //-- BUG0059-SPJ (NguyenPT 20170420) Check list district is existed
        // Show overlay
        //LoadingView.shared.showOverlay(view: view.view)
        let request = DistrictsListRequest(url: DomainConst.PATH_SITE_DISRICTS_LIST,
                                           reqMethod: DomainConst.HTTP_POST_REQUEST,
                                           view: view)
        request.setData(provinceId: provinceId)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        //request.execute()
        request.execute(isShowLoadingView: false)
    }
    
    //++ BUG0109-SPJ (NguyenPT 20170617) Request districts list on custom UIView
    /**
     * Request districts list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter provinceId:  Id of province
     */
    public static func requestDistricts(action: Selector, view: UIView, provinceId: String) {
//        LoadingView.shared.showOverlay(view: view)
        let request = DistrictsListRequest(url: DomainConst.PATH_SITE_DISRICTS_LIST,
                                           reqMethod: DomainConst.HTTP_POST_REQUEST)
        request.setData(provinceId: provinceId)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0109-SPJ (NguyenPT 20170617) Request districts list on custom UIView
}
