//
//  BaseNewsViewController.swift
//  harpyframework
//
//  Created by SPJ on 11/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class BaseNewsViewController: ParentExtViewController {
    // MARK: Properties
    /** Title label */
    var _lblTitle:              UILabel         = UILabel()
    /** Web view */
    var _webView:               UIWebView       = UIWebView()
    /** Title */
    var _title:                 String          = String()
    /** Id */
    var _id:                    String          = String()
    

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationBar(title: DomainConst.HOTLINE)
        
        NewsRequest.request(action: #selector(setData(_:)),
                            view: self,
                            id: self._id)
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
        createTitle()
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
        self.view.addSubview(_lblTitle)
        self.view.addSubview(_webView)
    }
    
    /**
     * Update children views
     */
    override public func updateChildrenViews() {
        super.updateChildrenViews()
        updateTitle()
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
            _lblTitle.text = model.getRecord().id
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
    
    // MARK: Layout
    // MARK: Title label
    /**
     * Create title bale
     */
    private func createTitle() {
        _lblTitle.frame = CGRect(
            x: GlobalConst.MARGIN, y: getTopHeight(),
            width: UIScreen.main.bounds.width - GlobalConst.MARGIN * 2,
            height: GlobalConst.LABEL_H * 3)
        _lblTitle.textColor = GlobalConst.MAIN_COLOR_GAS_24H
        _lblTitle.textAlignment = .center
        _lblTitle.lineBreakMode = .byWordWrapping
        _lblTitle.font = GlobalConst.BASE_FONT
    }
    
    /**
     * Update title label
     */
    private func updateTitle() {
        CommonProcess.updateViewPos(
            view: _lblTitle,
            x: GlobalConst.MARGIN, y: getTopHeight(),
            w: UIScreen.main.bounds.width - GlobalConst.MARGIN * 2,
            h: GlobalConst.LABEL_H * 3)
    }
    
    // MARK: Web view
    /**
     * Create web view
     */
    private func createWebView() {
        let yPos = _lblTitle.frame.maxY
        _webView.frame = CGRect(
            x: 0,
            y: yPos,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height - yPos)
    }
    
    /**
     * Update web view
     */
    private func updateWebView() {
        let yPos = _lblTitle.frame.maxY
        CommonProcess.updateViewPos(
            view: _webView,
            x: 0, y: yPos,
            w: UIScreen.main.bounds.width,
            h: UIScreen.main.bounds.height - yPos)
    }
}
