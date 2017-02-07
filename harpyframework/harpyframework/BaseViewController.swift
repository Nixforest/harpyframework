//
//  CommonViewController.swift
//  harpyframework
//
//  Created by SPJ on 12/23/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
open class BaseViewController : UIViewController, UIPopoverPresentationControllerDelegate {
    // MARK: Properties
    /** Navigation bar */
    @IBOutlet weak public var navigationBar: UINavigationItem!
    /** Menu button */
    @IBOutlet weak public var menuButton: UIButton!
    /** Notification button */
    @IBOutlet weak public var notificationButton: UIButton!
    /** Back button */
    @IBOutlet weak public var backButton: UIButton!
    /** Flag check keyboard is show or hide */
    public var isKeyboardShow : Bool = false
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
        BaseViewController.getCurrentViewController().view.addSubview(label)
        
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
            RequestAPI.requestRegisterConfirm(code: (alert.textFields?[0].text)!, view: self)
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
    
    /**
     * Handle show alert message
     * - parameter message: Message content
     * - parameter okHandler: Handler when tap OK button
     * - parameter cancelHandler: Handler when tap Cancel button
     */
    public func showAlert(message: String, okHandler: @escaping (UIAlertAction) -> Swift.Void, cancelHandler: @escaping (UIAlertAction) -> Swift.Void) -> Void {
        let alert       = UIAlertController(title: DomainConst.CONTENT00162, message: message, preferredStyle: .alert)
        let okAction    = UIAlertAction(title: DomainConst.CONTENT00008, style: .default, handler: okHandler)
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: DomainConst.CONTENT00202, style: .cancel, handler: cancelHandler)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /**
     * Set up for navigation bar
     * - parameter title:           Title of view
     * - parameter isNotifyEnable:  True is enable notify button, False otherwise
     * - parameter isHiddenBackBtn: Flag hide back button
     */
    public func setupNavigationBar(title: String, isNotifyEnable: Bool, isHiddenBackBtn: Bool = false) {
        // Set title
        self.navigationBar.title = title
        // Set color text
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
        
        // Menu button
        let menu                = ImageManager.getImage(named: DomainConst.MENU_IMG_NAME)
        let tintedImg           = menu?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        menuButton.setImage(tintedImg, for: UIControlState())
        menuButton.tintColor    = GlobalConst.BUTTON_COLOR_RED
        menuButton.frame        = CGRect(x: 0, y: 0,
                                         width: GlobalConst.MENU_BUTTON_W,
                                         height: GlobalConst.MENU_BUTTON_H)
        menuButton.setTitle("", for: UIControlState())
        let menuNavBar          = UIBarButtonItem()
        menuNavBar.customView   = menuButton
        menuNavBar.isEnabled    = true
        
        // Notify button
        notificationButton.frame = CGRect(x: 0, y: 0,
                                          width: GlobalConst.MENU_BUTTON_W,
                                          height: GlobalConst.NOTIFY_BUTTON_H)
        notificationButton.layer.cornerRadius = 0.5 * notificationButton.bounds.size.width
        notificationButton.setTitle("!", for: UIControlState())
        notificationButton.setTitleColor(UIColor.white, for: UIControlState())
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        // Set status of notify button
        if isNotifyEnable {
            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
        let notifyNavBar = UIBarButtonItem()
        notifyNavBar.customView = notificationButton
        notifyNavBar.isEnabled = isNotifyEnable
        
        // Set on Navigation bar
        self.navigationItem.rightBarButtonItems = [menuNavBar, notifyNavBar]
        
        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        backButton.setImage(tintedBack, for: UIControlState())
        backButton.tintColor = GlobalConst.BUTTON_COLOR_RED
        backButton.frame = CGRect(x: 0, y: 0,
                                  width: GlobalConst.MENU_BUTTON_W,
                                  height: GlobalConst.MENU_BUTTON_W)
        backButton.setTitle("", for: UIControlState())
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        let backNavBar = UIBarButtonItem()
        backNavBar.customView = backButton
        backNavBar.isEnabled = true
        navigationBar.setLeftBarButton(backNavBar, animated: false)
        backButton.isHidden = isHiddenBackBtn
    }
    
    /**
     * Set up for navigation bar
     * - parameter title: Title of view
     * - parameter isNotifyEnable:      True is enable notify button, False otherwise
     * - parameter isHiddenBackBtn:     Flag hide back button
     * - parameter isEnabledMenuBtn:    Flag enable/disable menu button
     */
    public func setupNavigationBar(title: String, isNotifyEnable: Bool, isHiddenBackBtn: Bool = false, isEnabledMenuBtn: Bool = false) {
        // Set title
        self.navigationBar.title = title
        // Set color text
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
        
        // Menu button
        let menu                = ImageManager.getImage(named: DomainConst.MENU_IMG_NAME)
        let tintedImg           = menu?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        menuButton.setImage(tintedImg, for: UIControlState())
        menuButton.tintColor    = GlobalConst.BUTTON_COLOR_RED
        menuButton.frame        = CGRect(x: 0, y: 0,
                                         width: GlobalConst.MENU_BUTTON_W,
                                         height: GlobalConst.MENU_BUTTON_H)
        menuButton.setTitle("", for: UIControlState())
        let menuNavBar          = UIBarButtonItem()
        menuNavBar.customView   = menuButton
        menuNavBar.isEnabled    = true
        
        // Notify button
        notificationButton.frame = CGRect(x: 0, y: 0,
                                          width: GlobalConst.MENU_BUTTON_W,
                                          height: GlobalConst.NOTIFY_BUTTON_H)
        notificationButton.layer.cornerRadius = 0.5 * notificationButton.bounds.size.width
        notificationButton.setTitle("!", for: UIControlState())
        notificationButton.setTitleColor(UIColor.white, for: UIControlState())
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        // Set status of notify button
        if isNotifyEnable {
            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
        let notifyNavBar = UIBarButtonItem()
        notifyNavBar.customView = notificationButton
        notifyNavBar.isEnabled = isNotifyEnable
        
        // Set on Navigation bar
        self.navigationItem.rightBarButtonItems = [menuNavBar, notifyNavBar]
        
        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        backButton.setImage(tintedBack, for: UIControlState())
        backButton.tintColor = GlobalConst.BUTTON_COLOR_RED
        backButton.frame = CGRect(x: 0, y: 0,
                                  width: GlobalConst.MENU_BUTTON_W,
                                  height: GlobalConst.MENU_BUTTON_W)
        backButton.setTitle("", for: UIControlState())
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        let backNavBar = UIBarButtonItem()
        backNavBar.customView = backButton
        backNavBar.isEnabled = true
        navigationBar.setLeftBarButton(backNavBar, animated: false)
        backButton.isHidden = isHiddenBackBtn
        menuButton.isEnabled = isEnabledMenuBtn
    }
    
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
    public func backButtonTapped(_ sender: AnyObject) {
        self.clearData()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    /**
     * Handle when tap on Config menu item
     */
    public func configItemTap(_ notification: Notification) {
        self.pushToView(name: DomainConst.G00_CONFIGURATION_VIEW_CTRL)
    }
    
    /**
     * Handle when tap on Home menu item
     */
    public func gasServiceItemTapped(_ notification: Notification) {
        self.popToRootView()
    }
    
    /**
     * Handle when tap on Home menu item
     */
    public func issueItemTapped(_ notification: Notification) {
        showAlert(message: "issueItemTapped")
    }
    
    /**
     * Handle when tap on Log out menu item
     */
    public func logoutItemTapped(_ notification: Notification) {
        RequestAPI.requestLogout(view: self)
    }
    
    /**
     * Handle tap on Register menu item
     */
    public func registerItemTapped(_ notification: Notification){
        self.pushToView(name: DomainConst.G00_REGISTER_VIEW_CTRL)
    }
    
    /**
     * Handle tap on Login menu item
     */
    public func loginItemTapped(_ notification: Notification) {
        self.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
    }
    
    /**
     * Clear data on current view.
     */
    open func clearData() {
        
    }
    
    /**
     * Update notification button status
     */
    public func updateNotificationStatus() {
        self.notificationButton.isEnabled = !BaseModel.shared.notifyCountText.isEmpty
        if !BaseModel.shared.notifyCountText.isEmpty {
            self.notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            self.notificationButton.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
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
    static func getCurrentViewController() -> BaseViewController {
        var currentView: UIViewController? = nil
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            currentView = navigationController.visibleViewController
        }
        return currentView as! BaseViewController
    }
    
    /**
     * Override: show menu controller
     */
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DomainConst.POPOVER_MENU_IDENTIFIER {
            let popoverVC = segue.destination
            popoverVC.popoverPresentationController?.delegate = self
        }
    }
    
    /**
     * ...
     */
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    /**
     * Push to a view controller with View controller name
     * - parameter name: Name of view controller
     */
    public func pushToView(name: String) {
        let view = mainStoryboard.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    /**
     * Move to root view of view hierarchy
     */
    public func popToRootView() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}
