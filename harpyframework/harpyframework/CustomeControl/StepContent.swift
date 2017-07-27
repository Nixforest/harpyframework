//
//  StepContent.swift
//  project
//
//  Created by Nixforest on 10/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

open class StepContent: UIView {
    // MARK: Properties
    /** Step done delegate */
    public var stepDoneDelegate: StepDoneDelegate?
    /** Title */
    var _lblTitle: UILabel          = UILabel()
    /** Scroll view */
    var _scrollView: UIScrollView   = UIScrollView()
    /** Main view */
    var _mainView: UIView?
    /** Parent */
    var _parent: BaseViewController?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: Methods
    /**
     * Default initializer.
     */
    public init() {
        super.init(frame: UIScreen.main.bounds)
        return
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /**
     * Setup layout for content view
     * - parameter mainView: Main view
     */
    open func setup(mainView: UIView, title: String, contentHeight: CGFloat,
               width: CGFloat, height: CGFloat) {
        self.frame = CGRect(
            x: 0, y: 0,
            width: width, height: height)
        // Label title
        _lblTitle.translatesAutoresizingMaskIntoConstraints = true
        _lblTitle.frame = CGRect(
            x: 0,
            y: 0,
            width: self.frame.width,
            height: GlobalConst.LABEL_HEIGHT)
        _lblTitle.text               = title
        _lblTitle.textAlignment      = NSTextAlignment.center
        //_lblTitle.font               = UIFont.boldSystemFont(ofSize: 15.0)
        _lblTitle.font               = UIFont.systemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE)
        self.addSubview(_lblTitle)
        
        // Main view
        var mainViewHeight: CGFloat = 0
        if contentHeight < (self.frame.height - _lblTitle.frame.height) {
            mainViewHeight = self.frame.height - _lblTitle.frame.height
        } else {
            mainViewHeight = contentHeight
        }
        _mainView = mainView
        _mainView?.translatesAutoresizingMaskIntoConstraints = true
        _mainView?.frame = CGRect(
            x: 0, y: 0,
            width: self.frame.width,
            height: mainViewHeight)
        
        // Scrollview
        _scrollView.translatesAutoresizingMaskIntoConstraints = true
        _scrollView.frame = CGRect(
            x: 0,
            y: _lblTitle.frame.maxY,
            width: self.frame.width,
            height: self.frame.height - _lblTitle.frame.height)
        _scrollView.contentSize = CGSize(
            width: (_mainView?.frame.width)!,
            height: (_mainView?.frame.height)!)
        _scrollView.addSubview(_mainView!)
        
        self.addSubview(_scrollView)
        self.makeComponentsColor()
        _mainView?.makeComponentsColor()
    }
    
    /**
     * Check if input data on this step is Done
     * - returns: True if inputted data, False otherwise
     */
    open func checkDone() -> Bool {
        return true
    }
    
    /**
     * Set parent view
     * - parameter parent: Parent view to set
     */
    public func setParentView(parent: BaseViewController) {
        self._parent = parent
    }
    
    /**
     * Get parent view
     * - returns: Parent view
     */
    public func getParentView() -> BaseViewController {
        return self._parent!
    }
    
    /**
     * Handle show alert message
     * - parameter message: Message content
     */
    public func showAlert(message: String) {
        self._parent?.showAlert(message: message)
    }
    
    /**
     * Get height of title
     * - returns: Height of title label
     */
    public func getTitleHeight() -> CGFloat {
        return self._lblTitle.frame.height
    }
    
    /**
     * Get title of content
     * - returns: Title string
     */
    public func getTitleText() -> String {
        if let title = self._lblTitle.text {
            return title
        }
        return DomainConst.BLANK
    }
    
    //++ BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    /**
     * Get scroll view
     * - returns: Scrollview
     */
    public func getScrollView() -> UIScrollView {
        return self._scrollView
    }
    //-- BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    //++ BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    /**
     * Set title for this step
     * - parameter title: Tile value
     */
    public func setTitle(title: String) {
        _lblTitle.text = title
    }
    //-- BUG0093-SPJ (NguyenPT 20170520) Add new function G09
}
