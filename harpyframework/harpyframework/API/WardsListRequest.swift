//
//  WardsListRequest.swift
//  harpyframework
//
//  Created by SPJ on 4/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class WardsListRequest: BaseRequest {
    /**
     * Set data content
     * - parameter provinceId: Id of province
     * - parameter districtId: Id of district
     */
    func setData(provinceId: String, districtId: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%d\"}",
            DomainConst.KEY_PROVINCE_ID, provinceId,
            DomainConst.KEY_DISTRICT_ID, districtId,
            DomainConst.KEY_PLATFORM, DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request wards list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter provinceId:  Id of province
     * - parameter districtId:  Id of district
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               provinceId: String,
                               districtId: String) {
        //++ BUG0059-SPJ (NguyenPT 20170420) Check list district is existed
        if BaseModel.shared.getListWards(districtId: districtId) != nil
            && BaseModel.shared.getListWards(districtId: districtId).count != 0 {
            return
        }
        //-- BUG0059-SPJ (NguyenPT 20170420) Check list district is existed
        // Show overlay
        //LoadingView.shared.showOverlay(view: view.view)
        let request = WardsListRequest(url: DomainConst.PATH_SITE_WARDS_LIST,
                                           reqMethod: DomainConst.HTTP_POST_REQUEST,
                                           view: view)
        request.setData(provinceId: provinceId, districtId: districtId)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        //request.execute()
        request.execute(isShowLoadingView: false)
    }
    
    //++ BUG0109-SPJ (NguyenPT 20170617) Request wards list on custom UIView
    /**
     * Request wards list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter provinceId:  Id of province
     */
    public static func requestWards(action: Selector, view: UIView,
                                    provinceId: String,
                                    districtId: String) {
//        LoadingView.shared.showOverlay(view: view)
        let request = WardsListRequest(url: DomainConst.PATH_SITE_WARDS_LIST,
                                           reqMethod: DomainConst.HTTP_POST_REQUEST)
        request.setData(provinceId: provinceId,  districtId: districtId)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    //-- BUG0109-SPJ (NguyenPT 20170617) Request wards list on custom UIView
}
