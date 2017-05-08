//
//  StepSummary.swift
//  project
//
//  Created by Nixforest on 10/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

open class StepSummary: UIView {
    // MARK: Properties
    /** Title */
    var _tbxTitle: UITextView       = UITextView()
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
     * - parameter mainView:        Main view
     * - parameter title:           Title
     * - parameter contentHeight:   Height of content
     * - parameter width:           Width of view
     * - parameter height:          Height of view
     */
    open func setup(mainView: UIView, title: String, contentHeight: CGFloat,
                    width: CGFloat, height: CGFloat, reCalculate: Bool = false) {
        self.frame = CGRect(
            x: 0, y: 0,
            width: width, height: height)
        // Label title
        _tbxTitle.translatesAutoresizingMaskIntoConstraints = true
        _tbxTitle.text               = title
        //_tbxTitle.textAlignment      = NSTextAlignment.center
        //_tbxTitle.font               = UIFont.boldSystemFont(ofSize: 15.0)
        _tbxTitle.font               = UIFont.systemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE)
        _tbxTitle.frame = CGRect(x: 0, y: 0,
                                 width: self.frame.width,
                                 height: GlobalConst.LABEL_HEIGHT)
        _tbxTitle.isUserInteractionEnabled = false
        let contentSize             = _tbxTitle.sizeThatFits(_tbxTitle.bounds.size)
        var frame                   = _tbxTitle.frame
        frame.size.height           = contentSize.height
        _tbxTitle.frame             = frame
        //_tbxTitle.backgroundColor   = GlobalConst.BACKGROUND_COLOR_GRAY
        self.addSubview(_tbxTitle)
        
        // Main view
        var mainViewHeight: CGFloat = 0
        if contentHeight < (self.frame.height - _tbxTitle.frame.height) {
            mainViewHeight = self.frame.height - _tbxTitle.frame.height
        } else {
            mainViewHeight = contentHeight
        }
        // Recalculate
        if reCalculate {
            mainViewHeight -= _tbxTitle.frame.height
        }
        _mainView = mainView
        _mainView?.translatesAutoresizingMaskIntoConstraints = true
        _mainView?.frame = CGRect(x: 0, y: 0,
                                  width: self.frame.width - GlobalConst.MARGIN_CELL_X * 2,
                                  height: mainViewHeight)
        
        // Scrollview
        _scrollView.translatesAutoresizingMaskIntoConstraints = true
        _scrollView.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                   y: _tbxTitle.frame.maxY,
                                    width: self.frame.width - GlobalConst.MARGIN_CELL_X * 2,
                                    height: self.frame.height - _tbxTitle.frame.height)
        _scrollView.contentSize = CGSize(width: (_mainView?.frame.width)!,
                                         height: (_mainView?.frame.height)!)
        CommonProcess.setBorder(view: _scrollView)
        _scrollView.backgroundColor = UIColor.white
        _scrollView.addSubview(_mainView!)
        self.addSubview(_scrollView)
    }
    
    /**
     * Update layout of view
     * - parameter contentHeight:   Height of content
     */
    open func updateLayout(contentHeight: CGFloat) {
        var mainViewHeight: CGFloat = 0
        if contentHeight < (self.frame.height - _tbxTitle.frame.height) {
            mainViewHeight = self.frame.height - _tbxTitle.frame.height
        } else {
            mainViewHeight = contentHeight
        }
        _mainView?.frame = CGRect(x: 0, y: 0,
                                  width: (_mainView?.frame.width)!,
                                  height: mainViewHeight)
        _scrollView.contentSize = CGSize(width: (_mainView?.frame.width)!,
                                         height: (_mainView?.frame.height)!)
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
    
    //++ BUG0050-SPJ (NguyenPT 20170331) Update Step Summary: Update content when show Summary
    /**
     * Update content layout
     * Must override in sub classes
     * - returns: Return offset (Height of content)
     */
    open func updateContentLayout() -> CGFloat {
        return 0.0
    }
    //-- BUG0050-SPJ (NguyenPT 20170331) Update Step Summary: Update content when show Summary
    
    /**
     * Get height of title
     * - returns: Height of title label
     */
    public func getTitleHeight() -> CGFloat {
        return self._tbxTitle.frame.height
    }
}
