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
}
