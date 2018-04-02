//
//  NewsPopupRequest.swift
//  harpyframework
//  P0091_GetNewsPopup_API
//  Created by SPJ on 1/31/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class NewsPopupRequest: BaseRequest {
    /**
     * Set data content
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     */
    func setData(
        //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
        lat: String, long: String
        //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
        ) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,      BaseModel.shared.getUserToken(),
            //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
            DomainConst.KEY_LATITUDE,   lat,
            DomainConst.KEY_LONGITUDE,  long,
            //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
            DomainConst.KEY_PLATFORM,   DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request news list
     * - parameter action:      Action execute when finish this task
     * - parameter view:        Current view
     * - parameter lat:         Latitude
     * - parameter long:        Longitude
     */
    public static func request(action: Selector,
                               view: BaseViewController,
                               //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
                                lat: String = DomainConst.BLANK,
                                long: String = DomainConst.BLANK
                                //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
        ) {
        let request = NewsPopupRequest(url: DomainConst.PATH_NEWS_POPUP,
                                      reqMethod: DomainConst.HTTP_POST_REQUEST,
                                      view: view)
        //++ BUG0194-SPJ (NguyenPT 20180402) Add location information
//        request.setData()
        request.setData(lat: lat, long: lat)
        //-- BUG0194-SPJ (NguyenPT 20180402) Add location information
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
}
