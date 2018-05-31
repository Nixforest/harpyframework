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
    // NguyenPT - Will remove in next version
    /** List user info */
    public var user_info: UserInfoBean? = nil
    // NguyenPT
    private var _userInfo:                      UserInfoBean    = UserInfoBean()
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
    private var list_street: [ConfigBean] = [ConfigBean]()
    /** List agents */
    var list_agent: [ConfigBean] = [ConfigBean]()
    //++ BUG0050-SPJ (NguyenPT 20170403) Handle Address information
    private var _listProvinces:                 [ConfigBean]                    = [ConfigBean]()
    private var _listDistricts:                 [String: [ConfigBean]]          = [String: [ConfigBean]]()
    private var _listWards:                     [String: [ConfigBean]]          = [String: [ConfigBean]]()
    //-- BUG0050-SPJ (NguyenPT 20170403) Handle Address information
    /** List family type */
    private var list_hgd_type:                  [ConfigBean]                    = [ConfigBean]()
    /** List Family invest */
    private var list_hgd_invest:            [ConfigBean]        = [ConfigBean]()
    //++ BUG0054-SPJ (NguyenPT 20170414) Add new function G07
    private var list_cancelOrderReasons:    [ConfigBean]        = [ConfigBean]()
    private var list_infoCylinder:          [MaterialBean]      = [MaterialBean]()
    private var list_infoOtherMaterial:     [MaterialBean]      = [MaterialBean]()
    //-- BUG0054-SPJ (NguyenPT 20170414) Add new function G07
    
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
    private var list_infoGas:               [MaterialBean]      = [MaterialBean]()
    //-- BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
    
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle update Order VIP customer
    private var list_cancelOrderVIPReasons: [ConfigBean]        = [ConfigBean]()
    //-- BUG0060-SPJ (NguyenPT 20170426) Handle update Order VIP customer
    
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    private var list_OrderTypes:            [ConfigBean]        = [ConfigBean]()
    private var list_SupportTypes:          [ConfigBean]        = [ConfigBean]()
    // BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /** Uphold list data */
    public var upholdList:                  UpholdListRespModel     = UpholdListRespModel()
    /** Search customer result */
    public var searchCustomerResult:        SearchCustomerRespModel = SearchCustomerRespModel()
    /** Shared string */
    public var sharedString:                String              = DomainConst.BLANK
    /** Shared 2 string */
    public var sharedDoubleStr:             (String, String)    = (DomainConst.BLANK, DomainConst.BLANK)
    /** Shared int */
    public var sharedInt:                   Int                 = -1
    /** Current uphold detail */
    public var currentUpholdDetail:         UpholdBean          = UpholdBean()
    /** Notification count text */
    var notifyCountText:                    String              = DomainConst.BLANK
    /** Id of user */
    public var user_id:                     String              = DomainConst.BLANK
    /** Notification */
    public var notify:                      NotificationBean    = NotificationBean()
    /** Last uphold id */
    public var lastUpholdId:                String              = DomainConst.BLANK
    /** Flag check can handle notification from server or not */
    var canHandleNotificationFromServer:    Bool                = true
    /** Call center */
    private var callCenterUphold:           String              = DomainConst.BLANK
    private var hotline:                    String              = DomainConst.BLANK
    /** Order config */
    private var _orderConfig:               OrderConfigBean     = OrderConfigBean()
    // Transaction data
    private var _transaction:               TransactionBean     = TransactionBean()
    /** Flag debug mode is ON */
    private var _debug:                     DebugBean           = DebugBean()
    /** Last save order vip description */
    private var _orderVipDescription:       String              = DomainConst.BLANK
    //++ BUG0077-SPJ (NguyenPT 20170508) Handle Flag need change pass
    private var _isNeedChangePass:          Bool                = false
    //-- BUG0077-SPJ (NguyenPT 20170508) Handle Flag need change pass
    private var _errorDetail:               String              = DomainConst.BLANK
    //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    private var _listVipCustomerStores:     [ConfigBean]        = [ConfigBean]()
    //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    //++ BUG0132-SPJ (NguyenPT 20170724) Remember username after login
    /** Call center */
    private var _currentUsername:           String              = DomainConst.BLANK
    //-- BUG0132-SPJ (NguyenPT 20170724) Remember username after login
    //++ BUG0151-SPJ (NguyenPT 20170819) Save agent id to user default setting
    /** Agent id */
    private var _agentId:                   String              = DomainConst.BLANK
    //-- BUG0151-SPJ (NguyenPT 20170819) Save agent id to user default setting
    private var _gas24hTimeCheckOrder:      Int                 = 5
    /** My invite code */
    private var _inviteCode:                String              = DomainConst.BLANK
    /** Gas24h menu text */
    private var _gas24hMenuText:            String              = DomainConst.BLANK
    
    /** Flag check first order */
    private var _isFirstOrder:              Bool                = true
    
    //++ BUG0187-SPJ (NguyenPT 20180202) Gas24h  - Add data for Bottom message view, Add popup promotion
    /** List news data */
    private var _listNews:                  NewsListRespModel   = NewsListRespModel()
    private var _popUpData:                 NewsListBean        = NewsListBean()
    //-- BUG0187-SPJ (NguyenPT 20180202) Gas24h  - Add data for Bottom message view, Add popup promotion
    
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
        // Debug Flag use material_name or material_name_short
        self._debug._isMaterialNameShort = DebugBean.DEBUG_DEFAULT_USE_MATERIAL_NAME_SHORT
        if defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_USE_MATERIAL_NAME_SHORT) != nil {
            self._debug._isMaterialNameShort = defaults.object(forKey: DomainConst.KEY_SETTING_DEBUG_IS_USE_MATERIAL_NAME_SHORT) as! Bool
        }
        // Order vip information
        self._orderVipDescription = DomainConst.BLANK
        if defaults.object(forKey: DomainConst.KEY_SETTING_ORDER_VIP_DESCRIPTION) != nil {
            self._orderVipDescription = defaults.object(forKey: DomainConst.KEY_SETTING_ORDER_VIP_DESCRIPTION) as! String
        }
        //++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
        self.list_infoGas = [MaterialBean]()
        if let data = defaults.object(forKey: DomainConst.KEY_LIST_GAS_INFORMATION) {
            self.list_infoGas = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! [MaterialBean]
        }
        //-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
        
        //++ BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        self.role_id = DomainConst.BLANK
        if let data = defaults.object(forKey: DomainConst.KEY_SETTING_ROLE_ID) {
            self.role_id = data as! String
        }
        //-- BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        //++ BUG0132-SPJ (NguyenPT 20170724) Remember username after login
        self._currentUsername = DomainConst.BLANK
        if let data = defaults.object(forKey: DomainConst.KEY_SETTING_USERNAME) {
            self._currentUsername = data as! String
        }
        //-- BUG0132-SPJ (NguyenPT 20170724) Remember username after login
        //++ BUG0151-SPJ (NguyenPT 20170819) Save agent id to user default setting
        // Get agent id value
        self._agentId = DomainConst.BLANK
        if defaults.object(forKey: DomainConst.KEY_SETTING_AGENT_ID) != nil {
            self._agentId = defaults.object(forKey: DomainConst.KEY_SETTING_AGENT_ID) as! String
        }
        //-- BUG0151-SPJ (NguyenPT 20170819) Save agent id to user default setting
        // Get isFirstOrder flag value
        self._isFirstOrder = false
        if defaults.object(forKey: DomainConst.KEY_SETTING_IS_FIRST_ORDER) != nil {
            self._isFirstOrder = defaults.object(forKey: DomainConst.KEY_SETTING_IS_FIRST_ORDER) as! Bool
        }
        //++ BUG0187-SPJ (NguyenPT 20180202) Gas24h  - Add data for Bottom message view, Add popup promotion
        if let id = defaults.object(forKey: DomainConst.KEY_SETTING_POPUP_ID) {
            self._popUpData.id = id as! String
        }
        //-- BUG0187-SPJ (NguyenPT 20180202) Gas24h  - Add data for Bottom message view, Add popup promotion
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
                             //++ BUG0086-SPJ (NguyenPT 20170530) Add phone
                             customerPhone: String,
                             //-- BUG0086-SPJ (NguyenPT 20170530) Add phone
                             note: String) {
        self._orderVipDescription = String.init(
            format: "%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
            DomainConst.KEY_B50, DomainConst.SPLITER_TYPE1, b50,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_B45, DomainConst.SPLITER_TYPE1, b45,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_B12, DomainConst.SPLITER_TYPE1, b12,
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_B6, DomainConst.SPLITER_TYPE1, b6,
            //++ BUG0086-SPJ (NguyenPT 20170530) Add phone
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_CUSTOMER_CONTACT, DomainConst.SPLITER_TYPE1, customerPhone,
            //-- BUG0086-SPJ (NguyenPT 20170530) Add phone
            DomainConst.SPLITER_TYPE2, DomainConst.KEY_NOTE, DomainConst.SPLITER_TYPE1, note)
        defaults.set(self._orderVipDescription, forKey: DomainConst.KEY_SETTING_ORDER_VIP_DESCRIPTION)
        defaults.synchronize()
    }
    
    /**
     * Get Order vip information
     * - returns: Temp token value
     */
    public func getOrderVipDescription() -> (String, String, String, String, String, String) {
        var retVal = (DomainConst.NUMBER_ZERO_VALUE, DomainConst.NUMBER_ZERO_VALUE,
                      DomainConst.NUMBER_ZERO_VALUE, DomainConst.NUMBER_ZERO_VALUE,
                      DomainConst.BLANK, DomainConst.BLANK)
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
                    //++ BUG0086-SPJ (NguyenPT 20170530) Add phone
                    case DomainConst.KEY_CUSTOMER_CONTACT:
                        retVal.4 = itemArrStr[1]
                        break
                    //-- BUG0086-SPJ (NguyenPT 20170530) Add phone
                    case DomainConst.KEY_NOTE:
                        retVal.5 = itemArrStr[1]
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
     * Set Flag use material_name or material_name_short is On/Off
     * - parameter isOn: True -> On, False -> Off
     */
    public func setDebugUseMaterialNameShort(isOn: Bool) {
        self._debug._isMaterialNameShort = isOn
        defaults.set(self._debug._isMaterialNameShort, forKey: DomainConst.KEY_SETTING_DEBUG_IS_USE_MATERIAL_NAME_SHORT)
        defaults.synchronize()
    }
    
    /**
     * Check if debug flag use material_name or material_name_short is On
     * - returns: True if on, False if off
     */
    public func getDebugUseMaterialNameShort() -> Bool {
        return self._debug._isMaterialNameShort
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
    public func loginSuccess(_ token: String)  {
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
    public func logoutSuccess()  {
        resetData()
        defaults.set(isLogin, forKey: DomainConst.KEY_SETTING_IS_LOGGING)
        defaults.set(userToken, forKey: DomainConst.KEY_SETTING_USER_TOKEN)
        defaults.set(self._transaction.id, forKey: DomainConst.KEY_SETTING_TRANSACTION_ID)
        defaults.set(self._transaction.name, forKey: DomainConst.KEY_SETTING_TRANSACTION_KEY)
        //++ BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        defaults.set(self.role_id, forKey: DomainConst.KEY_SETTING_ROLE_ID)
        //-- BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        defaults.synchronize()
    }
    
    /**
     * Reset data
     */
    func resetData() {
        isLogin = false
        userToken = ""
        self._transaction = TransactionBean.init()
        //self.user_info = nil
        self._userInfo = UserInfoBean()
        self.notifyCountText = ""
        self.setTempToken(token: "")
        //++ BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        self.role_id = DomainConst.BLANK
        //-- BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
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
//        if BaseModel.shared.checkTrainningMode() {
//            GlobalConst.BUTTON_COLOR_RED = GlobalConst.TRAINING_COLOR
//        } else {    // Training mode off
//            GlobalConst.BUTTON_COLOR_RED = GlobalConst.MAIN_COLOR
//        }
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
//        return getServerURLImmortal()
    }
    
    /**
     * Get server ULR
     * - returns: Server URL
     */
    public func getServerURLImmortal() -> String {
        return DomainConst.SERVER_URL_IMMORTAL
    }
    
    /**
     * Set user information
     * - parameter userInfo: List user information
     * - parameter userId: Id of user
     * - parameter roleId: Id of role
     */
    public func setUserInfo(userInfo: UserInfoBean) {
        //self.user_info = userInfo
        self._userInfo = userInfo
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
    
    // MARK: Temp data
    /**
     * Save temp data.
     * - parameter loginModel: LoginRespModel
     */
    public func saveTempData(loginModel: LoginRespModel) {
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
        //++ BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        //self.role_id = loginModel.role_id
        setRoleId(id: loginModel.role_id)
        //-- BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
        
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
        //++ BUG0151-SPJ (NguyenPT 20170819) Save agent id to user default setting
        self.setAgentId(id: self.getUserInfoLogin(id: DomainConst.KEY_AGENT_ID))
        //-- BUG0151-SPJ (NguyenPT 20170819) Save agent id to user default setting
        
        // Agent info
        self.list_agent = loginModel.list_agent
        
        // List street
        //++ BUG0109-SPJ (NguyenPT 20170617) Handle save unsigned value of street name
        for item in loginModel.list_street {
            //let itemAdd = item
            item.data.append(ConfigBean(id: DomainConst.BLANK, name: item.name.removeSign().lowercased()))
            //self.list_street.append(itemAdd)
        }
        //-- BUG0109-SPJ (NguyenPT 20170617) Handle save unsigned value of street name
        self.list_street = loginModel.list_street
        
        // List Family type
        self.list_hgd_type = loginModel.list_hgd_type
        self.list_hgd_invest = loginModel.list_hgd_invest
        //++ BUG0054-SPJ (NguyenPT 20170414) Add new function G07
        // List cancel order reasons
        self.list_cancelOrderReasons = loginModel.list_cancelOrderReasons
        self.list_infoCylinder       = loginModel.info_cylinder
        self.list_infoOtherMaterial  = loginModel.info_otherMaterial
        //-- BUG0054-SPJ (NguyenPT 20170414) Add new function G07
        //++ BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
        if loginModel.info_materialGas.count != 0 {
            self.list_infoGas            = loginModel.info_materialGas
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: self.list_infoGas)
            defaults.set(encodedData, forKey: DomainConst.KEY_LIST_GAS_INFORMATION)
            defaults.synchronize()
        }
        FavouriteDataModel.shared.updateListMaterialGas(data: self.list_infoGas,
                                                        key: DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN)
        //-- BUG0071-SPJ (NguyenPT 20170426) Handle save data to UserDefault
        //++ BUG0060-SPJ (NguyenPT 20170426) Handle update Order VIP customer
        self.list_cancelOrderVIPReasons = loginModel.list_cancelVIPOrderReasons
        //-- BUG0060-SPJ (NguyenPT 20170426) Handle update Order VIP customer
        //++ BUG0077-SPJ (NguyenPT 20170508) Handle Flag need change pass
        self._isNeedChangePass      = (loginModel.need_change_pass == DomainConst.NUMBER_ONE_VALUE)
        //-- BUG0077-SPJ (NguyenPT 20170508) Handle Flag need change pass
        //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
        self.list_OrderTypes        = loginModel.list_OrderTypes
        self.list_SupportTypes      = loginModel.list_support_employee
        // BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
        
        //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        self._listVipCustomerStores = loginModel.customer_chain_store
        //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        self._gas24hTimeCheckOrder  = loginModel.gas24h_time_check_order
        self._inviteCode            = loginModel.my_invite_code
        self._gas24hMenuText        = loginModel.gas24h_menu_text
    }
    
    /**
     * Get list of all agents
     * - returns: List of all agents
     */
    public func getListAgent() -> [ConfigBean] {
        return self.list_agent
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
     * Check if current user if a NVGN
     * returns: True if user is a NVGN, False otherwise
     */
    public func isNVGNUser() -> Bool {
        return (self.role_id == String(RoleType.ROLE_EMPLOYEE_MAINTAIN.rawValue))
    }
    
    /**
     * Check if current user if a Driver
     * returns: True if user is a Driver, False otherwise
     */
    public func isDriverUser() -> Bool {
        return (self.role_id == String(RoleType.ROLE_DRIVER.rawValue))
    }
    
    //++ BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    /**
     * Check if current user if a Coordinator
     * returns: True if user is a Coordinator, False otherwise
     */
    public func isCoordinator() -> Bool {
        return (self.role_id == String(RoleType.ROLE_DIEU_PHOI.rawValue))
    }
    //-- BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    
    /**
     * Save uphold list.
     * - parameter upholdListModel: Sata to save
     */
    public func saveUpholdList(upholdListModel: UpholdListRespModel) {
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
    public func saveSearchCustomerResult(result: SearchCustomerRespModel) {
        self.searchCustomerResult = result
    }
    
    /**
     * Save current uphold detail
     * - parameter model: Search result model
     */
    public func saveCurrentUpholdDetail(model: UpholdBean) {
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
    public func checkDeviceTokenExist() -> Bool {
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
    
    public func getNotificationData() -> NotificationBean {
        return self.notify
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
//        self._orderConfig = config
        // If server response only 1 agent
        if config.agent.count == 1 {
            // Loop through all current data
            for i in 0..<self._orderConfig.agent.count {
                // Get current item
                var item = self._orderConfig.agent[i]
                // Current item have id equal response agent id
                if item.info_agent.agent_id == config.agent[0].info_agent.agent_id {
                    // Overwrite current item
                    item = config.agent[0]
                    break
                }
            }
        } else {
            // Save all data
            self._orderConfig = config
        }
        //++ BUG0151-SPJ (NguyenPT 20170819) Handle favourite when select material
        FavouriteDataModel.shared.updateListMaterialGas(agentInfo: self._orderConfig.agent)
        //-- BUG0151-SPJ (NguyenPT 20170819) Handle favourite when select material
    }
    
    /**
     * Get order config data
     * - returns: Order config data
     */
    public func getOrderConfig() -> OrderConfigBean {
        return self._orderConfig
    }
    
    //++ BUG0156-SPJ (NguyenPT 20170925) Re-design Gas24h
    /**
     * Get list agent from order config data
     * - returns: List agent from order config data
     */
    public func getAgentListFromOrderConfig() -> [AgentInfoBean] {
        return self._orderConfig.agent
    }
    
    /**
     * Get max range distant from Order config
     * - returns: Return [distance_1] value
     */
    public func getMaxRangeDistantFromOrderConfig() -> Double {
        return self._orderConfig.distance_1
    }
    
    /**
     * Check if order does exist
     * - returns: True if order config exist, False otherwise
     */
    public func checkOrderConfigExist() -> Bool {
        return self._orderConfig.isExist()
    }
    //-- BUG0156-SPJ (NguyenPT 20170925) Re-design Gas24h
    
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    /**
     * Get List promotion by agent id
     * - parameter agentId: Id of agent
     * - returns: List promotion match with agent id in order config data
     */
    public func getAgentMaterialPromotion(agentId: String) -> [MaterialBean] {
        for item in self._orderConfig.agent {
            if item.info_agent.agent_id == agentId {
                return item.info_promotion
            }
        }
        return [MaterialBean]()
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    //++ BUG0088-SPJ (NguyenPT 20170516) Can change gas material in Order Family detail screen
    /**
     * Get List gas material by agent id
     * - parameter agentId: Id of agent
     * - returns: List gas material match with agent id in order config data
     */
    public func getAgentMaterialGas(agentId: String) -> [MaterialBean] {
        for item in self._orderConfig.agent {
            if item.info_agent.agent_id == agentId {
                return item.info_gas
            }
        }
        return [MaterialBean]()
    }
    //-- BUG0088-SPJ (NguyenPT 20170516) Can change gas material in Order Family detail screen
    
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
    
    /**
     * Get app store link
     * - returns:   Gas service - [itms://appsto.re/us/BVpRgb.i]
     *              Gas 24h     - [itms://appsto.re/us/BVpRgb.i]
     */
    public func getAppStoreLink() -> String {
        switch BaseModel.shared.getAppType() {
        case DomainConst.APP_TYPE_FLAG_GAS_24H:
            return "itms://itunes.apple.com/vn/app/gas24h/id1189016286?mt=8"
        case DomainConst.APP_TYPE_FLAG_GAS_SERVICE:
            return "itms://appsto.re/us/BVpRgb.i"
        default:
            break
        }
        return DomainConst.BLANK
    }
    
    //++ BUG0050-SPJ (NguyenPT 20170403) Handle Address information
    /**
     * Get list of provinces
     * - returns: List of provinces
     */
    public func getListProvinces() -> [ConfigBean] {
        return self._listProvinces
    }
    
    /**
     * Set list of provinces
     * - parameter data: List of provinces to save
     */
    public func setListProvinces(data: [ConfigBean]) {
        self._listProvinces.removeAll()
        self._listProvinces.append(contentsOf: data)
    }
    /**
     * Get list of wards
     * - parameter districtId: Id of district
     * - returns: List of wards
     */
    public func getListWards(districtId: String) -> [ConfigBean] {
        if let retVal = self._listWards[districtId] {
            return retVal
        }
//        return self._listWards[districtId]
        return [ConfigBean]()
    }
    
    /**
     * Set list of wards
     * - parameter districtId: Id of district
     * - parameter data: List of wards to save
     */
    public func setListWards(districtId: String, data: [ConfigBean]) {
        self._listWards.updateValue(data, forKey: districtId)
    }
    /**
     * Get list of districts
     * - parameter provinceId: Id of province
     * - returns: List of districts
     */
    public func getListDistricts(provinceId: String) -> [ConfigBean] {
        if let retVal = self._listDistricts[provinceId] {
            return retVal
        }
        return [ConfigBean]()
        //return self._listDistricts[provinceId]
    }
    
    /**
     * Set list of districts
     * - parameter provinceId: Id of province
     * - parameter data: List of districts to save
     */
    public func setListDistricts(provinceId: String, data: [ConfigBean]) {
        self._listDistricts.updateValue(data, forKey: provinceId)
    }
    /**
     * Get list of streets
     * - returns: List of streets
     */
    public func getListStreets() -> [ConfigBean] {
        return self.list_street
    }
    /**
     * Get list of Family types
     * - returns: List of Family types
     */
    public func getListFamilyTypes() -> [ConfigBean] {
        return self.list_hgd_type
    }
    /**
     * Get list of Family investments
     * - returns: List of Family investments
     */
    public func getListFamilyInvestments() -> [ConfigBean] {
        return self.list_hgd_invest
    }
    
    /**
     * Check if provinces list is empty
     * - returns: True if list provinces is empty, False otherwise
     */
    public func checkProvincesListEmpty() -> Bool {
        return self._listProvinces.isEmpty
    }
    
    /**
     * Check if districts of a province is empty
     * - parameter provinceId: If of province
     * - returns: True if list of districts of province is empty, False otherwise
     */
    public func checkDistrictListEmpty(provinceId: String) -> Bool {
        if let val = self._listDistricts[provinceId] {
            return val.isEmpty
        } else {
            return true
        }
    }
    
    /**
     * Check if wards of a district is empty
     * - parameter districtId: Id of district
     * - returns: True if list of wards of district is empty, False otherwise
     */
    public func checkWardListEmpty(districtId: String) -> Bool {
        if let val = self._listWards[districtId] {
            return val.isEmpty
        } else {
            return true
        }
    }
    //-- BUG0050-SPJ (NguyenPT 20170403) Handle Address information
    //++ BUG0054-SPJ (NguyenPT 20170414) Add new function G07
    /**
     * Get list of cancel order reasons
     * - returns: List of cancel order reasons
     */
    public func getListCancelOrderReasons() -> [ConfigBean] {
        return self.list_cancelOrderReasons
    }
    
    /**
     * Get list of main menu
     * - returns: List of menu
     */
    public func getListOfMenus() -> [ConfigBean] {
        return self.menu
    }
    
    /**
     * Get list of cylinders information
     * - returns: List of cylinders information
     */
    public func getListCylinderInfo() -> [MaterialBean] {
        return self.list_infoCylinder
    }
    
    /**
     * Get list of the other material
     * - returns: List of the other material
     */
    public func getListOtherMaterialInfo() -> [MaterialBean] {
        return self.list_infoOtherMaterial
    }
    
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
    /**
     * Get list of gas material
     * - returns: List of gas material
     */
    public func getListGasMaterialInfo() -> [MaterialBean] {
        return self.list_infoGas
    }
    //-- BUG0060-SPJ (NguyenPT 20170426) Handle save list gas information to local
    
    //++ BUG0094-SPJ (NguyenPT 20170701) Add function create order by Coordinator
    /**
     * Handle get material name from id
     */
    public func getMaterialNameFromId(id: String) -> String {
        for item in self.list_infoGas {
            if item.material_id == id {
                return item.material_name
            }
        }
        return DomainConst.BLANK
    }
    //-- BUG0094-SPJ (NguyenPT 20170701) Add function create order by Coordinator
    
    /**
     * Get Name of order cancel reason by id
     * - parameter id: Id of order cancel reason
     * - returns: Name of order cancel reason
     */
    public func getOrderCancelReasonById(id: String) -> String {
        for item in self.list_cancelOrderReasons {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    //-- BUG0054-SPJ (NguyenPT 20170414) Add new function G07
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle update Order VIP customer
    /**
     * Get list of cancel order (VIP customer) reasons
     * - returns: List of cancel order reasons
     */
    public func getListCancelOrderVIPReasons() -> [ConfigBean] {
        return self.list_cancelOrderVIPReasons
    }
    
    /**
     * Get Name of order (VIP customer) cancel reason by id
     * - parameter id: Id of order cancel reason
     * - returns: Name of order cancel reason
     */
    public func getOrderVIPCancelReasonById(id: String) -> String {
        for item in self.list_cancelOrderVIPReasons {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    //++ BUG0060-SPJ (NguyenPT 20170426) Handle update Order VIP customer
    //++ BUG0077-SPJ (NguyenPT 20170508) Handle Flag need change pass
    /**
     * Get value of Need change pass flag
     * - returns: Need change pass flag value
     */
    public func getNeedChangePassFlag() -> Bool {
        return self._isNeedChangePass
    }
    //-- BUG0077-SPJ (NguyenPT 20170508) Handle Flag need change pass
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /**
     * Get list of order types
     * - returns: List of order types
     */
    public func getListOrderTypes() -> [ConfigBean] {
        return self.list_OrderTypes
    }
    
    /**
     * Get list of support types
     * - returns: List of support types
     */
    public func getListSupportTypes() -> [ConfigBean] {
        return self.list_SupportTypes
    }
    
    /**
     * Get name of support type
     * - parameter id: Id of support type
     * - returns: Name of support type
     */
    public func getSupportNameById(id: String) -> String {
        for item in self.list_SupportTypes {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    
    /**
     * Get name of order type
     * - parameter id: Id of order type
     * - returns: Name of order type
     */
    public func getOrderTypeNameById(id: String) -> String {
        for item in self.list_OrderTypes {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /**
     * Set error detail value
     * - parameter detail: Error detail
     */
    public func setErrorDetail(detail: String) {
        self._errorDetail = detail
    }
    
    /**
     * Get error detail value
     * - returns: Error detail value
     */
    public func getErrorDetail() -> String {
        return self._errorDetail
    }
    
    //++ BUG0109-SPJ (NguyenPT 20170617) Handle get name of address value by id
    /**
     * Get province name by id
     * - parameter id: Id of province
     * - returns: Name of province
     */
    public func getProvinceNameById(id: String) -> String {
        for item in self._listProvinces {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    
    /**
     * Get district name by id
     * - parameter id: Id of district
     * - parameter provinceId: Id of province
     * - returns: Name of district
     */
    public func getDistrictNameById(id: String, provinceId: String) -> String {
        if let lst = self._listDistricts[provinceId] {
            for item in lst {
                if item.id == id {
                    return item.name
                }
            }
        }
        
        return DomainConst.BLANK
    }
    
    /**
     * Get ward name by id
     * - parameter id: Id of ward
     * - parameter districtId: Id of district
     * - returns: Name of ward
     */
    public func getWardNameById(id: String, districtId: String) -> String {
        if let lst = self._listWards[districtId] {
            for item in lst {
                if item.id == id {
                    return item.name
                }
            }
        }
        
        return DomainConst.BLANK
    }
    
    /**
     * Get street name by id
     * - parameter id: Id of street
     * - returns: Name of street
     */
    public func getStreetNameById(id: String) -> String {
        for item in self.list_street {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    //-- BUG0109-SPJ (NguyenPT 20170617) Handle get name of address value by id
    
    //++ BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
    /**
     * Set value for Role id
     * - parameter id: Id of role
     */
    public func setRoleId(id: String) {
        self.role_id = id
        defaults.set(self.role_id, forKey: DomainConst.KEY_SETTING_ROLE_ID)
        defaults.synchronize()
    }
    //-- BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
    
    //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    /**
     * Get list of vip customer stores
     * - returns: List of vip customer stores
     */
    public func getListVipCustomerStores() -> [ConfigBean] {
        return self._listVipCustomerStores
    }
    
    /**
     * Check if Customer has sub-agent
     * - returns: True if number of _listVipCustomerStores's element greater than zero,
     *              False otherwise
     */
    public func isVIPCustomerHasSubStores() -> Bool {
        return (self._listVipCustomerStores.count > 0)
    }
    //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    //++ BUG0132-SPJ (NguyenPT 20170724) Remember username after login
    /**
     * Set current username
     * - parameter username: Username string
     */
    public func setCurrentUsername(username: String) {
        self._currentUsername = username
        defaults.set(self._currentUsername, forKey: DomainConst.KEY_SETTING_USERNAME)
        defaults.synchronize()
    }
    
    /**
     * Get current username value
     * - returns: Username string
     */
    public func getCurrentUsername() -> String {
        return self._currentUsername
    }
    //-- BUG0132-SPJ (NguyenPT 20170724) Remember username after login
    
    //++ BUG0151-SPJ (NguyenPT 20170819) Handle favourite when select material
    /**
     * Set current username
     * - parameter username: Username string
     */
    public func setAgentId(id: String) {
        self._agentId = id
        defaults.set(self._agentId, forKey: DomainConst.KEY_SETTING_AGENT_ID)
        defaults.synchronize()
    }
    
    /**
     * Get current username value
     * - returns: Username string
     */
    public func getAgentId() -> String {
        return self._agentId
    }
    //-- BUG0151-SPJ (NguyenPT 20170819) Handle favourite when select material
    
    /**
     * Check is first order
     * - returns: Value of _isFirstOrder flag
     */
    public func isFirstOrder() -> Bool {
        return self._isFirstOrder
    }
    
    /**
     * Get user information
     * - returns: User information
     */
    public func getUserInfo() -> UserInfoBean {
        return self._userInfo
    }
    
    /**
     * Get name of province in User info
     * - returns: Name of province
     */
    public func getUserInfoProvinceName() -> String {
        return self.getProvinceNameById(id: self._userInfo.getProvinceId())
    }
    
    /**
     * Get name of district in User info
     * - returns: Name of district
     */
    public func getUserInfoDistrictName() -> String {
        return self.getDistrictNameById(id: self._userInfo.getDistrictId(),
                                        provinceId: self._userInfo.getProvinceId())
    }
    
    /**
     * Get name of ward in User info
     * - returns: Name of ward
     */
    public func getUserInfoWardName() -> String {
        return self.getWardNameById(id: self._userInfo.getWardId(),
                                    districtId: self._userInfo.getDistrictId())
    }
    
    /**
     * Get gas24h time check order
     * - returns: Int
     */
    public func getGas24hTimeCheckOrder() -> Int {
        return _gas24hTimeCheckOrder
    }
    
    /**
     * Get invite code
     * - returns: String
     */
    public func getInviteCode() -> String {
        return _inviteCode
    }
    
    /**
     * Get Gas24h Menu text
     * - returns: String
     */
    public func getGas24hMenuText() -> String {
        return _gas24hMenuText
    }
    
    //++ BUG0187-SPJ (NguyenPT 20180202) Gas24h  - Add data for Bottom message view, Add popup promotion
    /**
     * Set list news data
     * - parameter data: NewsListRespModel object
     */
    public func setListNews(data: NewsListRespModel) {
        self._listNews = data
    }
    
    /**
     * Get list news data
     * - returns: NewsListRespModel object
     */
    public func getListNews() -> NewsListRespModel {
        return _listNews
    }
    
    /**
     * Set Pop up data
     * - parameter data: NewsListBean object
     */
    public func setPopupData(data: NewsListBean) {
        self._popUpData = data
        defaults.set(self._popUpData.id, forKey: DomainConst.KEY_SETTING_POPUP_ID)
        defaults.synchronize()
    }
    
    /**
     * Get Pop up data
     * - returns: NewsListBean object
     */
    public func getPopupData() -> NewsListBean {
        return _popUpData
    }
    
    /**
     * Check if pop up data was changed
     * - parameter data: Data to compare
     * - returns: True if pop up data was changed, False otherwise
     */
    public func isPopupChanged(data: NewsListBean) -> Bool {
        if data.id != self._popUpData.id {
            return true
        }
        return false
    }
    //-- BUG0187-SPJ (NguyenPT 20180202) Gas24h  - Add data for Bottom message view, Add popup promotion
}
