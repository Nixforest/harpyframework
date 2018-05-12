//
//  NewListRequest.swift
//  harpyframework
//  P0090_GetNewsList_API
//  Created by SPJ on 1/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsListRequest: BaseRequest {
    /**
     * Set data content
     * - parameter page:        Page index
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     * - parameter isMenuList:  Flag check is menu list
     */
    func setData(page: String,
                 //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
                 lat: String, long: String,
                 //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
                 //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
                 isMenuList: String = DomainConst.NUMBER_ZERO_VALUE
                 //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
        ) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            DomainConst.KEY_PAGE,       page,
            //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
            DomainConst.KEY_LATITUDE,   lat,
            DomainConst.KEY_LONGITUDE,  long,
            //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
            //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
            DomainConst.KEY_MENU_LIST,  isMenuList,
            //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request news list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter page:        Page index
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     * - parameter isMenuList:  Flag check is menu list
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               page: String,
                               //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
                               lat: String = DomainConst.BLANK,
                               long: String = DomainConst.BLANK,
                               //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
                               isShowLoading: Bool = true,
                               //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
                               isMenuList: String = DomainConst.NUMBER_ZERO_VALUE
                               //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
        ) {
        let request = NewsListRequest(url: DomainConst.PATH_LIST_NEWS,
                                       reqMethod: DomainConst.HTTP_POST_REQUEST,
                                       view: view)
        //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
//        request.setData(page: page)
        request.setData(page: page, lat: lat, long: lat, isMenuList: isMenuList)
        //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
//        request.execute()
        request.execute(isShowLoadingView: isShowLoading)
    }
}
