//
//  BaseRequest.swift
//  project
//
//  Created by Nixforest on 9/23/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
open class BaseRequest: NSObject {
    /** URL */
    public var url: String = ""
    /** Data of request */
    public var data: String = ""
    /** Data of request (upload file) */
    public var param: [String: String] = [String: String]()
    /** Request method: GET/POST */
    public var reqMethod: String = ""
    /** Session */
    public var session = URLSession.shared
    /** Current view */
    public var view: BaseViewController
    
    /**
     * Initializer
     * - parameter url: URL
     * - parameter reqMethod: Request method Get/Post
     * - parameter view: current view
     */
    public init(url: String, reqMethod: String, view: BaseViewController) {
        self.url        = url
        self.reqMethod  = reqMethod
        self.view       = view
    }
    /**
     * Initializer
     * - parameter url: URL
     * - parameter reqMethod: Request method Get/Post
     */
    public init(url: String, reqMethod: String) {
        self.url        = url
        self.reqMethod  = reqMethod
        self.view       = BaseViewController()
    }
    
    /**
     * Execute task
     */
    open func execute() {
        let serverUrl: URL = URL(string: BaseModel.shared.getServerURL() + self.url)!
        let request = NSMutableURLRequest(url: serverUrl)
        request.httpMethod = self.reqMethod
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        // Make data string
        request.httpBody = self.data.data(using: String.Encoding.utf8)
        let task = completetionHandler(request: request)
        task.resume()
    }
    
    /**
     * Execute task and upload files
     * - parameter listImages: List of images
     */
    public func executeUploadFile(listImages: [UIImage]) {
        let serverUrl: URL = URL(string: BaseModel.shared.getServerURL() + self.url)!
        let request = NSMutableURLRequest(url: serverUrl)
        request.httpMethod = self.reqMethod
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        let boundary = generateBoundaryString()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var imgDataList: [Data] = [Data]()
        var filePathKey: [String] = [String]()
        for i in 0..<listImages.count {
            let imgData = UIImageJPEGRepresentation(listImages[i], 1)
            if imgData == nil {
                return
            }
            imgDataList.append(imgData!)
            filePathKey.append(String.init(format: "file_name[%d]", i))
        }
        request.httpBody = createBodyWithParameterList(parameters: self.param, filePathKey: filePathKey,
                                                   imageDataKey: imgDataList, boundary: boundary) as Data
        
        let task = completetionHandler(request: request)
        task.resume()
    }
    
    /**
     * Create boundary string for multipart/form-data request
     * - returns: The boundary string that consists of "Boundary-" followed by a UUID string.
     */
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    /**
     * Create body
     * - parameter parameters:      List of parameter
     * - parameter filePathKey:     Filepath key
     * - parameter imageDataKey:    Image data key
     * - parameter boundary:        Boundary data
     * - returns: NSData
     */
    func createBodyWithParameter(parameters: [String: String]?, filePathKey: String?,
                                 imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData()
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        let filename = "abcdef.jpg"
        let mimetype = "image/jpg"
        
        body.appendString(string: "--\(boundary)\r\n")
        body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
        body.append(imageDataKey as Data)
        body.appendString(string: "\r\n")
        body.appendString(string: "--\(boundary)--\r\n")
        
        return body
    }
    
    /**
     * Create body
     * - parameter parameters:      List of parameter
     * - parameter filePathKey:     Filepath key
     * - parameter imageDataKey:    List of Image data key
     * - parameter boundary:        Boundary data
     * - returns: NSData
     */
    func createBodyWithParameterList(parameters: [String: String]?, filePathKey: [String],
                                 imageDataKey: [Data], boundary: String) -> NSData {
        let body = NSMutableData()
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        let filename = "abcdef.jpg"
        let mimetype = "image/jpg"
        for i in 0..<filePathKey.count {
            body.appendString(string: "--\(boundary)\r\n")
            body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey[i])\"; filename=\"\(filename)\"\r\n")
            body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
            body.append(imageDataKey[i])
            body.appendString(string: "\r\n")
            body.appendString(string: "--\(boundary)--\r\n")
        }
        
        return body
    }
    
    /**
     * Handle when complete task
     */
    open func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            // Check error
            guard error == nil else {
                //++ BUG0050-SPJ (NguyenPT 20170403) Handle Error
                LoadingView.shared.hideOverlayView()
                //-- BUG0050-SPJ (NguyenPT 20170403) Handle Error
                self.view.showAlert(message: DomainConst.CONTENT00196)
                return
            }
            //++ BUG0050-SPJ (NguyenPT 20170323) Handle result string
            //guard data == nil else {
            guard let data = data else {
                LoadingView.shared.hideOverlayView()
            //-- BUG0050-SPJ (NguyenPT 20170323) Handle result string
                self.view.showAlert(message: DomainConst.CONTENT00196)
                return
            }
            //++ BUG0050-SPJ (NguyenPT 20170323) Handle result string
            // Convert to string
            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            self.handleCompleteTask(model: dataString)
            //-- BUG0050-SPJ (NguyenPT 20170323) Handle result string
        })
        return task
    }
    
    /**
     * Show alert when connection has error.
     * - parameter message: Message string
     */
    public func showAlert(message: String) {
        // Hide overlay
        LoadingView.shared.hideOverlayView()
        DispatchQueue.main.async {
            self.view.showAlert(message: message)
        }
    }
    
    /**
     * Handle when complete task
     * - parameter model: Model return by retuest
     */
    public func handleCompleteTask(model: Any?) {
        // Hide overlay
        LoadingView.shared.hideOverlayView()
        // Call complete handler
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
        }
    }
}
