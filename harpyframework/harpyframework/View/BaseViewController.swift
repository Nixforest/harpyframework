//
//  CommonViewController.swift
//  harpyframework
//
//  Created by SPJ on 12/23/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
//++ BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
//open class BaseViewController : UIViewController, UIPopoverPresentationControllerDelegate, MenuItemDelegate {
open class BaseViewController : UIViewController {
//-- BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
    // MARK: Properties
    /** Navigation bar */
    @IBOutlet weak public var navigationBar: UINavigationItem!
    //++ BUG0048-SPJ (NguyenPT 20170313) Remove
//    /** Menu button */
//    @IBOutlet weak public var menuButton: UIButton!
    //-- BUG0048-SPJ (NguyenPT 20170313) Remove
    //++ BUG0049-SPJ (NguyenPT 20170313) Handle notification received
    /** Notification button */
//    @IBOutlet weak public var notificationButton: UIButton!
    private var btnNotify: UIButton = UIButton()
    //-- BUG0049-SPJ (NguyenPT 20170313) Handle notification received
    //++ BUG0048-SPJ (NguyenPT 20170313) Remove 0129 2589 769
//    /** Back button */
//    @IBOutlet weak public var backButton: UIButton!
    //-- BUG0048-SPJ (NguyenPT 20170313) Remove
    /** Flag check keyboard is show or hide */
    public var isKeyboardShow : Bool = false
    /** Height of keyboard */
    public var keyboardTopY : CGFloat = 0.0
    /** Main story board */
    public let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    /** Background image path */
    private var backgroundImg: String = ""
    
    // MARK: Methods
    /**
     * Empty method, use for completion handler
     * - parameter notification: Notification object
     */
    public func emptyMethod(_ notification: Notification) {
        // Do nothing
    }
    //++ BUG0048-SPJ (NguyenPT 20170309) Get root view controller
    /**
     * Get root view controller
     * - returns: BaseSlideMenu controller
     */
    static func getRootController() -> BaseSlideMenuViewController? {
        // Get root view controller
        if let root = UIApplication.getRootVC() {
            // Check if root view controller is slide menu controller
            if let slide = root as? BaseSlideMenuViewController {
                return slide
            }
        }
        return nil
    }
    //++ BUG0048-SPJ (NguyenPT 20170309) Get root view controller
    
    /**
     * View did appear
     */
    override open func viewDidAppear(_ animated: Bool) {
        //notification button enable/disable
        self.updateNotificationStatus()
    }
    
    /**
     * View did load
     */
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background image
        if !self.backgroundImg.isEmpty {
            let background = UIImageView(frame: UIScreen.main.bounds)
            background.image = ImageManager.getImage(named: self.backgroundImg)
            self.view.insertSubview(background, at: 0)
        }
        // Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
    }
    
    /**
     * Get height of keyboard
     */
    open func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyboardTopY = GlobalConst.SCREEN_HEIGHT - keyboardSize.height
        }
    }
    
    /**
     * Set background image path
     * - parameter bkg: Background image path
     */
    public func setBackground(bkg: String) {
        self.backgroundImg = bkg
    }
    
    /**
     * Set data
     */
    open func setData(_ notification: Notification) {
        // Not implement
    }
    
    /**
     * Handle show alert message
     * - parameter message: Message content
     */
    public func showAlert(message: String) -> Void {
        let alert = UIAlertController(title: DomainConst.CONTENT00162, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: DomainConst.CONTENT00008, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     * Show toast message
     * - parameter message: Message content
     */
    public func showToast(message: String) -> Void {
        // Check debug toast mode
        if !BaseModel.shared.getDebugToast() {
            return
        }
        let label           = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.text          = message
        label.font          = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.adjustsFontSizeToFitWidth = true
        
        label.backgroundColor   =  UIColor.black
        label.textColor         = UIColor.white
        
        label.sizeToFit()
        label.numberOfLines         = 4
        label.layer.shadowColor     = UIColor.gray.cgColor
        label.layer.shadowOffset    = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity   = 0.3
        label.frame = CGRect(x: self.view.frame.width, y: self.view.frame.height - getTopHeight(),
                             width: label.frame.width, height: label.frame.height)
        label.alpha = 1
        if let currentView = BaseViewController.getCurrentViewController() {
            currentView.view.addSubview(label)
        }
//        BaseViewController.getCurrentViewController().view.addSubview(label)
        
        var basketTopFrame: CGRect = label.frame;
        basketTopFrame.origin.x = (self.view.frame.width - label.frame.width) / 2
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            label.frame = basketTopFrame
        },  completion: {
            (value: Bool) in
            UIView.animate(withDuration: 2.0, delay: 2.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                label.alpha = 0
            },  completion: {
                (value: Bool) in
                label.removeFromSuperview()
            })
        })
    }
    
    /**
     * Handle make a phone call
     * - parameter phone: Phone string to call
     */
    public func makeACall(phone: String) {
        let url = NSURL(string: "telprompt://\(phone)")
        if UIApplication.shared.canOpenURL(url as! URL) {
            UIApplication.shared.openURL(url as! URL)
        } else {
            showAlert(message: "Không gọi được vào số: \(phone)")
        }
    }
    
    public func makeEmail(email: String) {
        let url = NSURL(string: "mailto:\(email)")
        if UIApplication.shared.canOpenURL(url as! URL) {
            UIApplication.shared.openURL(url as! URL)
        } else {
            showAlert(message: "Không gửi được email cho: \(email)")
        }
    }
    
    /**
     * Handle show alert message
     * - parameter message: Message content
     * - parameter okHandler: Handler when tap OK button
     */
    public func showAlert(message: String, okHandler:  @escaping (UIAlertAction) -> Swift.Void) -> Void {
        let alert = UIAlertController(title: DomainConst.CONTENT00162, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: DomainConst.CONTENT00008, style: .cancel, handler: okHandler)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     * Process input confirm code from register request
     * - parameter message: Message content
     */
    public func processInputConfirmCode(message: String) {
        var msg = message
        if msg.isEmpty {
            msg = DomainConst.CONTENT00133
        }
        let alert = UIAlertController(title: DomainConst.CONTENT00162, message: msg, preferredStyle: .alert)
        let registerAction = UIAlertAction(title: DomainConst.CONTENT00230, style: .default, handler: {(registerCodeAlert) -> Void in()
            //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
//            RequestAPI.requestRegisterConfirm(code: (alert.textFields?[0].text)!, view: self)
            RegisterConfirmRequest.requestRegisterConfirm(action: #selector(self.finishRequestRegisterConfirm(_:)),
                                                          view: self,
                                                          code: (alert.textFields?[0].text)!)
            //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
        })
        let cancelAction = UIAlertAction(title: DomainConst.CONTENT00202, style: .cancel, handler: {(registerCodeAlert) -> Void in()
            BaseModel.shared.resetTempToken()
        })
        alert.addTextField { (textField : UITextField!) -> Void in
            let firstTextField = alert.textFields![0] as UITextField
            firstTextField.placeholder = DomainConst.CONTENT00135
            firstTextField.layer.cornerRadius = 20.0
        }
        
        alert.addAction(registerAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
    /**
     * Finish request register confirm handler
     */
    internal func finishRequestRegisterConfirm(_ notification: Notification) {
        self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
    }
    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
    
    /**
     * Handle show alert message
     * - parameter message:         Message content
     * - parameter okTitle:         Title of OK button
     * - parameter cancelTitle:     Title of Cancel button
     * - parameter okHandler:       Handler when tap OK button
     * - parameter cancelHandler:   Handler when tap Cancel button
     */
    public func showAlert(message: String,
                          okTitle: String = DomainConst.CONTENT00008,
                          cancelTitle: String = DomainConst.CONTENT00202, okHandler: @escaping (UIAlertAction) -> Swift.Void, cancelHandler: @escaping (UIAlertAction) -> Swift.Void) -> Void {
        let alert       = UIAlertController(title: DomainConst.CONTENT00162, message: message, preferredStyle: .alert)
        let okAction    = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    //++ BUG0048-SPJ (NguyenPT 20170309) Create navigation bar
    /**
     * Build navigation bar title
     * - parameter title: Title of navigation bar
     */
    public func setNavigationBarTitle(title: String) {
        // Set title
        self.navigationBar.title = title
        // Set color text
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
    }
    
    /**
     * Build items on navigation bar for parent view
     */
    public func setupNavigationBarParentItems() {
        // Create menu button
        let menu                = ImageManager.getImage(named: DomainConst.MENU_IMG_NAME)
        let tintedImg           = menu?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let btnMenu = UIButton()
        btnMenu.setImage(tintedImg, for: UIControlState())
        btnMenu.tintColor    = GlobalConst.BUTTON_COLOR_RED
        btnMenu.frame        = CGRect(x: 0, y: 0,
                                      width: GlobalConst.MENU_BUTTON_W,
                                      height: GlobalConst.MENU_BUTTON_H)
        btnMenu.setTitle(DomainConst.BLANK, for: UIControlState())
        btnMenu.addTarget(self, action: #selector(btnMenuTapped(_:)), for: UIControlEvents.touchUpInside)
        let menuNavBar          = UIBarButtonItem()
        menuNavBar.customView   = btnMenu
        menuNavBar.isEnabled    = true
        navigationBar.setLeftBarButton(menuNavBar, animated: false)
        
        // Notify button
        //++ BUG0049-SPJ (NguyenPT 20170313) Handle notification received
//        let btnNotify = UIButton()
        //-- BUG0049-SPJ (NguyenPT 20170313) Handle notification received
        btnNotify.frame = CGRect(x: 0, y: 0,
                                 width: GlobalConst.MENU_BUTTON_W,
                                 height: GlobalConst.NOTIFY_BUTTON_H)
        btnNotify.layer.cornerRadius = 0.5 * btnNotify.bounds.size.width
        btnNotify.setTitle("!", for: UIControlState())
        btnNotify.setTitleColor(UIColor.white, for: UIControlState())
        btnNotify.titleLabel?.font = UIFont.systemFont(ofSize: GlobalConst.NOTIFY_FONT_SIZE)
        btnNotify.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        // Set status of notify button
        if BaseModel.shared.checkIsLogin() {
            btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
        let notifyNavBar = UIBarButtonItem()
        notifyNavBar.customView = btnNotify
        notifyNavBar.isEnabled = BaseModel.shared.checkIsLogin()
        self.navigationBar.setRightBarButton(notifyNavBar, animated: true)
    }
    
    /**
     * Handle tap menu button event
     */
    open func btnMenuTapped(_ sender: AnyObject) {
        // Get slide root controller
        if let slideController = BaseViewController.getRootController() {
            // Open left menu
            slideController.openLeft()
        }
    }
    
    /**
     * Build items on navigation bar for children view
     */
    public func setupNavigationBarChildItems() {
        // Create back button
        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let btnBack = UIButton()
        btnBack.setImage(tintedBack, for: UIControlState())
        btnBack.tintColor = GlobalConst.BUTTON_COLOR_RED
        btnBack.frame = CGRect(x: 0, y: 0,
                               width: GlobalConst.MENU_BUTTON_W,
                               height: GlobalConst.MENU_BUTTON_W)
        btnBack.setTitle(DomainConst.BLANK, for: UIControlState())
        btnBack.addTarget(self, action: #selector(backButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        let backNavBar = UIBarButtonItem()
        backNavBar.customView = btnBack
        backNavBar.isEnabled = true
        navigationBar.setLeftBarButton(backNavBar, animated: false)
        
        // Notify button
        //++ BUG0049-SPJ (NguyenPT 20170313) Handle notification received
//        let btnNotify = UIButton()
        //-- BUG0049-SPJ (NguyenPT 20170313) Handle notification received
        btnNotify.frame = CGRect(x: 0, y: 0,
                                 width: GlobalConst.MENU_BUTTON_W,
                                 height: GlobalConst.NOTIFY_BUTTON_H)
        btnNotify.layer.cornerRadius = 0.5 * btnNotify.bounds.size.width
        btnNotify.setTitle("!", for: UIControlState())
        btnNotify.setTitleColor(UIColor.white, for: UIControlState())
        btnNotify.titleLabel?.font = UIFont.systemFont(ofSize: GlobalConst.NOTIFY_FONT_SIZE)
        btnNotify.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        // Set status of notify button
        if BaseModel.shared.checkIsLogin() {
            btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
        let notifyNavBar = UIBarButtonItem()
        notifyNavBar.customView = btnNotify
        notifyNavBar.isEnabled = BaseModel.shared.checkIsLogin()
        self.navigationBar.setRightBarButton(notifyNavBar, animated: true)
    }
    
//    /**
//     * Set up for navigation bar
//     * - parameter title:           Title of view
//     * - parameter isNotifyEnable:  True is enable notify button, False otherwise
//     * - parameter isHiddenBackBtn: Flag hide back button
//     */
//    public func setupNavigationBar(title: String, isNotifyEnable: Bool, isHiddenBackBtn: Bool = false) {
//        // Set title
//        self.navigationBar.title = title
//        // Set color text
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
//        
//        // Menu button
//        let menu                = ImageManager.getImage(named: DomainConst.MENU_IMG_NAME)
//        let tintedImg           = menu?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        menuButton.setImage(tintedImg, for: UIControlState())
//        menuButton.tintColor    = GlobalConst.BUTTON_COLOR_RED
//        menuButton.frame        = CGRect(x: 0, y: 0,
//                                         width: GlobalConst.MENU_BUTTON_W,
//                                         height: GlobalConst.MENU_BUTTON_H)
//        menuButton.setTitle("", for: UIControlState())
//        let menuNavBar          = UIBarButtonItem()
//        menuNavBar.customView   = menuButton
//        menuNavBar.isEnabled    = true
//        
//        // Notify button
//        notificationButton.frame = CGRect(x: 0, y: 0,
//                                          width: GlobalConst.MENU_BUTTON_W,
//                                          height: GlobalConst.NOTIFY_BUTTON_H)
//        notificationButton.layer.cornerRadius = 0.5 * notificationButton.bounds.size.width
//        notificationButton.setTitle("!", for: UIControlState())
//        notificationButton.setTitleColor(UIColor.white, for: UIControlState())
//        notificationButton.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
//        
//        // Set status of notify button
//        if isNotifyEnable {
//            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_RED
//        } else {
//            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
//        }
//        let notifyNavBar = UIBarButtonItem()
//        notifyNavBar.customView = notificationButton
//        notifyNavBar.isEnabled = isNotifyEnable
//        
//        // Set on Navigation bar
//        self.navigationItem.rightBarButtonItems = [menuNavBar, notifyNavBar]
//        
//        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
//        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        backButton.setImage(tintedBack, for: UIControlState())
//        backButton.tintColor = GlobalConst.BUTTON_COLOR_RED
//        backButton.frame = CGRect(x: 0, y: 0,
//                                  width: GlobalConst.MENU_BUTTON_W,
//                                  height: GlobalConst.MENU_BUTTON_W)
//        backButton.setTitle("", for: UIControlState())
//        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: UIControlEvents.touchUpInside)
//        
//        let backNavBar = UIBarButtonItem()
//        backNavBar.customView = backButton
//        backNavBar.isEnabled = true
//        navigationBar.setLeftBarButton(backNavBar, animated: false)
//        backButton.isHidden = isHiddenBackBtn
//    }
//    
//    /**
//     * Set up for navigation bar
//     * - parameter title: Title of view
//     * - parameter isNotifyEnable:      True is enable notify button, False otherwise
//     * - parameter isHiddenBackBtn:     Flag hide back button
//     * - parameter isEnabledMenuBtn:    Flag enable/disable menu button
//     */
//    public func setupNavigationBar(title: String, isNotifyEnable: Bool, isHiddenBackBtn: Bool = false, isEnabledMenuBtn: Bool = false) {
//        // Set title
//        self.navigationBar.title = title
//        // Set color text
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
//        
//        // Menu button
//        let menu                = ImageManager.getImage(named: DomainConst.MENU_IMG_NAME)
//        let tintedImg           = menu?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        menuButton.setImage(tintedImg, for: UIControlState())
//        menuButton.tintColor    = GlobalConst.BUTTON_COLOR_RED
//        menuButton.frame        = CGRect(x: 0, y: 0,
//                                         width: GlobalConst.MENU_BUTTON_W,
//                                         height: GlobalConst.MENU_BUTTON_H)
//        menuButton.setTitle("", for: UIControlState())
//        let menuNavBar          = UIBarButtonItem()
//        menuNavBar.customView   = menuButton
//        menuNavBar.isEnabled    = true
//        
//        // Notify button
//        notificationButton.frame = CGRect(x: 0, y: 0,
//                                          width: GlobalConst.MENU_BUTTON_W,
//                                          height: GlobalConst.NOTIFY_BUTTON_H)
//        notificationButton.layer.cornerRadius = 0.5 * notificationButton.bounds.size.width
//        notificationButton.setTitle("!", for: UIControlState())
//        notificationButton.setTitleColor(UIColor.white, for: UIControlState())
//        notificationButton.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
//        
//        // Set status of notify button
//        if isNotifyEnable {
//            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_RED
//        } else {
//            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
//        }
//        let notifyNavBar = UIBarButtonItem()
//        notifyNavBar.customView = notificationButton
//        notifyNavBar.isEnabled = isNotifyEnable
//        
//        // Set on Navigation bar
//        self.navigationItem.rightBarButtonItems = [menuNavBar, notifyNavBar]
//        
//        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
//        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
//        backButton.setImage(tintedBack, for: UIControlState())
//        backButton.tintColor = GlobalConst.BUTTON_COLOR_RED
//        backButton.frame = CGRect(x: 0, y: 0,
//                                  width: GlobalConst.MENU_BUTTON_W,
//                                  height: GlobalConst.MENU_BUTTON_W)
//        backButton.setTitle("", for: UIControlState())
//        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: UIControlEvents.touchUpInside)
//        
//        let backNavBar = UIBarButtonItem()
//        backNavBar.customView = backButton
//        backNavBar.isEnabled = true
//        navigationBar.setLeftBarButton(backNavBar, animated: false)
//        backButton.isHidden = isHiddenBackBtn
//        menuButton.isEnabled = isEnabledMenuBtn
//    }
    //-- BUG0048-SPJ (NguyenPT 20170309) Create navigation bar
    
    /**
     * Handle tap on Notification button
     * - parameter sender: AnyObject
     */
    public func notificationButtonTapped(_ sender: AnyObject) {
        showAlert(message: BaseModel.shared.notifyCountText)
    }
    
    /**
     * Handle tap on Back button
     * - parameter sender:AnyObject
     */
    open func backButtonTapped(_ sender: AnyObject) {
        self.clearData()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//    /**
//     * Handle when tap on Config menu item
//     */
//    public func configItemTap(_ notification: Notification) {
//        self.pushToView(name: DomainConst.G00_CONFIGURATION_VIEW_CTRL)
//    }
    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    
    /**
     * Handle when tap on Home menu item
     */
    public func gasServiceItemTapped(_ notification: Notification) {
        self.popToRootView()
    }
    
    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//    /**
//     * Handle when tap on Home menu item
//     */
//    public func issueItemTapped(_ notification: Notification) {
//        showAlert(message: "issueItemTapped")
//    }
    
//    /**
//     * Handle when tap on Log out menu item
//     */
//    public func logoutItemTapped(_ notification: Notification) {
//        RequestAPI.requestLogout(view: self)
//    }
    
//    /**
//     * Handle tap on Register menu item
//     */
//    public func registerItemTapped(_ notification: Notification){
//        self.pushToView(name: DomainConst.G00_REGISTER_VIEW_CTRL)
//    }
    
//    /**
//     * Handle tap on Login menu item
//     */
//    public func loginItemTapped(_ notification: Notification) {
//        self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
//    }
    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    
    /**
     * Clear data on current view.
     */
    open func clearData() {
        
    }
    
    /**
     * Update notification button status
     */
    public func updateNotificationStatus() {
        //++ BUG0049-SPJ (NguyenPT 20170313) Handle notification received
//        self.notificationButton.isEnabled = !BaseModel.shared.notifyCountText.isEmpty
//        if !BaseModel.shared.notifyCountText.isEmpty {
//            self.notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_RED
//        } else {
//            self.notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
//        }
        self.btnNotify.isEnabled = !BaseModel.shared.notifyCountText.isEmpty
        if !BaseModel.shared.notifyCountText.isEmpty {
            self.btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            self.btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
        //-- BUG0049-SPJ (NguyenPT 20170313) Handle notification received
    }
    
    /**
     * Update notification button status
     */
    public func updateNotificationStatus(_ notification: Notification) {
        updateNotificationStatus()
    }
    
    /**
     * Get height of status bar + navigation bar
     * - returns: Height of status bar + navigation bar
     */
    open func getTopHeight() -> CGFloat {
        return (self.navigationController!.navigationBar.frame.size.height
            + UIApplication.shared.statusBarFrame.size.height)
    }
    
    /**
     * Get current view controller
     * - returns: Current view controller
     */
    public static func getCurrentViewController() -> BaseViewController? {
        var currentView: UIViewController? = nil
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            currentView = navigationController.visibleViewController
        }
        //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
        if let slideMenu = BaseViewController.getRootController() {
            if let current = slideMenu.mainViewController as? UINavigationController {
                currentView = current.visibleViewController
            }
        }
        //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller

        return currentView as? BaseViewController
    }
    
    //++ BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
//    /**
//     * Override: show menu controller
//     */
//    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == DomainConst.POPOVER_MENU_IDENTIFIER {
//            let popoverVC = segue.destination
//            popoverVC.popoverPresentationController?.delegate = self
//            //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//            (popoverVC as! BaseMenuViewController).menuItemTappedDelegate = self
//            //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//        }
//    }
//    
//    /**
//     * ...
//     */
//    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.none
//    }
    //-- BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
    
    /**
     * Push to a view controller with View controller name
     * - parameter name: Name of view controller
     */
    public func pushToView(name: String) {
        if self.theClassName == String.init(format: "project.\(name)") {
            return
        }
        let view = mainStoryboard.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    /**
     * Move to root view of view hierarchy
     */
    public func popToRootView() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    //++ BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
//    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//    /**
//     * Handle when tapped menu item
//     * - parameter sender: AnyObject
//     */
//    public func menuItemTapped(_ sender: AnyObject) {
//        switch (sender as! UIButton).accessibilityIdentifier! {
//        case DomainConst.G00_CONFIGURATION_VIEW_CTRL:       // Config menu
//            self.pushToView(name: DomainConst.G00_CONFIGURATION_VIEW_CTRL)
//            break
//        case DomainConst.G00_LOGIN_VIEW_CTRL:               // Login menu
//            self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
//            break
//        case DomainConst.NOTIFY_NAME_LOGOUT_ITEM:           // Logout menu
//            //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//            //RequestAPI.requestLogout(view: self)
//            LogoutRequest.requestLogout(action: #selector(finishRequestLogout), view: self)
//            //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//            break
//        case DomainConst.G00_REGISTER_VIEW_CTRL:            // Register menu
//            self.pushToView(name: DomainConst.G00_REGISTER_VIEW_CTRL)
//            break
//        case DomainConst.HOME:                              // Home menu
//            self.popToRootView()
//            break
//        case DomainConst.USER_PROFILE:                      // User profile
//            self.pushToView(name: DomainConst.G00_ACCOUNT_VIEW_CTRL)
//            break
//        case DomainConst.UPHOLD_LIST:                       // Uphold list
//            self.pushToView(name: DomainConst.G01_F00_S01_VIEW_CTRL)
//            break
//        case DomainConst.ISSUE_LIST:                        // Issue list
//            self.showAlert(message: DomainConst.CONTENT00197)
//            break
//        case DomainConst.MESSAGE:                           // Message
//            self.showAlert(message: DomainConst.CONTENT00197)
//            break
//        case DomainConst.CUSTOMER_LIST:                     // Customer list
//            self.showAlert(message: DomainConst.CONTENT00197)
//            break
//        case DomainConst.WORKING_REPORT:                    // Working report
//            self.showAlert(message: DomainConst.CONTENT00197)
//            break
//        case DomainConst.ORDER_LIST:                        // Order list
//            self.pushToView(name: DomainConst.G04_F00_S01_VIEW_CTRL)
//            break
//        case DomainConst.ORDER_VIP_LIST:                    // VIP order list
//            self.pushToView(name: DomainConst.G05_F00_S01_VIEW_CTRL)
//            break
//        case DomainConst.KEY_MENU_PROMOTION_LIST:           // Promotion list
//            self.pushToView(name: DomainConst.G04_F02_S01_VIEW_CTRL)
//            break
//        default:
//            break
//        }
//    }
//    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    //-- BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    /**
     * Finish request logout handler
     */
    public func finishRequestLogout(_ notification: Notification) {
        self.showAlert(message: DomainConst.CONTENT00280, okHandler: {
            (alert: UIAlertAction!) in
            self.popToRootView()
        })
    }
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    //++ BUG0049-SPJ (NguyenPT 20170313) Handle notification received
    /**
     * Handle notification received from server
     * - paramter notify:   Notification data
     * - paramter isManual:
     */
    public func handleNotification(notify: NotificationBean, isManual: Bool = false) {
        if isManual && BaseModel.shared.canHandleNotification() {
            // Create alert
            let alert = UIAlertController(title: DomainConst.CONTENT00044, message: notify.getMessage(), preferredStyle: .alert)
            // OK handler
            let okAction = UIAlertAction(title: DomainConst.CONTENT00223, style: .default, handler: {
                (alert: UIAlertAction!) in
                // Confirm notify request
                ConfirmNotifyRequest.requestConfirmNotify(notifyId: notify.getNotifyId(), type: notify.getType(), objId: notify.getId())
                // Check if notification data is valid
                if notify.checkNotificationExist() {
                    // User logined
                    if BaseModel.shared.checkIsLogin() {
                        // Switch by type
                        switch notify.getType() {
                        case DomainConst.NOTIFY_VIEW_UPHOLD:
                            BaseModel.shared.sharedDoubleStr.0 = notify.getId()
                            BaseModel.shared.sharedDoubleStr.1 = notify.getReplyId()
                            if BaseModel.shared.isCustomerUser() {
                                self.pushToView(name: DomainConst.G01_F00_S03_VIEW_CTRL)
                            } else {
                                self.pushToView(name: DomainConst.G01_F00_S02_VIEW_CTRL)
                            }
                            break
                        default: break
                        }
                    } else {
                        self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
                    }
                }
            })
            alert.addAction(okAction)
            let cancelAction = UIAlertAction(title: DomainConst.CONTENT00224, style: .cancel, handler: {
                (alert: UIAlertAction!) in
                BaseModel.shared.clearNotificationData()
            })
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            // Reply confirm notify to server
            ConfirmNotifyRequest.requestConfirmNotify(notifyId: notify.getNotifyId(), type: notify.getType(), objId: notify.getId())
        }
    }
    //-- BUG0049-SPJ (NguyenPT 20170313) Handle notification received
    
    /**
     * Destructor
     */
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}