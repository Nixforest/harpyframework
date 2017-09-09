//
//  LoadingView.swift
//  project
//
//  Created by Nixforest on 9/24/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
//++ BUG0155-SPJ (NguyenPT 20170909) Update loading view
//public class LoadingView: {
//    /** Overlay view */
//    var overlayView = UIView()
//    /** Activity indicator */
//    var activityIndicator = UIActivityIndicatorView()
//    /** Overlay label */
//    var lblTitle = UILabel()
public class LoadingView: UIViewController, NVActivityIndicatorViewable {
//-- BUG0155-SPJ (NguyenPT 20170909) Update loading view
    /** Flag status */
    var isShowing = false
    //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view
    /** Request stack */
    var requestStack: RequestStack  = RequestStack()
    //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view
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
    //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view
    //public func showOverlay(view: UIView = UIView()) {
    public func showOverlay(view: UIView = UIView(), className: String = DomainConst.BLANK) {
    //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        if self.isShowing {
            return
        } else {
            self.isShowing = !self.isShowing
        }
        
        //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        if !requestStack.isRequestStarted(className: className) {
            requestStack.startRequest(className: className)
        }
        //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        
        //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
        //++ BUG0155-SPJ (NguyenPT 20170909) Update loading view
//        var currentView: UIViewController? = nil
//        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
//            currentView = navigationController.visibleViewController
//        if let currentView = BaseViewController.getCurrentViewController() {
//        //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//            lblTitle = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 50))
//            //lblTitle.text = "Đang tải"
//            lblTitle.textColor = UIColor.white
//            overlayView = UIView(frame: CGRect(x: 0, y: 0, width: GlobalConst.SCREEN_WIDTH, height: GlobalConst.SCREEN_HEIGHT))
//            //overlayView.layer.cornerRadius = 15
//            overlayView.backgroundColor = UIColor(white: 0, alpha: 0.7)
//            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
//            activityIndicator.frame = CGRect(x: (overlayView.bounds.width - 50) / 2,
//                                             y: (overlayView.bounds.height - 50) / 2, width: 50, height: 50)
//            activityIndicator.startAnimating()
//            overlayView.addSubview(activityIndicator)
//            overlayView.addSubview(lblTitle)
//            // Add overlay view to main view (cross-thread)
//            DispatchQueue.main.async {
//                //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//                //currentView?.view.addSubview(self.overlayView)
//                //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view cover navigation bar
//                //currentView.view.addSubview(self.overlayView)
//                currentView.navigationController?.view.addSubview(self.overlayView)
//                //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view cover navigation bar
//                //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//            }
//            // If this view run about 30s, turn it off
//            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(30000)) {
//                //self.hideOverlayView()
//                self.hideOverlayView(className: className)
//            }
//        }
        self.startAnimatingLoading()
        // If this view run about 30s, turn it off
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(30000)) {
            self.stopAnimating()
        }
        
        //-- BUG0155-SPJ (NguyenPT 20170909) Update loading view
    }
    
    /**
     * Hide overlay view
     */
    public func hideOverlayView(className: String = DomainConst.BLANK) {
//        if !self.isShowing {
//            return
//        } else {
//            self.isShowing = !self.isShowing
//        }
        
        //++ BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        if requestStack.isStopLoading(className: className) {
            requestStack.endRequest(className: className)
            self.isShowing = !self.isShowing
        } else {
            return
        }
        //-- BUG0138-SPJ (NguyenPT 20170510) Handle loading view
        
        //++ BUG0155-SPJ (NguyenPT 20170909) Update loading view
//        // Stop animating
//        activityIndicator.stopAnimating()
//        
//        // Remove overlay view from main view (cross-thread)
        DispatchQueue.main.async {
//            self.overlayView.removeFromSuperview()
            self.stopAnimating()
        }
        //-- BUG0155-SPJ (NguyenPT 20170909) Update loading view
    }
    
    //++ BUG0155-SPJ (NguyenPT 20170909) Update loading view
    /**
     * Start animating loading
     */
    open func startAnimatingLoading() {
        let size = CGSize(width: GlobalConst.ANIMATING_LOADING_WIDTH,
                          height: GlobalConst.ANIMATING_LOADING_HEIGHT)
        
        startAnimating(size, message: DomainConst.BLANK, type: NVActivityIndicatorType(rawValue: CommonProcess.generateRandom(min: NVActivityIndicatorType.ballPulse.rawValue, max: NVActivityIndicatorType.audioEqualizer.rawValue))!)
    }
    //-- BUG0155-SPJ (NguyenPT 20170909) Update loading view
}
