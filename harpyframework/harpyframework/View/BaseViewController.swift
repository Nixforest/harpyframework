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
    // MARK: Constant
    public static var W_RATE_HD    = UIScreen.main.bounds.width / GlobalConst.HD_SCREEN_BOUND.w
    public static var H_RATE_HD    = UIScreen.main.bounds.height / GlobalConst.HD_SCREEN_BOUND.h
    public static var W_RATE_FHD   = UIScreen.main.bounds.width / GlobalConst.FULL_HD_SCREEN_BOUND.w
    public static var H_RATE_FHD   = UIScreen.main.bounds.height / GlobalConst.FULL_HD_SCREEN_BOUND.h
    public static var W_RATE_FHD_L = UIScreen.main.bounds.width / GlobalConst.FULL_HD_SCREEN_BOUND.h
    public static var H_RATE_FHD_L = UIScreen.main.bounds.height / GlobalConst.FULL_HD_SCREEN_BOUND.w
    // MARK: Methods
    // MARK: - Override
//    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        GlobalConst.SCREEN_WIDTH = UIScreen.main.bounds.height
//        GlobalConst.SCREEN_HEIGHT = UIScreen.main.bounds.width
//    }
    
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
    public static func getRootController() -> BaseSlideMenuViewController? {
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
        print("CurrentController ----------\(String(describing: nibName))")
        //notification button enable/disable
        //self.updateNotificationStatus()
        if BaseModel.shared.checkIsLogin() {
//            NotificationCountRequest.requestNotificationCount(action: #selector(updateNotificationStatus(_:)), view: self)
        }
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
        self.view.makeComponentsColor()
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
     * Create children views
     */
    open func createChildrenViews() {
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
    
    /**
     * Update children views
     */
    open func updateChildrenViews() {
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
    
    /**
     * Handle set background image
     */
    open func setBackgroundImage() {
    }
    
    /**
     * Handle view position when rotated
     */
    internal func rotated() {
        self.updateConst()
        self.view.endEditing(true)
        self.setBackgroundImage()
        UIView.animate(withDuration: TimeInterval(GlobalConst.ROTATED_TIME_INTERVAL), animations: {
            self.updateChildrenViews()
        })
    }
    //-- BUG0170-SPJ (NguyenPT 20172711) Update bottom message view
    
    /**
     * Set background image path
     * - parameter bkg: Background image path
     */
    public func setBackground(bkg: String) {
        self.backgroundImg = bkg
    }
    /**
     * Handle open Promotion view
     */
    open func openPromotionActiveQR() {
        
    }
    
    open func openPromotionActiveUsingCode(code: String) {
        
    }
    /**
     * Handle update constants
     */
    open func updateConst() {
        BaseViewController.W_RATE_HD    = UIScreen.main.bounds.width / GlobalConst.HD_SCREEN_BOUND.w
        BaseViewController.H_RATE_HD    = UIScreen.main.bounds.height / GlobalConst.HD_SCREEN_BOUND.h
        BaseViewController.W_RATE_FHD   = UIScreen.main.bounds.width / GlobalConst.FULL_HD_SCREEN_BOUND.w
        BaseViewController.H_RATE_FHD   = UIScreen.main.bounds.height / GlobalConst.FULL_HD_SCREEN_BOUND.h
        BaseViewController.W_RATE_FHD_L = UIScreen.main.bounds.width / GlobalConst.FULL_HD_SCREEN_BOUND.h
        BaseViewController.H_RATE_FHD_L = UIScreen.main.bounds.height / GlobalConst.FULL_HD_SCREEN_BOUND.w
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
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     * Handle show alert message
     * - parameter message: Message content
     * - parameter title:   Title
     */
    public func showAlert(message: String, title: String) {
        let msg = message.replacingOccurrences(of: "<br>", with: DomainConst.LINE_FEED)
        let alert = UIAlertController(
            title: title,
            message: msg,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: DomainConst.CONTENT00008, style: .default, handler: nil)
        alert.addAction(okAction)
        alert.popoverPresentationController?.sourceView = self.view
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
    
    /**
     * Handle make a sms message
     * - parameter phone: Phone string to send sms
     */
    public func makeASMS(phone: String) {
        let url = NSURL(string: "sms:\(phone)")
        if UIApplication.shared.canOpenURL(url as! URL) {
            UIApplication.shared.openURL(url as! URL)
        } else {
            showAlert(message: "Không nhắn tin được vào số: \(phone)")
        }
    }
    
    /**
     * Handle send email
     * - parameter email: Email to send
     */
    public func makeEmail(email: String) {
        let url = NSURL(string: "mailto:\(email)")
        if UIApplication.shared.canOpenURL(url as! URL) {
            UIApplication.shared.openURL(url as! URL)
        } else {
            showAlert(message: "Không gửi được email cho: \(email)")
        }
    }
    
    /**
     * Open Apple Store to update version of app
     */
    public func updateVersionAppStore() {
        let url = NSURL(string: BaseModel.shared.getAppStoreLink())
        if UIApplication.shared.canOpenURL(url as! URL) {
            UIApplication.shared.openURL(url as! URL)
        } else {
            showAlert(message: "Không mở được")
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
        alert.popoverPresentationController?.sourceView = self.view
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
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }
    
    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
    /**
     * Finish request register confirm handler
     */
    internal func finishRequestRegisterConfirm(_ notification: Notification) {
        //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
        //self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
        let data = (notification.object as! String)
        let model = BaseRespModel(jsonString: data)
        if model.isSuccess() {
            BaseModel.shared.resetTempToken()
            showAlert(message: model.message, okHandler: {
                (alert: UIAlertAction!) in
                self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
            })
        } else {
            showAlert(message: model.message)
        }
        //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
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
        alert.popoverPresentationController?.sourceView = self.view
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
        if BaseModel.shared.isTrainningMode {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.TRAINING_COLOR]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
        }
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
        btnMenu.imageView?.contentMode = .scaleAspectFit
        let menuNavBar          = UIBarButtonItem()
        menuNavBar.customView   = btnMenu
        menuNavBar.isEnabled    = true
        navigationBar.setLeftBarButton(menuNavBar, animated: false)
        CommonProcess.scaleNavBtn(btn: btnMenu)
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
        CommonProcess.scaleNavBtn(btn: btnNotify)
        
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
        CommonProcess.scaleNavBtn(btn: btnBack)
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
        CommonProcess.scaleNavBtn(btn: btnNotify)
        
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
    
    //++ BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    /**
     * Create right navigation item with icon
     * - parameter icon:        Icon path
     * - parameter action:      Handle when tapped on item
     * - parameter target:      Target of action
     */
    public func createRightNavigationItem(icon: String, action: Selector, target: Any?) {
        let img = ImageManager.getImage(named: icon)
        let tinted = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let btn = UIButton()
        btn.setImage(tinted, for: UIControlState())
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tintColor = UIColor.white
        btn.frame = CGRect(x: 0, y: 0,
                               width: GlobalConst.MENU_BUTTON_W,
                               height: GlobalConst.MENU_BUTTON_W)
        btn.setTitle(DomainConst.BLANK, for: UIControlState())
        btn.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        CommonProcess.scaleNavBtn(btn: btn)
        let navItem = UIBarButtonItem()
        navItem.customView = btn
        navItem.isEnabled = true
//        self.navigationItem.rightBarButtonItems?.append(navItem)
        self.navigationItem.setRightBarButton(navItem, animated: true)
    }
    
    /**
     * Create right navigation item with string
     * - parameter title:       String title
     * - parameter action:      Handle when tapped on item
     * - parameter target:      Target of action
     */
    public func createRightNavigationItem(title: String, action: Selector, target: Any?, fontSize: CGFloat = 35.0) {
        let btn = UIButton()
        btn.setTitle(title, for: UIControlState())
        btn.setTitleColor(GlobalConst.MAIN_COLOR, for: UIControlState())
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 35.0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.frame = CGRect(x: 0, y: 0,
                           width: GlobalConst.MENU_BUTTON_W,
                           height: GlobalConst.MENU_BUTTON_W)
        btn.backgroundColor = UIColor.clear
//        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        let navItem = UIBarButtonItem()
        navItem.customView = btn
        navItem.isEnabled = true
//        self.navigationItem.rightBarButtonItems?.append(navItem)
        self.navigationItem.setRightBarButton(navItem, animated: true)
    }
    //-- BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    
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
        //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//        updateNotificationStatus()
        let data = (notification.object as! String)
        let model = NotificationCountRespModel(jsonString: data)
        if model.isSuccess() {
            BaseModel.shared.setNotificationCountText(text: model.NotifyCountText)
            BaseModel.shared.setOtherInfo(data: model.otherInfo)
            updateNotificationStatus()
        }
        //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
    }
    
    /**
     * Get height of status bar + navigation bar
     * - returns: Height of status bar + navigation bar
     */
    open func getTopHeight() -> CGFloat {
        //++ BUG0156-SPJ (NguyenPT 20170924) Re-design Gas24h
//        return (self.navigationController!.navigationBar.frame.size.height
//            + UIApplication.shared.statusBarFrame.size.height)
        var retVal = UIApplication.shared.statusBarFrame.size.height
        if let navigation = self.navigationController {
            retVal += navigation.navigationBar.frame.size.height
        } else {
            retVal += 64.0
        }
        
        return retVal
        //++ BUG0156-SPJ (NguyenPT 20170924) Re-design Gas24h
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
     * Handle push to view controller
     */
    public func push(_ viewController: UIViewController, animated: Bool) {
        if let controller = BaseViewController.getCurrentViewController() {
            controller.navigationController?.pushViewController(
                viewController, animated: animated)
        }
    }
    
    /**
     * Push to a view controller with View controller name
     * - parameter name: Name of view controller
     */
    public func pushToView(name: String) {
        print(name)
        //++ BUG0050-SPJ (NguyenPT 20170403) Add new function G06
        //if self.theClassName == String.init(format: "project.\(name)") {
        if self.theClassName == name {
        //-- BUG0050-SPJ (NguyenPT 20170403) Add new function G06
            return
        }
        let view = mainStoryboard.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    /**
     * Push to a view controller with View controller name
     * Clear data before push
     * - parameter name: Name of view controller
     */
    public func pushToViewAndClearData(name: String) {
        print(name)
        self.clearData()
        pushToView(name: name)
    }
    
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Present a VC
    /**
     * Present a view controller with View controller name
     * - parameter name: Name of view controller
     * - parameter action: Name of view controller
     */
    public func presentVC(name: String, action: (() -> Void)?) {
        let view = mainStoryboard.instantiateViewController(withIdentifier: name)
        self.present(view, animated: true, completion: action)
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Present a VC
    
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
        //++ BUG0087-SPJ (NguyenPT 20170516) Remove message Logout success
//        self.showAlert(message: DomainConst.CONTENT00280, okHandler: {
//            (alert: UIAlertAction!) in
//            self.popToRootView()
//            self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
//        })
        //++ BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
//        self.popToRootView()
//        self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
        let data = (notification.object as! String)
        let model = BaseRespModel(jsonString: data)
        if model.isSuccess() {
            BaseModel.shared.logoutSuccess()
            self.popToRootView()
            self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
        } else {
            showAlert(message: model.message)
        }
        //-- BUG0047-SPJ (NguyenPT 20170724) Refactor BaseRequest class
        //-- BUG0087-SPJ (NguyenPT 20170516) Remove message Logout success
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
            let alert = UIAlertController(title: DomainConst.CONTENT00044,
                                          message: notify.getMessage(),
                                          preferredStyle: .alert)
            // OK handler
            let okAction = UIAlertAction(title: DomainConst.CONTENT00223, style: .default, handler: {
                (alert: UIAlertAction!) in
                //++ BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
//                // Confirm notify request
//                ConfirmNotifyRequest.requestConfirmNotify(notifyId: notify.getNotifyId(), type: notify.getType(), objId: notify.getId())
//                // Check if notification data is valid
//                if notify.checkNotificationExist() {
//                    // User logined
//                    if BaseModel.shared.checkIsLogin() {
//                        // Switch by type
//                        switch notify.getType() {
//                        case DomainConst.NOTIFY_VIEW_UPHOLD:
//                            BaseModel.shared.sharedDoubleStr.0 = notify.getId()
//                            BaseModel.shared.sharedDoubleStr.1 = notify.getReplyId()
//                            if BaseModel.shared.isCustomerUser() {
//                                self.pushToView(name: DomainConst.G01_F00_S03_VIEW_CTRL)
//                            } else {
//                                self.pushToView(name: DomainConst.G01_F00_S02_VIEW_CTRL)
//                            }
//                            break
//                        //++ BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
//                        case DomainConst.NOTIFY_VIEW_VIP_CUSTOMER_ORDER:
//                            BaseModel.shared.sharedString = notify.getId()
//                            self.pushToView(name: "G05F00S02VC")
//                            break
//                        //-- BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
//                        default: break
//                        }
//                    } else {
//                        self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
//                    }
//                }
                self.handleViewNotify(notify: notify)
                //-- BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
            })
            alert.addAction(okAction)
            let cancelAction = UIAlertAction(title: DomainConst.CONTENT00224, style: .cancel, handler: {
                (alert: UIAlertAction!) in
                BaseModel.shared.clearNotificationData()
            })
            alert.addAction(cancelAction)
            alert.popoverPresentationController?.sourceView = self.view
            self.present(alert, animated: true, completion: nil)
        //++ BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
//        } else {
//            // Reply confirm notify to server
//            ConfirmNotifyRequest.requestConfirmNotify(notifyId: notify.getNotifyId(), type: notify.getType(), objId: notify.getId())
        } else if !isManual && BaseModel.shared.canHandleNotification() {
            self.handleViewNotify(notify: notify)
        }
        // Reply confirm notify to server
        ConfirmNotifyRequest.requestConfirmNotify(notifyId: notify.getNotifyId(), type: notify.getType(), objId: notify.getId())
        //-- BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
    }
    //-- BUG0049-SPJ (NguyenPT 20170313) Handle notification received
    
    //++ BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
    /**
     * Handle view notification detail
     * - paramter notify:   Notification data
     */
    private func handleViewNotify(notify: NotificationBean) {
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
                case DomainConst.NOTIFY_VIEW_VIP_CUSTOMER_ORDER:
                    if BaseModel.shared.isCustomerUser() {
                        BaseModel.shared.sharedString = notify.getId()
                        self.pushToView(name: DomainConst.G05_F00_S02_VC)
                    } else if BaseModel.shared.isNVGNUser() {
                        self.pushToView(name: DomainConst.G05_F00_S03_VC)
                    }
                    break
                case DomainConst.NOTIFY_VIEW_FAMILY_UPHOLD:
                    if BaseModel.shared.isNVGNUser() {
                        self.pushToView(name: DomainConst.G01_F00_S04_VC)
                    } else {
                        BaseModel.shared.sharedString = notify.getId()
                        self.pushToView(name: DomainConst.G01_F00_S05_VC)
                    }
                    break
                //++ BUG0049-SPJ (NguyenPT 20170622) Handle notification for Order family, Ticket and SPJ code
                case DomainConst.NOTIFY_VIEW_FAMILY_CUSTOMER_ORDER:
                    if BaseModel.shared.isNVGNUser() {
                        self.pushToView(name: DomainConst.G07_F00_S01_VC)
                    }
                    break
                case DomainConst.NOTIFY_VIEW_TICKET:
                    BaseModel.shared.sharedString = notify.getId()
                    self.pushToView(name: DomainConst.G11_F00_S02_VC)
                    break
                case DomainConst.NOTIFY_VIEW_SPJ_CODE:
                    BaseModel.shared.sharedString = notify.getId()
                    self.pushToView(name: DomainConst.G06_F00_S02_VC)
                    break
                //-- BUG0049-SPJ (NguyenPT 20170622) Handle notification for Order family, Ticket and SPJ code
                //-- BUG0195-SPJ (NguyenPT 20180414) Handle announcement
                case DomainConst.GAS24h_ANNOUNCE_TYPE:
                    let id = notify.getId()
                    self.openAnnounceDetail(id: id)
                    break
                //-- BUG0195-SPJ (NguyenPT 20180414) Handle announcement
                default: break
                }
            } else {
                self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
            }
        }
    }
    //-- BUG0057-SPJ (NguyenPT 20170414) Handle notification VIP customer order
    
    //++ BUG0082-SPJ (NguyenPT 20170510) Change BaseRequest handle completion mechanism
    /**
     * Set data
     */
    open func finishRequest(_ model: Any?) {
        // Not implement
    }
    //-- BUG0082-SPJ (NguyenPT 20170510) Change BaseRequest handle completion mechanism
    
    open func openGasRemainList() {
        // Not implement
    }
    
    //++ BUG0191-SPJ (NguyenPT 20180328) Create issue list
    open func openIssueList() {
        // Not implement
    }
    //-- BUG0191-SPJ (NguyenPT 20180328) Create issue list
    
    //-- BUG0195-SPJ (NguyenPt 20180414) Add menu item
    open func openAnnounce() {
        
    }
    
    //-- BUG0191-SPJ (NguyenPT 20180328) Create issue list
    
    open func openAnnounceDetail(id: String) {
        
    }
    
    //-- BUG0195 (NguyenPt 20180414) Add menu item
    
    
    /**
     * Destructor
     */
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
