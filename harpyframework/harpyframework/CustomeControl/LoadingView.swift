//
//  LoadingView.swift
//  project
//
//  Created by Nixforest on 9/24/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class LoadingView{
    /** Overlay view */
    var overlayView = UIView()
    /** Activity indicator */
    var activityIndicator = UIActivityIndicatorView()
    /** Overlay label */
    var lblTitle = UILabel()
    /** Flag status */
    var isShowing = false
    /** Instance */
    public static let shared: LoadingView = {
        let instance = LoadingView()
        return instance
    }()
    
    //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//    /**
//     * Show overlay view
//     * - parameter view: Parent view
//     */
//    public func showOverlay1(view: UIView) {
//        // Create overlay vew
//        overlayView.frame = CGRect(x: 0, y: 0, width: GlobalConst.SCREEN_WIDTH, height: GlobalConst.SCREEN_HEIGHT)
//        overlayView.center = view.center
//        overlayView.backgroundColor = UIColor(white: 0x444444, alpha: 0.7)
//        overlayView.clipsToBounds = true
//        overlayView.layer.cornerRadius = 10
//        
//        // Create indicator
//        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//        activityIndicator.activityIndicatorViewStyle = .whiteLarge
//        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
//        
//        // Add indicator into overlay view
//        overlayView.addSubview(activityIndicator)
//        
//        // Add overlay view to main view (cross-thread)
//        DispatchQueue.main.async {
//            view.addSubview(self.overlayView)
//        }
//        //view.addSubview(overlayView)
//        // Run animating
//        activityIndicator.startAnimating()
//    }
//    
//    /**
//     * Show overlay view
//     */
//    public func showOverlay1() {
//        var currentView: UIViewController? = nil
//        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
//            currentView = navigationController.visibleViewController
//            // Create overlay vew
//            overlayView.frame = CGRect(x: 0, y: 0, width: GlobalConst.SCREEN_WIDTH, height: GlobalConst.SCREEN_HEIGHT)
//            overlayView.center = (currentView?.view.center)!
//            overlayView.backgroundColor = UIColor(white: 0x444444, alpha: 0.7)
//            overlayView.clipsToBounds = true
//            overlayView.layer.cornerRadius = 10
//            
//            // Create indicator
//            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//            activityIndicator.activityIndicatorViewStyle = .whiteLarge
//            activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
//            
//            // Add indicator into overlay view
//            overlayView.addSubview(activityIndicator)
//            
//            // Add overlay view to main view (cross-thread)
//            DispatchQueue.main.async {
//                currentView?.view.addSubview(self.overlayView)
//            }
//            //view.addSubview(overlayView)
//            // Run animating
//            activityIndicator.startAnimating()
//        }
//    }
    //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
    
    /**
     * Show overlay
     * - parameter view: Current view
     */
    public func showOverlay(view: UIView = UIView()) {
        if self.isShowing {
            return
        } else {
            self.isShowing = !self.isShowing
        }
        //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//        var currentView: UIViewController? = nil
//        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
//            currentView = navigationController.visibleViewController
        let currentView = BaseViewController.getCurrentViewController()
        //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
            lblTitle = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
            lblTitle.text = "Đang tải"
            lblTitle.textColor = UIColor.white
            overlayView = UIView(frame: CGRect(x: 0, y: 0, width: GlobalConst.SCREEN_WIDTH, height: GlobalConst.SCREEN_HEIGHT))
            overlayView.layer.cornerRadius = 15
            overlayView.backgroundColor = UIColor(white: 0, alpha: 0.7)
            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
            activityIndicator.frame = CGRect(x: (overlayView.bounds.width - 50) / 2,
                                             y: (overlayView.bounds.height - 50) / 2, width: 50, height: 50)
            activityIndicator.startAnimating()
            overlayView.addSubview(activityIndicator)
            overlayView.addSubview(lblTitle)
            // Add overlay view to main view (cross-thread)
            DispatchQueue.main.async {
                //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
                //currentView?.view.addSubview(self.overlayView)
                currentView.view.addSubview(self.overlayView)
                //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
            }
            // If this view run about 30s, turn it off
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(30000)) {
                self.hideOverlayView()
            }
        //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//        }
        //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
    }
    
    /**
     * Hide overlay view
     */
    public func hideOverlayView() {
        if !self.isShowing {
            return
        } else {
            self.isShowing = !self.isShowing
        }
        // Stop animating
        activityIndicator.stopAnimating()
        
        // Remove overlay view from main view (cross-thread)
        DispatchQueue.main.async {
            self.overlayView.removeFromSuperview()
        }
    }
}
