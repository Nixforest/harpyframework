//
//  ImageRequest.swift
//  harpyframework
//
//  Created by SPJ on 6/9/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class ImageRequest: BaseRequest {
    /**
     * Execute task
     */
    //public override func execute() {
    public override func execute(isShowLoadingView: Bool = true) {
        if isShowLoadingView {
            LoadingView.shared.showOverlay(view: self.view.view, className: self.theClassName)
        }
        let serverUrl: URL = URL(string: self.url)!
        let request = NSMutableURLRequest(url: serverUrl)
        request.httpMethod = self.reqMethod
        request.cachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
        // Make data string
        //request.httpBody = self.data.data(using: String.Encoding.utf8)
        let task = completetionHandler(request: request)
        task.resume()
    }
    
    /**
     * Request images
     * - parameter action:      Action when request complete
     * - parameter view:        Current screen
     * - parameter url:         Image url
     */
    public static func request(action: Selector, view: BaseViewController, url: String) {
//        // Show overlay
//        LoadingView.shared.showOverlay(view: view.view)
        let request = ImageRequest(url: url,
                                   reqMethod: DomainConst.HTTP_POST_REQUEST,
                                   view: view)
        NotificationCenter.default.addObserver(view, selector: action, name: NSNotification.Name(rawValue: request.theClassName), object: nil)
        request.execute()
    }
    override public func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler:
            { (data, response, error) in
            // Check error
//            guard error == nil else {
//                self.handleErrorTask()
//                return
//            }
//            guard let data = data else {
//                self.handleErrorTask()
//                return
//            }
            var phImage = UIImage(named: DomainConst.DEFAULT_IMG_NAME)
            
            guard
                let httpURLResponse = response as? HTTPURLResponse , httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType , mimeType.hasPrefix("image"),
                let data = data , error == nil,
                let image = UIImage(data: data)
                //else { return }
                else {  // Failed
//                    DispatchQueue.main.async {
//                        self.image = phImage
//                    }
                    return
            }
            DispatchQueue.main.async {
                phImage = image
            }
            
//            // Hide overlay
//            LoadingView.shared.hideOverlayView()
//            // Back to home page (cross-thread)
//            DispatchQueue.main.async {
//                NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: phImage)
//            }
                self.handleCompleteTask(model: phImage)
        })
        return task
    }
}
