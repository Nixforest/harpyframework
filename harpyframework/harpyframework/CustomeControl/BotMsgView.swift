//
//  BotMsgView.swift
//  harpyframework
//
//  Created by SPJ on 11/28/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class BotMsgView: UIView {
    // MARK: Properties
    /** Button collapse */
    var _btnCollapse:       UIButton    = UIButton()
    /** Table view */
    var _tblView:           UITableView     = UITableView()
    /** Flag collapsed */
    var _isCollapsed:       Bool        = true
    /** Type of content */
    var _listType:          [BottomMsgCellTypeEnum] = [BottomMsgCellTypeEnum]()
    
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
    
    // MARK: Logic
    /**
     * Check if this view is collapsed
     * - returns: True if this view is collapsed, False otherwise
     */
    public func isCollapsed() -> Bool {
        return _isCollapsed
    }
    /**
     * Show/Hide this view
     */
    public func showHide() {
        self._isCollapsed = !self._isCollapsed
        showHide(isShow: !self._isCollapsed)
    }
    
    /**
     * Show/Hide this view
     * - parameter isShow: Flag show or hide
     * - parameter isRotate: Flag need rotate button collapse
     */
    public func showHide(isShow: Bool, isRotate: Bool = true) {
        let duration = 0.5
        var rotateAngle: CGFloat = 1.0
        if !isShow {
            rotateAngle = -1.0
        }
        // If flag is on
        if isRotate {
            // Rotate button collapse
            UIView.animate(withDuration: duration, animations: {
                self._btnCollapse.layer.transform = CATransform3DConcat(
                    self._btnCollapse.layer.transform,
                    CATransform3DMakeRotation(CGFloat(M_PI), rotateAngle, 0.0, 0.0))
            })
        }
        // Get current device type
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:        // iPhone
            UIView.animate(withDuration: duration, animations: {
                self.updateLayoutHD(isShow: isShow)
            })
            break
        case .pad:          // iPad
            switch UIApplication.shared.statusBarOrientation {
            case .portrait, .portraitUpsideDown:        // Portrait
                UIView.animate(withDuration: duration, animations: {
                    self.updateLayoutFHD(isShow: isShow)
                })
                break
            case .landscapeLeft, .landscapeRight:       // Landscape
                UIView.animate(withDuration: duration, animations: {
                    self.updateLayoutFHD_L(isShow: isShow)
                })
                break
            default:
                break
            }
            break
        default:
            break
        }
    }
    
    // MARK: Event handlers
    /**
     * Handle when tap on collapse button
     */
    internal func btnCollapsedTappedHandler(_ sender: AnyObject) {
        showHide()
    }
    
    /**
     * Handle when tap on actions buttons
     * - parameter sender: Button object
     */
    internal func handleTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        showHide()
    }
    
    /**
     * Handle when tap on actions buttons
     * - parameter sender: Button object
     */
    internal func handleSwipe(_ gestureRecognizer: UIGestureRecognizer) {
        if let swipeGesture = gestureRecognizer as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.up:
                if self._isCollapsed {
                    self._isCollapsed = false
                    showHide(isShow: !self._isCollapsed)
                }
                
                break
            case UISwipeGestureRecognizerDirection.down:
                if !self._isCollapsed {
                    self._isCollapsed = true
                    showHide(isShow: !self._isCollapsed)
                }
                
                break
            default:
                break
            }
        }
    }
    
    // MARK: Create layout
    /**
     * Create layout for this view
     * - parameter width:   Width of view
     * - parameter height:  Height of view
     * - parameter yPos:    Y position
     */
    public func createLayout(width: CGFloat, height: CGFloat, yPos: CGFloat) {
        self.frame = CGRect(x: (UIScreen.main.bounds.width - width) / 2,
                                  y: yPos,
                                  width: width,
                                  height: height)
        if BaseModel.shared.checkTrainningMode() {
            self.backgroundColor = GlobalConst.PROMOTION_BKG_COLOR
        } else {
            self.backgroundColor = UIColor(white: 1, alpha: 0)
        }
        
        self.layer.cornerRadius = GlobalConst.BOTTOM_MSG_VIEW_CORNER_RADIUS
        createCollapseButton(width: width)
        // Handle event
        let tappedRecog = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTapped(_:)))
        let swipeTop = UISwipeGestureRecognizer(target: self,
                                                action: #selector(handleSwipe(_:)))
        swipeTop.direction = .up
        let swipeBot = UISwipeGestureRecognizer(target: self,
                                                action: #selector(handleSwipe(_:)))
        swipeBot.direction = .down
        
        // Add children views and gesture
        self.addGestureRecognizer(tappedRecog)
        self.addGestureRecognizer(swipeTop)
        self.addGestureRecognizer(swipeBot)
        self.addSubview(_btnCollapse)
    }
    
    /**
     * Update layout for view
     * - parameter y:    Y position
     * - parameter w:   Width of view
     * - parameter h:  Height of view
     */
    public func updateLayout(y: CGFloat, w: CGFloat, h: CGFloat) {
        CommonProcess.updateViewPos(
            view: self,
            x: (UIScreen.main.bounds.width - w) / 2,
            y: y,
            w: w, h: h)
        updateCollapseButton(width: w)
    }
    
    /**
     * Update bottom message view in HD mode
     * - parameter isShow: Flag show/hide
     */
    public func updateLayoutHD(isShow: Bool = true) {
        if isShow {
            updateLayout(
                y: GlobalConst.NAVIGATION_BAR_HEIGHT,
                w: UIScreen.main.bounds.width,
                h: UIScreen.main.bounds.height - GlobalConst.NAVIGATION_BAR_HEIGHT)
        } else {
            updateLayout(
                y: UIScreen.main.bounds.height - BaseViewController.BOTTOM_MSG_REAL_HEIGHT_HD,
                w: BaseViewController.BOTTOM_MSG_REAL_WIDTH_HD,
                h: BaseViewController.BOTTOM_MSG_FULL_HEIGHT)
        }
    }
    
    /**
     * Update bottom message view in Full HD mode
     * - parameter isShow: Flag show/hide
     */
    public func updateLayoutFHD(isShow: Bool = true) {
        if isShow {
            updateLayout(
                y: GlobalConst.NAVIGATION_BAR_HEIGHT,
                w: UIScreen.main.bounds.width,
                h: UIScreen.main.bounds.height - GlobalConst.NAVIGATION_BAR_HEIGHT)
        } else {
            updateLayout(
                y: UIScreen.main.bounds.height - BaseViewController.BOTTOM_MSG_REAL_HEIGHT_FHD,
                w: BaseViewController.BOTTOM_MSG_REAL_WIDTH_FHD,
                h: BaseViewController.BOTTOM_MSG_FULL_HEIGHT)
        }
    }
    
    /**
     * Update bottom message view in Full HD Landscape mode
     * - parameter isShow: Flag show/hide
     */
    public func updateLayoutFHD_L(isShow: Bool = true) {
        if isShow {
            updateLayout(
                y: GlobalConst.NAVIGATION_BAR_HEIGHT + GlobalConst.MARGIN,
                w: BaseViewController.BOTTOM_MSG_REAL_WIDTH_FHD_L,
                h: BaseViewController.BOTTOM_MSG_FULL_HEIGHT)
        } else {
            updateLayout(
                y: UIScreen.main.bounds.height - BaseViewController.BOTTOM_MSG_REAL_HEIGHT_FHD_L / 2,
                w: BaseViewController.BOTTOM_MSG_REAL_WIDTH_FHD_L,
                h: BaseViewController.BOTTOM_MSG_FULL_HEIGHT)
        }
    }
    
    // MARK: Collapse button
    /**
     * Create collapse button
     * - parameter width:   Width of view
     */
    private func createCollapseButton(width: CGFloat) {
        let btnSize = GlobalConst.LABEL_H
        _btnCollapse.frame = CGRect(
            x: (width - btnSize) / 2,
            y: 0,
            width: btnSize,
            height: btnSize)
        
        let back = ImageManager.getImage(named: DomainConst.COLLAPSE_BUTTON_ICON_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        _btnCollapse.setImage(tintedBack, for: UIControlState())
        _btnCollapse.tintColor = GlobalConst.MAIN_COLOR_GAS_24H
        _btnCollapse.backgroundColor = UIColor.clear
        _btnCollapse.imageView?.contentMode = .scaleAspectFit
        _btnCollapse.layer.transform = CATransform3DConcat(
            _btnCollapse.layer.transform,
            CATransform3DMakeRotation(CGFloat(M_PI), 1.0, 0.0, 0.0))
        _btnCollapse.addTarget(self, action: #selector(btnCollapsedTappedHandler(_:)),
                              for: .touchUpInside)
    }
    
    /**
     * Update collapse button
     * - parameter width:   Width of view
     */
    private func updateCollapseButton(width: CGFloat) {
        let btnSize = GlobalConst.LABEL_H
        CommonProcess.updateViewPos(
            view: _btnCollapse,
            x: (width - btnSize) / 2,
            y: 0,
            w: btnSize,
            h: btnSize)
    }
    
    /**
     * Create table view
     * - parameter width:   Width of parent view
     * - parameter height:   height of parent view
     */
    private func createTableView(width: CGFloat, height: CGFloat) {
        let yPos = _btnCollapse.frame.height + GlobalConst.MARGIN_CELL_Y
        _tblView.frame = CGRect(
            x: 0, y: yPos,
            width: width,
            height: height - yPos)
        let bundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        _tblView.register(UINib(nibName: BottomMsgCell.theClassName, bundle: bundle),
                          forCellReuseIdentifier: BottomMsgCell.theClassName)
        _tblView.dataSource = self
    }
    
    /**
     * Update table view
     * - parameter width:   Width of parent view
     * - parameter height:   height of parent view
     */
    private func updateTableView(width: CGFloat, height: CGFloat) {
        let yPos = _btnCollapse.frame.height + GlobalConst.MARGIN_CELL_Y
        CommonProcess.updateViewPos(
            view: _tblView,
            x: 0, y: yPos,
            w: width, h: height - yPos)
        _tblView.reloadData()
    }
}

// MARK: Protocol - UITableViewDataSource
extension BotMsgView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _listType.count
    }
    
    /**
     * Asks the data source for a cell to insert in a particular location of the table view.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= _listType.count {
            return UITableViewCell()
        }
        var cell = UITableViewCell()
        
        switch _listType[indexPath.row] {
        case .shareCode:
            break
        case .usingCode:
            break
        case .news:
            break
        default:
            break
        }
        
        return cell
    }
    
    /**
     * Asks the delegate for the height to use for a row in a specified location.
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
