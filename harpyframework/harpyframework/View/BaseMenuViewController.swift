//
//  BaseMenuViewController.swift
//  harpyframework
//
//  Created by SPJ on 12/24/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
open class BaseMenuViewController : BaseViewController {
    // MARK: Properties
    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    /** Menu item tapped delegate */
    public var menuItemTappedDelegate: MenuItemDelegate?
    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    /** List menu flag */
    var listMenu: [Bool] = []
    /** Top part height */
    var topHeight:      CGFloat = GlobalConst.LOGIN_LOGO_H * 3 / 2
    
    /** Scroll view */
    var _scrollView: UIScrollView   = UIScrollView()
    
    // MARK: Methods
    /**
     * View will appear
     */
    override open func viewWillAppear(_ animated: Bool) {
        self.update()
    }
    //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu
    
    /**
     * View did load
     */
    override open func viewDidLoad() {
        // Background
//        self.view.layer.contents = ImageManager.getImage(named: DomainConst.MENU_BKG_BODY_IMG_NAME)?.cgImage
        createBackground()
        
        // Setting top image
//        let topImg: UIImageView = UIImageView()
//        topImg.image = ImageManager.getImage(named: DomainConst.MENU_BKG_TOP_IMG_NAME)
//        topImg.frame = CGRect(x: 0,
//                               y: 0,
//                               width: GlobalConst.POPOVER_WIDTH,
//                               height: GlobalConst.LOGIN_LOGO_H * 3 / 2)
//        topImg.contentMode = .scaleToFill
//        topImg.translatesAutoresizingMaskIntoConstraints = true
//        self.view.addSubview(topImg)
//        // Setting logo
//        let imgLogo: UIImageView = UIImageView()
//        imgLogo.image = ImageManager.getImage(named: BaseModel.shared.getMainLogo())
//        imgLogo.frame = CGRect(x: GlobalConst.MARGIN,
//                               y: GlobalConst.MARGIN,
//                               width: GlobalConst.POPOVER_WIDTH - GlobalConst.MARGIN * 2,
//                               height: GlobalConst.LOGIN_LOGO_H)
//        imgLogo.contentMode = .scaleAspectFit
//        imgLogo.translatesAutoresizingMaskIntoConstraints = true
//        self.view.addSubview(imgLogo)
        createTopPart()
        self.preferredContentSize = CGSize(width: GlobalConst.POPOVER_WIDTH, height: GlobalConst.SCREEN_HEIGHT)
        
    }
    
    // MARK: Methods
    /**
     * Create background
     */
    open func createBackground() {
        self.view.layer.contents = ImageManager.getImage(named: DomainConst.MENU_BKG_BODY_IMG_NAME)?.cgImage
    }
    
    /**
     * Create top image of menu
     * - returns: Offset
     */
    open func createTopPart() {
        // Setting top image
        createTopView(topImgPath: DomainConst.MENU_BKG_TOP_IMG_NAME)
        // Setting logo
        createTopLogo(logo: BaseModel.shared.getMainLogo())
    }
    
    public func createTopView(topImgPath: String) {
        let topImg: UIImageView = UIImageView()
        topImg.image = ImageManager.getImage(named: topImgPath)
        topImg.frame = CGRect(x: 0,
                              y: 0,
                              width: GlobalConst.POPOVER_WIDTH,
                              height: GlobalConst.LOGIN_LOGO_H * 3 / 2)
        topImg.contentMode = .scaleToFill
        topImg.translatesAutoresizingMaskIntoConstraints = true
        self.view.addSubview(topImg)
    }
    
    public func createTopLogo(logo: String) {
        let imgLogo: UIImageView = UIImageView()
        imgLogo.image = ImageManager.getImage(named: logo)
        imgLogo.frame = CGRect(x: GlobalConst.MARGIN,
                               y: GlobalConst.MARGIN,
                               width: GlobalConst.POPOVER_WIDTH - GlobalConst.MARGIN * 2,
                               height: GlobalConst.LOGIN_LOGO_H)
        imgLogo.contentMode = .scaleAspectFit
        imgLogo.translatesAutoresizingMaskIntoConstraints = true
        self.view.addSubview(imgLogo)
    }
    //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu
    /**
     * Update layout of menu
     */
    open func update() {
        // Remove all current menu items
        self.listMenu.removeAll()
        
        // Re-create menu items
        if BaseModel.shared.checkIsLogin() {
            //++ BUG0130-SPJ (NguyenPT 20170724) Remove Signout menu
            //setItem(listValues: [false, true, false, true, true])
            if BaseModel.shared.isTrainningMode {   // Training mode
                setItem(listValues: [false, true, false, true, true])
            } else {                                // Normal mode
                //++ BUG0167-SPJ (NguyenPT 20171123) Remove Config menu
//                setItem(listValues: [false, false, false, true, true])
                setItem(listValues: [false, false, false, true, false])
                //-- BUG0167-SPJ (NguyenPT 20171123) Remove Config menu
            }
            //-- BUG0130-SPJ (NguyenPT 20170724) Remove Signout menu
        } else {
            //++ BUG0167-SPJ (NguyenPT 20171123) Remove Register menu
//            setItem(listValues: [true, false, true, false, true])
            setItem(listValues: [true, false, false, false, true])
            //-- BUG0167-SPJ (NguyenPT 20171123) Remove Register menu
        }
        setupMenuItem()
        
        // Update layout
        self.view.setNeedsDisplay()
    }
    
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
        
        //++ BUG0048-SPJ (NguyenPT 20170309) Remove all sub views inside scroll view
        for view in _scrollView.subviews {
            view.removeFromSuperview()
        }
        //-- BUG0048-SPJ (NguyenPT 20170309) Remove all sub views inside scroll view
        _scrollView.translatesAutoresizingMaskIntoConstraints = true
        _scrollView.frame = CGRect(
            x: 0,
//            y: GlobalConst.LOGIN_LOGO_H * 3 / 2,
            y: topHeight,
            width: GlobalConst.POPOVER_WIDTH,
//            height: self.preferredContentSize.height - GlobalConst.LOGIN_LOGO_H * 3 / 2)
            height: self.preferredContentSize.height - topHeight)
        
        // Dynamic menu
        if listMenu[MenuItemEnum.DYNAMIC_MENU_LIST.hashValue] {
            for item in BaseModel.shared.menu {
                //++ BUG0121-SPJ (NguyenPT 20170712) Add menu to Home
//                var iconPath: String = DomainConst.MENU_ITEM_HOME_IMG_NAME
//                switch (item.id) {
//                case DomainConst.HOME:
//                    iconPath = DomainConst.MENU_ITEM_HOME_IMG_NAME
//                    break
//                case DomainConst.USER_PROFILE:
//                    iconPath = DomainConst.MENU_ITEM_PROFILE_IMG_NAME
//                    break
//                case DomainConst.UPHOLD_LIST:
//                    //++ BUG0073-SPJ (NguyenPT 20170503) Change uphold list menu icon
//                    //iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
//                    iconPath = DomainConst.MENU_ITEM_SUPPORT_IMG_NAME
//                    //-- BUG0073-SPJ (NguyenPT 20170503) Add new function G08
//                    break
//                case DomainConst.ISSUE_LIST:
//                    iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
//                    break
//                case DomainConst.MESSAGE:
//                    iconPath = DomainConst.MENU_ITEM_MSG_IMG_NAME
//                    break
//                case DomainConst.CUSTOMER_LIST:
//                    iconPath = DomainConst.FAMILY_ICON_IMG_NAME
//                    break
//                case DomainConst.WORKING_REPORT:
//                    iconPath = DomainConst.MENU_ITEM_WORKING_REPORT_IMG_NAME
//                    break
//                case DomainConst.ORDER_LIST:
//                    iconPath = DomainConst.MENU_ITEM_ORDER_LIST_IMG_NAME
//                    break
//                case DomainConst.ORDER_VIP_LIST:
//                    iconPath = DomainConst.MENU_ITEM_ORDER_LIST_IMG_NAME
//                    break
//                case DomainConst.KEY_MENU_PROMOTION_LIST:
//                    iconPath = DomainConst.MENU_ITEM_GIFT_IMG_NAME
//                    break
//                //++ BUG0054-SPJ (NguyenPT 20170407) Add new key for new function G07
//                case DomainConst.ORDER_TRANSACTION_LIST:
//                    iconPath = DomainConst.MENU_ITEM_ORDER_LIST_IMG_NAME
//                //-- BUG0054-SPJ (NguyenPT 20170407) Add new key for new function G07
//                //++ BUG0073-SPJ (NguyenPT 20170503) Add new function G08
//                case DomainConst.KEY_MENU_STORE_CARD_LIST:
//                    iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
//                    break
//                case DomainConst.KEY_MENU_CASH_BOOK_LIST:
//                    iconPath = DomainConst.MENU_ITEM_CASH_BOOK_IMG_NAME
//                    break
//                case DomainConst.KEY_MENU_CASH_BOOK_SCHEDULE:
//                    iconPath = DomainConst.MENU_ITEM_CASH_BOOK_IMG_NAME
//                    break
//                case DomainConst.KEY_MENU_FAMILY_UPHOLD_LIST:
//                    iconPath = DomainConst.MENU_ITEM_SUPPORT_IMG_NAME
//                    break
//                case DomainConst.KEY_MENU_REPORT_LIST:
//                    iconPath = DomainConst.REPORT_SUM_ICON_IMG_NAME
//                    break
//                //-- BUG0073-SPJ (NguyenPT 20170503) Add new function G08
//                //++ BUG0102-SPJ (NguyenPT 20170604) Update function G11
//                case DomainConst.KEY_MENU_TICKET_LIST:
//                    iconPath = DomainConst.TICKET_ICON_IMG_NAME
//                    break
//                case DomainConst.KEY_MENU_GOOGLE_MAP:
//                    iconPath = DomainConst.MAP_ICON_IMG_NAME
//                    break
//                //-- BUG0102-SPJ (NguyenPT 20170604) Update function G11
//                //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
//                case DomainConst.KEY_MENU_CCS_CODE_LIST:
//                    iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
//                //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
//                default:
//                    break
//                }
                let iconPath = BaseMenuViewController.getMenuIcon(id: item.id)
                //-- BUG0121-SPJ (NguyenPT 20170712) Add menu to Home
                setItemContent(title: item.name, iconPath: iconPath,
                               //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
                               //action: #selector(issueItemTapped),
                               action: #selector(menuItemTapped),
                               //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
                               offset: offset, id: item.id)
                offset += GlobalConst.BUTTON_HEIGHT
            }
        }
        
        // Configuration menu
        if listMenu[MenuItemEnum.CONFIG.hashValue] {
            setItemContent(title: DomainConst.CONTENT00128,
                           iconPath: DomainConst.CONFIG_MENU_IMG_NAME,
                           //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
                           //action: #selector(configItemTapped),
                           action: #selector(menuItemTapped(_:)),
                           offset: offset,
                           id: DomainConst.G00_CONFIGURATION_VIEW_CTRL)
                           //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Login menu
        if listMenu[MenuItemEnum.LOGIN.hashValue] {
            setItemContent(title: DomainConst.CONTENT00051,
                           iconPath: DomainConst.LOGIN_MENU_IMG_NAME,
                           //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
                           //action: #selector(loginItemTapped), offset: offset)
                           action: #selector(menuItemTapped),
                           offset: offset,
                           id: DomainConst.G00_LOGIN_VIEW_CTRL)
                           //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Logout menu
        if listMenu[MenuItemEnum.LOGOUT.hashValue] {
            setItemContent(title: DomainConst.CONTENT00132,
                           iconPath: DomainConst.LOGOUT_MENU_IMG_NAME,
                           //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
                           //action: #selector(logoutItemTapped), offset: offset)
                           action: #selector(menuItemTapped),
                           offset: offset,
                           id: DomainConst.NOTIFY_NAME_LOGOUT_ITEM)
                           //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        // Register menu
        if listMenu[MenuItemEnum.REGISTER.hashValue] {
            setItemContent(title: DomainConst.CONTENT00052,
                           iconPath: DomainConst.REGISTER_MENU_IMG_NAME,
                           //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
                           //action: #selector(registerItemTapped), offset: offset)
                           action: #selector(menuItemTapped),
                           offset: offset,
                           id: DomainConst.G00_REGISTER_VIEW_CTRL)
                           //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
            offset += GlobalConst.BUTTON_HEIGHT
        }
        
        _scrollView.contentSize = CGSize(
            width: GlobalConst.POPOVER_WIDTH,
            //height: offset + GlobalConst.BUTTON_HEIGHT)
            height: offset)
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
        let item: MenuItem = MenuItem(title: title, id: id, iconPath: iconPath, action: action)
        item.frame = CGRect(x: 0, y: offset, width: GlobalConst.POPOVER_WIDTH,
                            height: GlobalConst.BUTTON_HEIGHT)
        _scrollView.addSubview(item)
    }
    
    // MARK: Actions
    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    /**
     * Handle tap on menu item.
     * - parameter sender: AnyObject
     */
    func menuItemTapped(_ sender: AnyObject) {
        //++ BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
//        self.dismiss(animated: true, completion: {
//            self.menuItemTappedDelegate?.menuItemTapped(sender)
//        })
        if let currentView = BaseViewController.getCurrentViewController() {
        // Close slide menu
        BaseViewController.getRootController()?.closeLeft()
        switch (sender as! UIButton).accessibilityIdentifier! {
        case DomainConst.G00_CONFIGURATION_VIEW_CTRL:       // Config menu
            //currentView.pushToView(name: DomainConst.G00_CONFIGURATION_VIEW_CTRL)
            currentView.pushToViewAndClearData(name: DomainConst.G00_CONFIGURATION_VIEW_CTRL)
            break
        case DomainConst.G00_LOGIN_VIEW_CTRL:               // Login menu
            //++ BUG0156-SPJ (NguyenPT 20170922) Re-design Gas24h
            //currentView.pushToView(name: DomainConst.G00_LOGIN_VIEW_CTRL)
            openLogin()
            //-- BUG0156-SPJ (NguyenPT 20170922) Re-design Gas24h
            break
        case DomainConst.NOTIFY_NAME_LOGOUT_ITEM:           // Logout menu
            LogoutRequest.requestLogout(action: #selector(currentView.finishRequestLogout), view: currentView)
            break
        case DomainConst.G00_REGISTER_VIEW_CTRL:            // Register menu
            currentView.pushToView(name: DomainConst.G00_REGISTER_VIEW_CTRL)
            break
        case DomainConst.HOME:                              // Home menu
            //++ BUG0165-SPJ (NguyenPT 20171123) Override select home menu
//            currentView.clearData()
//            currentView.popToRootView()
            openHome()
            //-- BUG0165-SPJ (NguyenPT 20171123) Override select home menu
            break
        case DomainConst.USER_PROFILE:                      // User profile
            //currentView.pushToView(name: DomainConst.G00_ACCOUNT_VIEW_CTRL)
            //currentView.pushToViewAndClearData(name: DomainConst.G00_ACCOUNT_VIEW_CTRL)
            openUserProfile()
            break
        case DomainConst.UPHOLD_LIST:                       // Uphold list
            //currentView.pushToView(name: DomainConst.G01_F00_S01_VIEW_CTRL)
            currentView.pushToViewAndClearData(name: DomainConst.G01_F00_S01_VIEW_CTRL)
            break
        case DomainConst.ISSUE_LIST:                        // Issue list
            currentView.showAlert(message: DomainConst.CONTENT00362)
            break
        case DomainConst.MESSAGE:                           // Message
            //currentView.showAlert(message: DomainConst.CONTENT00362)
            currentView.pushToViewAndClearData(name: "G03F00S01VC")
            break
        case DomainConst.CUSTOMER_LIST:                     // Customer list
            //currentView.showAlert(message: DomainConst.CONTENT00197)
            //currentView.pushToView(name: DomainConst.G06_F00_S01_VC)
            currentView.pushToViewAndClearData(name: DomainConst.G06_F00_S01_VC)
            break
        case DomainConst.WORKING_REPORT:                    // Working report
            //currentView.showAlert(message: DomainConst.CONTENT00197)
            //currentView.pushToView(name: DomainConst.G06_F00_S04_VC)
            currentView.pushToViewAndClearData(name: DomainConst.G06_F00_S04_VC)
            break
        case DomainConst.ORDER_LIST:                        // Order list
            //currentView.pushToView(name: DomainConst.G04_F00_S01_VIEW_CTRL)
            //currentView.pushToViewAndClearData(name: DomainConst.G04_F00_S01_VIEW_CTRL)
            openListOrder()
            break
        case DomainConst.ORDER_VIP_LIST:                    // VIP order list
            //currentView.pushToView(name: DomainConst.G05_F00_S01_VIEW_CTRL)
            //++ BUG0060-SPJ (NguyenPT 20170421) Add new constant for G05F00S03VC
            //currentView.pushToViewAndClearData(name: DomainConst.G05_F00_S01_VIEW_CTRL)
            if BaseModel.shared.isCustomerUser() {
                currentView.pushToViewAndClearData(name: DomainConst.G05_F00_S01_VIEW_CTRL)
            } else {
                currentView.pushToViewAndClearData(name: DomainConst.G05_F00_S03_VIEW_CTRL)
            }
            //-- BUG0060-SPJ (NguyenPT 20170421) Add new constant for G05F00S03VC
            break
        case DomainConst.KEY_MENU_PROMOTION_LIST:           // Promotion list
            //currentView.pushToView(name: DomainConst.G04_F02_S01_VIEW_CTRL)
//            currentView.pushToViewAndClearData(name: DomainConst.G04_F02_S01_VIEW_CTRL)
            openPromotion()
            break
        //++ BUG0054-SPJ (NguyenPT 20170407) Add new key for new function G07
        case DomainConst.ORDER_TRANSACTION_LIST:
            currentView.pushToViewAndClearData(name: DomainConst.G07_F00_S01_VC)
        //-- BUG0054-SPJ (NguyenPT 20170407) Add new key for new function G07
        //++ BUG0073-SPJ (NguyenPT 20170503) Add new function G08
        case DomainConst.KEY_MENU_STORE_CARD_LIST:
            currentView.pushToViewAndClearData(name: DomainConst.G08_F00_S01_VC)
            break
        case DomainConst.KEY_MENU_CASH_BOOK_LIST:
            BaseModel.shared.sharedString = DomainConst.CASHBOOK_TYPE_LIST
            currentView.pushToViewAndClearData(name: DomainConst.G09_F00_S01_VC)
            break
        case DomainConst.KEY_MENU_CASH_BOOK_SCHEDULE:
            BaseModel.shared.sharedString = DomainConst.CASHBOOK_TYPE_SCHEDULE
            currentView.pushToViewAndClearData(name: DomainConst.G09_F00_S03_VC)
            break
        case DomainConst.KEY_MENU_FAMILY_UPHOLD_LIST:
            //currentView.showAlert(message: DomainConst.CONTENT00362)
            currentView.pushToViewAndClearData(name: DomainConst.G01_F00_S04_VC)
            break
        case DomainConst.KEY_MENU_REPORT_LIST:
            //currentView.showAlert(message: DomainConst.CONTENT00362)
            currentView.pushToViewAndClearData(name: DomainConst.G10_F00_S01_VC)
            break
        //-- BUG0073-SPJ (NguyenPT 20170503) Add new function G08
        //++ BUG0102-SPJ (NguyenPT 20170604) Update function G11
        case DomainConst.KEY_MENU_TICKET_LIST:
            currentView.pushToViewAndClearData(name: DomainConst.G11_F00_S01_VC)
            break
        case DomainConst.KEY_MENU_GOOGLE_MAP:
            //currentView.showAlert(message: DomainConst.CONTENT00362)
            currentView.pushToViewAndClearData(name: "G05F01S01VC")
            break
        //-- BUG0102-SPJ (NguyenPT 20170604) Update function G11
        //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
        case DomainConst.KEY_MENU_CCS_CODE_LIST:
            currentView.pushToViewAndClearData(name: "G06F00S06VC")
            break
        //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
            
        //++ BUG0171-SPJ (NguyenPT 20171127	) Add new menu
        case DomainConst.KEY_MENU_PROMOTION_POLICY:
            openPromotionPolicy()
            break
        case DomainConst.KEY_MENU_APP_GUIDE:
            openAppGuide()
            break
        //-- BUG0171-SPJ (NguyenPT 20171127	) Add new menu
        //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
        case DomainConst.KEY_ANNOUNCE_LIST:
            openAnnounce()
        //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
        case DomainConst.KEY_MAP_AGENT:
            openMapAgent()
        default:
            currentView.showAlert(message: DomainConst.CONTENT00362)
            break
        }
        }
        //-- BUG0048-SPJ (NguyenPT 20170309) Remove popover menu
    }
    
//    /**
//     * Handle tap on login item.
//     * - parameter sender: AnyObject
//     */
//    func loginItemTapped(_ sender: AnyObject) {
//        self.dismiss(animated: false) {
//            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_LOGIN_ITEM), object: nil)
//        }
//    }
    
//    /**
//     * Handle tap on logout item.
//     * - parameter sender: AnyObject
//     */
//    func logoutItemTapped(_ sender: AnyObject) {
//        //++ BUG0025-SPJ (NguyenPT 20161221) Fix bug logout not success
//        //Singleton.shared.logoutSuccess()
//        //-- BUG0025-SPJ (NguyenPT 20161221) Fix bug logout not success
//        self.dismiss(animated: false) {
//            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_LOGOUT_ITEM), object: nil)
//        }
//    }
    
//    /**
//     * Handle tap on register item.
//     * - parameter sender: AnyObject
//     */
//    func registerItemTapped(_ sender: AnyObject) {
//        self.dismiss(animated: false) {
//            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_REGISTER_ITEM), object: nil)
//        }
//    }
    
//    /**
//     * Handle tap on issue item.
//     * - parameter sender: AnyObject
//     */
//    func issueItemTapped(_ sender: AnyObject) {
//        self.dismiss(animated: false) {
//            let currentView: BaseViewController = BaseViewController.getCurrentViewController()
//            switch ((sender as! UIButton).accessibilityIdentifier)! {
//            case DomainConst.HOME:
//                _ = currentView.popToRootView()
//                break
//            case DomainConst.USER_PROFILE:
//                currentView.pushToView(name: DomainConst.G00_ACCOUNT_VIEW_CTRL)
//                break
//            case DomainConst.UPHOLD_LIST:
//                currentView.pushToView(name: DomainConst.G01_F00_S01_VIEW_CTRL)
//                break
//            case DomainConst.ISSUE_LIST:
//                currentView.showAlert(message: DomainConst.CONTENT00197)
//                break
//            case DomainConst.MESSAGE:
//                currentView.showAlert(message: DomainConst.CONTENT00197)
//                break
//            case DomainConst.CUSTOMER_LIST:
//                currentView.showAlert(message: DomainConst.CONTENT00197)
//                break
//            case DomainConst.WORKING_REPORT:
//                currentView.showAlert(message: DomainConst.CONTENT00197)
//                break
//            case DomainConst.ORDER_LIST:
//                currentView.pushToView(name: DomainConst.G04_F00_S01_VIEW_CTRL)
//                break
//            case DomainConst.ORDER_VIP_LIST:
//                currentView.pushToView(name: DomainConst.G05_F00_S01_VIEW_CTRL)
//                break
//            case DomainConst.KEY_MENU_PROMOTION_LIST:
//                currentView.pushToView(name: DomainConst.G04_F02_S01_VIEW_CTRL)
//                break
//            default:
//                break
//            }
//        }
//    }
    
//    /**
//     * Handle tap on configuration item.
//     * - parameter sender: AnyObject
//     */
//    open func configItemTapped(_ sender: AnyObject) {
//        self.dismiss(animated: false) {
//            NotificationCenter.default.post(name: Notification.Name(rawValue: DomainConst.NOTIFY_NAME_COFIG_ITEM), object: nil)
//        }
//    }
    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    
    /**
     * Destructor
     */
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //++ BUG0121-SPJ (NguyenPT 20170712) Add menu to Home
    /**
     * Get Menu icon from menu id
     * - parameter id: Id of menu
     * - returns: Icon path of menu
     */
    public static func getMenuIcon(id: String) -> String {
        var iconPath: String = DomainConst.MENU_ITEM_HOME_IMG_NAME
        switch (id) {
        case DomainConst.HOME:
            iconPath = DomainConst.MENU_ITEM_HOME_IMG_NAME
            break
        case DomainConst.USER_PROFILE:
            iconPath = DomainConst.MENU_ITEM_PROFILE_IMG_NAME
            break
        case DomainConst.UPHOLD_LIST:
            iconPath = DomainConst.MENU_ITEM_SUPPORT_IMG_NAME
            break
        case DomainConst.ISSUE_LIST:
            iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
            break
        case DomainConst.MESSAGE:
            iconPath = DomainConst.MENU_ITEM_MSG_IMG_NAME
            break
        case DomainConst.CUSTOMER_LIST:
            iconPath = DomainConst.FAMILY_ICON_IMG_NAME
            break
        case DomainConst.WORKING_REPORT:
            iconPath = DomainConst.MENU_ITEM_WORKING_REPORT_IMG_NAME
            break
        case DomainConst.ORDER_LIST:
            iconPath = DomainConst.MENU_ITEM_ORDER_LIST_IMG_NAME
            break
        case DomainConst.ORDER_VIP_LIST:
            iconPath = DomainConst.MENU_ITEM_ORDER_LIST_IMG_NAME
            break
        case DomainConst.KEY_MENU_PROMOTION_LIST:
            iconPath = DomainConst.MENU_ITEM_GIFT_IMG_NAME
            break
        case DomainConst.ORDER_TRANSACTION_LIST:
            iconPath = DomainConst.MENU_ITEM_ORDER_LIST_IMG_NAME
        case DomainConst.KEY_MENU_STORE_CARD_LIST:
            iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
            break
        case DomainConst.KEY_MENU_CASH_BOOK_LIST:
            iconPath = DomainConst.MENU_ITEM_CASH_BOOK_IMG_NAME
            break
        case DomainConst.KEY_MENU_CASH_BOOK_SCHEDULE:
            iconPath = DomainConst.MENU_ITEM_CASH_BOOK_IMG_NAME
            break
        case DomainConst.KEY_MENU_FAMILY_UPHOLD_LIST:
            iconPath = DomainConst.MENU_ITEM_SUPPORT_IMG_NAME
            break
        case DomainConst.KEY_MENU_REPORT_LIST:
            iconPath = DomainConst.REPORT_SUM_ICON_IMG_NAME
            break
        case DomainConst.KEY_MENU_TICKET_LIST:
            iconPath = DomainConst.TICKET_ICON_IMG_NAME
            break
        case DomainConst.KEY_MENU_GOOGLE_MAP:
            iconPath = DomainConst.MAP_ICON_IMG_NAME
            break
        case DomainConst.KEY_MENU_CCS_CODE_LIST:
            iconPath = DomainConst.MENU_ITEM_UPHOLD_LIST_IMG_NAME
            break            
        //++ BUG0171-SPJ (NguyenPT 20171127	) Add new menu
        case DomainConst.KEY_MENU_PROMOTION_POLICY:
            iconPath = DomainConst.MENU_ITEM_PROMOTION_POLICY
            break
        case DomainConst.KEY_MENU_APP_GUIDE:
            iconPath = DomainConst.MENU_ITEM_APP_GUIDE
            break
        //-- BUG0171-SPJ (NguyenPT 20171127	) Add new menu
        //++ BUG0195-SPJ (NguyenPT 20180411) Add function announce
        case DomainConst.KEY_ANNOUNCE_LIST:
            iconPath = DomainConst.MENU_NOTICE_ICON_IMG_NAME
        //-- BUG0195-SPJ (NguyenPT 20180411) Add function announce
        case DomainConst.KEY_MAP_AGENT:
            iconPath = DomainConst.MENU_MAP_ICON_IMG_NAME
        default:
            break
        }
        return iconPath
    }
    //-- BUG0121-SPJ (NguyenPT 20170712) Add menu to Home
    //++ BUG0156-SPJ (NguyenPT 20170922) Re-design Gas24h
    /**
     * Update value of top height
     * - parameter value: Value to update
     */
    public func updateTopPartHeight(value: CGFloat) {
        self.topHeight = value
    }
    
    /**
     * Get value of top height
     */
    public func getTopPartHeight() -> CGFloat {
        return self.topHeight
    }
    //-- BUG0156-SPJ (NguyenPT 20170922) Re-design Gas24h
}
