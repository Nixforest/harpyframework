//
//  BaseMenuViewController.swift
//  harpyframework
//
//  Created by SPJ on 12/24/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
open class BaseMenuViewController : UIViewController {
    /** List menu flag */
    var listMenu: [Bool] = []
    
//    /** Login item: button */
//    var loginBtn = UIButton()
//    /** Login item: icon */
//    var iconLogin = UIImageView()
//    
//    /** Logout item: button */
//    var logoutBtn = UIButton()
//    /** Logout item: icon */
//    var iconLogout = UIImageView()
//    
//    /** Register item: button */
//    var regBtn = UIButton()
//    /** Register item: icon */
//    var iconReg = UIImageView()
//
//    /** Issue item: button */
//    var dynamicMenu = [UIButton]()
//    /** Issue item: icon */
//    var iconDynamicMenu = [UIImageView]()
//
//    /** Config item: button */
//    var configBtn = UIButton()
//    /** Config item: icon */
//    var iconConfig = UIImageView()
    
    /** Scroll view */
    var _scrollView: UIScrollView   = UIScrollView()
    
    override open func viewDidLoad() {
        // Background
        self.view.layer.contents = UIImage(named: "bg_sliding_menu_body.jpg")?.cgImage
        
        // Setting top image
        let topImg: UIImageView = UIImageView()
        topImg.image = UIImage(named: "bg_sliding_menu_top.jpg")
        topImg.frame = CGRect(x: 0,
                               y: 0,
                               width: GlobalConst.POPOVER_WIDTH,
                               height: GlobalConst.LOGIN_LOGO_H * 3 / 2)
        topImg.contentMode = .scaleToFill
        topImg.translatesAutoresizingMaskIntoConstraints = true
        self.view.addSubview(topImg)
        // Setting logo
        let imgLogo: UIImageView = UIImageView()
        imgLogo.image = UIImage(named: "logo-1.png")
        imgLogo.frame = CGRect(x: GlobalConst.MARGIN,
                               y: GlobalConst.MARGIN,
                               width: GlobalConst.POPOVER_WIDTH - GlobalConst.MARGIN * 2,
                               height: GlobalConst.LOGIN_LOGO_H)
        imgLogo.contentMode = .scaleAspectFit
        imgLogo.translatesAutoresizingMaskIntoConstraints = true
        self.view.addSubview(imgLogo)
        self.preferredContentSize = CGSize(width: GlobalConst.POPOVER_WIDTH, height: GlobalConst.SCREEN_HEIGHT)
        
    }
    
    // MARK: Methods
    /**
     * Set menu item flag values
     * - parameter listValues: List of values
     */
    public func setItem(listValues: [Bool]) {
        if listValues.count <= MenuItemEnum.MENUITEM_NUM.hashValue {
            for item in listValues {
                listMenu.append(item)
            }
        }
    }
    
    /**
     * Setup for menu items view
     */
    public func setupMenuItem() {
        // Valid data menu
        if listMenu.count < MenuItemEnum.MENUITEM_NUM.hashValue {
            return
        }
        // Offset
        var offset: CGFloat = 0.0
        
        
        _scrollView.translatesAutoresizingMaskIntoConstraints = true
        _scrollView.frame = CGRect(
            x: 0,
            y: GlobalConst.LOGIN_LOGO_H * 3 / 2,
            width: GlobalConst.POPOVER_WIDTH,
            height: self.preferredContentSize.height - GlobalConst.LOGIN_LOGO_H * 3 / 2)
        
        // Dynamic menu
        if listMenu[MenuItemEnum.DYNAMIC_MENU_LIST.hashValue] {
            for item in BaseModel.shared.menu {
                var iconPath: String = "ic_menu_home.png"
                switch (item.id) {
                case DomainConst.HOME:
                    iconPath = "ic_menu_home.png"
                    break
                case DomainConst.USER_PROFILE:
                    iconPath = "ic_menu_profile.png"
                    break
                case DomainConst.UPHOLD_LIST:
                    iconPath = "list.png"
                    break
                case DomainConst.ISSUE_LIST:
                    iconPath = "list.png"
                    break
                case DomainConst.MESSAGE:
                    iconPath = "message.png"
                    break
                case DomainConst.CUSTOMER_LIST:
                    iconPath = "list.png"
                    break
                case DomainConst.WORKING_REPORT:
                    iconPath = "report.png"
                    break
                case DomainConst.ORDER_TRANSACTION_LIST:
                    iconPath = "ic_menu_shoping_cart.png"
                    break
                default:
                    break
                }
                setItemContent(title: item.name, iconPath: iconPath, action: #selector(issueItemTapped), offset: offset, id: item.id)
                offset += GlobalConst.BUTTON_HEIGHT
            }
        }
        
        // Configuration menu
        if listMenu[MenuItemEnum.CONFIG.hashValue] {
            setItemContent(title: DomainConst.CONTENT00128, iconPath: DomainConst.CONFIG_MENU_IMG_NAME, action: #selector(configItemTapped), offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Login menu
        if listMenu[MenuItemEnum.LOGIN.hashValue] {
            setItemContent(title: DomainConst.CONTENT00051, iconPath: DomainConst.LOGIN_MENU_IMG_NAME, action: #selector(loginItemTapped), offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Logout menu
        if listMenu[MenuItemEnum.LOGOUT.hashValue] {
            setItemContent(title: DomainConst.CONTENT00132, iconPath: DomainConst.LOGOUT_MENU_IMG_NAME, action: #selector(logoutItemTapped), offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Register menu
        if listMenu[MenuItemEnum.REGISTER.hashValue] {
            setItemContent(title: DomainConst.CONTENT00052, iconPath: DomainConst.REGISTER_MENU_IMG_NAME, action: #selector(registerItemTapped), offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        _scrollView.contentSize = CGSize(
            width: GlobalConst.POPOVER_WIDTH,
            height: offset + GlobalConst.BUTTON_HEIGHT)
        self.view.addSubview(_scrollView)
    }
    
    /**
     * Set menu items content
     * - parameter title: Title of item
     * - parameter iconPath: Path of icon image
     * - parameter action: Action when tab on item
     * - parameter button: Button object
     * - parameter icon: Icon image
     * - parameter offset: Y offset
     */
    func setItemContent(title: String, iconPath: String, action: Selector,
                        offset: CGFloat, id: String = "") {
        // Icon
//        icon.image = UIImage(named: iconPath)
//        icon.translatesAutoresizingMaskIntoConstraints = true
//        icon.frame = CGRect(x: GlobalConst.MARGIN,
//                            y: offset + GlobalConst.MARGIN,
//                            width: GlobalConst.BUTTON_HEIGHT - 2 * GlobalConst.MARGIN,
//                            height: GlobalConst.BUTTON_HEIGHT - 2 * GlobalConst.MARGIN)
//        
//        // Button
//        button.translatesAutoresizingMaskIntoConstraints = true
//        button.frame = CGRect(x: GlobalConst.MARGIN + icon.frame.maxX,
//                              y: offset,
//                              width: GlobalConst.POPOVER_WIDTH,
//                              height: GlobalConst.BUTTON_HEIGHT)
//        //button.backgroundColor = UIColor.white
//        button.setTitle(title, for: UIControlState())
//        button.setTitleColor(UIColor.white, for: UIControlState())
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        button.addTarget(self, action: action, for: .touchUpInside)
//        
//        _scrollView.addSubview(button)
//        _scrollView.addSubview(icon)
        let item: MenuItem = MenuItem(title: title, id: id, iconPath: iconPath, action: action)
        item.frame = CGRect(x: 0, y: offset, width: GlobalConst.POPOVER_WIDTH,
                            height: GlobalConst.BUTTON_HEIGHT)
        _scrollView.addSubview(item)
    }
    
    // MARK: Actions
    /**
     * Handle tap on login item.
     * - parameter sender: AnyObject
     */
    func loginItemTapped(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_LOGIN_ITEM), object: nil)
        }
    }
    
    /**
     * Handle tap on logout item.
     * - parameter sender: AnyObject
     */
    func logoutItemTapped(_ sender: AnyObject) {
        //++ BUG0025-SPJ (NguyenPT 20161221) Fix bug logout not success
        //Singleton.shared.logoutSuccess()
        //-- BUG0025-SPJ (NguyenPT 20161221) Fix bug logout not success
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_LOGOUT_ITEM), object: nil)
        }
    }
    
    /**
     * Handle tap on register item.
     * - parameter sender: AnyObject
     */
    func registerItemTapped(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_REGISTER_ITEM), object: nil)
        }
    }
    
    /**
     * Handle tap on issue item.
     * - parameter sender: AnyObject
     */
    func issueItemTapped(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            //            NotificationCenter.default.post(name: Notification.Name(rawValue: GlobalConst.NOTIFY_NAME_ISSUE_ITEM), object: nil)
            //            switch ((sender as! UIButton).accessibilityIdentifier) {
            //            case DomainConst.?HOME:
            //                self.win
            //                break
            //            default:
            //                break
            //            }
            let currentView: BaseViewController = BaseViewController.getCurrentViewController()
            switch ((sender as! UIButton).accessibilityIdentifier)! {
            case DomainConst.HOME:
                _ = currentView.navigationController?.popToRootViewController(animated: true)
                break
            case DomainConst.USER_PROFILE:
                let accountVC = currentView.mainStoryboard.instantiateViewController(withIdentifier: DomainConst.G00_ACCOUNT_VIEW_CTRL)
                currentView.navigationController?.pushViewController(accountVC, animated: true)
                break
            case DomainConst.UPHOLD_LIST:
                let upholdListVC = currentView.mainStoryboard.instantiateViewController(withIdentifier: DomainConst.G01_F00_S01_VIEW_CTRL)
                currentView.navigationController?.pushViewController(upholdListVC, animated: true)
                break
            case DomainConst.ISSUE_LIST:
                currentView.showAlert(message: DomainConst.CONTENT00197)
                break
            case DomainConst.MESSAGE:
                currentView.showAlert(message: DomainConst.CONTENT00197)
                break
            case DomainConst.CUSTOMER_LIST:
                currentView.showAlert(message: DomainConst.CONTENT00197)
                break
            case DomainConst.WORKING_REPORT:
                currentView.showAlert(message: DomainConst.CONTENT00197)
                break
            case DomainConst.ORDER_TRANSACTION_LIST:
                let orderList = currentView.mainStoryboard.instantiateViewController(withIdentifier: DomainConst.G04_F00_S01_VIEW_CTRL)
                currentView.navigationController?.pushViewController(orderList, animated: true)
                break
            default:
                break
            }
        }
    }
    
    /**
     * Handle tap on configuration item.
     * - parameter sender: AnyObject
     */
    open func configItemTapped(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_COFIG_ITEM), object: nil)
        }
    }
}
