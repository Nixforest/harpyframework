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
    //++ BUG0082-SPJ (NguyenPT 20170510) Change BaseRequest handle completion mechanism
    /** Completion block code */
    public var completionBlock: ((Any?) -> Void)? = nil
    //-- BUG0082-SPJ (NguyenPT 20170510) Change BaseRequest handle completion mechanism
    //++ BUG0156-SPJ (NguyenPT 20170930) Re-design Gas24h
    /** Flag show error */
    private var isShowError:    Bool        = true
    //-- BUG0156-SPJ (NguyenPT 20170930) Re-design Gas24h
    
    //++ BUG0175-SPJ (NguyenPT 20171206) Handle response code
    // MARK - Constant
    /** Error code response when Log out */
    public static let ERROR_CODE_LOG_OUT                    =   "1987"
    /** Error code response when Lost connection */
    public static let ERROR_CODE_LOST_CONNECTION            =   "1988"
    /** Error code response when Unknown reason */
    public static let ERROR_CODE_UNKNOWN                    =   "1989"
    /** Error code response when Wrong version application */
    public static let ERROR_CODE_WRONG_VERSION              =   "1990"
    //-- BUG0175-SPJ (NguyenPT 20171206) Handle response code
    
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
     * - parameter isShowLoadingView: Flag show/not show loading view
     */
    //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view
    //open func execute() {
    open func execute(isShowLoadingView: Bool = true) {
        if isShowLoadingView {
            LoadingView.shared.showOverlay(view: self.view.view, className: self.theClassName)
        }
    //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        
        let serverUrl: URL = URL(string: BaseModel.shared.getServerURL() + self.url)!
        let request = NSMutableURLRequest(url: serverUrl)
        request.httpMethod = self.reqMethod
        request.timeoutInterval = TimeInterval(30)
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
        //++ BUG0115-SPJ (NguyenPT 20170624) Handle add version code when request server
        // Version
        self.data = self.data.replacingOccurrences(
            of: "}",
            with: String.init(format: ",\"%@\":\"%@\"}",
                              DomainConst.KEY_VERSION_CODE,
                              DomainConst.VERSION_CODE.replacingOccurrences(
                                of: DomainConst.SPLITER_TYPE4,
                                with: DomainConst.BLANK)))
        //-- BUG0115-SPJ (NguyenPT 20170624) Handle add version code when request server
        // Make data string
        request.httpBody = self.data.data(using: String.Encoding.utf8)
        let task = completetionHandler(request: request)
        task.resume()
//        self.completeHandlerConnection(request: request)
    }
    
    /**
     * Execute task and upload files
     * - parameter listImages: List of images
     * - parameter isShowLoadingView: Flag show/not show loading view
     */
    //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view
    //public func executeUploadFile(listImages: [UIImage]) {
    public func executeUploadFile(listImages: [UIImage], isShowLoadingView: Bool = true) {
        if isShowLoadingView {
            LoadingView.shared.showOverlay(view: self.view.view, className: self.theClassName)
        }
    //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        
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
        
        //++ BUG0115-SPJ (NguyenPT 20170624) Handle add version code when request server
        // Version
        self.param["q"] = self.param["q"]?.replacingOccurrences(
            of: "}",
            with: String.init(format: ",\"%@\":\"%@\"}",
                              DomainConst.KEY_VERSION_CODE, DomainConst.VERSION_CODE))
        //-- BUG0115-SPJ (NguyenPT 20170624) Handle add version code when request server
        
        request.httpBody = createBodyWithParameterList(parameters: self.param, filePathKey: filePathKey,
                                                   imageDataKey: imgDataList, boundary: boundary) as Data
        
        let task = completetionHandler(request: request)
        task.resume()
//        self.completeHandlerConnection(request: request)
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
     * Handle request server by NSURLConnection
     */
    open func completeHandlerConnection(request: NSMutableURLRequest) {
        let queue: OperationQueue = OperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(
            request as URLRequest,
            queue: queue,
            completionHandler: {
                (response, data, error) in
                // Check error
                guard error == nil else {
//                    BaseModel.shared.setErrorDetail(detail: (error?.localizedDescription)!)
//                    self.handleErrorTask()
                    self.handleErrorTask(error: (error?.localizedDescription)!)
                    return
                }
                //guard data == nil else {
                guard let data = data else {
//                    BaseModel.shared.setErrorDetail(detail: (error?.localizedDescription)!)
//                    self.handleErrorTask()
                    self.handleErrorTask(error: (error?.localizedDescription)!)
                    return
                }
                // Convert to string
                let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(dataString ?? DomainConst.BLANK)
                if self.completionBlock != nil {
                    // Hide overlay
                    LoadingView.shared.hideOverlayView(className: self.theClassName)
                    // Call complete handler
                    DispatchQueue.main.async {
                        self.completionBlock!(dataString)
                    }
                } else {
                    self.handleCompleteTask(model: dataString)
                }
        })
    }
    
    /**
     * Handle when complete task
     */
    open func completetionHandler(request: NSMutableURLRequest) -> URLSessionTask {
        let task = self.session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            // Check error
//            guard error == nil else {
//                //++ BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
////                //++ BUG0050-SPJ (NguyenPT 20170403) Handle Error
////                LoadingView.shared.hideOverlayView()
////                //-- BUG0050-SPJ (NguyenPT 20170403) Handle Error
////                self.view.showAlert(message: DomainConst.CONTENT00196)
////                BaseModel.shared.setErrorDetail(detail: (error?.localizedDescription)!)
////                self.handleErrorTask()
//                self.handleErrorTask(error: (error?.localizedDescription)!)
////                if let err = error {
////                    self.handleErrorTask(error: (error as! NSError).localizedDescription + (error as! NSError).localizedFailureReason!)
////                }
//                //-- BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
//                return
//            }
//            //++ BUG0050-SPJ (NguyenPT 20170323) Handle result string
//            //guard data == nil else {
//            guard let data = data else {
//                //++ BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
////                LoadingView.shared.hideOverlayView()
////            //-- BUG0050-SPJ (NguyenPT 20170323) Handle result string
////                self.view.showAlert(message: DomainConst.CONTENT00196)
////                BaseModel.shared.setErrorDetail(detail: (error?.localizedDescription)!)
////                self.handleErrorTask()
//                if let err = error?.localizedDescription {
//                    self.handleErrorTask(error: err)
//                }
//                
//                //-- BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
//                return
//            }
//            //++ BUG0082-SPJ (NguyenPT 20170510) Change BaseRequest handle completion mechanism
//            //++ BUG0050-SPJ (NguyenPT 20170323) Handle result string
//            // Convert to string
//            let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            print(dataString ?? DomainConst.BLANK)
//            //self.handleCompleteTask(model: dataString)
//            //-- BUG0050-SPJ (NguyenPT 20170323) Handle result string
//            if self.completionBlock != nil {
//                // Hide overlay
//                LoadingView.shared.hideOverlayView(className: self.theClassName)
//                // Call complete handler
//                DispatchQueue.main.async {
//                    self.completionBlock!(dataString)
//                }
//            } else {
//                self.handleCompleteTask(model: dataString)
//            }
//            //-- BUG0082-SPJ (NguyenPT 20170510) Change BaseRequest handle completion mechanism
            if error != nil {
                if let err = error?.localizedDescription {
                    self.handleErrorTask(error: err)
                }
            } else {
                if let usableData = data {
                    let dataString = NSString(data: usableData, encoding: String.Encoding.utf8.rawValue)
                    print(dataString ?? DomainConst.BLANK)
                    if self.completionBlock != nil {
                        // Hide overlay
                        LoadingView.shared.hideOverlayView(className: self.theClassName)
                        // Call complete handler
                        DispatchQueue.main.async {
                            self.completionBlock!(dataString)
                        }
                    } else {
                        self.handleCompleteTask(model: dataString)
                    }
                }
            }
        })
        return task
    }
    
    /**
     * Show alert when connection has error.
     * - parameter message: Message string
     */
    public func showAlert(message: String) {
        // Hide overlay
        LoadingView.shared.hideOverlayView(className: self.theClassName)
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
        LoadingView.shared.hideOverlayView(className: self.theClassName)
        // Call complete handler
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
            // Remove observer
            NotificationCenter.default.removeObserver(self.view, name: Notification.Name(rawValue: self.theClassName), object: nil)
        }
    }
    
    //++ BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
    /**
     * Handle when error happen
     * - parameter error: Error content, default is blank
     */
    //++ BUG0146-SPJ (NguyenPT 20170817) Handle error: request to server create log
    //public func handleErrorTask() {
    public func handleErrorTask(error: String = DomainConst.BLANK) {
        BaseModel.shared.setErrorDetail(detail: error)
        if self.url != DomainConst.PATH_SUPPORT_APPLOG {
            //CreateErrorLogRequest.request(action: #selector(finishCreateErrorLog(_:)), view: self.view, msg: error)
        }
    //-- BUG0146-SPJ (NguyenPT 20170817) Handle error: request to server create log
        LoadingView.shared.hideOverlayView(className: self.theClassName)
        //self.view.showAlert(message: DomainConst.CONTENT00196)
        
        //++ BUG0156-SPJ (NguyenPT 20170930) Re-design Gas24h
//        self.view.showAlert(
//            message: DomainConst.CONTENT00196,
//            okHandler: {
//                alert in
//                self.execute()
//        },
//            cancelHandler: {
//                alert in
//        
//        })
//        if isShowError {
//            self.view.showAlert(
//                message: DomainConst.CONTENT00196,
//                okHandler: {
//                    alert in
//                    // Reload data
//                    // Update setting
//                    // Re-execute
//                    self.execute()
//            },
//                cancelHandler: {
//                    alert in
//                    
//            })
//        } else {
//            self.execute(isShowLoadingView: false)
//        }
        //-- BUG0156-SPJ (NguyenPT 20170930) Re-design Gas24h
        
        DispatchQueue.main.async {
            let model = BaseRespModel.createFailedJson(msg: error)
            NotificationCenter.default.post(name: Notification.Name(rawValue: self.theClassName), object: model)
            // Remove observer
            NotificationCenter.default.removeObserver(self.view, name: Notification.Name(rawValue: self.theClassName), object: nil)
        }
    }
    //-- BUG0099-SPJ (NguyenPT 20170601) Handle when error happen
    
    internal func finishCreateErrorLog(_ notification: Notification) {
        
    }
    
    //++ BUG0156-SPJ (NguyenPT 20170930) Re-design Gas24h
    /**
     * Set value of flag show error
     * - parameter value: Value of flag
     */
    public func setFlagShowError(value: Bool) {
        self.isShowError = value
    }
    //-- BUG0156-SPJ (NguyenPT 20170930) Re-design Gas24h
    
    public static func cancel() {
        URLSession.shared.invalidateAndCancel()
    }
}

extension BaseRequest: URLSessionDelegate {
    
}
