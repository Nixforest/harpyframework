//
//  StepVC.swift
//  project
//
//  Created by Nixforest on 10/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

//++ BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
//open class StepVC: BaseViewController, UIScrollViewDelegate, ScrollButtonListDelegate {
open class StepVC: ChildViewController, UIScrollViewDelegate, ScrollButtonListDelegate {
//-- BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
    // MARK: Properties
    /** Step number */
    var _numberStep: Int                = 0
    /** Content */
    var _arrayContent: [StepContent]    = [StepContent]()
    /** Summary */
    var _summary: StepSummary           = StepSummary()
    /** Current step */
    var _currentStep: Int               = -1
    /** Back step button */
    var _btnBack: UIButton              = UIButton()
    /** Next step button */
    var _btnNext: UIButton              = UIButton()
    /** Send button */
    var _btnSend: UIButton              = UIButton()
    /** Scrollbutton list */
    var _listButton: ScrollButtonList   = ScrollButtonList()
    /** Screen title */
    var _title: String                  = DomainConst.BLANK
    //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Handle slide gesture
    // Right slide gesture
    var _swipeGestRight:    UISwipeGestureRecognizer!
    // Left slide gesture
    var _swipeGestLeft:     UISwipeGestureRecognizer!
    //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Handle slide gesture
    
    // MARK: Methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Set up button Back
        self.view.addSubview(_btnBack)
        _btnBack.addTarget(self, action: #selector(btnBackTapper), for: .touchUpInside)
        // Setup button Next
        self.view.addSubview(_btnNext)
        _btnNext.addTarget(self, action: #selector(btnNextTapper), for: .touchUpInside)
        // Setup button Send
        self.view.addSubview(_btnSend)
        _btnSend.addTarget(self, action: #selector(btnSendTapped), for: .touchUpInside)
        // Setup list step button
        self.view.addSubview(_listButton)
        self.moveNext()
        self.view.backgroundColor = GlobalConst.BACKGROUND_COLOR_GRAY
        
        // Setup navigation bar
        //++ BUG0048-SPJ (NguyenPT 20170309) Change navigation bar
        //setupNavigationBar(title: _title, isNotifyEnable: BaseModel.shared.checkIsLogin())
        createNavigationBar(title: _title)
        //-- BUG0048-SPJ (NguyenPT 20170309) Change navigation bar
        //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Handle slide gesture
        _swipeGestRight = UISwipeGestureRecognizer(target: self,
                                                   action: #selector(swipeHandler(_:)))
        _swipeGestRight.direction = .right
        self.view.addGestureRecognizer(_swipeGestRight)
        _swipeGestLeft = UISwipeGestureRecognizer(target: self,
                                                   action: #selector(swipeHandler(_:)))
        _swipeGestLeft.direction = .left
        self.view.addGestureRecognizer(_swipeGestLeft)
        //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Handle slide gesture
        
        //++ BUG0109-SPJ (NguyenPT 20170614) HarpyFramework: Fix bug UI StepVC
        // Set up buttons
        setupButtons()
        // Setup list step button
        setupListButton()
        
        // Setup step contents
        for i in 0..<(_numberStep - 2) {
            self.view.addSubview(self._arrayContent[i])
        }
        //-- BUG0109-SPJ (NguyenPT 20170614) HarpyFramework: Fix bug UI StepVC
    }
    
    //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Handle slide gesture
    /**
     * Handle swipe gesture
     */
    func swipeHandler(_ sender: UIGestureRecognizer) {
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                btnBackTapper()
            case UISwipeGestureRecognizerDirection.left:
                btnNextTapper()
            default:
                break
            }
        }
    }
    //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Handle slide gesture
    
    override open func viewDidLayoutSubviews() {
        //++ BUG0109-SPJ (NguyenPT 20170614) HarpyFramework: Fix bug UI StepVC
//        // Set up buttons
//        setupButtons()
//        // Setup list step button
//        setupListButton()
//        
//        // Setup step contents
//        for i in 0..<(_numberStep - 2) {
//            self.view.addSubview(self._arrayContent[i])
//        }
        //-- BUG0109-SPJ (NguyenPT 20170614) HarpyFramework: Fix bug UI StepVC
    }
    
    /**
     * Set list of content views
     * - parameter listContent: List of content views
     */
    open func setListContents(listContent: [StepContent]) {
        if listContent.count == (_numberStep - 1) {
            for item in listContent {
                self._arrayContent.append(item)
                item.isHidden = true
            }
        }
    }
    
    /**
     * Set up layout for list buttons.
     */
    open func setupListButton() {
        _listButton._numberOfBtn = _numberStep
        _listButton.translatesAutoresizingMaskIntoConstraints = true
        _listButton.frame = CGRect(
            x: 0,
            y: self.view.frame.height - GlobalConst.SCROLL_BUTTON_LIST_HEIGHT,
            width: self.view.frame.width,
            height: GlobalConst.SCROLL_BUTTON_LIST_HEIGHT)
        _listButton.setup()
        _listButton.btnTapDelegate = self
    }
    
    /**
     * Set up buttons: Back, Next, Send
     */
    open func setupButtons() {
        // Set up button Back
        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        _btnBack.translatesAutoresizingMaskIntoConstraints = true
        _btnBack.frame = CGRect(
            x: 0,
            y: self.view.frame.height - GlobalConst.SCROLL_BUTTON_LIST_HEIGHT - GlobalConst.BUTTON_H,
            width: GlobalConst.BUTTON_H,
            height: GlobalConst.BUTTON_H)
        _btnBack.setImage(tintedBack, for: UIControlState())
        _btnBack.backgroundColor    = GlobalConst.BUTTON_COLOR_RED
        _btnBack.tintColor          = UIColor.white
        _btnBack.layer.cornerRadius = GlobalConst.BUTTON_CORNER_RADIUS
        //_btnBack.isHidden           = true
        
        // Set up button Next
        _btnNext.translatesAutoresizingMaskIntoConstraints = true
        _btnNext.frame = CGRect(
            x: self.view.frame.width - GlobalConst.BUTTON_H,
            y: self.view.frame.height - GlobalConst.SCROLL_BUTTON_LIST_HEIGHT - GlobalConst.BUTTON_H,
            width: GlobalConst.BUTTON_H,
            height: GlobalConst.BUTTON_H)
        _btnNext.setImage(tintedBack, for: UIControlState())
        _btnNext.transform          = CGAffineTransform(rotationAngle: (180.0 * CGFloat(M_PI)) / 180.0)
        _btnNext.backgroundColor    = GlobalConst.BUTTON_COLOR_RED
        _btnNext.tintColor          = UIColor.white
        _btnNext.layer.cornerRadius = GlobalConst.BUTTON_CORNER_RADIUS
        //_btnNext.isHidden           = true
        
        // Setup button Send
        _btnSend.translatesAutoresizingMaskIntoConstraints = true
        _btnSend.frame = CGRect(
            x: (GlobalConst.SCREEN_WIDTH) / 2  - GlobalConst.BUTTON_H,
            y: self.view.frame.height - GlobalConst.SCROLL_BUTTON_LIST_HEIGHT - GlobalConst.BUTTON_H,
            width: GlobalConst.BUTTON_H * 2,
            height: GlobalConst.BUTTON_H)
        _btnSend.setTitle(DomainConst.CONTENT00180, for: .normal)
        _btnSend.backgroundColor    = GlobalConst.BUTTON_COLOR_RED
        _btnSend.layer.cornerRadius = GlobalConst.BUTTON_CORNER_RADIUS
        _btnSend.tintColor          = UIColor.white
        _btnSend.isHidden           = true
    }
    
    /**
     * Handle when tap on button in scroll list
     * - parameter sender: Button is tapped
     */
    open func selectButton(_ sender: AnyObject) {
        // Current is summary
        if self._currentStep == (self._numberStep - 1) {
            moveTo(current: sender.tag)
        } else if (self._currentStep >= 0) {
            if self._arrayContent[self._currentStep].checkDone() {
                moveTo(current: sender.tag)
            }
        }
    }
    
    /**
     * Handle next tap button
     */
    open func btnNextTapper() {
        if self._currentStep < (self._numberStep - 1) {
            if self._arrayContent[self._currentStep].checkDone() {
                moveNext()
            }
        }
    }
    
    /**
     * Handle back tap button
     */
    open func btnBackTapper() {
        //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Not check valid data when move back
//        // Current is summary
//        if self._currentStep == (self._numberStep - 1) {
//            moveBack()
//        } else if (self._currentStep > 0) {
//            if self._arrayContent[self._currentStep].checkDone() {
//                moveBack()
//            }
//        }
        moveBack()
        //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Not check valid data when move back
	    }
    
    open func btnSendTapped() {
        
    }
    //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
    /**
     * Move view right with animation
     * - parameter view: View to move
     */
    open func animateRight(view: UIView) {
        // Visible view if needed
        if view.frame.minX < 0 {
            view.isHidden = false
        }
        UIView.animate(withDuration: GlobalConst.STEP_MOVE_TIME_INTERVAL,
                       animations: {
                        var frame = view.frame
                        frame.origin = CGPoint(x: frame.origin.x + GlobalConst.SCREEN_WIDTH,
                                               y: frame.origin.y)
                        view.frame = frame
        },
                       completion: { (finished: Bool) in
                        self.updateViewHidden(view: view)
        })
    }
    
    /**
     * Update view hidden
     * - parameter view: View to update
     */
    private func updateViewHidden(view: UIView) {
        if (view.frame.minX < 0) || (view.frame.minX >= GlobalConst.SCREEN_WIDTH) {
            view.isHidden = true
        } else {
            view.isHidden = false
        }
    }
    
    /**
     * Move view left with animation
     * - parameter view: View to move
     */
    open func animateLeft(view: UIView) {
        // Visible view if needed
        if view.frame.minX >= GlobalConst.SCREEN_WIDTH {
            view.isHidden = false
        }
        UIView.animate(withDuration: GlobalConst.STEP_MOVE_TIME_INTERVAL,
                       animations: {
                        var frame = view.frame
                        frame.origin = CGPoint(x: frame.origin.x - GlobalConst.SCREEN_WIDTH,
                                               y: frame.origin.y)
                        view.frame = frame
        },
                       completion: { (finished: Bool) in
                        self.updateViewHidden(view: view)
        })
    }
    //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
    
    /**
     * Move next screen
     */
    open func moveNext() {
        // First step
        if _currentStep == -1 {
            _currentStep += 1
            if _numberStep > 0 {
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_arrayContent[_currentStep].isHidden = false
                animateLeft(view: _arrayContent[_currentStep])
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            }
        } else if (_currentStep < (_numberStep - 2)) {
            // Middle steps
            //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            //_arrayContent[_currentStep].isHidden = true
            animateLeft(view: _arrayContent[_currentStep])
            //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            _currentStep += 1
            _listButton.moveNext()
            //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            //_arrayContent[_currentStep].isHidden = false
            animateLeft(view: _arrayContent[_currentStep])
            //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
        } else if _currentStep == (_numberStep - 2) {
            //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            //_arrayContent[_currentStep].isHidden = true
            animateLeft(view: _arrayContent[_currentStep])
            //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            _currentStep += 1
            _listButton.moveNext()
            //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            //_summary.isHidden = false
            animateLeft(view: _summary)
            _ = _summary.updateContentLayout()
            //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
        }
        updateButton()
    }
    
    /**
     * Move previous screen
     */
    open func moveBack() {
        if _currentStep > 0 {
            if _currentStep == (_numberStep - 1) {
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_summary.isHidden = true
                animateRight(view: _summary)
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                _currentStep -= 1
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_arrayContent[_currentStep].isHidden = false
                animateRight(view: _arrayContent[_currentStep])
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                _listButton.moveBack()
            } else {
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_arrayContent[_currentStep].isHidden = true
                animateRight(view: _arrayContent[_currentStep])
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                _currentStep -= 1
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_arrayContent[_currentStep].isHidden = false
                animateRight(view: _arrayContent[_currentStep])
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                _listButton.moveBack()
            }
        }
        updateButton()
    }
    
    /**
     * Move to specific screen
     * - parameter current: Screen index
     */
    open func moveTo(current: Int) {
        if ((current < _numberStep) && (current >= 0) && (current != _currentStep)) {
            // Current screen is summary screen
            if _currentStep == (_numberStep - 1) {
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_summary.isHidden = true
                animateRight(view: _summary)
                for i in (current + 1)..<_currentStep {
                    animateRight(view: _arrayContent[i])
                }
                for i in (current + 1)..<_currentStep {
                    animateRight(view: _arrayContent[i])
                }
                _currentStep = current
                //_arrayContent[_currentStep].isHidden = false
                animateRight(view: _arrayContent[_currentStep])
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            } else if current == (_numberStep - 1) {            // Move to summary
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_arrayContent[_currentStep].isHidden = true
                animateLeft(view: _arrayContent[_currentStep])
                for i in (_currentStep + 1)..<current {
                    animateLeft(view: _arrayContent[i])
                }
                for i in (_currentStep + 1)..<current {
                    animateLeft(view: _arrayContent[i])
                }
                _currentStep = current
                //_summary.isHidden = false
                animateLeft(view: _summary)
                _ = _summary.updateContentLayout()
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            } else {
                //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
                //_arrayContent[_currentStep].isHidden = true
                //_currentStep = current
                //_arrayContent[_currentStep].isHidden = false
                if _currentStep > current {
                    // Move right current view
                    animateRight(view: _arrayContent[_currentStep])
                    for i in (current + 1)..<_currentStep {
                        animateRight(view: _arrayContent[i])
                    }
                    for i in (current + 1)..<_currentStep {
                        animateRight(view: _arrayContent[i])
                    }
                    _currentStep = current
                    // Move right current will be view
                    animateRight(view: _arrayContent[_currentStep])
                } else {
                    animateLeft(view: _arrayContent[_currentStep])
                    for i in (_currentStep + 1)..<current {
                        animateLeft(view: _arrayContent[i])
                    }
                    for i in (_currentStep + 1)..<current {
                        animateLeft(view: _arrayContent[i])
                    }
                    _currentStep = current                    
                    animateLeft(view: _arrayContent[_currentStep])
                }
                //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            }
            _listButton.moveTo(current: current)
        }
        updateButton()
    }
    
    /**
     * Update show/hide status of back-next-send button
     */
    open func updateButton() {
        if _currentStep == 0 {
            _btnBack.isHidden = true
        }
        if _currentStep == (_numberStep - 1) {
            _btnNext.isHidden = true
            _btnSend.isHidden = false
        }
        if _currentStep < (_numberStep - 1) {
            _btnNext.isHidden = false
        }
        if _currentStep > 0 {
            _btnBack.isHidden = false
        }
    }
    
    /**
     * Insert a content screen
     * - parameter stepContent: Content screen view
     */
    open func appendContent(stepContent: StepContent) {
        // Get height of status bar + navigation bar
        let height = self.getTopHeight()
        stepContent.translatesAutoresizingMaskIntoConstraints = true
        stepContent.frame = CGRect(
            //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            //x: 0,
            x: GlobalConst.SCREEN_WIDTH,
            //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            y: height,
            width: GlobalConst.SCREEN_WIDTH,
            height: GlobalConst.SCREEN_HEIGHT - (height + GlobalConst.BUTTON_H + GlobalConst.SCROLL_BUTTON_LIST_HEIGHT))
        //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
        //stepContent.isHidden = true
        //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
        self._arrayContent.append(stepContent)
        self.view.addSubview(stepContent)
        self._numberStep += 1
    }
    
    /**
     * Insert a summary screen
     * - parameter summary: Summary screen view
     */
    open func appendSummary(summary: StepSummary) {
        // Get height of status bar + navigation bar
        let height = self.getTopHeight()
        summary.translatesAutoresizingMaskIntoConstraints = true
        summary.frame = CGRect(
            //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            //x: 0,
            x: GlobalConst.SCREEN_WIDTH,
            //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
            y: height,
            width: GlobalConst.SCREEN_WIDTH,
            height: GlobalConst.SCREEN_HEIGHT - (height + GlobalConst.BUTTON_H + GlobalConst.SCROLL_BUTTON_LIST_HEIGHT))
        //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
        //summary.isHidden = true
        //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
        self._summary = summary
        self.view.addSubview(summary)
        self._numberStep += 1
    }
    
    /**
     * Set icon for button list
     * - parameter listIcon: List of icon
     */
    open func setListIcon(listIcon: [String]) {
        self._listButton._listIcons = listIcon
    }
    
    /**
     * Set view title
     * - parameter title: Title of view
     */
    public func setTitle(title: String) {
        self._title = title
    }
    
    public func stepDone() {
        self.moveNext()
    }
    
    /**
     * Update data in step content
     * - parameter name: Name of notification
     */
    public func updateData(name: String) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil)
    }
    
    /**
     * Update data in step content
     * - parameter name: Name of notification
     * - parameter model: Object model
     */
    public func updateData(name: String, model: AnyObject) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: model)
    }
    
    //++ BUG0090-SPJ (NguyenPT 20170519) Show confirm alert when back from create screen
//    /**
//     * Override handle back button tap event
//     */
//    open override func backButtonTapped(_ sender: AnyObject) {
//        showAlert(message: DomainConst.CONTENT00378,
//                  okHandler: {
//                    alert in
//                    super.backButtonTapped(self)
//        }, cancelHandler: {
//            alert in
//        })
//    }
    //-- BUG0090-SPJ (NguyenPT 20170519) Show confirm alert when back from create screen
}
