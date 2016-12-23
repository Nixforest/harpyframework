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
    
    /** Login item: button */
    var loginBtn = UIButton()
    /** Login item: icon */
    var iconLogin = UIImageView()
    
    /** Logout item: button */
    var logoutBtn = UIButton()
    /** Logout item: icon */
    var iconLogout = UIImageView()
    
    /** Register item: button */
    var regBtn = UIButton()
    /** Register item: icon */
    var iconReg = UIImageView()
    
    /** Issue item: button */
    var dynamicMenu = [UIButton]()
    /** Issue item: icon */
    var iconDynamicMenu = [UIImageView]()
    
    /** Config item: button */
    var configBtn = UIButton()
    /** Config item: icon */
    var iconConfig = UIImageView()
    
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
        
        // Login menu
        if listMenu[MenuItemEnum.LOGIN.hashValue] {
            setItemContent(title: GlobalConst.CONTENT00051, iconPath: GlobalConst.LOGIN_MENU_IMG_NAME, action: #selector(loginItemTapped), button: loginBtn, icon: iconLogin, offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Logout menu
        if listMenu[MenuItemEnum.LOGOUT.hashValue] {
            setItemContent(title: GlobalConst.CONTENT00132, iconPath: GlobalConst.LOGOUT_MENU_IMG_NAME, action: #selector(logoutItemTapped), button: logoutBtn, icon: iconLogout, offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Register menu
        if listMenu[MenuItemEnum.REGISTER.hashValue] {
            setItemContent(title: GlobalConst.CONTENT00052, iconPath: GlobalConst.REGISTER_MENU_IMG_NAME, action: #selector(registerItemTapped), button: regBtn, icon: iconReg, offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Dynamic menu
        if listMenu[MenuItemEnum.DYNAMIC_MENU_LIST.hashValue] {
            for item in BaseModel.shared.menu {
                let btn = UIButton()
                let icon = UIImageView()
                btn.accessibilityIdentifier = item.id
                setItemContent(title: item.name, iconPath: GlobalConst.ISSUE_MENU_IMG_NAME, action: #selector(issueItemTapped), button: btn, icon: icon, offset: offset)
                offset += GlobalConst.BUTTON_HEIGHT
            }
        }
        
        // Configuration menu
        if listMenu[MenuItemEnum.CONFIG.hashValue] {
            setItemContent(title: GlobalConst.CONTENT00128, iconPath: GlobalConst.CONFIG_MENU_IMG_NAME, action: #selector(configItemTapped), button: configBtn, icon: iconConfig, offset: offset)
            offset += GlobalConst.BUTTON_HEIGHT
        }
        self.preferredContentSize = CGSize(width: GlobalConst.POPOVER_WIDTH, height: offset)
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
                        button: UIButton, icon: UIImageView, offset: CGFloat) {
        // Icon
        icon.image = UIImage(named: iconPath)
        icon.translatesAutoresizingMaskIntoConstraints = true
        icon.frame = CGRect(x: GlobalConst.MARGIN,
                            y: offset + GlobalConst.MARGIN,
                            width: GlobalConst.BUTTON_HEIGHT - 2 * GlobalConst.MARGIN,
                            height: GlobalConst.BUTTON_HEIGHT - 2 * GlobalConst.MARGIN)
        
        // Button
        button.translatesAutoresizingMaskIntoConstraints = true
        button.frame = CGRect(x: GlobalConst.MARGIN + icon.frame.maxX,
                              y: offset,
                              width: GlobalConst.POPOVER_WIDTH,
                              height: GlobalConst.BUTTON_HEIGHT)
        button.backgroundColor = UIColor.white
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(GlobalConst.BUTTON_COLOR_RED, for: UIControlState())
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: action, for: .touchUpInside)
        
        self.view.addSubview(button)
        self.view.addSubview(icon)
    }
    
    // MARK: Actions
    /**
     * Handle tap on login item.
     * - parameter sender: AnyObject
     */
    func loginItemTapped(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: GlobalConst.NOTIFY_NAME_LOGIN_ITEM), object: nil)
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
            NotificationCenter.default.post(name: Notification.Name(rawValue: GlobalConst.NOTIFY_NAME_LOGOUT_ITEM), object: nil)
        }
    }
    
    /**
     * Handle tap on register item.
     * - parameter sender: AnyObject
     */
    func registerItemTapped(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: GlobalConst.NOTIFY_NAME_REGISTER_ITEM), object: nil)
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
                let accountVC = currentView.mainStoryboard.instantiateViewController(withIdentifier: GlobalConst.G00_ACCOUNT_VIEW_CTRL)
                currentView.navigationController?.pushViewController(accountVC, animated: true)
                break
            case DomainConst.UPHOLD_LIST:
                let upholdListVC = currentView.mainStoryboard.instantiateViewController(withIdentifier: GlobalConst.G01_F00_S01_VIEW_CTRL)
                currentView.navigationController?.pushViewController(upholdListVC, animated: true)
                break
            case DomainConst.ISSUE_LIST:
                currentView.showAlert(message: GlobalConst.CONTENT00197)
                break
            case DomainConst.MESSAGE:
                currentView.showAlert(message: GlobalConst.CONTENT00197)
                break
            case DomainConst.CUSTOMER_LIST:
                currentView.showAlert(message: GlobalConst.CONTENT00197)
                break
            case DomainConst.WORKING_REPORT:
                currentView.showAlert(message: GlobalConst.CONTENT00197)
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
            NotificationCenter.default.post(name: Notification.Name(rawValue: GlobalConst.NOTIFY_NAME_COFIG_ITEM), object: nil)
        }
    }
}
