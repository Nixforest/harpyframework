//
//  ScrollButtonList.swift
//  project
//
//  Created by Nixforest on 10/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
/**
 * Scrollable button list.
 */
class ScrollButtonList: UIScrollView {
    // MARK: Properties
    /** Button tap delegate */
    var btnTapDelegate: ScrollButtonListDelegate?
    /** Number of buttons */
    var _numberOfBtn    = 0
    /** List buttons */
    var _arrayBtn       = [UIButton]()
    /** Current active */
    var _currentActive  = -1
    /** List icon */
    var _listIcons = [String]()

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
    init() {
        super.init(frame: UIScreen.main.bounds);
        return;
    }
    
    /**
     * Setup layout for this control
     */
    func setup() {
        // List buttons
        for i in 0..<_numberOfBtn {
            let button = UIButton()
            if self._listIcons.count > i {
//                if i < (self._listIcons.count - 1) {
//                    let img = UIImage(named: self._listIcons[i])
//                    let tinted = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//                    button.setImage(tinted, for: UIControlState())
//                    button.tintColor = UIColor.white
//                } else {
//                    button.setImage(UIImage(named: self._listIcons[i]), for: UIControlState())
//                }
                button.setImage(ImageManager.getImage(named: self._listIcons[i]), for: UIControlState())
            } else {
                //button.setTitle(String(i + 1), for: .normal)
                //button.setTitleColor(UIColor.white , for: .normal)
            }
            button.translatesAutoresizingMaskIntoConstraints = true
            button.frame = CGRect(
                x: (self.frame.width - GlobalConst.SCROLL_BUTTON_LIST_HEIGHT) / 2 + (CGFloat)(i) * GlobalConst.SCROLL_BUTTON_LIST_HEIGHT,
                y: 0,
                width: GlobalConst.SCROLL_BUTTON_LIST_HEIGHT,
                height: GlobalConst.SCROLL_BUTTON_LIST_HEIGHT)
            button.tag = i
            button.layer.cornerRadius = 0.5 * GlobalConst.SCROLL_BUTTON_LIST_HEIGHT
            button.backgroundColor = GlobalConst.SCROLLBUTTONLIST_BTN_BKG_COLOR_DISABLE
            button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
            button.isEnabled = false
            self.addSubview(button)
            _arrayBtn.append(button)
        }
        
        // Layout for this control
        self.contentSize        = CGSize(
            width: self.frame.width + (CGFloat)(self._numberOfBtn - 1) * GlobalConst.SCROLL_BUTTON_LIST_HEIGHT,
            height: self.frame.height)
        //self.backgroundColor    = GlobalConst.SCROLLBUTTONLIST_BKG_COLOR
        //self.layer.borderWidth  = GlobalConst.BUTTON_BORDER_WIDTH
        self.contentOffset      = CGPoint(x: 0, y: 0)
        self.contentInset       = UIEdgeInsetsMake(0, 0, 0, 0)
        self.bounces            = true
        self.moveNext()
    }
    
    /**
     * Handle select button event.
     * - parameter sender: Button object
     */
    func btnTapped(_ sender: AnyObject) {
        btnTapDelegate?.selectButton(sender)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /**
     * Force move to specific button.
     * - parameter current: Button index
     */
    func moveTo(current: Int) {
        // Check if button index is valid (0 -> _numberOfBtn - 1)
        if ((current < _numberOfBtn) && (current >= 0)) {
            // Set current button to enable status
            _arrayBtn[_currentActive].backgroundColor = GlobalConst.SCROLLBUTTONLIST_BTN_BKG_COLOR_ENABLE
            // Assign value of current button index
            self._currentActive = current
            // Update layout
            update()
        }
    }
    
    /**
     * Move to next button
     * Call this method after finish setup layout
     */
    func moveNext() {
        // First time call -> Set first button is selecting
        if _currentActive == -1 {
            _currentActive += 1
            if _numberOfBtn > 0 {
                _arrayBtn[_currentActive].backgroundColor = GlobalConst.SCROLLBUTTONLIST_BTN_BKG_COLOR_SELECTING
            }
        } else if (_currentActive < (_numberOfBtn - 1)) {
            // Assign value of current button index
            _currentActive += 1
            update(isMoveNext: true)
            // Update layout
        }
    }
    
    /**
     * Move to previous button
     */
    func moveBack() {
        if _currentActive > 0 {
            // Set current button to enable status
            _arrayBtn[_currentActive].backgroundColor = GlobalConst.SCROLLBUTTONLIST_BTN_BKG_COLOR_ENABLE
            // Assign value of current button index
            _currentActive -= 1
            // Update layout
            update()
        }
    }
    
    /**
     * Update layout
     * - parameter isMoveNext: Flag specific move next handle
     */
    func update(isMoveNext: Bool = false) {
        if isMoveNext {
            _arrayBtn[_currentActive - 1].backgroundColor   = GlobalConst.SCROLLBUTTONLIST_BTN_BKG_COLOR_ENABLE
            _arrayBtn[_currentActive - 1].isEnabled         = true
            _arrayBtn[_currentActive].isEnabled             = true
        }
        // Set current button to selecting status
        _arrayBtn[_currentActive].backgroundColor = GlobalConst.SCROLLBUTTONLIST_BTN_BKG_COLOR_SELECTING
        // Scroll to middle button
        self.scrollRectToVisible(
            CGRect(
                x: GlobalConst.SCROLL_BUTTON_LIST_HEIGHT * (CGFloat)(_currentActive),
                y: 0,
                width: self.frame.width,
                height: self.frame.height),
            animated: true)
    }
}
