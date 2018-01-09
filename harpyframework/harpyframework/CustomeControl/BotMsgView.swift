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
    /** Label note */
    var _lblNote:           UILabel     = UILabel()
    /** Table view */
    var _tblView:           UITableView     = UITableView()
    /** Flag collapsed */
    var _isCollapsed:       Bool        = true
    /** Type of content */
    var _listData:          [(BottomMsgCellTypeEnum, AnyObject)] = [(BottomMsgCellTypeEnum, AnyObject)]()
    /** Handle event */
    let _tappedRecog = UITapGestureRecognizer(
        target: self,
        action: #selector(handleTapped(_:)))
    
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
        _tblView.reloadData()
    }
    
    /**
     * Set text for note label
     * - parameter text: Note text
     */
    public func setLabelText(text: String) {
        self._lblNote.text = text
    }
    
    /**
     * Update data for this view
     * - parameter data: List of data
     */
    public func updateData(data: [(BottomMsgCellTypeEnum, AnyObject)]) {
        _listData.removeAll()
        _listData.append(contentsOf: data)
        _tblView.reloadData()
    }
    
    /**
     * Set bottom message color
     * - parameter lstString: List of sub strings
     */
    public func setBotMsgColor(lstString: [String]) {
        var colors: [UIColor] = [UIColor]()
        for _ in lstString {
            colors.append(GlobalConst.MAIN_COLOR_GAS_24H)
        }
        CommonProcess.makeMultiColorLabel(lbl: _lblNote,
                                          lstString: lstString, colors: colors)
    }
    
    // MARK: Event handlers
    /**
     * Handle when tap on collapse button
     */
    internal func btnCollapsedTappedHandler(_ sender: AnyObject) {
        showHide()
    }
    
    /**
     * Handle when tap on view
     * - parameter gestureRecognizer: Gesture
     */
    internal func handleTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        showHide()
    }
    
    /**
     * Handle dragged view
     */
    internal func draggedView(_ sender: UIPanGestureRecognizer) {
        if let currentVC = BaseViewController.getCurrentViewController() {
            let translation = sender.translation(in: currentVC.view)
            switch sender.state {
            case .began:
                break
            case .cancelled:
                break
            case .changed:
                self.center = CGPoint(
                    x: self.center.x,
                    y: self.center.y + translation.y)
                break
            case .ended:
                if _isCollapsed {
                    // Handle when view is collapsed
                    if (self.center.y + translation.y) > UIScreen.main.bounds.height * 5 / 4 {
                        showHide(isShow: false, isRotate: false)
                    } else {
                        showHide()
                    }
                } else {
                    // Handle when view is not collapsed
                    if (self.center.y + translation.y) > UIScreen.main.bounds.height / 4 {
                        showHide()
                    } else {
                        showHide(isShow: true, isRotate: false)
                    }
                }
                break
            case .failed:
                break
            case .possible:
                break
            default:
                break
            }
            sender.setTranslation(CGPoint.zero, in: currentVC.view)
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
//        if BaseModel.shared.checkTrainningMode() {
//            self.backgroundColor = GlobalConst.PROMOTION_BKG_COLOR
//        } else {
//            self.backgroundColor = UIColor(white: 1, alpha: 0)
//        }
        self.backgroundColor = GlobalConst.PROMOTION_BKG_COLOR
        
        self.layer.cornerRadius = GlobalConst.BOTTOM_MSG_VIEW_CORNER_RADIUS
        createCollapseButton(width: width)
        createNoteLabel(width: width)
        createTableView(width: width, height: height)
        // Pan gesture
        let panGesture = UIPanGestureRecognizer(target: self,
                                                action: #selector(draggedView(_:)))
        
        // Add children views and gesture
        self.addGestureRecognizer(_tappedRecog)
        self.addGestureRecognizer(panGesture)
        self.addSubview(_btnCollapse)
        self.addSubview(_lblNote)
        self.addSubview(_tblView)
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
        updateNoteLabel(width: w)
        updateTableView(width: w, height: h)
        if _isCollapsed {
            self.addGestureRecognizer(_tappedRecog)
        } else {
            self.removeGestureRecognizer(_tappedRecog)
        }
        _tblView.reloadData()
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
                w: BaseViewController.BOTTOM_MSG_REAL_WIDTH_FHD,
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
        let btnSize = GlobalConst.LABEL_H * 1.5
        _btnCollapse.frame = CGRect(
            x: (width - btnSize) / 2,
            y: 0,
            width: btnSize,
            height: btnSize)
        
        let back = ImageManager.getImage(named: DomainConst.COLLAPSE_BUTTON_ICON_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        _btnCollapse.setImage(tintedBack, for: UIControlState())
        _btnCollapse.tintColor = GlobalConst.MAIN_COLOR_GAS_24H
        _btnCollapse.backgroundColor = GlobalConst.PROMOTION_BKG_COLOR
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
        let btnSize = GlobalConst.LABEL_H * 1.5
        CommonProcess.updateViewPos(
            view: _btnCollapse,
            x: (width - btnSize) / 2,
            y: 0,
            w: btnSize,
            h: btnSize)
    }
    
    // MARK: Lable note
    /**
     * Create note label
     */
    private func createNoteLabel(width: CGFloat) {
        var height = GlobalConst.LABEL_H * 2
        if !_isCollapsed {
            height = 0
        }
        _lblNote.frame = CGRect(x: 0, y: _btnCollapse.frame.maxY,
                               width: width,
                               height: height)
        _lblNote.textColor = UIColor.black
        _lblNote.textAlignment = .center
        _lblNote.adjustsFontSizeToFitWidth = true
        _lblNote.font = GlobalConst.BASE_FONT
        _lblNote.numberOfLines = 0
    }
    
    /**
     * Update note label
     */
    private func updateNoteLabel(width: CGFloat) {
        var height = GlobalConst.LABEL_H * 2
        if !_isCollapsed {
            height = 0
        }
        CommonProcess.updateViewPos(
            view: _lblNote,
            x: 0, y: _btnCollapse.frame.maxY,
            w: width,
            h: height)
    }
    
    // MARK: Table view
    /**
     * Create table view
     * - parameter width:   Width of parent view
     * - parameter height:   height of parent view
     */
    private func createTableView(width: CGFloat, height: CGFloat) {
        let yPos = _lblNote.frame.maxY + GlobalConst.MARGIN_CELL_X
        _tblView.frame = CGRect(
            x: 0, y: yPos,
            width: width,
            height: height - yPos)
        _tblView.backgroundColor = UIColor.clear
        let bundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        _tblView.register(UINib(nibName: BottomMsgCell.theClassName, bundle: bundle),
                          forCellReuseIdentifier: BottomMsgCell.theClassName)
        _tblView.dataSource = self
        _tblView.delegate = self
    }
    
    /**
     * Update table view
     * - parameter width:   Width of parent view
     * - parameter height:   height of parent view
     */
    private func updateTableView(width: CGFloat, height: CGFloat) {
        let yPos = _lblNote.frame.maxY + GlobalConst.MARGIN_CELL_X
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
        return _listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= _listData.count {
            return UITableViewCell()
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: BottomMsgCell.theClassName) as! BottomMsgCell
        
        cell.setData(data: _listData[indexPath.row])
        
        return cell
    }
}

// MARK: Protocol - UITableViewDelegate
extension BotMsgView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BottomMsgCell.getHeight(type: _listData[indexPath.row].0)
    }
}
