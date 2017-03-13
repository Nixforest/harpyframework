//
//  BaseModel.swift
//  harpyframework
//
//  Created by SPJ on 12/23/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation

public class BaseModel: NSObject {
    /**
     * Object instance
     */
    public static let shared: BaseModel = {
        let instance = BaseModel()
        return instance
    }()
    /** Default Setting */
    let defaults = UserDefaults.standard
    /** Flag login */
    var isLogin = Bool()
    /** Flag training mode */
    var isTrainningMode = Bool()
    /** User token */
    var userToken: String = ""
    /** Temp token */
    var tempToken: String = ""
    /** Device token */
    var deviceToken: String = ""
    /** List menu */
    var menu: [ConfigBean] = [ConfigBean]()
    /** List data uphold */
    var data_uphold: [ConfigBean] = [ConfigBean]()
    /** Max upload */
    var max_upload: String = ""
    /** List uphold status */
    public var listUpholdStatus: [ConfigBean] = [ConfigBean]()
    /** List uphold type */
    public var listUpholdType: [ConfigBean] = [ConfigBean]()
    /** List contact type */
    public var listContactType: [ConfigBean] = [ConfigBean]()
    /** List hour handle */
    public var listHourHandle: [ConfigBean] = [ConfigBean]()
    /** List menu permission */
    var listMenuPermission: [ConfigBean] = [ConfigBean]()
    /** List rating status */
    public var listRatingStatus: [ConfigBean] = [ConfigBean]()
    /** List rating type */
    public var listRatingType: [ConfigBean] = [ConfigBean]()
    /** Id of role */
    var role_id: String = ""
    /** List user info */
    public var user_info: UserInfoBean? = nil
    /** User information get from login */
    public var user_info_login: [ConfigBean] = [ConfigBean]()
    /** List check menu */
    var check_menu: [ConfigBean] = [ConfigBean]()
    /** Flag need change pass */
    var need_change_pass: String = ""
    /** Flag need update app */
    var need_update_app: String = ""
    /** Name of role */
    var role_name: String = ""
    /** List streets */
    var list_street: [ConfigBean] = [ConfigBean]()
    /** List agents */
    var list_agent: [ConfigBean] = [ConfigBean]()
    /** List family type */
    var list_hgd_type: [ConfigBean] = [ConfigBean]()
    /** Uphold list data */
    public var upholdList: UpholdListRespModel = UpholdListRespModel()
    /** Search customer result */
    public var searchCustomerResult: SearchCustomerRespModel = SearchCustomerRespModel()
    /** Shared string */
    public var sharedString = ""
    /** Shared 2 string */
    public var sharedDoubleStr = (DomainConst.BLANK, DomainConst.BLANK)
    /** Shared int */
    public var sharedInt = -1
    /** Current uphold detail */
    public var currentUpholdDetail: UpholdBean = UpholdBean()
    /** Notification count text */
    var notifyCountText: String = ""
    /** Id of user */
    public var user_id: String = ""
    /** Notification */
    public var notify: NotificationBean = NotificationBean()
    /** Last uphold id */
    public var lastUpholdId: String = ""
    /** Flag check can handle notification from server or not */
    var canHandleNotificationFromServer: Bool = true
    /** Call center */
    private var callCenterUphold: String = DomainConst.BLANK
    private var hotline: String = DomainConst.BLANK
    /** Order config */
    private var _orderConfig: OrderConfigBean = OrderConfigBean()
    // Transaction data
    private var _transaction: TransactionBean = TransactionBean()
    /** Flag debug mode is ON */
    private var _debug: DebugBean = DebugBean()
    /** Last save order vip description */
    private var _orderVipDescription = DomainConst.BLANK
    
    // MARK - Methods
    override init() {
        super.init()
        // Get login status
        self.isLogin = false
        if defaults.object(forKey: DomainConst.KEY_SETTING_IS_LOGGING) != nil {
            self.isLogin = defaults.object(forKey: DomainConst.KEY_SETTING_IS_LOGGING) as! Bool
        }
        // Get user token value
        self.userToken = ""
        if defaults.object(forKey: DomainConst.KEY_SETTING_USER_TOKEN) != nil {
            self.userToken = defaults.object(forKey: DomainConst.KEY_SETTING_USER_TOKEN) as! String
        }
        // Get training mode
        self.isTrainningMode = false
        if defaults.object(forKey: DomainConst.KEY_SETTING_TRAINING_MODE) != nil {
            self.isTrainningMode = defaults.object(forKey: DomainConst.KEY_SETTING_TRAINING_MODE) as! Bool
        }
        
        // Get temp token value
        self.tempToken = ""
        if defaults.object(forKey: DomainConst.KEY_SETTING_TEMP_TOKEN) != nil {
            self.tempToken = defaults.object(forKey: DomainConst.KEY_SETTING_TEMP_TOKEN) as! String
        }
        
        // Get transaction data
        if defaults.object(forKey: DomainConst.KEY_SETTING_TRANSACTION_ID) != nil {
            self._transaction.id = defaults.object(forKey: DomainConst.KEY_SETTING_TRANSACTION_ID) as! String
        }
        if defaults.object(forKey: DomainConst.KEY_SETTING_TRANSACTION_KEY) != nil {
            self._transaction.name = defaults.object(forKey: DomainConst.KEY_SETTING_TRANSACTION_KEY) as! String
        }
        
        // Debug color mode
        self._debug._isColorOn = false
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_COLOR) != nil {
            self._debug._isColorOn = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_COLOR) as! Bool
        }
        // Debug toast mode
        self._debug._isShowToast = false
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_TOAST) != nil {
            self._debug._isShowToast = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_TOAST) as! Bool
        }
        // Debug zoom value
        self._debug._zoomValue = 13.0
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_ZOOM) != nil {
            self._debug._zoomValue = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_ZOOM) as! CGFloat
        }
        // Debug flag gas service
        self._debug._isGasService = DebugBean.DEBUG_DEFAULT_GAS_SERVICE
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_GAS_SERVICE) != nil {
            self._debug._isGasService = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_GAS_SERVICE) as! Bool
        }
        // Debug flag show number picker
        self._debug._isShowNumberPicker = DebugBean.DEBUG_DEFAULT_SHOW_NUMBER_PICKER
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_SHOW_NUM_PICKER) != nil {
            self._debug._isShowNumberPicker = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_SHOW_NUM_PICKER) as! Bool
        }
        // Debug flag show number picker
        self._debug._isShowTopIcon = DebugBean.DEBUG_DEFAULT_TOP_ICON
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_SHOW_TOP_ICON) != nil {
            self._debug._isShowTopIcon = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_SHOW_TOP_ICON) as! Bool
        }
        // Order vip information
        self._orderVipDescription = DomainConst.BLANK
        if defaults.object(forKey: DomainConst.KEY_SETTING_ORDER_VIP_DESCRIPTION) != nil {
            self._orderVipDescription = defaults.object(forKey: DomainConst.KEY_SETTING_ORDER_VIP_DESCRIPTION) as! String
        }
    }
    
    /**
     * Set Order vip information
     * - parameter b50:     b50 quantity
     * - parameter b45:     b45 quantity
     * - parameter b12:     b12 quantity
     * - parameter b6:      b6 quantity
     * - parameter note:    Note of customer
     */
    public func setOrderVipDescription(b50: String, b45: String, b12: String,
                             b6: String,
                             note: String) {
        self._orderVipDescription = String.init(
            format: "%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
            DomainConst.KEY_B50, DomainConst.SPLITER_TYPE1, b50,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_B45, DomainConst.SPLITER_TYPE1, b45,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_B12, DomainConst.SPLITER_TYPE1, b12,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_B6, DomainConst.SPLITER_TYPE1, b6,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_NOTE, DomainConst.SPLITER_TYPE1, note)
        defaults.set(self._orderVipDescription, forKey: DomainConst.KEY_SETTING_ORDER_VIP_DESCRIPTION)
        defaults.synchronize()
    }
    
    /**
     * Get Order vip information
     * - returns: Temp token value
     */
    public func getOrderVipDescription() -> (String, String, String, String, String) {
        var retVal = (DomainConst.NUMBER_ZERO_VALUE, DomainConst.NUMBER_ZERO_VALUE,
                      DomainConst.NUMBER_ZERO_VALUE,
                      DomainConst.NUMBER_ZERO_VALUE, DomainConst.BLANK)
        if self._orderVipDescription.range(of: DomainConst.SPLITER_TYPE2) != nil {
            let arrStr = self._orderVipDescription.components(separatedBy: DomainConst.SPLITER_TYPE2)
            for item in arrStr {
                if item.range(of: DomainConst.SPLITER_TYPE1) != nil {
                    let itemArrStr = item.components(separatedBy: DomainConst.SPLITER_TYPE1)
                    switch itemArrStr[0] {
                    case DomainConst.KEY_B50:
                        retVal.0 = itemArrStr[1]
                        break
                    case DomainConst.KEY_B45:
                        retVal.1 = itemArrStr[1]
                        break
                    case DomainConst.KEY_B12:
                        retVal.2 = itemArrStr[1]
                        break
                    case DomainConst.KEY_B6:
                        retVal.3 = itemArrStr[1]
                        break
                    case DomainConst.KEY_NOTE:
                        retVal.4 = itemArrStr[1]
                        break
                    default:
                        break
                    }
                }
            }
        }
        return retVal
    }
    
    /**
     * Set flag show top icon is On/Off
     * - parameter isOn: True -> On, False -> Off
     */
    public func setDebugShowTopIconFlag(isOn: Bool) {
        self._debug._isShowTopIcon = isOn
        defaults.set(self._debug._isShowTopIcon, forKey: DomainConst.KEY_SETTING_DEBUG_IS_SHOW_TOP_ICON)
        defaults.synchronize()
    }
    
    /**
     * Check if debug flag show top icon is On
     * - returns: True if on, False if off
     */
    public func getDebugShowTopIconFlag() -> Bool {
        return self._debug._isShowTopIcon
    }
    
    /**
     * Set flag show number picker is On/Off
     * - parameter isOn: True -> On, False -> Off
     */
    public func setDebugShowNumPickerFlag(isOn: Bool) {
        self._debug._isShowNumberPicker = isOn
        defaults.set(self._debug._isShowNumberPicker, forKey: DomainConst.KEY_SETTING_DEBUG_IS_SHOW_NUM_PICKER)
        defaults.synchronize()
    }
    
    /**
     * Check if debug flag show number picker is On
     * - returns: True if on, False if off
     */
    public func getDebugShowNumPickerFlag() -> Bool {
        return self._debug._isShowNumberPicker
    }
    
    /**
     * Set debug color mode is On/Off
     * - parameter isOn: True -> On, False -> Off
     */
    public func setDebugColor(isOn: Bool) {
        self._debug._isColorOn = isOn
        defaults.set(self._debug._isColorOn, forKey: DomainConst.KEY_SETTING_DEBUG_COLOR)
        defaults.synchronize()
    }
    
    /**
     * Check if debug color mode is On
     * - returns: True if on, False if off
     */
    public func getDebugColor() -> Bool {
        return self._debug._isColorOn
    }
    
    /**
     * Set debug gas service flag
     * - parameter isOn: True -> On, False -> Off
     */
    public func setDebugGasServiceFlag(isOn: Bool) {
        self._debug._isGasService = isOn
        defaults.set(self._debug._isGasService, forKey: DomainConst.KEY_SETTING_DEBUG_IS_GAS_SERVICE)
        defaults.synchronize()
    }
    
    /**
     * Get gas service flag value
     * - returns: True if on, False if off
     */
    public func getDebugGasServiceFlag() -> Bool {
        return self._debug._isGasService
    }
    
    /**
     * Set debug zoom value
     * - parameter value: Zoom value
     */
    public func setDebugZoom(value: CGFloat) {
        self._debug._zoomValue = value
        defaults.set(self._debug._zoomValue, forKey: DomainConst.KEY_SETTING_DEBUG_ZOOM)
        defaults.synchronize()
    }
    
    /**
     * Get Zoom value
     * - returns: Zoom value
     */
    public func getZoomValue() -> CGFloat {
        return self._debug._zoomValue
    }
    
    /**
     * Set debug show toast mode is On/Off
     * - parameter isOn: True -> On, False -> Off
     */
    public func setDebugToast(isOn: Bool) {
        self._debug._isShowToast = isOn
        defaults.set(self._debug._isShowToast, forKey: DomainConst.KEY_SETTING_DEBUG_TOAST)
        defaults.synchronize()
    }
    
    /**
     * Check if debug show toast mode is On
     * - returns: True if on, False if off
     */
    public func getDebugToast() -> Bool {
        return self._debug._isShowToast
    }
    
    /**
     * Set transaction data
     * - parameter transaction: Object to set
     */
    public func setTransactionData(transaction: TransactionBean) {
        self._transaction = transaction
        defaults.set(self._transaction.id, forKey: DomainConst.KEY_SETTING_TRANSACTION_ID)
        defaults.set(self._transaction.name, forKey: DomainConst.KEY_SETTING_TRANSACTION_KEY)
        defaults.synchronize()
    }
    
    /**
     * Check if transaction key does exist
     * - returns: True if transaction key is not empty, False otherwise
     */
    public func checkTransactionKey() -> Bool {
        if self._transaction.name.isEmpty {
            return false
        }
        return true
    }
    
    /**
     * Get transaction data
     * - returns: Transaction data
     */
    public func getTransactionData() -> TransactionBean {
        return self._transaction
    }
    
    /**
     * Set temp token value
     * - parameter token: Token value
     */
    public func setTempToken(token: String) {
        self.tempToken = token
        defaults.set(self.tempToken, forKey: DomainConst.KEY_SETTING_TEMP_TOKEN)
        defaults.synchronize()
    }
    
    /**
     * Get temp token value
     * - returns: Temp token value
     */
    public func getTempToken() -> String {
        return self.tempToken
    }
    
    /**
     * Reset value of temp token
     */
    public func resetTempToken() {
        self.setTempToken(token: "")
    }
    
    /**
     * Call When Login Success
     * - parameter token: User token
     */
    func loginSuccess(_ token: String)  {
        isLogin = true
        userToken = token
        defaults.set(isLogin, forKey: DomainConst.KEY_SETTING_IS_LOGGING)
        defaults.set(userToken, forKey: DomainConst.KEY_SETTING_USER_TOKEN)
        defaults.synchronize()
        self.setTempToken(token: "")
    }
    
    /**
     * Call When Logout Success
     */
    func logoutSuccess()  {
        resetData()
        defaults.set(isLogin, forKey: DomainConst.KEY_SETTING_IS_LOGGING)
        defaults.set(userToken, forKey: DomainConst.KEY_SETTING_USER_TOKEN)
        defaults.set(self._transaction.id, forKey: DomainConst.KEY_SETTING_TRANSACTION_ID)
        defaults.set(self._transaction.name, forKey: DomainConst.KEY_SETTING_TRANSACTION_KEY)
        defaults.synchronize()
    }
    
    /**
     * Reset data
     */
    func resetData() {
        isLogin = false
        userToken = ""
        self._transaction = TransactionBean.init()
        self.user_info = nil
        self.notifyCountText = ""
        self.setTempToken(token: "")
    }
    
    /**
     * Get user token
     * - returns: User token string
     */
    public func getUserToken() -> String {
        return self.userToken
    }
    
    /**
     * Check login
     * - returns: True if login is success, False otherwise
     */
    public func checkIsLogin() -> (Bool) {
        return self.isLogin
    }
    
    /**
     * Set training mode
     * - parameter isTrainingValue: Training mode value
     */
    public func setTrainningMode(_ isTrainningValue :Bool)  {
        self.isTrainningMode = isTrainningValue
        defaults.set(isTrainningMode, forKey: DomainConst.KEY_SETTING_TRAINING_MODE)
        defaults.synchronize()
        
        // Handle display color when training mode is on
        if BaseModel.shared.checkTrainningMode() {
            GlobalConst.BUTTON_COLOR_RED = GlobalConst.TRAINING_COLOR
        } else {    // Training mode off
            GlobalConst.BUTTON_COLOR_RED = GlobalConst.MAIN_COLOR
        }
    }
    
    /**
     * Get Trainning Mode
     * - returns: True if training mode is ON, False otherwise
     */
    public func checkTrainningMode() -> (Bool) {
        return self.isTrainningMode
    }
    
    /**
     * Get server ULR
     * - returns: Server URL
     */
    public func getServerURL() -> String {
        if !checkTrainningMode() {
            return DomainConst.SERVER_URL
        }
        return DomainConst.SERVER_URL_TRAINING
    }
    
    /**
     * Set user information
     * - parameter userInfo: List user information
     * - parameter userId: Id of user
     * - parameter roleId: Id of role
     */
    func setUserInfo(userInfo: UserInfoBean) {
        self.user_info = userInfo
    }
    
    /**
     * Set list streets.
     * parameter listStreets: List streets
     */
    func setListStreets(listStreets: [ConfigBean]) {
        for item in listStreets {
            self.list_street.append(item)
        }
    }
    
    /**
     * Save temp data.
     * - parameter loginModel: LoginRespModel
     */
    func saveTempData(loginModel: LoginRespModel) {
        for item in loginModel.data_uphold {
            // Uphold status data
            if item.id == DomainConst.KEY_STATUS {
                self.listUpholdStatus.removeAll()
                for status in item.data {
                    self.listUpholdStatus.append(status)
                }
            }
            
            // List uphold type
            if item.id == DomainConst.KEY_UPHOLD_TYPE {
                self.listUpholdType.removeAll()
                for type in item.data {
                    self.listUpholdType.append(type)
                }
            }
            // List hour handle
            if item.id == DomainConst.KEY_HOURS_HANDLE {
                self.listHourHandle.removeAll()
                for hour in item.data {
                    self.listHourHandle.append(hour)
                }
            }
            // List contact type
            if item.id == DomainConst.KEY_REQUEST_TYPE {
                self.listContactType.removeAll()
                for type in item.data {
                    self.listContactType.append(type)
                }
            }
            // List rating status
            if item.id == DomainConst.KEY_RATING_STATUS {
                self.listRatingStatus.removeAll()
                for status in item.data {
                    self.listRatingStatus.append(status)
                }
            }
            // List rating type
            if item.id == DomainConst.KEY_RATING_TYPE {
                self.listRatingType.removeAll()
                for type in item.data {
                    self.listRatingType.append(type)
                }
            }
        }
        // Role id
        self.role_id = loginModel.role_id
        
        // Role name
        self.role_name = loginModel.role_name
        
        // Check menu permission
        self.listMenuPermission = loginModel.check_menu
        
        // User id
        self.user_id = loginModel.user_id
        
        // Menu
        self.menu = loginModel.menu
        
        // Call center
        self.callCenterUphold = loginModel.call_center_uphold
        self.hotline = loginModel.hotline
        
        // User infor
        self.user_info_login = loginModel.user_info
    }
    
    /**
     * Get user infor by Id
     * - parameter id: Id of info
     * - returns: Name of info
     */
    public func getUserInfoLogin(id: String) -> String{
        for info in self.user_info_login {
            if id == info.id {
                return info.name
            }
        }
        return DomainConst.BLANK
    }
    
    /**
     * Get call center uphold phone number
     * - returns: Call center uphold phone number
     */
    public func getCallCenterUpholdNumber() -> String {
        return self.callCenterUphold
    }
    
    /**
     * Get hotline phone number
     * - returns: Hotline phone number
     */
    public func getHotlineNumber() -> String {
        return self.hotline
    }
    
    /**
     * Check if current user is a customer.
     * returns: True if user is a customer, False otherwise
     */
    public func isCustomerUser() -> Bool {
        return (self.role_id == DomainConst.ROLE_CUSTOMER)
    }
    
    /**
     * Save uphold list.
     * - parameter upholdListModel: Sata to save
     */
    func saveUpholdList(upholdListModel: UpholdListRespModel) {
        if self.upholdList.record.count == 0{
            self.upholdList = upholdListModel
        } else {
            self.upholdList.record.append(contentsOf: upholdListModel.record)
        }
    }
    
    /**
     * Clear uphold list
     */
    public func clearUpholdList() {
        self.upholdList = UpholdListRespModel()
    }
    
    /**
     * Search customer result
     * - parameter result: Search result model
     */
    func saveSearchCustomerResult(result: SearchCustomerRespModel) {
        self.searchCustomerResult = result
    }
    
    /**
     * Save current uphold detail
     * - parameter model: Search result model
     */
    func saveCurrentUpholdDetail(model: UpholdBean) {
        self.currentUpholdDetail = model
    }
    
    /**
     * Check user has permission to access menu
     * - parameter key: Key of menu
     */
    public func checkAllowAccess(key: String) -> Bool {
        for item in self.listMenuPermission {
            if item.id == key {
                if item.name == "1" {
                    return true
                }
                break;
            }
        }
        return false
    }
    
    /**
     * Set notification count text
     * - parameter text: Text to set
     */
    func setNotificationCountText(text: String) {
        self.notifyCountText = text
    }
    
    /**
     * Save device token
     * - parameter token: Token to saving
     */
    public func setDeviceToken(token: String) {
        self.deviceToken = token
    }
    
    /**
     * Get device token
     * - returns: Device token string
     */
    public func getDeviceToken() -> String {
        return self.deviceToken
    }
    
    /**
     * Check if device token is exist
     * - returns: True if device token is not empty, False otherwise
     */
    func checkDeviceTokenExist() -> Bool {
        return !(self.deviceToken.isEmpty)
    }
    
    /**
     * Set notification data
     * - parameter id:          Id
     * - parameter notify_id:   Id of notify
     * - parameter notify_type: Notify type
     * - parameter type:        type
     * - parameter reply_id:    Id of reply item
     * - parameter message:     Message
     */
    public func setNotificationData(id: String, notify_id: String,
                             notify_type: String, type: String,
                             reply_id: String, message: String) {
        self.notify.id          = id
        self.notify.notify_id   = notify_id
        self.notify.notify_type = notify_type
        self.notify.type        = type
        self.notify.reply_id    = reply_id
        self.notify.message     = message
    }
    
    /**
     * Set other information
     * - parameter data: List of config bean item
     */
    func setOtherInfo(data: [ConfigBean]) {
        for item in data {
            if item.id == DomainConst.KEY_UPHOLD_ID_LASTEST {
                self.lastUpholdId = item.name
            }
        }
    }
    
    /**
     * Clear notification data
     */
    public func clearNotificationData() {
        self.notify.id          = ""
        self.notify.notify_id   = ""
        self.notify.notify_type = ""
        self.notify.type        = ""
        self.notify.reply_id    = ""
        self.notify.message     = ""
    }
    
    /**
     * Check if notification is exist
     * - returns: True if id of notification is not empty, False otherwise
     */
    public func checkNotificationExist() -> Bool {
        return !(self.notify.id.isEmpty)
    }
    
    /**
     * Check if notification from uphold
     * - returns: True if type is VIEW_UPHOLD, False otherwise
     */
    public func isUpholdNotification() -> Bool {
        return (self.notify.type == DomainConst.NOTIFY_VIEW_UPHOLD)
    }
    
    /**
     * Get index of uphold item from list uphold by uphold id
     * - parameter id: Id of uphold item
     * - returns: Index of uphold item from list uphold, if item not found, return -1
     */
    public func getUpholdIndexById(id: String) -> Int {
        for i in 0..<self.upholdList.record.count {
            if self.upholdList.record[i].id == id {
                return i
            }
        }
        return -1
    }
    
    /**
     * Check application can handle notification from server or not
     * - returns: Value of flag canHandleNotificationFromServer
     */
    public func canHandleNotification() -> Bool {
        return self.canHandleNotificationFromServer
    }
    
    /**
     * Enable/Disable action handle notification from server
     * - parameter isEnabled: Flag value
     */
    public func enableHandleNotificationFlag(isEnabled: Bool) {
        self.canHandleNotificationFromServer = isEnabled
    }
    
    /**
     * Save order config data
     * - parameter config: Order config data
     */
    public func saveOrderConfig(config: OrderConfigBean) {
        self._orderConfig = config
    }
    
    /**
     * Get order config data
     * - returns: Order config data
     */
    public func getOrderConfig() -> OrderConfigBean {
        return self._orderConfig
    }
    
    /**
     * Get main logo string
     * - returns: Image path of main logo
     */
    public func getMainLogo() -> String {
        if self.getDebugGasServiceFlag() {
            return DomainConst.LOGO_GAS_SERVICE_IMG_NAME
        } else {
            return DomainConst.LOGO_GAS_24H_IMG_NAME
        }
    }
    
    /**
     * Get current app name
     * - returns: Name of app
     */
    public func getAppName() -> String {
        if BaseModel.shared.getDebugGasServiceFlag() {
            return DomainConst.CONTENT00108
        } else {
            return DomainConst.CONTENT00226
        }
    }
    
    /**
     * Get app type string
     * - returns:   Gas service - 0
     *              Gas 24h     - 1
     */
    public func getAppType() -> String {
        if BaseModel.shared.getDebugGasServiceFlag() {
            return DomainConst.APP_TYPE_FLAG_GAS_SERVICE
        } else {
            return DomainConst.APP_TYPE_FLAG_GAS_24H
        }
    }
    
    /**
     * Get app type Agent icon
     * - returns:   Gas service - 0
     *              Gas 24h     - 1
     */
    public func getAppAgentIcon() -> String {
        if BaseModel.shared.getDebugGasServiceFlag() {
            return DomainConst.LOGO_AGENT_GAS_SERVICE_IMG_NAME
        } else {
            return DomainConst.LOGO_AGENT_GAS_24H_IMG_NAME
        }
    }
}