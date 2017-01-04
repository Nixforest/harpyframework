//
//  DomainConst.swift
//  harpyframework
//
//  Created by SPJ on 12/17/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
public class DomainConst {
    // MARK: -----API request define-----
    /** Autocomplete user */
    public static let PATH_SITE_AUTOCOMPLETE_USER = "site/autocompleteUser"
    /** Confirm notify */
    public static let PATH_SITE_CONFIRM_NOTIFY = "site/confirmNotify"
    /** Issue close */
    public static let PATH_SITE_ISSUE_CLOSE = "site/issueClose"
    /** Issue create */
    public static let PATH_SITE_ISSUE_CREATE = "site/issueCreate"
    /** Issue list */
    public static let PATH_SITE_ISSUE_LIST = "site/issueList"
    /** Issue Reopen */
    public static let PATH_SITE_ISSUE_REOPEN = "site/issueReopen"
    /** Issue Reply */
    public static let PATH_SITE_ISSUE_REPLY = "site/issueReply"
    /** Issue View */
    public static let PATH_SITE_ISSUE_VIEW = "site/issueView"
    /** Login page */
    public static let PATH_SITE_LOGIN = "site/login"
    /** Logout page */
    public static let PATH_SITE_LOGOUT = "site/logout"
    /** News list */
    public static let PATH_SITE_NEWS_LIST = "site/newsList"
    /** News view */
    public static let PATH_SITE_NEWS_VIEW = "site/newsView"
    /** Notify count */
    public static let PATH_SITE_NOTIFY_COUNT = "site/notifyCount"
    /** Notify list */
    public static let PATH_SITE_NOTIFY_LIST = "site/notifyList"
    /** Notify view */
    public static let PATH_SITE_NOTIFY_VIEW = "site/notifyView"
    /** Order create */
    public static let PATH_SITE_ORDER_CREATE = "site/orderCreate"
    /** Order create data label */
    public static let PATH_SITE_ORDER_CREATE_DATA_LABEL = "site/orderCreateDataLabel"
    /** Order list */
    public static let PATH_SITE_ORDER_LIST = "site/orderList"
    /** Sign up */
    public static let PATH_SITE_SIGN_UP = "site/signup"
    /** Sign up data label */
    public static let PATH_SITE_SIGN_UP_DATA_LABEL = "site/signupDataLabel"
    /** Sign up get District */
    public static let PATH_SITE_SIGN_UP_GET_DISTRICT = "site/signupGetDistrict"
    /** Sign up get Ward */
    public static let PATH_SITE_SIGN_UP_GET_WARD = "site/signupGetWard"
    /** Update config */
    public static let PATH_SITE_UPDATE_CONFIG = "site/updateConfig"
    /** Uphold create */
    public static let PATH_SITE_UPHOLD_CREATE = "site/upholdCreate"
    /** Uphold list */
    public static let PATH_SITE_UPHOLD_LIST = "site/upholdList"
    /** Uphold reply */
    public static let PATH_SITE_UPHOLD_REPLY = "site/upholdReply"
    /** Uphold view */
    public static let PATH_SITE_UPHOLD_VIEW = "site/upholdView"
    /** Uphold Customer rating */
    public static let PATH_SITE_UPHOLD_CUSTOMER_RATING = "site/upholdCustomerRating"
    /** Change password */
    public static let PATH_USER_CHANGE_PASS = "user/changePass"
    /** User profile */
    public static let PATH_USER_PROFILE = "user/profile"
    /** Customer register */
    public static let PATH_CUSTOMER_REGISTER = "customer/register"
    /** Customer register confirm */
    public static let PATH_CUSTOMER_REGISTER_CONFIRM = "customer/registerConfirm"
    
    // MARK: -----List of keys-----
    /** Token */
    public static let KEY_TOKEN = "token"
    /** Keyword */
    public static let KEY_KEYWORD = "keyword"
    /** Q */
    public static let KEY_Q = "q"
    /** Notify Id */
    public static let KEY_NOTIFY_ID = "notify_id"
    /** Type */
    public static let KEY_TYPE = "type"
    /** Object Id */
    public static let KEY_OBJECT_ID = "obj_id"
    /** Issue Id */
    public static let KEY_ISSUE_ID = "issue_id"
    /** Customer Id */
    public static let KEY_CUSTOMER_ID = "customer_id"
    /** Customer Name */
    public static let KEY_CUSTOMER_NAME = "customer_name"
    /** Customer Address */
    public static let KEY_CUSTOMER_ADDRESS = "customer_address"
    /** Title */
    public static let KEY_TITLE = "title"
    /** Message */
    public static let KEY_MESSAGE = "message"
    /** Problem */
    public static let KEY_PROBLEM = "problem"
    /** Page */
    public static let KEY_PAGE = "page"
    /** Chief monitor id */
    public static let KEY_CHIEF_MONITOR_ID = "chief_monitor_id"
    /** Monitor agent id */
    public static let KEY_MONITOR_AGENT_ID = "monitor_agent_id"
    /** Accounting id */
    public static let KEY_ACCOUNTING_ID = "accounting_id"
    /** Username */
    public static let KEY_USERNAME = "username"
    /** Password */
    public static let KEY_PASSWORD = "password"
    /** GCM device token */
    public static let KEY_GCM_DEVICE_TOKEN = "gcm_device_token"
    /** APNS device token */
    public static let KEY_APNS_DEVICE_TOKEN = "apns_device_token"
    /** News Id */
    public static let KEY_NEWS_ID = "news_id"
    /** Id */
    public static let KEY_ID = "id"
    /** Note Customer */
    public static let KEY_NOTE_CUSTOMER = "note_customer"
    /** qty_12 */
    public static let KEY_QTY_12 = "qty_12"
    /** qty_50 */
    public static let KEY_QTY_50 = "qty_50"
    /** qty_12_list */
    public static let KEY_QTY_12_LIST = "qty_12_list"
    /** qty_50_list */
    public static let KEY_QTY_50_LIST = "qty_50_list"
    /** Phone */
    public static let KEY_PHONE = "phone"
    /** Password */
    public static let KEY_PASSWORD_CONFIRM = "password_confirm"
    /** First name */
    public static let KEY_FIRST_NAME = "first_name"
    /** Province Id */
    public static let KEY_PROVINCE_ID = "province_id"
    /** District Id */
    public static let KEY_DISTRICT_ID = "district_id"
    /** Ward Id */
    public static let KEY_WARD_ID = "ward_id"
    /** Street */
    public static let KEY_STREET = "street"
    /** House Number */
    public static let KEY_HOUSE_NUMBER = "house_numbers"
    /** Sign up code */
    public static let KEY_SIGN_UP_CODE = "signup_code"
    /** Employee Id */
    public static let KEY_EMPLOYEE_ID = "employee_id"
    /** Employee Name */
    public static let KEY_EMPLOYEE_NAME = "employee_name"
    /** Employee phone */
    public static let KEY_EMPLOYEE_PHONE = "employee_phone"
    /** Employee code */
    public static let KEY_EMPLOYEE_CODE = "employee_code"
    /** Employee image */
    public static let KEY_EMPLOYEE_IMG = "employee_image"
    /** Uphold type */
    public static let KEY_UPHOLD_TYPE = "type_uphold"
    /** Uphold type */
    public static let KEY_UPHOLD_TYPE_IDX = "uphold_type"
    /** Content */
    public static let KEY_CONTENT = "content"
    /** Contact person */
    public static let KEY_CONTACT_PERSON = "contact_person"
    /** Contact telephone number */
    public static let KEY_CONTACT_TEL = "contact_tel"
    /** Status */
    public static let KEY_STATUS = "status"
    /** Status number */
    public static let KEY_STATUS_NUMBER = "status_number"
    /** Uphold Id */
    public static let KEY_UPHOLD_ID = "uphold_id"
    /** Hours handle */
    public static let KEY_HOURS_HANDLE = "hours_handle"
    /** Contact phone */
    public static let KEY_CONTACT_PHONE = "contact_phone"
    /** Note */
    public static let KEY_NOTE = "note"
    /** Report wrong */
    public static let KEY_REPORT_WRONG = "report_wrong"
    /** Note internal */
    public static let KEY_NOTE_INTERNAL = "note_internal"
    /** Reply Id */
    public static let KEY_REPLY_ID = "reply_id"
    /** Old password */
    public static let KEY_OLD_PASSWORD = "old_password"
    /** New password */
    public static let KEY_NEW_PASSWORD = "new_password"
    /** New password confirm */
    public static let KEY_NEW_PASSWORD_CONFIRM = "new_password_confirm"
    /** Code */
    public static let KEY_CODE = "code"
    /** Record */
    public static let KEY_RECORD = "record"
    /** Notify count text */
    public static let KEY_NOTIFY_COUNT_TEXT = "NotifyCountText"
    /** Issue create */
    public static let KEY_ISSUE_CREATE = "issue_create"
    /** Total page */
    public static let KEY_TOTAL_PAGE = "total_page"
    /** LIST_CHIEF_MONITOR */
    public static let KEY_LIST_CHIEF_MONITOR = "LIST_CHIEF_MONITOR"
    /** LIST_MONITOR_AGENT */
    public static let KEY_LIST_MONITOR_AGENT = "LIST_MONITOR_AGENT"
    /** LIST_ACCOUNTING */
    public static let KEY_LIST_ACCOUNTING = "LIST_ACCOUNTING"
    /** Model issue */
    public static let KEY_MODEL_ISSUE = "model_issue"
    /** Menu */
    public static let KEY_MENU = "menu"
    /** Data uphold */
    public static let KEY_DATA_UPHOLD = "data_uphold"
    /** Maximum upload size */
    public static let KEY_MAX_UPLOAD = "max_upload"
    /** Data issue */
    public static let KEY_DATA_ISSUE = "data_issue"
    /** Role id */
    public static let KEY_ROLE_ID = "role_id"
    /** User id */
    public static let KEY_USER_ID = "user_id"
    /** User information */
    public static let KEY_USER_INFO = "user_info"
    /** Check menu */
    public static let KEY_CHECK_MENU = "check_menu"
    /** Province list */
    public static let KEY_PROVINCE_LIST = "province_list"
    /** District list */
    public static let KEY_DISTRICT_LIST = "district_list"
    /** Ward list */
    public static let KEY_WARD_LIST = "ward_list"
    /** Detail id */
    public static let KEY_DETAIL_ID = "detail_id"
    /** Model uphold */
    public static let KEY_MODEL_UPHOLD = "model_uphold"
    /** Address */
    public static let KEY_ADDRESS = "address"
    /** Image avatar */
    public static let KEY_IMG_AVATAR = "image_avatar"
    /** Notify type */
    public static let KEY_NOTIFY_TYPE = "notify_type"
    /** Request type */
    public static let KEY_REQUEST_TYPE = "request_by"
    /** Request type */
    public static let KEY_RATING_STATUS = "rating_status"
    /** Request type */
    public static let KEY_RATING_TYPE = "rating_type"
    /** Request type */
    public static let KEY_RATING_NOTE = "rating_note"
    /** Other information */
    public static let KEY_OTHER_INFO = "OtherInfo"
    /** Uphold last id */
    public static let KEY_UPHOLD_ID_LASTEST = "uphold_id_lastest"
    /** Need change pass */
    public static let KEY_NEED_CHANGE_PASS = "need_change_pass"
    /** Need update app */
    public static let KEY_NEED_UPDATE_APP = "need_update_app"
    /** Detail reply id */
    public static let KEY_DETAIL_REPLY_ID = "detail_reply_id"
    /** Uphold create */
    public static let KEY_UPHOLD_CREATE = "uphold_create"
    /** Role name */
    public static let KEY_ROLE_NAME = "role_name"
    /** List streets */
    public static let KEY_LIST_STREET = "list_street"
    /** List agents */
    public static let KEY_LIST_AGENT = "list_agent"
    /** List hgd type */
    public static let KEY_LIST_HGD_TYPE = "list_hgd_type"
    /** List hgd_invest */
    public static let KEY_LIST_HGD_INVEST = "list_hgd_invest"
    /** Name */
    public static let KEY_NAME = "name"
    /** Data */
    public static let KEY_DATA = "data"
    /** Grand total */
    public static let KEY_GRAND_TOTAL = "grand_total"
    /** Setting key: is login */
    public static let KEY_SETTING_IS_LOGGING = "gasservice.isLogin"
    /** Setting key: user token */
    public static let KEY_SETTING_USER_TOKEN = "gasservice.user.token"
    /** Setting key: training mode */
    public static let KEY_SETTING_TRAINING_MODE = "gasservice.trainningMode"
    /** Setting key: Temp token */
    public static let KEY_SETTING_TEMP_TOKEN = "gasservice.temp.token"
    /** Setting key: Material type id */
    public static let KEY_MATERIALS_TYPE_ID = "materials_type_id"
    /** Setting key: Material id */
    public static let KEY_MATERIALS_ID = "material_id"
    /** Setting key: Material name */
    public static let KEY_MATERIALS_NAME = "material_name"
    /** Setting key: Material price */
    public static let KEY_MATERIALS_PRICE = "material_price"
    /** Setting key: Price */
    public static let KEY_PRICE = "price"
    /** Setting key: Quantity */
    public static let KEY_QUANTITY = "qty"
    /** Setting key: Amount */
    public static let KEY_AMOUNT = "amount"
    /** Setting key: Material image */
    public static let KEY_MATERIAL_IMAGE = "material_image"
    /** Setting key: Email */
    public static let KEY_EMAIL = "email"
    /** Setting key: Agent id */
    public static let KEY_AGENT_ID = "agent_id"
    /** Setting key: Agent name */
    public static let KEY_AGENT_NAME = "agent_name"
    /** Setting key: Allow update */
    public static let KEY_ALLOW_UPDATE = "allow_update"
    /** Setting key: Order type */
    public static let KEY_ORDER_TYPE = "order_type"
    /** Setting key: Type amount */
    public static let KEY_TYPE_AMOUNT = "type_amount"
    /** Setting key: Amount discount */
    public static let KEY_AMOUNT_DISCOUNT = "amount_discount"
    /** Setting key: Discount type */
    public static let KEY_DISCOUNT_TYPE = "discount_type"
    /** Setting key: Status cancel */
    public static let KEY_STATUS_CANCEL = "status_cancel"
    /** Setting key: Order detail */
    public static let KEY_ORDER_DETAIL = "order_detail"
    
    /** Key total record */
    public static let KEY_TOTAL_RECORD = "total_record"
    /** Code no */
    public static let KEY_CODE_NO = "code_no"
    /** Level type */
    public static let KEY_LEVEL_TYPE = "level_type"
    /** Created date */
    public static let KEY_CREATED_DATE = "created_date"
    /** Created byte */
    public static let KEY_CREATED_BY = "created_by"
    /** Sale name */
    public static let KEY_SALE_NAME = "sale_name"
    /** Schedule month */
    public static let KEY_SCHEDULE_MONTH = "schedule_month"
    /** Last reply message */
    public static let KEY_LAST_REPLY_MESSAGE = "last_reply_message"
    /** Schedule Type */
    public static let KEY_SCHEDULE_TYPE = "schedule_type"
    /** Uid login */
    public static let KEY_UID_LOGIN = "uid_login"
    /** Date time handle */
    public static let KEY_DATE_TIME_HANDLE = "date_time_handle"
    /** Reply item */
    public static let KEY_REPLY_ITEM = "reply_item"
    /** Image thumb */
    public static let KEY_IMG_THUMB = "thumb"
    /** Image large */
    public static let KEY_IMG_LARGE = "large"
    /** Image list */
    public static let KEY_IMAGES = "images"
    /** Latitude */
    public static let KEY_LATITUDE = "latitude"
    /** Version code */
    public static let KEY_VERSION_CODE = "version_code"
    /** Longitude */
    public static let KEY_LONGITUDE = "longitude"
    /** Uphold list */
    public static let KEY_UPHOLD_LIST = "uphold_list"
    /** Uphold rating */
    public static let KEY_UPHOLD_RATING = "uphold_rating"
    /** Version code */
    public static let KEY_APP_VERSION_CODE = "app_version_code"
    /** Confirm code */
    public static let KEY_CONFIRM_CODE = "confirm_code"
    /** show_nhan_giao_hang */
    public static let KEY_SHOW_NHAN_GH = "show_nhan_giao_hang"
    /** show_huy_giao_hang */
    public static let KEY_SHOW_HUY_GH = "show_huy_giao_hang"
    /** Transaction History Id */
    public static let KEY_TRANSACTION_HISTORY_ID = "transaction_history_id"
    
    // MARK: -----Specified constant-----
    /** File parameter: file_name[ + ] */
    public static let FILE_PARAM_FILE_NAME = "file_name["
    public static let FILE_PARAM_FILE_NAME_CLOSE = "]"
    /** Character encoding: UTF-8 */
    public static let CHARACTER_ENCODING_UTF8 = "UTF-8"
    /** Http request header: Content-Type */
    public static let HTTP_REQ_HEADER = "Content-Type"
    /** Http request header: application */
    public static let HTTP_REQ_HEADER_CONTENT = "application/x-www-form-urlencoded"
    /** Specified constant */
    public static let MSG_PRESS_OK = "Press OK"
    /** Specified constant */
    public static let MSG_PRESS_REOPEN = "Press reopen"
    /** Specified constant */
    public static let MSG_DEVICE_NOT_SUPPORT = "This device is not supported."
    /** Specified constant */
    public static let MSG_NOT_RECEIVE_TOKEN = "Không thể nhận được device token!"
    /** Specified constant */
    public static let MSG_RECEIVE_TOKEN = "Đã nhận được device token!!"
    /** Request method: POST */
    public static let REQUEST_POST = 1
    /** Request method: GET */
    public static let REQUEST_GET = 2
    /** Request method: PUT */
    public static let REQUEST_PUT = 3
    /** Request method: DELETE */
    public static let REQUEST_DELETE = 4
    /** Certificate exception */
    public static let CERTIFICATE_NOT_VALID_OR_TRUSTED = "Certificate not valid or trusted."
    /** Http scheme */
    public static let SCHEME_HTTP = "http"
    /** Https scheme */
    public static let SCHEME_HTTPS = "https"
    /** Port: 80 */
    public static let PORT_80 = 80
    /** Port: 443 */
    public static let PORT_443 = 443
    /** Application mode: Running */
    public static let MODE_RUNNING = 0
    /** Application mode: Training */
    public static let MODE_TRAINING = 1
    /** Issue type: open */
    public static let TYPE_OPEN = 1
    /** Issue type: close */
    public static let TYPE_CLOSE = 2
    /** News type: new */
    public static let TYPE_NEW = 1
    /** News type: view */
    public static let TYPE_VIEW = 2
    /** Google play service resolution request */
    public static let PLAY_SERVICES_RESOLUTION_REQUEST = 9000
    /** Maximum of click on Logo to show hidden Activity */
    public static let MAX_CLICK_NUMBER = 7
    /** Result load image */
    public static let RESULT_LOAD_IMG = 1000
    /** Limit number of image can select 1 time */
    public static let MAX_SELECTED_PICTURE = 6
    /** Touch image state: None */
    public static let TOUCH_IMG_NONE = 0
    /** Touch image state: Dragging */
    public static let TOUCH_IMG_DRAG = 1
    /** Touch image state: Zoom */
    public static let TOUCH_IMG_ZOOM = 2
    /** Touch image state: Click */
    public static let TOUCH_IMG_CLICK = 3
    /** Auto search interval */
    public static let SEARCH_INTERVAL = 1000
    /** Minimum number of characters begin search */
    public static let SEARCH_MIN_LENGTH = 5
    /** Pattern to remove accent */
    public static let PATTERN_REMOVE_ACCENT = "\\p{InCombiningDiacriticalMarks}+"
    
    /** Uphold type: Periodically */
    public static let UPHOLD_TYPE_PERIODICALLY = "1"
    /** Uphold type: Trouble */
    public static let UPHOLD_TYPE_TROUBLE = "2"
    /** Uphold type: Periodically */
    public static let TYPE_PERIODICALLY = 1
    /** Uphold type: Trouble */
    public static let TYPE_TROUBLE = 2
    
    /** Uphold status: Complete */
    public static let UPHOLD_STATUS_COMPLETE = "3"
    /** Uphold status: New */
    public static let UPHOLD_STATUS_NEW = "1"
    /** Uphold status: Handling */
    public static let UPHOLD_STATUS_HANDLE = "2"
    /** Uphold status: Other */
    public static let UPHOLD_TYPE_OTHER = "6"
    /** Uphold contact: Other */
    public static let UPHOLD_CONTACT_OTHER = "4"
    /** Role id: Customer */
    public static let ROLE_CUSTOMER = "4"
    /** Role id: Coordinator */
    public static let ROLE_COORDINATOR = "17"
    /** Role id: Audit */
    public static let ROLE_AUDIT = "54"
    /** Role id: Chief monitor */
    public static let ROLE_CHIEF_MONITOR = "28"
    /** Role id: Director */
    public static let ROLE_DIRECTOR = "19"
    /** Flag change pass: need change */
    public static let NEED_CHANGE_PASS = "1"
    /** Flag change pass: no need change */
    public static let NO_NEED_CHANGE_PASS = "0"
    /** Notify type: View Uphold */
    public static let NOTIFY_VIEW_UPHOLD = "VIEW_UPHOLD"
    /** Notify type: View Issue */
    public static let NOTIFY_VIEW_ISSUE = "VIEW_ISSUE"
    /** Notify type: Uphold alert 10 */
    public static let NOTIFY_UPHOLD_ALERT_10 = "1"
    /** Notify type: Uphold periodically */
    public static let NOTIFY_UPHOLD_PERIODICALLY_1_DAY = "2"
    /** Notify type: Issue ticket */
    public static let NOTIFY_ISSUE_TICKET = "3"
    /** Notify type: Uphold create */
    public static let NOTIFY_UPHOLD_CREATE = "4"
    /** The other option */
    public static let OPTION_OTHER = "Khác"
    /** Address unknown string */
    public static let ADDRESS_UNKNOWN = "Khong ro, "
    
    /** -----Log message----- */
    /** Log tag: error. */
    public static let LOG_TAG_ERROR = "harpy.error"
    /** Log tag: warn. */
    public static let LOG_TAG_WARN = "harpy.warn"
    /** Log tag: info. */
    public static let LOG_TAG_INFO = "harpy.info"
    /** Log tag: debug. */
    //public static let LOG_TAG_DEBUG = "harpy.debug"
    /** Log message. */
    public static let LOG_MSG_HTTP_ACCESS_FAILED = "httpAccessPost fail:"
    /** Log message. */
    public static let LOG_MSG_GET_DATA_FROM_URL = "Get data from URL: "
    
    /** Blank character */
    public static let BLANK = ""
    /** Space string */
    public static let SPACE_STR = " "
    /** Server URL (Training mode) */
    public static let SERVER_URL_TRAINING = "http://android.huongminhgroup.com/api/"
    /** Server URL */
    public static let SERVER_URL = "http://spj.daukhimiennam.com/api/"
    
    // MARK -----Define id of fragment-----
    public static let LOGOUT = "logout"
    public static let ORDER_LIST = "order_list"
    public static let ORDER_CREATE = "order_create"
    public static let UPHOLD_LIST = "uphold_list"
    public static let NEWS_LIST = "news_list"
    public static let USER_PROFILE = "user_profile"
    public static let ISSUE_CREATE = "Tạo mới phản ánh"
    public static let HOME = "home"
    public static let ISSUE_LIST = "issue_list"
    public static let MESSAGE = "message"
    public static let CUSTOMER_LIST = "customer_list"
    public static let WORKING_REPORT = "working_report_list"
    public static let ORDER_TRANSACTION_LIST = "transaction_list"
    public static let ISSUE_VIEW = "Chi tiết phản ánh"
    public static let NEWS_VIEW = "Chi tiết tin tức"
    public static let UPHOLD_VIEW = "Chi tiết bảo trì"
    public static let ISSUE_REPLY = "Trả lời phản ánh"
    public static let UPHOLD_REPLY = "Trả lời bảo trì"
    public static let USER_CHANGE_PASS = "Đổi mật khẩu"
    public static let UPHOLD_CREATE = "Tạo mới bảo trì"
    
    // MARK: -----Controller names-----
    /** Application name */
    public static let APPNAME = "gasservice"
    public static let HARPY_FRAMEWORK_BUNDLE_NAME = "com.spj.harpyframework.harpyframework"
    /** Name of RegisterViewController */
    public static let REGISTER_VIEW_CTRL = "G00RegisterVC"
    /** Name of G00 home view controller */
    public static let G00_HOME_VIEW_CTRL = "G00HomeVC"
    /** Name of G00 login view controller */
    public static let G00_LOGIN_VIEW_CTRL = "G00LoginVC"
    /** Name of ConfigurationViewController */
    public static let G00_CONFIGURATION_VIEW_CTRL = "G00ConfigurationVC"
    /** Name of G00 information view controller */
    public static let G00_INFORMATION_VIEW_CTRL = "G00InfomationVC"
    /** Name of AccountViewController */
    public static let G00_ACCOUNT_VIEW_CTRL = "G00AccountVC"
    /** Name of Uphold List View Controller */
    public static let G01_F00_S01_VIEW_CTRL = "G01F00S01VC"
    /** Name of Uphold detail employee view controller */
    public static let G01_F00_S02_VIEW_CTRL = "G01F00S02VC"
    /** Name of Uphold detail customer view controller */
    public static let G01_F00_S03_VIEW_CTRL = "G01F00S03VC"
    /** Name of UpholdListViewController */
    public static let PERIOD_UPHOLDDETAIL_CUSTOMER_VIEW_CTRL = "PeriodUpholdDetailCustomerViewController"
    /** Name of ReplyUpholdViewController */
    public static let REPLY_UPHOLD_VIEW_CTRL = "ReplyUpholdViewController"
    /** Name of Uphold detail employee information view */
    public static let G01_F00_S02_INFO_VIEW = "G01F00S02InfoView"
    
    /** Name of G01F02 create uphold reply view controller */
    public static let G01_F02_VIEW_CTRL = "G01F02VC"
    /** Name of G01F03 uphold rating view controller */
    public static let G01_F03_VIEW_CTRL = "G01F03VC"
    /** Name of G04F00 Order list view controller */
    public static let G04_F00_S01_VIEW_CTRL = "G04F00S01VC"
    
    /** Name of ChangePasswordViewController */
    public static let G00_CHANGE_PASS_VIEW_CTRL = "G00ChangePassVC"
    /** Name of G01F01VC */
    public static let G01_F01_VIEW_CTRL = "G01F01VC"
    /** Name of zoomIMGViewController */
    public static let ZOOM_IMAGE_VIEW_CTRL = "zoomIMGViewController"
    /** Home table view cell */
    public static let G00_HOME_CELL = "G00HomeCell"
    /** Period table view cell */
    public static let G01_F00_S01_PERIOD_CELL = "TableCellUpholdType"
    /** Problem table view cell */
    public static let G01_F00_S01_PROBLEM_CELL = "TableCellUpholdType"
    /** Search bar table view cell */
    public static let SEARCH_BAR_TABLE_VIEW_CELL = "searchBarTableViewCell"
    /** Configuration table view cell */
    public static let G00_CONFIGURATION_TABLE_VIEW_CELL = "G00ConfigurationCell"
    /** Uphold detail employee history table view cell */
    public static let UPHOLD_DETAIL_EMPLOYEE_HISTORY_TABLE_VIEW_CELL = "G01F00S02HistoryCell"
    /** Collection Image view cell */
    public static let COLLECTION_IMAGE_VIEW_CELL = "CollectionImageViewCell"
    /** Table view cell order type */
    public static let TABLE_VIEW_CELL_ORDER_TYPE = "TableCellOrderType"
    
    /** Pop overmenu identifier */
    public static let POPOVER_MENU_IDENTIFIER = "popOverMenu"
    /** G01F02S06 table view cell */
    public static let G01_F02_S06_CELL = "ImageTableViewCell"
    
    // MARK: -----Notification name-----
    public static let NOTIFY_NAME_LOGIN_ITEM                   = "loginItemTapped"
    public static let NOTIFY_NAME_LOGOUT_ITEM                  = "logoutItemTapped"
    public static let NOTIFY_NAME_REGISTER_ITEM                = "registerItemTapped"
    public static let NOTIFY_NAME_GAS_SERVICE_ITEM             = "gasServiceItemTapped"
    public static let NOTIFY_NAME_ISSUE_ITEM                   = "issueItemTapped"
    public static let NOTIFY_NAME_COFIG_ITEM                   = "configItemTapped"
    public static let NOTIFY_NAME_COFIG_ITEM_ACCOUNTVIEW       = "configItemTappedAccountView"
    public static let NOTIFY_NAME_COFIG_ITEM_UPHOLDLISTVIEW    = "configItemTappedUpholdListView"
    public static let NOTIFY_NAME_COFIG_ITEM_CREATE_UPHOLD     = "configItemTappedCreateUphold"
    public static let NOTIFY_NAME_COFIG_ITEM_UPHOLDDETAILVIEW    = "configItemTappedUpholdDetailView"
    public static let NOTIFY_NAME_COFIG_ITEM_CHANGEPASSVIEW    = "configItemTappedChangePassView"
    public static let NOTIFY_NAME_COFIG_ITEM_REGISTERVIEW    = "configItemTappedRegisterView"
    public static let NOTIFY_NAME_SET_DATA_ACCOUNTVIEW         = "G00AccountVC.setData"
    public static let NOTIFY_NAME_SET_DATA_UPHOLDLIST_VIEW     = "G01F00S01VC.setData"
    public static let NOTIFY_NAME_RELOAD_DATA_UPHOLDLIST_VIEW  = "G01F00S01VC.reloadData"
    public static let NOTIFY_NAME_SHOW_SEARCH_BAR_UPHOLDLIST_VIEW     = "G01F00S01VC.showSearchBarTableView"
    public static let NOTIFY_NAME_SET_DATA_UPHOLD_DETAIL_VIEW  = "UpholdDetailViewController.setData"
    public static let NOTIFY_NAME_COFIG_ITEM_G01F02            = "G01F2VC.configItemTapped"
    public static let NOTIFY_NAME_SET_DATA_G01F01              = "G01F1VC.setData"
    public static let NOTIFY_NAME_SET_DATA_G01F02              = "G01F2VC.setData"
    public static let NOTIFY_NAME_SET_DATA_G01F03              = "G01F3VC.setData"
    public static let NOTIFY_NAME_SET_DATA_HOMEVIEW            = "G00HomeVC.setData"
    public static let NOTIFY_NAME_COFIG_ITEM_HOMEVIEW          = "G00HomeVC.configItemTapped"
    public static let NOTIFY_NAME_UPDATE_NOTIFY_HOMEVIEW       = "G00HomeVC.updateNotify"
    public static let NOTIFY_NAME_RELOAD_DATA_UPHOLD_DETAIL_VIEW  = "G01F00S02.reloadData"
    
    // MARK: -----Domain constants-----
    /** Logo image name */
    public static let LOGO_IMG_NAME            = "gas_logo.png"
    /** Contact image name */
    public static let CONTACT_IMG_NAME         = "contact.png"
    /** Phone image name */
    public static let PHONE_IMG_NAME           = "mobile.png"
    /** Address image name */
    public static let ADDRESS_IMG_NAME         = "address.png"
    /** Menu image name */
    public static let MENU_IMG_NAME            = "menu.png"
    /** Back image name */
    public static let BACK_IMG_NAME            = "back.png"
    /** Back image name */
    public static let DELETE_IMG_NAME          = "delete.png"
    /** Uncheck image name */
    public static let UNCHECK_IMG_NAME         = "checkbox-unchecked.png"
    /** Checked image name */
    public static let CHECKED_IMG_NAME         = "checkbox-checked.png"
    /** Login image name */
    public static let LOGIN_MENU_IMG_NAME      = "login.png"
    /** Logout image name */
    public static let LOGOUT_MENU_IMG_NAME     = "logout.png"
    /** Register image name */
    public static let REGISTER_MENU_IMG_NAME   = "register.png"
    /** Issue image name */
    public static let ISSUE_MENU_IMG_NAME      = "issueMenu.png"
    /** Config image name */
    public static let CONFIG_MENU_IMG_NAME     = "configuration.png"
    /** Training mode image name */
    public static let TRAINING_MODE_IMG_NAME   = "trainingMode.png"
    /** Information image name */
    public static let INFORMATION_IMG_NAME     = "information"
    /** Order gas image name */
    public static let ORDER_GAS_IMG_NAME       = "ordergas.png"
    /** Uphold request image name */
    public static let UPHOLD_REQUEST_IMG_NAME  = "upholdRequest.png"
    /** Uphold list image name */
    public static let UPHOLD_LIST_IMG_NAME     = "UpHoldList.jpeg"
    /** Service rating image name */
    public static let SERVICE_RATING_IMG_NAME  = "ServiceRating.jpeg"
    /** Account image name */
    public static let ACCOUNT_IMG_NAME         = "Account.jpeg"
    /** Done image name */
    public static let DONE_IMG_NAME            = "done.png"
    /** Rating image name */
    public static let RATING_IMG_NAME          = "rating.png"
    /** Rating empty image name */
    public static let RATING_EMPTY_IMG_NAME    = "rating_empty.png"
    /** HTTP Post request method */
    public static let HTTP_POST_REQUEST        = "POST"
    
    // MARK: -----Version code-----
    public static let VERSION_CODE = "111"
    public static let VERSION_CODE_NAME = "Gas Service 1.1.1 @2016 Southern Petroleum"
    public static let EMAIL = "it@spj.vn"
    public static let WEBSITE = "http://daukhimiennam.com"
    
    
    // MARK: -----Public static strings-----
    public static let CONTENT00001 = "Harpy Framework"
    public static let CONTENT00002 = "Chưa chọn khách hàng"
    public static let CONTENT00003 = "Chưa chọn nguyên nhân!"
    public static let CONTENT00004 = "Chưa nhập tiêu đề!"
    public static let CONTENT00005 = "Chưa nhập nội dung!"
    public static let CONTENT00006 = "Bạn chỉ được nhập tối đa %1$d hình!"
    public static let CONTENT00007 = "Vui lòng kiểm tra lại dữ liệu!"
    public static let CONTENT00008 = "OK"
    public static let CONTENT00009 = "Cancel"
    public static let CONTENT00010 = "Bạn chắc chắn muốn close Issue"
    public static let CONTENT00011 = "Bạn chắc chắn muốn Reopen Issue"
    public static let CONTENT00012 = "Mã số:"
    public static let CONTENT00013 = "Khách hàng:"
    public static let CONTENT00014 = "NV kinh doanh:"
    public static let CONTENT00015 = "Địa chỉ:"
    public static let CONTENT00016 = "Tiêu đề:"
    public static let CONTENT00017 = "Người tạo:"
    public static let CONTENT00018 = "Ngày tạo:"
    public static let CONTENT00019 = "Trạng thái:"
    public static let CONTENT00020 = "Nguyên nhân:"
    public static let CONTENT00021 = "Điện thoại:"
    public static let CONTENT00022 = "Người liên hệ:"
    public static let CONTENT00023 = "Tài khoản và mật khẩu không được trống!"
    public static let CONTENT00024 = "(%1$s)"
    public static let CONTENT00025 = "Bạn vui lòng điền đầy đủ thông tin!"
    public static let CONTENT00026 = "Mật khẩu nhập lại không chính xác!"
    public static let CONTENT00027 = "Chưa chọn NV bảo trì!"
    public static let CONTENT00028 = "Chưa chọn loại sự cố!"
    public static let CONTENT00029 = "Chưa nhập người liên hệ!"
    public static let CONTENT00030 = "Chưa nhập số điện thoại!"
    public static let CONTENT00031 = "Nội dung: \n"
    public static let CONTENT00032 = "Liên hệ:"
    public static let CONTENT00033 = "Sự cố:"
    public static let CONTENT00034 = "Mức độ:"
    public static let CONTENT00035 = "Ngày bảo trì:"
    public static let CONTENT00036 = "Lịch bảo trì:"
    public static let CONTENT00037 = "Nhân viên bảo trì:"
    public static let CONTENT00038 = "Số điện thoại:"
    public static let CONTENT00039 = "Báo cáo kết quả: \n"
    public static let CONTENT00040 = "Bảo trì định kỳ"
    public static let CONTENT00041 = "Yêu cầu bảo trì"
    public static let CONTENT00042 = "Thời gian xử lý:"
    public static let CONTENT00043 = "Chưa chọn trạng thái!"
    public static let CONTENT00044 = "Tin nhắn từ Gas Service"
    public static let CONTENT00045 = "Nội dung:"
    public static let CONTENT00046 = "Mất kết nối mạng, vui lòng thử lại!"
    public static let CONTENT00047 = "Có lỗi xảy ra, vui lòng thử lại!"
    public static let CONTENT00048 = "Có lỗi xảy ra"
    public static let CONTENT00049 = "Tài khoản / Số điện thoại"
    public static let CONTENT00050 = "Mật khẩu"
    public static let CONTENT00051 = "Đăng nhập"
    public static let CONTENT00052 = "Đăng ký"
    public static let CONTENT00053 = "Welcome to gas app!"
    public static let CONTENT00054 = "Số điện thoại"
    public static let CONTENT00055 = "Họ và tên"
    public static let CONTENT00056 = "Nhập lại mật khẩu"
    public static let CONTENT00057 = "Số nhà"
    public static let CONTENT00058 = "Tên đường"
    public static let CONTENT00059 = "Title"
    public static let CONTENT00060 = "Tìm kiếm KH, nhập tối thiểu 5 ký tự"
    public static let CONTENT00061 = "Mã khách hàng"
    public static let CONTENT00062 = "Tiêu đề"
    public static let CONTENT00063 = "Nội dung"
    public static let CONTENT00064 = "Thêm hình"
    public static let CONTENT00065 = "Tạo mới"
    public static let CONTENT00066 = "Xoá hình"
    public static let CONTENT00067 = "Open"
    public static let CONTENT00068 = "Close"
    public static let CONTENT00069 = "Không có dữ liệu"
    public static let CONTENT00070 = "Gửi trả lời"
    public static let CONTENT00071 = "Lịch sử trả lời"
    public static let CONTENT00072 = "Thông tin"
    public static let CONTENT00073 = "Đóng lại"
    public static let CONTENT00074 = "Mới"
    public static let CONTENT00075 = "Đã xem"
    public static let CONTENT00076 = "Người liên hệ"
    public static let CONTENT00077 = "Bảo trì sự cố"
    public static let CONTENT00078 = "Bảo trì định kỳ"
    public static let CONTENT00079 = "Tên khách hàng"
    public static let CONTENT00080 = "Báo sai sự cố"
    public static let CONTENT00081 = "Ghi chú"
    public static let CONTENT00082 = "Ghi chú nội bộ"
    public static let CONTENT00083 = "Mật khẩu cũ"
    public static let CONTENT00084 = "Mật khẩu mới"
    public static let CONTENT00085 = "Xác nhận mật khẩu mới"
    public static let CONTENT00086 = "Lưu"
    public static let CONTENT00087 = "Họ tên"
    public static let CONTENT00088 = "Địa chỉ"
    public static let CONTENT00089 = "Đổi mật khẩu"
    public static let CONTENT00090 = "Thoát"
    public static let CONTENT00091 = "Mã"
    public static let CONTENT00092 = "Trạng thái"
    public static let CONTENT00093 = "Nguyên nhân"
    public static let CONTENT00094 = "Nhân viên sale"
    public static let CONTENT00095 = "Người tạo"
    public static let CONTENT00096 = "Ngày tạo"
    public static let CONTENT00097 = "Mở lại"
    public static let CONTENT00098 = "Đánh giá dịch vụ"
    public static let CONTENT00099 = "Danh sách bảo trì"
    public static let CONTENT00100 = "Tài khoản"
    public static let CONTENT00101 = "Chưa chọn hình ảnh"
    public static let CONTENT00102 = "Hiện mật khẩu"
    public static let CONTENT00103 = "Nội dung đánh giá &amp; góp ý"
    public static let CONTENT00104 = "Khách hàng: %1$s"
    public static let CONTENT00105 = "Ngày tạo: $1%s"
    public static let CONTENT00106 = "%1$sID: %2$s"
    public static let CONTENT00107 = "%1$s - %2$s"
    public static let CONTENT00108 = "Gas Service"
    public static let CONTENT00109 = "Số serial bình"
    public static let CONTENT00110 = "Loại định kỳ:"
    public static let CONTENT00111 = "Loại khách hàng:"
    public static let CONTENT00112 = "Vị trí"
    public static let CONTENT00113 = "Số serial bình:"
    public static let CONTENT00114 = "Chưa cập nhật được vị trí hiện tại!"
    public static let CONTENT00115 = "Thương hiệu khách hàng đã dùng"
    public static let CONTENT00116 = "Tên dịch vụ đối thủ"
    public static let CONTENT00117 = "Thông tin thêm: "
    public static let CONTENT00118 = "Loại điểm: "
    public static let CONTENT00119 = "Thời gian dự kiến hết gas: "
    public static let CONTENT00120 = "Thương hiệu đối thủ:"
    public static let CONTENT00121 = "Tên đối thủ:"
    public static let CONTENT00122 = "Tạo Khách Hàng"
    public static let CONTENT00123 = "Điện thoại liên hệ"
    public static let CONTENT00124 = "Version code hiện tại:"
    public static let CONTENT00125 = "Xem thêm"
    public static let CONTENT00126 = "Cập nhật thông tin thành công"
    public static let CONTENT00127 = "Home"
    public static let CONTENT00128 = "Cài đặt"
    public static let CONTENT00129 = "Bảo trì"
    public static let CONTENT00130 = "Đặt gas"
    public static let CONTENT00131 = "Quản lý sự việc"
    public static let CONTENT00132	= "Đăng xuất"
    public static let CONTENT00133	= "Nhập mã xác thực"
    public static let CONTENT00134	= "Một mã xác thực đã được gửi đến số điện thoại của bạn dưới dạng tin nhắn, hãy nhập nó vào ô bên dưới"
    public static let CONTENT00135 = "Mã xác thực"
    public static let CONTENT00136 = "Để sau"
    public static let CONTENT00137 = "Thông tin đăng ký còn thiếu"
    public static let CONTENT00138 = "Chế độ training"
    public static let CONTENT00139 = "Thông tin"
    public static let CONTENT00140	= "vd: 0123456789-0908070605"
    public static let CONTENT00141	= "Cập nhật"
    public static let CONTENT00142	= "Đã có phiên bản mới, vui lòng cập nhật!"
    public static let CONTENT00143 = "Chi tiết bảo trì"
    public static let CONTENT00144 = "NVKD"
    public static let CONTENT00145 = "NV Bảo trì"
    public static let CONTENT00146 = "Liên hệ"
    public static let CONTENT00147 = "Sự cố"
    public static let CONTENT00148 = "Mã số"
    public static let CONTENT00149 = "Tạo trả lời"
    public static let CONTENT00150 = "Ngày xử lý"
    public static let CONTENT00151 = "Nội bộ"
    public static let CONTENT00152 = "Điện thoại"
    public static let CONTENT00153 = "Đánh giá nhân viên bảo trì"
    public static let CONTENT00154 = "Cập nhật khách hàng"
    public static let CONTENT00155 = "Góp ý"
    public static let CONTENT00156 = "Nhân viên bảo trì"
    public static let CONTENT00157 = "Tgian xử lý"
    public static let CONTENT00158 = "Kết quả"
    public static let CONTENT00159 = "Báo cáo"
    public static let CONTENT00160 = "Ngày bảo trì"
    public static let CONTENT00161 = "Lịch bảo trì"
    public static let CONTENT00162 = "Thông báo"
    public static let CONTENT00177 = "Loại định kỳ"
    public static let CONTENT00178 = "Tạo mới bảo trì"
    public static let CONTENT00180 = "Gửi"
    public static let CONTENT00181 = "Xin vui lòng chọn Trạng thái sự cố"
    public static let CONTENT00182 = "Xin vui lòng chọn Thời lượng xử lý"
    public static let CONTENT00183 = "Xin vui lòng đánh giá thông tin KH"
    public static let CONTENT00184 = "Khách hàng báo ĐÚNG sự cố"
    public static let CONTENT00185 = "Khách hàng báo SAI sự cố"
    public static let CONTENT00186 = "Trả lời bảo trì"
    public static let CONTENT00187 = "Xin nhập thông tin Người nghiệm thu"
    public static let CONTENT00188 = "Xin nhập thông tin Ghi chú nội bộ"
    public static let CONTENT00189 = "Xin bổ sung Hình ảnh liên quan"
    public static let CONTENT00190 = "Bạn đang gửi thông tin trả lời như bên dưới cho chúng tôi. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00191 = "Khách hàng báo sai sự cố"
    public static let CONTENT00194 = "Thời gian"
    public static let CONTENT00195 = "Nghiệm thu"
    public static let CONTENT00196 = "Lỗi kết nối đến máy chủ"
    public static let CONTENT00197 = "Chức năng đã bị khoá, vui lòng thử lại sau!"
    public static let CONTENT00198 = "Thông tin phiên bản"
    public static let CONTENT00199 = "Email góp ý"
    public static let CONTENT00200 = "Trang chủ"
    public static let CONTENT00201 = "Xin vui lòng chọn Loại sự cố"
    public static let CONTENT00202 = "Huỷ"
    public static let CONTENT00203 = "Sự cố khác"
    public static let CONTENT00204 = "Xin vui lòng chọn Người liên hệ"
    public static let CONTENT00205 = "Bạn đang gửi thông tin sự cố như bên dưới cho chúng tôi. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00206 = "Xin vui lòng đánh giá Mức độ hài lòng"
    public static let CONTENT00207 = "Xin vui lòng đánh giá Nhân viên bảo trì"
    public static let CONTENT00208 = "Nội dung cần đánh giá và góp ý"
    public static let CONTENT00209 = "Xin cảm ơn quý khách hàng đã đánh giá dịch vụ của chúng tôi. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu quý khách hàng đồng ý."
    public static let CONTENT00210 = "Mức hài lòng"
    public static let CONTENT00212 = "Xem ảnh"
    public static let CONTENT00223 = "Xem"
    public static let CONTENT00224 = "Để sau"
    public static let CONTENT00225 = "Bảo trì miễn phí"
    public static let CONTENT00226 = "Gas 24h"
    public static let CONTENT00227 = "Quên mật khẩu?"
    public static let CONTENT00228 = "Tạo tài khoản mới"
    public static let CONTENT00229 = "Lưu thông tin"
    public static let CONTENT00230 = "Xác thực"
    public static let CONTENT00231 = "Đơn hàng"
    public static let CONTENT00232 = "Chi tiết đơn hàng"
    public static let CONTENT00233 = "Nhân viên giao hàng"
}
