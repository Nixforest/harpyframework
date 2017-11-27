//
//  BaseNewsViewController.swift
//  harpyframework
//
//  Created by SPJ on 11/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class BaseNewsViewController: ChildExtViewController {
    // MARK: Properties
    /** Web view */
    var _webView:               UIWebView       = UIWebView()
    /** Title */
    var _title:                 String          = String()
    /** Id */
    var _id:                    String          = String()
    

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationBar(title: _title)
        
        
        NewsRequest.request(action: #selector(setData(_:)),
                            view: self,
                            id: self._id)
        
        self.view.addSubview(_webView)
    }
    
    /**
     * Handle update constants
     */
    override public func updateConst() {
        super.updateConst()
    }
    
    /**
     * Create children views
     */
    override public func createChildrenViews() {
        super.createChildrenViews()
        createWebView()
        // Get current device type
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:        // iPhone
            break
        case .pad:          // iPad
            switch UIApplication.shared.statusBarOrientation {
            case .portrait, .portraitUpsideDown:        // Portrait
                break
            case .landscapeLeft, .landscapeRight:       // Landscape
                break
            default:
                break
            }
            
            break
        default:
            break
        }
        self.view.addSubview(_webView)
    }
    
    /**
     * Update children views
     */
    override public func updateChildrenViews() {
        super.updateChildrenViews()
        updateWebView()
        // Get current device type
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:        // iPhone
            break
        case .pad:          // iPad
            switch UIApplication.shared.statusBarOrientation {
            case .portrait, .portraitUpsideDown:        // Portrait
                break
            case .landscapeLeft, .landscapeRight:       // Landscape
                break
            default:
                break
            }
            
            break
        default:
            break
        }
    }
    
    override public func setData(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = NewsRespModel(jsonString: data)
        if model.isSuccess() {
            _webView.loadHTMLString(model.getRecord().name, baseURL: nil)
        } else {
            //
        }
    }
    
    /**
     * Set data
     * - parameter title:       Title of view controller
     * - parameter id:          Id of view controller
     */
    public func setData(title: String, id: String) {
        self._title = title
        self._id    = id
    }
    // MARK: Information table view
    private func createWebView() {
        _webView.frame = CGRect(
            x: 0,
            //            y: getTopHeight(),
            y: 0,
            width: UIScreen.main.bounds.width,
            //            height: UIScreen.main.bounds.height - getTopHeight()
            height: UIScreen.main.bounds.height)
    }
    
    private func updateWebView() {
        CommonProcess.updateViewPos(
            view: _webView,
            x: 0, y: 0,
            w: UIScreen.main.bounds.width,
            h: UIScreen.main.bounds.height)
    }
}
