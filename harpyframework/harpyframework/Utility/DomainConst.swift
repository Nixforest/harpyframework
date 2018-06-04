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
    public static let PATH_SITE_AUTOCOMPLETE_USER       = "site/autocompleteUser"
    /** Confirm notify */
    public static let PATH_SITE_CONFIRM_NOTIFY          = "site/confirmNotify"
    /** Issue close */
    public static let PATH_SITE_ISSUE_CLOSE             = "site/issueClose"
    /** Issue create */
    public static let PATH_SITE_ISSUE_CREATE            = "site/issueCreate"
    /** Issue list */
    public static let PATH_SITE_ISSUE_LIST              = "site/issueList"
    /** Issue Reopen */
    public static let PATH_SITE_ISSUE_REOPEN            = "site/issueReopen"
    /** Issue Reply */
    public static let PATH_SITE_ISSUE_REPLY             = "site/issueReply"
    /** Issue View */
    public static let PATH_SITE_ISSUE_VIEW              = "site/issueView"
    /** Login page */
    public static let PATH_SITE_LOGIN                   = "site/login"
    /** Logout page */
    public static let PATH_SITE_LOGOUT                  = "site/logout"
    /** News list */
    public static let PATH_SITE_NEWS_LIST               = "site/newsList"
    /** News view */
    public static let PATH_SITE_NEWS_VIEW               = "site/newsView"
    /** Notify count */
    public static let PATH_SITE_NOTIFY_COUNT            = "site/notifyCount"
    /** Notify view */
    public static let PATH_SITE_NOTIFY_VIEW             = "site/notifyView"
    /** Order create */
    public static let PATH_SITE_ORDER_CREATE            = "site/orderCreate"
    /** Order create data label */
    public static let PATH_SITE_ORDER_CREATE_DATA_LABEL = "site/orderCreateDataLabel"
    /** Order list */
    public static let PATH_SITE_ORDER_LIST              = "site/orderList"
    /** Sign up */
    public static let PATH_SITE_SIGN_UP                 = "site/signup"
    /** Sign up data label */
    public static let PATH_SITE_SIGN_UP_DATA_LABEL      = "site/signupDataLabel"
    /** Sign up get District */
    public static let PATH_SITE_SIGN_UP_GET_DISTRICT    = "site/signupGetDistrict"
    /** Sign up get Ward */
    public static let PATH_SITE_SIGN_UP_GET_WARD        = "site/signupGetWard"
    /** Update config */
    public static let PATH_SITE_UPDATE_CONFIG           = "site/updateConfig"
    /** Uphold create */
    public static let PATH_SITE_UPHOLD_CREATE           = "site/upholdCreate"
    /** Uphold list */
    public static let PATH_SITE_UPHOLD_LIST             = "site/upholdList"
    /** Uphold reply */
    public static let PATH_SITE_UPHOLD_REPLY            = "site/upholdReply"
    /** Uphold view */
    public static let PATH_SITE_UPHOLD_VIEW             = "site/upholdView"
    /** Uphold Customer rating */
    public static let PATH_SITE_UPHOLD_CUSTOMER_RATING  = "site/upholdCustomerRating"
    /** Change password */
    public static let PATH_USER_CHANGE_PASS             = "user/changePass"
    /** User profile */
    public static let PATH_USER_PROFILE                 = "user/profile"
    /** Customer register */
    public static let PATH_CUSTOMER_REGISTER            = "customer/register"
    /** Customer register confirm */
    public static let PATH_CUSTOMER_REGISTER_CONFIRM    = "customer/registerConfirm"
    /** Get provinces list */
    public static let PATH_SITE_PROVINCES_LIST          = "site/signupDataLabel"
    /** Get districts list */
    public static let PATH_SITE_DISRICTS_LIST           = "site/signupGetDistrict"
    /** Get wards list */
    public static let PATH_SITE_WARDS_LIST              = "site/signupGetWard"
    /** Get order family list */
    public static let PATH_ORDER_TRANSACTION_LIST       = "order/transactionList"
    /** Get order family view */
    public static let PATH_ORDER_TRANSACTION_VIEW       = "order/transactionView"
    /** Get order family set event */
    public static let PATH_ORDER_TRANSACTION_SET_EVENT  = "order/transactionSetEvent"
    /** Get order VIP set event */
    public static let PATH_ORDER_VIP_SET_EVENT          = "boMoi/boMoiSetEvent"
    /** Get order VIP update */
    public static let PATH_ORDER_VIP_UPDATE             = "boMoi/boMoiDriverUpdate"
    /** Get order VIP update */
    public static let PATH_SITE_CACHE_DATA              = "site/getDataCache"
    /** Request create support app log */
    public static let PATH_SUPPORT_APPLOG               = "support/appLog"
    /** Request news content */
    public static let PATH_SUPPORT_NEWS                 = "support/viewPage"
    /** Request news list */
    public static let PATH_LIST_NEWS                    = "gas24h/newsList"
    /** Request news list */
    public static let PATH_NEWS_POPUP                   = "gas24h/newsPopup"
    /** Request news view */
    public static let PATH_NEWS_VIEW                    = "gas24h/newsView"
    /** Request news view */
    public static let PATH_MAP_AGENT                    = "support/mapAgent"
    
    // MARK: -----List of keys-----
    /** Token */
    public static let KEY_TOKEN                         = "token"
    /** Keyword */
    public static let KEY_KEYWORD                       = "keyword"
    /** Q */
    public static let KEY_Q                             = "q"
    /** Notify Id */
    public static let KEY_NOTIFY_ID                     = "notify_id"
    /** Type */
    public static let KEY_TYPE                          = "type"
    /** Object Id */
    public static let KEY_OBJECT_ID                     = "obj_id"
    /** Issue Id */
    public static let KEY_ISSUE_ID                      = "issue_id"
    /** Customer Id */
    public static let KEY_CUSTOMER_ID                   = "customer_id"
    /** Customer Name */
    public static let KEY_CUSTOMER_NAME                 = "customer_name"
    /** Customer Address */
    public static let KEY_CUSTOMER_ADDRESS              = "customer_address"
    /** Customer Agent */
    public static let KEY_CUSTOMER_AGENT                = "customer_agent"
    /** Customer Agent */
    public static let KEY_CUSTOMER_AGENT_DELIVERY       = "customer_delivery_agent"
    /** Customer Agent */
    public static let KEY_CUSTOMER_AGENT_DELIVERY_ID    = "customer_delivery_agent_id"
    /** Customer Phone */
    public static let KEY_CUSTOMER_PHONE                = "customer_phone"
    /** Customer contact */
    public static let KEY_CUSTOMER_CONTACT              = "customer_contact"
    /** Title */
    public static let KEY_TITLE                         = "title"
    /** Title */
    public static let KEY_URL_WEB                       = "link_web"
    /** Title */
    public static let KEY_URL_TEXT                      = "link_web_text"
    /** Title */
    public static let KEY_URL_BANNER_POPUP              = "url_banner_popup"
    /** Title */
    public static let KEY_URL_BANNER                    = "url_banner"
    /** list_title */
    public static let KEY_LIST_TITLE                    = "list_title"
    /** Message */
    public static let KEY_MESSAGE                       = "message"
    /** Message */
    public static let KEY_MSG                           = "msg"
    /** Problem */
    public static let KEY_PROBLEM                       = "problem"
    /** Page */
    public static let KEY_PAGE                          = "page"
    /** Chief monitor id */
    public static let KEY_CHIEF_MONITOR_ID              = "chief_monitor_id"
    /** Monitor agent id */
    public static let KEY_MONITOR_AGENT_ID              = "monitor_agent_id"
    /** Accounting id */
    public static let KEY_ACCOUNTING_ID                 = "accounting_id"
    /** Username */
    public static let KEY_USERNAME                      = "username"
    /** Password */
    public static let KEY_PASSWORD                      = "password"
    /** GCM device token */
    public static let KEY_GCM_DEVICE_TOKEN              = "gcm_device_token"
    /** APNS device token */
    public static let KEY_APNS_DEVICE_TOKEN             = "apns_device_token"
    /** News Id */
    public static let KEY_NEWS_ID                       = "news_id"
    /** Device phone */
    public static let KEY_DEVICE_PHONE                  = "device_phone"
    /** Id */
    public static let KEY_ID                            = "id"
    /** Note Customer */
    public static let KEY_NOTE_CUSTOMER                 = "note_customer"
    /** qty_12 */
    public static let KEY_QTY_12                        = "qty_12"
    /** qty_50 */
    public static let KEY_QTY_50                        = "qty_50"
    /** qty_12_list */
    public static let KEY_QTY_12_LIST                   = "qty_12_list"
    /** qty_50_list */
    public static let KEY_QTY_50_LIST                   = "qty_50_list"
    /** Phone */
    public static let KEY_PHONE                         = "phone"
    /** Password */
    public static let KEY_PASSWORD_CONFIRM              = "password_confirm"
    /** First name */
    public static let KEY_FIRST_NAME                    = "first_name"
    /** Province Id */
    public static let KEY_PROVINCE_ID                   = "province_id"
    /** District Id */
    public static let KEY_DISTRICT_ID                   = "district_id"
    /** Ward Id */
    public static let KEY_WARD_ID                       = "ward_id"
    /** Street id */
    public static let KEY_STREET_ID                     = "street_id"
    /** Street */
    public static let KEY_STREET                        = "street"
    /** House Number */
    public static let KEY_HOUSE_NUMBER                  = "house_numbers"
    /** Sign up code */
    public static let KEY_SIGN_UP_CODE                  = "signup_code"
    /** Employee Id */
    public static let KEY_EMPLOYEE_ID                   = "employee_id"
    /** Employee Name */
    public static let KEY_EMPLOYEE_NAME                 = "employee_name"
    /** Employee phone */
    public static let KEY_EMPLOYEE_PHONE                = "employee_phone"
    /** Employee code */
    public static let KEY_EMPLOYEE_CODE                 = "employee_code"
    /** Employee image */
    public static let KEY_EMPLOYEE_IMG                  = "employee_image"
    /** Employee latitude */
    public static let KEY_EMPLOYEE_LAT                  = "employee_latitude"
    /** Employee longitude */
    public static let KEY_EMPLOYEE_LONG                 = "employee_longitude"
    /** Uphold type */
    public static let KEY_UPHOLD_TYPE                   = "type_uphold"
    /** Uphold type */
    public static let KEY_UPHOLD_TYPE_IDX               = "uphold_type"
    /** Content */
    public static let KEY_CONTENT                       = "content"
    /** Content */
    public static let KEY_NEWS_CONTENT                  = "news_content"
    /** Content */
    public static let KEY_NEWS_TYPE                     = "news_type"
    /** Contact person */
    public static let KEY_CONTACT_PERSON                = "contact_person"
    /** Contact telephone number */
    public static let KEY_CONTACT_TEL                   = "contact_tel"
    /** Status */
    public static let KEY_STATUS                        = "status"
    /** Status number */
    public static let KEY_STATUS_NUMBER                 = "status_number"
    /** Uphold Id */
    public static let KEY_UPHOLD_ID                     = "uphold_id"
    /** Hours handle */
    public static let KEY_HOURS_HANDLE                  = "hours_handle"
    /** Contact phone */
    public static let KEY_CONTACT_PHONE                 = "contact_phone"
    /** Contact */
    public static let KEY_CONTACT                       = "contact"
    /** Contact note */
    public static let KEY_CONTACT_NOTE                  = "contact_note"
    /** Note */
    public static let KEY_NOTE                          = "note"
    /** Report wrong */
    public static let KEY_REPORT_WRONG                  = "report_wrong"
    /** Note internal */
    public static let KEY_NOTE_INTERNAL                 = "note_internal"
    /** Reply Id */
    public static let KEY_REPLY_ID                      = "reply_id"
    /** Old password */
    public static let KEY_OLD_PASSWORD                  = "old_password"
    /** New password */
    public static let KEY_NEW_PASSWORD                  = "new_password"
    /** New password confirm */
    public static let KEY_NEW_PASSWORD_CONFIRM          = "new_password_confirm"
    /** Code */
    public static let KEY_CODE                          = "code"
    /** Record */
    public static let KEY_RECORD                        = "record"
    /** Notify count text */
    public static let KEY_NOTIFY_COUNT_TEXT             = "NotifyCountText"
    /** Issue create */
    public static let KEY_ISSUE_CREATE                  = "issue_create"
    /** Total page */
    public static let KEY_TOTAL_PAGE                    = "total_page"
    /** Total quantity */
    public static let KEY_TOTAL_QTY                     = "total_qty"
    /** Promotion amount */
    public static let KEY_PROMOTION_AMOUNT              = "promotion_amount"
    /** Discount amount */
    public static let KEY_DISCOUNT_AMOUNT               = "discount_amount"
    /** Total */
    public static let KEY_TOTAL                         = "total"
    /** LIST_CHIEF_MONITOR */
    public static let KEY_LIST_CHIEF_MONITOR            = "LIST_CHIEF_MONITOR"
    /** LIST_MONITOR_AGENT */
    public static let KEY_LIST_MONITOR_AGENT            = "LIST_MONITOR_AGENT"
    /** LIST_ACCOUNTING */
    public static let KEY_LIST_ACCOUNTING               = "LIST_ACCOUNTING"
    /** Model issue */
    public static let KEY_MODEL_ISSUE                   = "model_issue"
    /** Menu */
    public static let KEY_MENU                          = "menu"
    /** Data uphold */
    public static let KEY_DATA_UPHOLD                   = "data_uphold"
    /** Maximum upload size */
    public static let KEY_MAX_UPLOAD                    = "max_upload"
    /** Data issue */
    public static let KEY_DATA_ISSUE                    = "data_issue"
    /** Role id */
    public static let KEY_ROLE_ID                       = "role_id"
    /** User id */
    public static let KEY_USER_ID                       = "user_id"
    /** User information */
    public static let KEY_USER_INFO                     = "user_info"
    /** Check menu */
    public static let KEY_CHECK_MENU                    = "check_menu"
    /** Province list */
    public static let KEY_PROVINCE_LIST                 = "province_list"
    /** District list */
    public static let KEY_DISTRICT_LIST                 = "district_list"
    /** Ward list */
    public static let KEY_WARD_LIST                     = "ward_list"
    /** Detail id */
    public static let KEY_DETAIL_ID                     = "detail_id"
    /** Model uphold */
    public static let KEY_MODEL_UPHOLD                  = "model_uphold"
    /** Address */
    public static let KEY_ADDRESS                       = "address"
    /** Address */
    public static let KEY_GOOGLE_ADDRESS                = "google_address"
    /** Image avatar */
    public static let KEY_IMG_AVATAR                    = "image_avatar"
    /** Notify type */
    public static let KEY_NOTIFY_TYPE                   = "notify_type"
    /** Request type */
    public static let KEY_REQUEST_TYPE                  = "request_by"
    /** Request type */
    public static let KEY_RATING_STATUS                 = "rating_status"
    /** Request type */
    public static let KEY_RATING_TYPE                   = "rating_type"
    /** Request type */
    public static let KEY_RATING_NOTE                   = "rating_note"
    /** Key rating value */
    public static let KEY_RATING                        = "rating"
    /** Key rating comment */
    public static let KEY_RATING_COMMENT                = "rating_comment"
    /** Other information */
    public static let KEY_OTHER_INFO                    = "OtherInfo"
    /** Uphold last id */
    public static let KEY_UPHOLD_ID_LASTEST             = "uphold_id_lastest"
    /** Need change pass */
    public static let KEY_NEED_CHANGE_PASS              = "need_change_pass"
    /** Need update app */
    public static let KEY_NEED_UPDATE_APP               = "need_update_app"
    /** Detail reply id */
    public static let KEY_DETAIL_REPLY_ID               = "detail_reply_id"
    /** Uphold create */
    public static let KEY_UPHOLD_CREATE                 = "uphold_create"
    /** Role name */
    public static let KEY_ROLE_NAME                     = "role_name"
    /** List streets */
    public static let KEY_LIST_STREET                   = "list_street"
    /** List agents */
    public static let KEY_LIST_AGENT                    = "list_agent"
    /** List hgd type */
    public static let KEY_LIST_HGD_TYPE                 = "list_hgd_type"
    /** List hgd_invest */
    public static let KEY_LIST_HGD_INVEST               = "list_hgd_invest"
    /** Name */
    public static let KEY_NAME                          = "name"
    /** Data */
    public static let KEY_DATA                          = "data"
    /** Key transaction id */
    public static let KEY_TRANSACTION_ID                = "transaction_id"
    /** Key transaction key */
    public static let KEY_TRANSACTION_KEY               = "transaction_key"
    /** Key transaction type */
    public static let KEY_TRANSACTION_TYPE              = "transaction_type"
    /** Grand total */
    public static let KEY_GRAND_TOTAL                   = "grand_total"
    /** Setting key: is login */
    public static let KEY_SETTING_IS_LOGGING            = "gasservice.isLogin"
    /** Setting key: user token */
    public static let KEY_SETTING_USER_TOKEN            = "gasservice.user.token"
    /** Setting key: orderVipDescription */
    public static let KEY_SETTING_ORDER_VIP_DESCRIPTION = "gasservice.order.orderVipDescription"
    /** Setting key: training mode */
    public static let KEY_SETTING_TRAINING_MODE         = "gasservice.trainningMode"
    /** Setting key: Transaction id */
    public static let KEY_SETTING_TRANSACTION_ID        = "gasservice.transaction.id"
    /** Setting key: Transaction key */
    public static let KEY_SETTING_TRANSACTION_KEY       = "gasservice.transaction.key"
    /** Setting key: Temp token */
    public static let KEY_SETTING_TEMP_TOKEN            = "gasservice.temp.token"
    /** Setting key: Debug color */
    public static let KEY_SETTING_DEBUG_COLOR           = "gasservice.debug.color"
    /** Setting key: Debug toast */
    public static let KEY_SETTING_DEBUG_TOAST           = "gasservice.debug.toast"
    /** Setting key: Debug zoom */
    public static let KEY_SETTING_DEBUG_ZOOM            = "gasservice.debug.zoom"
    /** Setting key: Debug Is Gas service */
    public static let KEY_SETTING_DEBUG_IS_GAS_SERVICE  = "gasservice.debug.isGasService"
    /** Setting key: Debug Is Show number picker */
    public static let KEY_SETTING_DEBUG_IS_SHOW_NUM_PICKER  = "gasservice.debug.isShowNumPicker"
    /** Setting key: Debug Is Show number picker */
    public static let KEY_SETTING_DEBUG_IS_SHOW_TOP_ICON    = "gasservice.debug.isShowTopIcon"
    /** Setting key: Debug Flag use material_name or material_name_short */
    public static let KEY_SETTING_DEBUG_IS_USE_MATERIAL_NAME_SHORT    = "gasservice.debug.isUseMaterialNameShort"
    /** Setting key: is first order */
    public static let KEY_SETTING_IS_FIRST_ORDER            = "gasservice.isFirstOrder"
    //++ BUG0060-SPJ (NguyenPT 20170426) Save list of gas to local
    /** Setting key: List gas information */
    public static let KEY_LIST_GAS_INFORMATION          = "gasservice.listGasInfo"
    //++ BUG0060-SPJ (NguyenPT 20170426) Save list of gas to local
    
    //++ BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
    /** Setting key: Role id */
    public static let KEY_SETTING_ROLE_ID               = "gasservice.roleId"
    //-- BUG0049-SPJ (NguyenPT 20170622) Handle save user info in setting
    //++ BUG0132-SPJ (NguyenPT 20170724) Remember username after login
    /** Setting key: Username */
    public static let KEY_SETTING_USERNAME              = "gasservice.username"
    //-- BUG0132-SPJ (NguyenPT 20170724) Remember username after login
    /** Setting key: Agent id */
    public static let KEY_SETTING_AGENT_ID              = "gasservice.agentId"
    /** Setting key: List favourite gas information */
    public static let KEY_SETTING_FAVOURITE_GAS         = "gasservice.listFavouriteGas"
    /** Setting key: List favourite gas information */
    public static let KEY_SETTING_FAVOURITE_GAS_LOGIN   = "gasservice.listFavouriteGasLogin"
    /** Setting key: List favourite gas information */
    public static let KEY_SETTING_POPUP_ID              = "gasservice.popupId"
    
    /** Setting key: Material type id */
    public static let KEY_MATERIALS_TYPE_ID             = "materials_type_id"
    /** Setting key: Material id */
    public static let KEY_MATERIALS_ID                  = "materials_id"
    /** Setting key: Material name */
    public static let KEY_MATERIALS_NAME                = "materials_name"
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    /** Setting key: Material no */
    public static let KEY_MATERIALS_NO                  = "materials_no"
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    /** Setting key: Material short name */
    public static let KEY_MATERIALS_NAME_SHORT          = "materials_name_short"
    /** Setting key: Material price */
    public static let KEY_MATERIALS_PRICE               = "material_price"
    /** Setting key: Price */
    public static let KEY_PRICE                         = "price"
    /** Setting key: Price original */
    public static let KEY_PRICE_ORIGINAL                = "price_root"
    /** Setting key: Quantity */
    public static let KEY_QUANTITY                      = "qty"
    /** Setting key: Real quantity */
    public static let KEY_QUANTITY_REAL                 = "qty_real"
    /** Setting key: Serial */
    public static let KEY_SERI                          = "seri"
    /** Setting key: Serial */
    public static let KEY_SERIAL                        = "serial"
    /** Setting key: KEY_KG_EMPTY */
    public static let KEY_KG_EMPTY                      = "kg_empty"
    /** Setting key: KEY_KG_HAS_GAS */
    public static let KEY_KG_HAS_GAS                    = "kg_has_gas"
    /** Setting key: Amount */
    public static let KEY_AMOUNT                        = "amount"
    /** Setting key: Material image */
    public static let KEY_MATERIAL_IMAGE                = "material_image"
    /** Setting key: Email */
    public static let KEY_EMAIL                         = "email"
    /** Setting key: Agent */
    public static let KEY_AGENT                         = "agent"
    /** Setting key: Agent id */
    public static let KEY_AGENT_ID                      = "agent_id"
    /** Setting key: Agent name */
    public static let KEY_AGENT_NAME                    = "agent_name"
    /** Setting key: Agent phone */
    public static let KEY_AGENT_PHONE                   = "agent_phone"
    /** Setting key: Agent cell phone */
    public static let KEY_AGENT_CELL_PHONE              = "agent_cell_phone"
    /** Setting key: Agent phone support */
    public static let KEY_AGENT_PHONE_SUPPORT           = "agent_phone_support"
    /** Setting key: Agent address */
    public static let KEY_AGENT_ADDRESS                 = "agent_address"
    /** Setting key: Agent latitude */
    public static let KEY_AGENT_LAT                     = "agent_latitude"
    /** Setting key: Agent longitude */
    public static let KEY_AGENT_LONG                    = "agent_longitude"
    /** Setting key: Agent list */
    public static let KEY_AGENT_LIST                    = "agent_list"
    /** Setting key: Information of agent */
    public static let KEY_INFO_AGENT                    = "info_agent"
    /** Setting key: Information of gas */
    public static let KEY_INFO_GAS                      = "info_gas"
    /** Setting key: Information of price */
    public static let KEY_INFO_PRICE                    = "info_price"
    /** Setting key: Information of promotion */
    public static let KEY_INFO_PROMOTION                = "info_promotion"
    /** Setting key: Distance 1 */
    public static let KEY_DISTANCE_1                    = "distance_1"
    /** Setting key: Distance 2 */
    public static let KEY_DISTANCE_2                    = "distance_2"
    /** Setting key: Allow update */
    public static let KEY_ALLOW_UPDATE                  = "allow_update"
    /** Setting key: Allow update */
    public static let KEY_ALLOW_SEARCH                  = "allow_search"
    /** Setting key: Order type */
    public static let KEY_ORDER_TYPE                    = "order_type"
    /** Setting key: Type amount */
    public static let KEY_TYPE_AMOUNT                   = "type_amount"
    /** Setting key: Amount discount */
    public static let KEY_AMOUNT_DISCOUNT               = "amount_discount"
    /** Setting key: Discount type */
    public static let KEY_DISCOUNT_TYPE                 = "discount_type"
    /** Setting key: Status cancel */
    public static let KEY_STATUS_CANCEL                 = "status_cancel"
    /** Setting key: Order detail */
    public static let KEY_ORDER_DETAIL                  = "order_detail"
    /** Setting key: Customer info */
    public static let KEY_CUSTOMER_INFO                 = "customer_info"
    /** Setting key: Boss name */
    public static let KEY_BOSS_NAME                     = "boss_name"
    /** Setting key: Boss phone */
    public static let KEY_BOSS_PHONE                    = "boss_phone"
    /** Setting key: Manager name */
    public static let KEY_MANAGER_NAME                  = "manage_name"
    /** Setting key: Manager phone */
    public static let KEY_MANAGER_PHONE                 = "manage_phone"
    /** Setting key: Technical name */
    public static let KEY_TECHNICAL_NAME                = "technical_name"
    /** Setting key: Technical phone */
    public static let KEY_TECHNICAL_PHONE               = "technical_phone"
    
    /** Key total record */
    public static let KEY_TOTAL_RECORD                  = "total_record"
    /** Code no */
    public static let KEY_CODE_NO                       = "code_no"
    /** Code no */
    public static let KEY_CODE_NO_TEXT                  = "code_no_text"
    /** Level type */
    public static let KEY_LEVEL_TYPE                    = "level_type"
    /** Created date */
    public static let KEY_CREATED_DATE                  = "created_date"
    /** Created byte */
    public static let KEY_CREATED_BY                    = "created_by"
    /** Sale name */
    public static let KEY_SALE_NAME                     = "sale_name"
    /** Sale phone */
    public static let KEY_SALE_PHONE                    = "sale_phone"
    /** Sale type */
    public static let KEY_SALE_TYPE                     = "sale_type"
    /** Schedule month */
    public static let KEY_SCHEDULE_MONTH                = "schedule_month"
    /** Last reply message */
    public static let KEY_LAST_REPLY_MESSAGE            = "last_reply_message"
    /** Schedule Type */
    public static let KEY_SCHEDULE_TYPE                 = "schedule_type"
    /** Uid login */
    public static let KEY_UID_LOGIN                     = "uid_login"
    /** Date time handle */
    public static let KEY_DATE_TIME_HANDLE              = "date_time_handle"
    /** Reply item */
    public static let KEY_REPLY_ITEM                    = "reply_item"
    /** Image thumb */
    public static let KEY_IMG_THUMB                     = "thumb"
    /** Image large */
    public static let KEY_IMG_LARGE                     = "large"
    /** Image list */
    public static let KEY_IMAGES                        = "images"
    /** Latitude */
    public static let KEY_LATITUDE                      = "latitude"
    /** Version code */
    public static let KEY_VERSION_CODE                  = "version_code"
    /** Longitude */
    public static let KEY_LONGITUDE                     = "longitude"
    /** Uphold list */
    public static let KEY_UPHOLD_LIST                   = "uphold_list"
    /** Uphold rating */
    public static let KEY_UPHOLD_RATING                 = "uphold_rating"
    /** Version code */
    public static let KEY_APP_VERSION_CODE              = "app_version_code"
    /** Confirm code */
    public static let KEY_CONFIRM_CODE                  = "confirm_code"
    /** show_nhan_giao_hang */
    public static let KEY_SHOW_NHAN_GH                  = "show_nhan_giao_hang"
    /** show_huy_giao_hang */
    public static let KEY_SHOW_HUY_GH                   = "show_huy_giao_hang"
    /** Transaction History Id */
    public static let KEY_TRANSACTION_HISTORY_ID        = "transaction_history_id"
    /** Call center uphold */
    public static let KEY_CALL_CENTER_UPHOLD            = "call_center_uphold"
    /** Hotline */
    public static let KEY_HOTLINE                       = "hotline"
    /** Flag gas 24h */
    public static let KEY_FLAG_GAS_24H                  = "app_type"
    /** Key text of order type */
    public static let KEY_ORDER_TYPE_TEXT               = "order_type_text"
    /** Key amount of order type */
    public static let KEY_ORDER_TYPE_AMOUNT             = "order_type_amount"
    /** Key amount of bu vo */
    public static let KEY_AMOUNT_BU_VO                  = "amount_bu_vo"
    /** Key expiration date */
    public static let KEY_EXPIRY_DATE                   = "expiry_date"
    /** Key b50 kg */
    public static let KEY_B50                           = "b50"
    /** Key b45 kg */
    public static let KEY_B45                           = "b45"
    /** Key b12 kg */
    public static let KEY_B12                           = "b12"
    /** Key b6 kg */
    public static let KEY_B6                            = "b6"
    /** Key Unit */
    public static let KEY_UNIT                          = "unit"
    /** Key Delivery date */
    public static let KEY_DATE_DELIVERY                 = "date_delivery"
    /** Key Total gas */
    public static let KEY_TOTAL_GAS                     = "total_gas"
    /** Key Total gas du */
    public static let KEY_TOTAL_GAS_DU                  = "total_gas_du"
    /** Key note of employee */
    public static let KEY_NOTE_EMPLOYEE                 = "note_employee"
    /** Key Name of gas */
    public static let KEY_NAME_GAS                      = "name_gas"
    /** Key name of driver */
    public static let KEY_NAME_DRIVER                   = "name_driver"
    /** Key name of car */
    public static let KEY_NAME_CAR                      = "name_car"
    /** Key name of maintain employee */
    public static let KEY_NAME_EMPLOYEE_MAINTAIN        = "name_employee_maintain"
    /** Key Cylinder information */
    public static let KEY_INFO_CYLINDER                 = "info_vo"
    /** Key Order id */
    public static let KEY_ORDER_ID                      = "order_id"
    //++ BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    /** Key Buying */
    public static let KEY_BUYING                        = "buying"
    /** Key Platform */
    public static let KEY_PLATFORM                      = "platform"
    /** Key Date from */
    public static let KEY_DATE_FROM                     = "date_from"
    /** Key Date to */
    public static let KEY_DATE_TO                       = "date_to"
    /** Key Customer Family Brand*/
    public static let KEY_CUSTOMER_FAMILY_BRAND         = "hgd_thuong_hieu"
    /** List Customer family type */
    public static let KEY_HGD_TYPE                      = "hgd_type"
    /** List Customer family type */
    public static let KEY_HGD_TYPE_ID                   = "hgd_type_id"
    /** List Customer family type */
    public static let KEY_HGD_TIME_USE                  = "hgd_time_use"
    /** List Customer family type */
    public static let KEY_HGD_DOI_THU                   = "hgd_doi_thu"
    /** Key customer type */
    public static let KEY_CUSTOMER_TYPE                 = "customer_type"
    /** Key latitude longitude */
    public static let KEY_LONG_LAT                      = "latitude_longitude"
    /** Key list_hgd_invest_text */
    public static let KEY_HGD_INVEST_TEXT               = "list_hgd_invest_text"
    /** Key Can update flag */
    public static let KEY_CAN_UPDATE_FLAG               = "can_update"
    /** Key full name */
    public static let KEY_FULL_NAME                     = "full_name"
    /** Key Model record */
    public static let KEY_MODEL_RECORD                  = "model_record"
    /** Key Report */
    public static let KEY_HGD_REPORT                    = "hgd_short_report"
    //-- BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    /** Key Material cylinder */
    public static let KEY_MATERIAL_VO                   = "material_vo"
    /** Key Material gas */
    public static let KEY_MATERIAL_GAS                  = "material_gas"
    /** Key the other material */
    public static let KEY_MATERIAL_HGD                  = "material_hgd"
    /** Key Cancel order reasons */
    public static let KEY_ORDER_STATUS_CANCEL           = "order_status_cancel"
    /** Key List order type */
    public static let KEY_ORDER_LIST_TYPE               = "order_list_type"
    /** Key List order discount type */
    public static let KEY_ORDER_LIST_DISCOUNT_TYPE      = "order_list_discount_type"
    /** Key List order discount type */
    public static let KEY_STORECARD_STATUS_CANCEL       = "storecard_status_cancel"
    /** Key Action type */
    public static let KEY_ACTION_TYPE                   = "action_type"
    /** Key Change type */
    public static let KEY_CHANGE_TYPE                   = "change_type"
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Get new data
    //++ BUG0060-SPJ (NguyenPT 20170421) Add new constant for Order vip set event
    /** Key App order id */
    public static let KEY_APP_ORDER_ID                  = "app_order_id"
    //-- BUG0060-SPJ (NguyenPT 20170421) Add new constant for Order vip set event
    //++ BUG0073-SPJ (NguyenPT 20170503) Add new function G08
    /** Key Type of store card */
    public static let KEY_TYPE_IN_OUT                   = "type_in_out"
    /** Key List Types of store card */
    public static let KEY_LIST_TYPE_IN_OUT              = "list_type_in_out"
    /** Key List all materials */
    public static let KEY_LIST_ALL_MATERIAl             = "list_all_material"
    /** Key List all materials */
    public static let KEY_LIST_CASHBOOK_MATER_LOOKUP    = "list_cashbook_master_lookup"
    //-- BUG0073-SPJ (NguyenPT 20170503) Add new function G08
    //++ BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    /** Key Support type */
    public static let KEY_SUPPORT_ID                    = "support_id"
    /** Key Support type */
    public static let KEY_SUPPORT_TEXT                  = "support_text"
    /** Key favorite limit */
    public static let KEY_LIMIT_FAVORITE                = "limit_favorite"
    /** Key Support type list */
    public static let KEY_LIST_SUPPORT_EMPLOYEE         = "list_support_employee"
    //-- BUG0079-SPJ (NguyenPT 20170509) Add order type and support type in Family order
    //++ BUG0103-SPJ (NguyenPT 20170606) Update new flag
    /** Key show button complete flag */
    public static let KEY_SHOW_BUTTON_COMPLETE          = "show_button_complete"
    /** Key show button save flag */
    public static let KEY_SHOW_BUTTON_SAVE              = "show_button_save"
    //-- BUG0103-SPJ (NguyenPT 20170606) Update new flag
    
    //++ BUG0104-SPJ (NguyenPT 20170607) Update new flag
    /** Key setting */
    public static let KEY_TOTAL_GAS_DU_KG               = "total_gas_du_kg"
    /** Key setting */
    public static let KEY_SHOW_THU_TIEN                 = "show_thu_tien"
    /** Key setting */
    public static let KEY_SHOW_CHI_GAS_DU               = "show_chi_gas_du"
    /** Key setting */
    public static let KEY_SHOW_BUTTON_DEBIT             = "show_button_debit"
    /** Key setting */
    public static let KEY_PAY_DIRECT                    = "pay_direct"
    /** Key setting */
    public static let KEY_SHOW_BUTTON_CANCEL            = "show_button_cancel"
    //-- BUG0104-SPJ (NguyenPT 20170607) Update new flag
    
    //++ BUG0107-SPJ (NguyenPT 20170609) Handle image in store card
    /** Key setting */
    public static let KEY_LIST_ID_IMAGE                 = "list_id_image"
    //-- BUG0107-SPJ (NguyenPT 20170609) Handle image in store card
    
    //++ BUG0093-SPJ (NguyenPT 20170517) Add new key setting
    /** Key lookup type */
    public static let KEY_LOOKUP_TYPE                   = "lookup_type"
    /** Key master lookup id */
    public static let KEY_MASTER_LOOKUP_ID              = "master_lookup_id"
    /** Key master lookup text */
    public static let KEY_MASTER_LOOKUP_TEXT            = "master_lookup_text"
    /** Key date input */
    public static let KEY_DATE_INPUT                    = "date_input"
    /** Key lookup type text */
    public static let KEY_LOOKUP_TYPE_TEXT              = "lookup_type_text"
    /** Key list images */
    public static let KEY_LIST_IMAGE                    = "list_image"
    //-- BUG0093-SPJ (NguyenPT 20170517) Add new key setting
    //-- BUG0098-SPJ (NguyenPT 20170530) Add new key setting
    /** Key begin quantity */
    public static let KEY_BEGIN                         = "begin"
    /** Key in quantity */
    public static let KEY_IN                            = "in"
    /** Key out quantity */
    public static let KEY_OUT                           = "out"
    /** Key end quantity */
    public static let KEY_END                           = "end"
    /** Key rows */
    public static let KEY_ROWS                          = "rows"
    /** Key allow_update_storecard_hgd */
    public static let KEY_ALLOW_UPDATE_STORECARD_HGD    = "allow_update_storecard_hgd"
    /** Key next_time_update_storecard_hgd */
    public static let KEY_NEXT_UPDATE_STORECARD_HGD     = "next_time_update_storecard_hgd"
    /** Setting key: discount */
    public static let KEY_DISCOUNT                      = "discount"
    /** Key amount of bu vo */
    public static let KEY_BU_VO                         = "bu_vo"
    /** Key amount of revenue */
    public static let KEY_REVENUE                       = "revenue"
    /** Key sum all */
    public static let KEY_SUM_ALL                       = "sum_all"
    /** Key sum order type */
    public static let KEY_SUM_ORDER_TYPE                = "sum_order_type"
    /** Key total revenue */
    public static let KEY_TOTAL_REVENUE                 = "total_revenue"
    /** Key opening balance */
    public static let KEY_OPENING_BALANCE               = "opening_balance"
    /** Key ending balance */
    public static let KEY_ENDING_BALANCE                = "ending_balance"
    /** Key report_inventory */
    public static let KEY_REPORT_INVENTORY              = "report_inventory"
    /** Key report_hgd */
    public static let KEY_REPORT_ORDER_FAMILY           = "report_hgd"
    /** Key report_cashbook */
    public static let KEY_REPORT_CASHBOOK               = "report_cashbook"
    //-- BUG0098-SPJ (NguyenPT 20170530) Add new key setting
    //++ BUG0100-SPJ (NguyenPT 20170602) Add new key setting
    /** Key note of create */
    public static let KEY_NOTE_CREATE                   = "note_create"
    /** show_confirm */
    public static let KEY_SHOW_CONFIRM                  = "show_confirm"
    /** show_cancel */
    public static let KEY_SHOW_CANCEL                   = "show_cancel"
    //-- BUG0100-SPJ (NguyenPT 20170602) Add new key setting
    //++ BUG0101-SPJ (NguyenPT 20170604) Add new key setting
    /** send_to_id */
    public static let KEY_SEND_TO_ID                    = "send_to_id"
    /** name_user_reply */
    public static let KEY_NAME_USER_REPLY               = "name_user_reply"
    /** position */
    public static let KEY_POSITION                      = "position"
    /** name_user_to */
    public static let KEY_NAME_USER_TO                  = "name_user_to"
//    /** name_user_reply */
//    public static let KEY_NAME_USER_REPLY               = "name_user_reply"
    /** time_reply */
    public static let KEY_TIME_REPLY                    = "time_reply"
    /** can_close */
    public static let KEY_CAN_CLOSE                     = "can_close"
    /** can_reply */
    public static let KEY_CAN_REPLY                     = "can_reply"
    /** list_reply */
    public static let KEY_LIST_REPLY                    = "list_reply"
    //-- BUG0101-SPJ (NguyenPT 20170604) Add new key setting
    //++ BUG0110-SPJ (NguyenPT 20170617) Add new key setting
    /** time_send */
    public static let KEY_TIME_SEND                     = "time_send"
    /** created_date_on_history */
    public static let KEY_CREATED_DATE_ON_HISTORY       = "created_date_on_history"
    //-- BUG0110-SPJ (NguyenPT 20170617) Add new key setting
    //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    /** Flag show/hide Update agent button */
    public static let KEY_SHOW_BUTTON_CHANGE_AGENT      = "show_button_change_agent"
    //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    
    public static let KEY_IS_INVITED                    = "is_invited"
    public static let KEY_INVITED_CODE                  = "invite_code"
    public static let KEY_CURRENT_POINT                 = "current_point"
    public static let KEY_INVITED_LIST                  = "invited_list"
    public static let KEY_MENU_LIST                     = "menu_list"
    public static let KEY_DEVICE_NAME                   = "device_name"
    public static let KEY_DEVICE_IMEI                   = "device_imei"
    public static let KEY_DEVICE_OS_VERSION             = "device_os_version"
    
    
    // MARK: -----Specified constant-----
    /** File parameter: file_name[ + ] */
    public static let FILE_PARAM_FILE_NAME              = "file_name["
    public static let FILE_PARAM_FILE_NAME_CLOSE        = "]"
    /** Character encoding: UTF-8 */
    public static let CHARACTER_ENCODING_UTF8           = "UTF-8"
    /** Http request header: Content-Type */
    public static let HTTP_REQ_HEADER                   = "Content-Type"
    /** Http request header: application */
    public static let HTTP_REQ_HEADER_CONTENT           = "application/x-www-form-urlencoded"
    /** Specified constant */
    public static let MSG_PRESS_OK                      = "Press OK"
    /** Specified constant */
    public static let MSG_PRESS_REOPEN                  = "Press reopen"
    /** Specified constant */
    public static let MSG_DEVICE_NOT_SUPPORT            = "This device is not supported."
    /** Specified constant */
    public static let MSG_NOT_RECEIVE_TOKEN             = "Không thể nhận được device token!"
    /** Specified constant */
    public static let MSG_RECEIVE_TOKEN                 = "Đã nhận được device token!!"
    /** Request method: POST */
    public static let REQUEST_POST                      = 1
    /** Request method: GET */
    public static let REQUEST_GET                       = 2
    /** Request method: PUT */
    public static let REQUEST_PUT                       = 3
    /** Request method: DELETE */
    public static let REQUEST_DELETE                    = 4
    /** Certificate exception */
    public static let CERTIFICATE_NOT_VALID_OR_TRUSTED  = "Certificate not valid or trusted."
    /** Http scheme */
    public static let SCHEME_HTTP                       = "http"
    /** Https scheme */
    public static let SCHEME_HTTPS                      = "https"
    /** Port: 80 */
    public static let PORT_80                           = 80
    /** Port: 443 */
    public static let PORT_443                          = 443
    /** Application mode: Running */
    public static let MODE_RUNNING                      = 0
    /** Application mode: Training */
    public static let MODE_TRAINING                     = 1
    /** Issue type: open */
    public static let TYPE_OPEN                         = 1
    /** Issue type: close */
    public static let TYPE_CLOSE                        = 2
    /** News type: new */
    public static let TYPE_NEW                          = 1
    /** News type: view */
    public static let TYPE_VIEW                         = 2
    /** Google play service resolution request */
    public static let PLAY_SERVICES_RESOLUTION_REQUEST  = 9000
    /** Maximum of click on Logo to show hidden Activity */
    public static let MAX_CLICK_NUMBER                  = 7
    /** Result load image */
    public static let RESULT_LOAD_IMG                   = 1000
    /** Limit number of image can select 1 time */
    public static let MAX_SELECTED_PICTURE              = 6
    /** Touch image state: None */
    public static let TOUCH_IMG_NONE                    = 0
    /** Touch image state: Dragging */
    public static let TOUCH_IMG_DRAG                    = 1
    /** Touch image state: Zoom */
    public static let TOUCH_IMG_ZOOM                    = 2
    /** Touch image state: Click */
    public static let TOUCH_IMG_CLICK                   = 3
    /** Auto search interval */
    public static let SEARCH_INTERVAL                   = 1000
    /** Minimum number of characters begin search */
    public static let SEARCH_MIN_LENGTH                 = 5
    /** Minimum number of characters begin search material */
    public static let SEARCH_MATERIAL_MIN_LENGTH        = 2
    /** Minimum number of characters begin search target store card */
    public static let SEARCH_TARGET_MIN_LENGTH          = 3
    
    /** Pattern to remove accent */
    public static let PATTERN_REMOVE_ACCENT             = "\\p{InCombiningDiacriticalMarks}+"
    
    /** Transaction type: NORMAL */
    public static let TRANSACTION_TYPE_NORMAL           = "1"
    
    /** Uphold type: Periodically */
    public static let UPHOLD_TYPE_PERIODICALLY          = "1"
    /** Uphold type: Trouble */
    public static let UPHOLD_TYPE_TROUBLE               = "2"
    /** Uphold type: Periodically */
    public static let TYPE_PERIODICALLY                 = 1
    /** Uphold type: Trouble */
    public static let TYPE_TROUBLE                      = 2
    /** App type flag: Gas 24h */
    public static let APP_TYPE_FLAG_GAS_24H             = "1"
    /** App type flag: Gas Service */
    public static let APP_TYPE_FLAG_GAS_SERVICE         = "0"
    
    /** Order status: New */
    public static let ORDER_STATUS_NEW                  = "1"
    /** Order status: New */
    public static let ORDER_STATUS_PROCESSING           = "3"
    /** Order status: Complete */
    public static let ORDER_STATUS_COMPLETE             = "4"
    /** Order status: Complete */
    public static let ORDER_STATUS_CANCEL               = "5"
    /** Uphold status: Complete */
    public static let UPHOLD_STATUS_COMPLETE            = "3"
    /** Uphold status: New */
    public static let UPHOLD_STATUS_NEW                 = "1"
    /** Uphold status: Handling */
    public static let UPHOLD_STATUS_HANDLE              = "2"
    /** Uphold status: Other */
    public static let UPHOLD_TYPE_OTHER                 = "6"
    /** Uphold contact: Other */
    public static let UPHOLD_CONTACT_OTHER              = "4"
    /** Role id: Customer */
    public static let ROLE_CUSTOMER                     = String(RoleType.ROLE_CUSTOMER.rawValue)
    /** Role id: Coordinator */
    public static let ROLE_COORDINATOR                  = String(RoleType.ROLE_DIEU_PHOI.rawValue)
    /** Role id: Audit */
    public static let ROLE_AUDIT                        = String(RoleType.ROLE_AUDIT.rawValue)
    /** Role id: Chief monitor */
    public static let ROLE_CHIEF_MONITOR                = String(RoleType.ROLE_CHIEF_MONITOR.rawValue)
    /** Role id: Director */
    public static let ROLE_DIRECTOR                     = String(RoleType.ROLE_DIRECTOR.rawValue)
    /** Flag change pass: need change */
    public static let NEED_CHANGE_PASS                  = "1"
    /** Flag change pass: no need change */
    public static let NO_NEED_CHANGE_PASS               = "0"
    /** Maximum number of user interaction tapped */
    public static let MAXIMUM_TAPPED                    = 7
    /** Notify type: View Uphold */
    public static let NOTIFY_VIEW_UPHOLD                = "VIEW_UPHOLD"
    /** Notify type: View Issue */
    public static let NOTIFY_VIEW_ISSUE                 = "VIEW_ISSUE"
    /** Notify type: View Issue */
    public static let NOTIFY_VIEW_VIP_CUSTOMER_ORDER    = "TYPE_ORDER_BO_MOI"
    /** Notify type: View Issue */
    public static let NOTIFY_VIEW_FAMILY_CUSTOMER_ORDER = "VIEW_TRANSACTION"
    /** Notify type: Family Uphold */
    public static let NOTIFY_VIEW_FAMILY_UPHOLD         = "TYPE_UPHOLD_HGD"
    
    //++ BUG0049-SPJ (NguyenPT 20170622) Handle notification for Ticket and SPJ code
    /** Notify type: Ticket */
    public static let NOTIFY_VIEW_TICKET                = "TYPE_TICKET_EVENT"
    /** Notify type: Spj code */
    public static let NOTIFY_VIEW_SPJ_CODE              = "TYPE_SPJ_CODE_GOBACK"
    /** Notify type: Gas24h  */
    public static let GAS24h_ANNOUNCE_TYPE              = "TYPE_GAS24H_ANNOUNCE"
    //-- BUG0049-SPJ (NguyenPT 20170622) Handle notification for Ticket and SPJ code
    
    /** Notify type: Uphold alert 10 */
    public static let NOTIFY_UPHOLD_ALERT_10            = "1"
    /** Notify type: Uphold periodically */
    public static let NOTIFY_UPHOLD_PERIODICALLY_1_DAY  = "2"
    /** Notify type: Issue ticket */
    public static let NOTIFY_ISSUE_TICKET               = "3"
    /** Notify type: Uphold create */
    public static let NOTIFY_UPHOLD_CREATE              = "4"
    /** Response status code: Success */
    public static let RESPONSE_STATUS_SUCCESS           = "1"
    /** Response status code: Success */
    public static let RESPONSE_STATUS_FAILED            = "0"
    /** Report wrong */
    public static let REPORT_WRONG                      = "1"
    /** Report right */
    public static let REPORT_RIGHT                      = "0"
    /** Contact type: Boss */
    public static let CONTACT_TYPE_BOSS                 = "1"
    /** Contact type: Manager */
    public static let CONTACT_TYPE_MANAGER              = "2"
    /** Contact type: Technical */
    public static let CONTACT_TYPE_TECHNICAL            = "3"
    /** Rating status: Glad */
    public static let RATING_STATUS_GLAD                = "1"
    /** Rating status: Normal */
    public static let RATING_STATUS_NORMAL              = "2"
    /** Rating status: Sad */
    public static let RATING_STATUS_SAD                 = "3"
    /** Category type: VIP */
    public static let CATEGORY_TYPE_VIP                 = "1"
    /** Category type: GAS */
    public static let CATEGORY_TYPE_GAS                 = "2"
    /** Category type: Utility */
    public static let CATEGORY_TYPE_UTILITY             = "3"
    /** Category type: Order vip */
    public static let CATEGORY_TYPE_ORDER_VIP           = "4"
    /** Category type: Uphold */
    public static let CATEGORY_TYPE_UPHOLD              = "5"
    /** Category type: Uphold */
    public static let ACTION_TYPE_SELECT_GAS            = "6"
    /** Category type: Uphold */
    public static let ACTION_TYPE_SELECT_PROMOTE        = "7"
    /** Category type: Uphold */
    public static let ACTION_TYPE_SUPPORT               = "8"
    /** Category type: Uphold */
    public static let ACTION_TYPE_NONE                  = "9999"
    /** Employee information id: Phone */
    public static let EMPLOYEE_INFO_PHONE_ID            = "1"
    /** Employee information id: Code */
    public static let EMPLOYEE_INFO_CODE_ID             = "2"
    
    /** Agent information id: Promotion */
    public static let AGENT_PROMOTION_ID                = "###99901"
    /** Agent information id: Discount */
    public static let AGENT_DISCOUNT_ID                 = "###99902"
    /** Agent information id: Total money */
    public static let AGENT_TOTAL_MONEY_ID              = "###99903"
    /** Agent information id: Name */
    public static let AGENT_NAME_ID                     = "###99904"
    /** Agent information id: Phone */
    public static let AGENT_PHONE_ID                    = "###99905"
    /** Agent information id: Support */
    public static let AGENT_SUPPORT_ID                  = "###99906"
    /** Agent information id: Bu vo */
    public static let AGENT_BUVO_ID                     = "###99907"
    /** Order information id: Order Id */
    public static let ORDER_INFO_ID_ID                  = "###99908"
    /** Order information id: Order status */
    public static let ORDER_INFO_STATUS_ID              = "###99909"
    /** Order information id: Order Car number */
    public static let ORDER_INFO_CAR_NUMBER_ID          = "###99910"
    /** Order information id: Order Payment method */
    public static let ORDER_INFO_PAYMENT_METHOD_ID      = "###99911"
    /** Order information id: Order Gas money */
    public static let ORDER_INFO_GAS_MONEY_ID           = "###99912"
    /** Order information id: Order Gas du */
    public static let ORDER_INFO_GAS_DU_ID              = "###99913"
    /** Order information id: Order Total money */
    public static let ORDER_INFO_TOTAL_MONEY_ID         = "###99914"
    /** Order information id: Order Address */
    public static let ORDER_INFO_ADDRESS_ID             = "###99915"
    /** Order information id: Order Phone */
    public static let ORDER_INFO_PHONE_ID               = "###99916"
    /** Order information id: Order Add new material */
    public static let ORDER_INFO_MATERIAL_ADD_NEW       = "###99917"
    /** Order information id: Order created date */
    public static let ORDER_INFO_CREATED_DATE_ID        = "###99918"
    /** Order information id: Order delivery date */
    public static let ORDER_INFO_DELIVERY_DATE_ID       = "###99919"
    /** Order information id: Order contact */
    public static let ORDER_INFO_CONTACT_ID             = "###99920"
    /** Order information id: Order employee deliver */
    public static let ORDER_INFO_EMPLOYEE_DELIVER_ID    = "###99921"
    /** Order information id: Order Gas Price */
    public static let ORDER_INFO_GAS_PRICE_ID           = "###99922"
    /** Order information id: Order support type */
    public static let ORDER_INFO_SUPPORT_TYPE_ID        = "###99923"
    /** Order information id: Order order type */
    public static let ORDER_INFO_ORDER_TYPE_ID          = "###99924"
    /** Uphold information id: Id */
    public static let UPHOLD_INFO_ID_ID                 = "###99925"
    /** Uphold information id: Uphold status */
    public static let UPHOLD_INFO_STATUS_ID             = "###99926"
    /** Uphold information id: Uphold created date */
    public static let UPHOLD_INFO_CREATED_DATE_ID       = "###99927"
    /** Uphold information id: Uphold customer note */
    public static let UPHOLD_INFO_CUSTOMER_NOTE_ID      = "###99928"
    /** Order information id: CCS code */
    public static let ORDER_INFO_CCS_CODE_ID            = "###99929"
    /** Order information id: Note */
    public static let ORDER_INFO_NOTE_ID                = "###99930"
    /** Order information id: Order Clear all cylinder */
    public static let ORDER_INFO_MATERIAL_CLEAR_ALL_CYLINDER    = "###99931"
    /** Order information id: Order Sum all cylinder */
    public static let ORDER_INFO_MATERIAL_SUM_ALL_CYLINDER      = "###99932"
    /** Order information id: Order Sum all cylinder */
    public static let ORDER_INFO_PAY_BACK               = "###99933"
    /** Order information id: Order Sum all cylinder */
    public static let ORDER_INFO_PAY_DIRECT             = "###99934"
    /** Order information id: Order discount */
    public static let ORDER_INFO_DISCOUNT               = "###99935"
    /** Account information id: Name */
    public static let ACCOUNT_INFO_NAME_ID              = "###99936"
    /** Account information id: Email */
    public static let ACCOUNT_INFO_EMAIL_ID             = "###99937"
    /** Account information id: House number */
    public static let ACCOUNT_INFO_HOUSE_NUMBER_ID      = "###99938"
    /** Account information id: Street */
    public static let ACCOUNT_INFO_STREET_ID            = "###99939"
    /** Account information id: Ward */
    public static let ACCOUNT_INFO_WARD_ID              = "###99940"
    /** Account information id: District */
    public static let ACCOUNT_INFO_DISTRICT_ID          = "###99941"
    /** Account information id: City */
    public static let ACCOUNT_INFO_CITY_ID              = "###99942"
    /** Account information id: Save */
    public static let ACCOUNT_INFO_SAVE_ID              = "###99943"
    /** Account information id: Cancel */
    public static let ACCOUNT_INFO_CANCEL_ID            = "###99944"
    /** Order information id: Order promotion */
    public static let ORDER_INFO_PROMOTION              = "###99945"
    /** Order information id: Order Material */
    public static let ORDER_INFO_MATERIAL_ID            = "###999"
    
    // MARK: New
    /** Key menu item: Promotion list */
    public static let KEY_MENU_PROMOTION_LIST           = "promotion_list"
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    /** Key menu item: Store card list */
    public static let KEY_MENU_STORE_CARD_LIST          = "store_card_list"
    /** Key menu item: Cash boook list */
    public static let KEY_MENU_CASH_BOOK_LIST           = "cashbook_list"
    /** Key menu item: Cash book schedule */
    public static let KEY_MENU_CASH_BOOK_SCHEDULE       = "cashbook_schedule"
    /** Key menu item: Family uphold list */
    public static let KEY_MENU_FAMILY_UPHOLD_LIST       = "uphold_hgd_list"
    /** Key menu item: Report list */
    public static let KEY_MENU_REPORT_LIST              = "report"
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    
    //++ BUG0102-SPJ (NguyenPT 20170604) Add new key setting
    /** Key menu item: Ticket list */
    public static let KEY_MENU_TICKET_LIST              = "ticket_list"
    /** Key menu item: Google map */
    public static let KEY_MENU_GOOGLE_MAP               = "google_map"
    /** Key List Ticket handler */
    public static let KEY_LIST_TICKET_HANDLE            = "list_ticket_handle"
    //-- BUG0102-SPJ (NguyenPT 20170604) Add new key setting
    
    //++ BUG0111-SPJ (NguyenPT 20170617) Update function G06
    /** Key List CCS code */
    public static let KEY_MENU_CCS_CODE_LIST            = "pttt_code_list"
    /** Key CCS code */
    public static let KEY_MENU_CCS_CODE                 = "pttt_code"
    //-- BUG0111-SPJ (NguyenPT 20170617) Update function G06
    
    //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    /** Key customer_chain_store */
    public static let KEY_CUSTOMER_CHAIN_STORE          = "customer_chain_store"
    /** Key customer_chain_store_id */
    public static let KEY_CUSTOMER_CHAIN_STORE_ID       = "customer_chain_store_id"
    /** Key customer_chain_store_id */
    public static let KEY_IS_CHAIN_STORE                = "is_chain_store"
    /** Key customer_chain_store_id */
    public static let KEY_CUSTOMER_NAME_CHAIN           = "customer_name_chain"
    /** Key customer_chain_store_id */
    public static let KEY_APP_STATUS_TEXT               = "app_status_text"
    //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
    
    //++ BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
    /** Key show_button_update_customer */
    public static let KEY_SHOW_BTN_UPDATE_CUSTOMER      = "show_button_update_customer"
    //-- BUG0119-SPJ (NguyenPT 20170630) Handle update customer in Order Family
    
    //++ BUG0094-SPJ (NguyenPT 20170701) Add function create order by Coordinator
    /** Key employee_maintain_id */
    public static let KEY_EMPLOYEE_MAINTAIN_ID          = "employee_maintain_id"
    /** Key monitor_market_development_id */
    public static let KEY_MONITOR_MARKET_DEV_ID         = "monitor_market_development_id"
    //-- BUG0094-SPJ (NguyenPT 20170701) Add function create order by Coordinator
    //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    /** Key monitor_market_development_id */
    public static let KEY_CHANGE_TO_AGENT               = "change_to_agent"
    //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    
    /** Key show_pay_back */
    public static let KEY_SHOW_PAY_BACK                 = "show_pay_back"
    /** Key pay_back */
    public static let KEY_PAY_BACK                      = "pay_back"
    /** Key show_discount */
    public static let KEY_SHOW_DISCOUNT                 = "show_discount"
    
    /** Key otp code */
    public static let KEY_OTP_CODE                      = "otp_code"
    /** Key change_qty */
    public static let KEY_CHANGE_QTY                    = "change_qty"
    /** Key show_input_promotion_amount */
    public static let KEY_SHOW_INPUT_PROMOTION_AMOUNT   = "show_input_promotion_amount"
    /** Key input_promotion_amount */
    public static let KEY_INPUT_PROMOTION_AMOUNT        = "input_promotion_amount"
    public static let KEY_LAST_ORDER                    = "last_order"
    public static let KEY_REVIEW                        = "review"
    /** Key transaction id */
    public static let KEY_SESSION_ID                    = "session_id"
    /** Key transaction key */
    public static let KEY_SESSION_KEY                   = "session_key"
    /** Key gas24h_time_check_order */
    public static let KEY_GAS24H_TIME_INTERVAL          = "gas24h_time_check_order"
    /** Key menu item: Promotion policy */
    public static let KEY_MENU_PROMOTION_POLICY         = "id_page_promotion"
    /** Key menu item: Promotion policy */
    public static let KEY_MENU_APP_GUIDE                = "id_page_guide"
    /** Key my_invite_code */
    public static let KEY_MY_INVITE_CODE                = "my_invite_code"
    /** Key my_invite_code */
    public static let KEY_GAS24H_MENU_TEXT              = "gas24h_menu_text"
    /** Key gas_remain_amount */
    public static let KEY_GAS_REMAIN_AMOUNT             = "gas_remain_amount"
    /** Key announce_list */
    public static let KEY_ANNOUNCE_LIST                 = "announce_list"
    /** Key announce_list */
    public static let KEY_MAP_AGENT                     = "map_agent"
    
    //++ BUG0050-SPJ (NguyenPT 20170325) Add new function G06
    /** Platform value: Android */
    public static let PLATFORM_ANDROID                  = 1
    /** Platform value: iOS */
    public static let PLATFORM_IOS                      = 2
    /** Customer Family Buying value: All */
    public static let CUSTOMER_FAMILY_BUYING_ALL        = "0"
    /** Customer Family Buying value: Bought */
    public static let CUSTOMER_FAMILY_BUYING_BOUGHT     = "1"
    /** Customer Family Buying value: Not yet */
    public static let CUSTOMER_FAMILY_BUYING_NOTYET     = "2"
    /** City keyword */
    public static let CITY                              = "city"
    /** Street keyword */
    public static let STREET                            = "duong"
    //-- BUG0050-SPJ (NguyenPT 20170325) Add new function G06
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    /** Search target type: Search Agent */
    public static let SEARCH_TARGET_TYPE_AGENT          = "1"
    /** Search target type: Search Customer */
    public static let SEARCH_TARGET_TYPE_CUSTOMER       = "2"
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    
    /** Cylinder type id: 6Kg */
    public static let CYLINDER_TYPE_ID_6KG              = "14"
    /** Cylinder type id: 12Kg */
    public static let CYLINDER_TYPE_ID_12KG             = "1"
    /** Cylinder type id: 45Kg */
    public static let CYLINDER_TYPE_ID_45KG             = "10"
    /** Cylinder type id: 50Kg */
    public static let CYLINDER_TYPE_ID_50KG             = "12"
    /** Gas type id: 4Kg */
    public static let GAS_TYPE_ID_4KG                   = "19"
    /** Gas type id: 6Kg */
    public static let GAS_TYPE_ID_6KG                   = "9"
    /** Gas type id: 12Kg */
    public static let GAS_TYPE_ID_12KG                  = "4"
    /** Gas type id: 45Kg */
    public static let GAS_TYPE_ID_45KG                  = "7"
    /** Gas type id: 50Kg */
    public static let GAS_TYPE_ID_50KG                  = "11"
    /** Gas type id: Big pool */
    public static let GAS_TYPE_ID_BIG_POOL              = "13"
    /** Promotion type id */
    public static let PROMOTION_TYPE_ID                 = "6"
    /** Unit mass of gas */
    public static let GAS_MASS_UNIT                     = "kg"
    
    
    /** Money unit: Vietnam dong */
    //++ BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
    //public static let VIETNAMDONG                       = " " + NumberFormatter().locale.currencySymbol!
    public static let VIETNAMDONG                       = DomainConst.BLANK
    //-- BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
    /** Promote default value */
    public static let PROMOTION_DEFAULT                 = "50,000"
    /** Discount default value */
    public static let DISCOUNT_DEFAULT                  = "20,000"
    /** The other option */
    public static let OPTION_OTHER                      = "Khác"
    public static let LINE_FEED                         = "\n"
    /** Contact spliter */
    public static let CONTACT_SPLITER                   = DomainConst.LINE_FEED
    /** Address spliter */
    public static let ADDRESS_SPLITER                   = DomainConst.SPLITER_TYPE2
    /** Address spliter with space */
    public static let ADDRESS_SPLITER_WITH_SPACE        = ", "
    /** Phone spliter */
    public static let PHONE_SPLITER                     = SPLITER_TYPE1
    /** Phone spliter */
    public static let SPLITER_TYPE1                     = "-"
    /** Phone spliter */
    public static let SPLITER_TYPE2                     = ","
    /** Phone spliter */
    public static let SPLITER_TYPE3                     = "/"
    /** Number spliter */
    public static let SPLITER_TYPE4                     = "."
    /** Separator string */
    public static let SEPARATOR_STR                     = "-------------------------------------------------------------------------------------------------"
    /** Text spliter */
    public static let TEXT_SPLITER                      = ":"
    /** Plus spliter: + */
    public static let PLUS_SPLITER                      = "+"
    /** Number string: 0 */
    public static let NUMBER_ZERO_VALUE                 = "0"
    /** Number string: 1 */
    public static let NUMBER_ONE_VALUE                  = "1"
    /** Number string: 2 */
    public static let NUMBER_TWO_VALUE                  = "2"
    /** Number string: 3 */
    public static let NUMBER_THREE_VALUE                = "3"
    /** Number string: 4 */
    public static let NUMBER_FOUR_VALUE                 = "4"
    /** Default time value */
    public static let DEFAULT_TIME_VALUE                = "08:00"
    /** Address unknown string */
    public static let ADDRESS_UNKNOWN                   = "Khong ro, "
    //++ BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    /** Address unknown string */
    public static let ADDRESS_UNKNOWN1                  = "Không rõ, "
    //-- BUG0073-SPJ (NguyenPT 20170504) Add new key setting
    /** Json error: Failed to load */
    public static let JSON_ERR_FAILED_LOAD              = "Failed to load: "
    /** Json error: Wrong format */
    public static let JSON_ERR_WRONG_FORMAT             = "Json is of wrong format"
    public static let UNICODE_SIGNS: [String]           = [
        "aAeEoOuUiIdDyY",
        "áàạảãâấầậẩẫăắằặẳẵ",
        "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
        "éèẹẻẽêếềệểễ",
        "ÉÈẸẺẼÊẾỀỆỂỄ",
        "óòọỏõôốồộổỗơớờợởỡ",
        "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
        "úùụủũưứừựửữ",
        "ÚÙỤỦŨƯỨỪỰỬỮ",
        "íìịỉĩ",
        "ÍÌỊỈĨ",
        "đ",
        "Đ",
        "ýỳỵỷỹ",
        "ÝỲỴỶỸ"
    ]
    //++ BUG0060-SPJ (NguyenPT 20170421) Add new constant for Order status
    /** Order status: New */
    public static let ORDER_STATUS_TYPE_NEW             = DomainConst.NUMBER_ONE_VALUE
    /** Order status: Complete */
    public static let ORDER_STATUS_TYPE_COMPLETE        = DomainConst.NUMBER_TWO_VALUE
    /** Order status: All */
    public static let ORDER_STATUS_TYPE_ALL             = DomainConst.NUMBER_ZERO_VALUE
    /** Order Code prefix */
    public static let ORDER_CODE_PREFIX                 = "#"
    //-- BUG0060-SPJ (NguyenPT 20170421) Add new constant for Order status
    //++ BUG0093-SPJ (NguyenPT 20170518) Type of cash book
    /** Cashbook type: List */
    public static let CASHBOOK_TYPE_LIST                = DomainConst.NUMBER_ONE_VALUE
    /** Cashbook type: Schedule */
    public static let CASHBOOK_TYPE_SCHEDULE            = DomainConst.NUMBER_TWO_VALUE
    //-- BUG0093-SPJ (NguyenPT 20170518) Type of cash book
    //++ BUG0110-SPJ (NguyenPT 20170617) Type of notify list
    /** Notify list type: new */
    public static let NOTIFY_LIST_TYPE_NEW              = DomainConst.NUMBER_ONE_VALUE
    /** Notify list type: read */
    public static let NOTIFY_LIST_TYPE_READ             = DomainConst.NUMBER_TWO_VALUE
    //-- BUG0110-SPJ (NguyenPT 20170617) Type of notify list
    /** Constant Promotion policy */
    public static let MENU_PROMOTION_POLICY_ID          = "3"
    /** Constant App guide */
    public static let MENU_APP_GUIDE_ID                 = "4"

    /** -----Log message----- */
    /** Log tag: error. */
    public static let LOG_TAG_ERROR                     = "harpy.error"
    /** Log tag: warn. */
    public static let LOG_TAG_WARN                      = "harpy.warn"
    /** Log tag: info. */
    public static let LOG_TAG_INFO                      = "harpy.info"
    /** Log tag: debug. */
    //public static let LOG_TAG_DEBUG = "harpy.debug"
    /** Log message. */
    public static let LOG_MSG_HTTP_ACCESS_FAILED        = "httpAccessPost fail:"
    /** Log message. */
    public static let LOG_MSG_GET_DATA_FROM_URL         = "Get data from URL: "
    
    /** Blank character */
    public static let BLANK                             = ""
    /** Space string */
    public static let SPACE_STR                         = " "
    /** Server URL (Training mode) */
    public static let SERVER_URL_TRAINING               = "http://dev.spj.vn/api/"
    /** Server URL */
    public static let SERVER_URL                        = "http://spj.daukhimiennam.com/api/"
    /** Immortal Server URL */
    public static let SERVER_URL_IMMORTAL               = "http://build.immortal.vn/api/"
    /** Hotline */
    public static let HOTLINE                           = "1900 1565"
    /** Refer link */
    public static let REFER_LINK                        = "http://spj.vn/app?code="
    
    // MARK -----Define id of fragment-----
    public static let LOGOUT                            = "logout"
    public static let ORDER_LIST                        = "order_list"
    public static let ORDER_VIP_LIST                    = "bomoi_list"
    public static let ORDER_CREATE                      = "order_create"
    public static let UPHOLD_LIST                       = "uphold_list"
    public static let NEWS_LIST                         = "news_list"
    public static let USER_PROFILE                      = "user_profile"
    public static let ISSUE_CREATE                      = "Tạo mới phản ánh"
    public static let HOME                              = "home"
    public static let ISSUE_LIST                        = "issue_list"
    public static let MESSAGE                           = "message"
    public static let CUSTOMER_LIST                     = "customer_list"
    public static let WORKING_REPORT                    = "working_report_list"
    public static let ORDER_TRANSACTION_LIST            = "transaction_list"
    public static let ISSUE_VIEW                        = "Chi tiết phản ánh"
    public static let NEWS_VIEW                         = "Chi tiết tin tức"
    public static let UPHOLD_VIEW                       = "Chi tiết bảo trì"
    public static let ISSUE_REPLY                       = "Trả lời phản ánh"
    public static let UPHOLD_REPLY                      = "Trả lời bảo trì"
    public static let USER_CHANGE_PASS                  = "Đổi mật khẩu"
    public static let UPHOLD_CREATE                     = "Tạo mới bảo trì"
    
    // MARK: -----Controller names-----
    /** Application name */
    public static let APPNAME                                       = "gasservice"
    public static let APPNAME_IMMORTAL                              = "countingstar"
    public static let HARPY_FRAMEWORK_BUNDLE_NAME                   = "com.spj.harpyframework.harpyframework"
    /** Name of RegisterViewController */
    public static let G00_REGISTER_VIEW_CTRL                        = "G00RegisterVC"
    /** Name of G00 home view controller */
    public static let G00_HOME_VIEW_CTRL                            = "G00HomeVC"
    /** Name of G00 login view controller */
    public static let G00_LOGIN_VIEW_CTRL                           = "G00LoginVC"
    /** Name of ConfigurationViewController */
    public static let G00_CONFIGURATION_VIEW_CTRL                   = "G00ConfigurationVC"
    /** Name of G00 information view controller */
    public static let G00_INFORMATION_VIEW_CTRL                     = "G00InfomationVC"
    /** Name of AccountViewController */
    public static let G00_ACCOUNT_VIEW_CTRL                         = "G00AccountVC"
    /** Name of Uphold List View Controller */
    public static let G01_F00_S01_VIEW_CTRL                         = "G01F00S01VC"
    /** Name of Uphold detail employee view controller */
    public static let G01_F00_S02_VIEW_CTRL                         = "G01F00S02VC"
    /** Name of Uphold detail customer view controller */
    public static let G01_F00_S03_VIEW_CTRL                         = "G01F00S03VC"
    /** Name of UpholdListViewController */
    public static let PERIOD_UPHOLDDETAIL_CUSTOMER_VIEW_CTRL        = "PeriodUpholdDetailCustomerViewController"
    /** Name of ReplyUpholdViewController */
    public static let REPLY_UPHOLD_VIEW_CTRL                        = "ReplyUpholdViewController"
    /** Name of Uphold detail employee information view */
    public static let G01_F00_S02_INFO_VIEW                         = "G01F00S02InfoView"
    
    /** Name of G01F02 create uphold reply view controller */
    public static let G01_F02_VIEW_CTRL                             = "G01F02VC"
    /** Name of G01F03 uphold rating view controller */
    public static let G01_F03_VIEW_CTRL                             = "G01F03VC"
    /** Name of G04F00 Order list view controller */
    public static let G04_F00_S01_VIEW_CTRL                         = "G04F00S01VC"
    /** Name of G04F02 Promotions list view controller */
    public static let G04_F02_S01_VIEW_CTRL                         = "G04F02S01VC"
    /** Name of G05F00 Order list view controller */
    public static let G05_F00_S01_VIEW_CTRL                         = "G05F00S01VC"
    //++ BUG0060-SPJ (NguyenPT 20170421) Add new constant for G05F00S03VC
    /** Name of G05F00 Order list view controller */
    public static let G05_F00_S03_VIEW_CTRL                         = "G05F00S03VC"
    //-- BUG0060-SPJ (NguyenPT 20170421) Add new constant for G05F00S03VC
    //++ BUG0050-SPJ (NguyenPT 20170323) Add new view controller
    /** Name of G06APITest view controller */
    public static let G06_API_TEST_VIEW_CTRL                        = "G06APITestVC"
    /** Name of G05APITest view controller */
    public static let G05_API_TEST_VIEW_CTRL                        = "G05APITestVC"
    /** Name of BaseAPITest view controller */
    public static let BASE_API_TEST_VIEW_CTRL                        = "BaseAPITestViewController"
    //++ BUG0050-SPJ (NguyenPT 20170323) Add new view controller
    
    /** Name of ChangePasswordViewController */
    public static let G00_CHANGE_PASS_VIEW_CTRL                     = "G00ChangePassVC"
    /** Name of G01F01VC */
    public static let G01_F01_VIEW_CTRL                             = "G01F01VC"
    /** Name of Internal view controller */
    public static let INTERNAL_VIEW_CTRL                            = "InternalViewController"
    /** Name of zoomIMGViewController */
    public static let ZOOM_IMAGE_VIEW_CTRL                          = "zoomIMGViewController"
    /** Home table view cell */
    public static let G00_HOME_CELL                                 = "G00HomeCell"
    /** Period table view cell */
    public static let G01_F00_S01_PERIOD_CELL                       = "TableCellUpholdType"
    /** Problem table view cell */
    public static let G01_F00_S01_PROBLEM_CELL                      = "TableCellUpholdType"
    /** Search bar table view cell */
    public static let SEARCH_BAR_TABLE_VIEW_CELL                    = "SearchBarTableViewCell"
    /** Configuration table view cell */
    public static let CONFIGURATION_TABLE_VIEW_CELL                 = "ConfigurationTableViewCell"
    /** Configuration table view cell */
    public static let ORDER_DETAIL_TABLE_VIEW_CELL                  = "OrderDetailTableViewCell"
    /** Material table view cell */
    public static let MATERIAL_TABLE_VIEW_CELL                      = "MaterialTableViewCell"
    /** Uphold detail employee history table view cell */
    public static let UPHOLD_DETAIL_EMPLOYEE_HISTORY_TABLE_VIEW_CELL = "G01F00S02HistoryCell"
    /** Collection Image view cell */
    public static let COLLECTION_IMAGE_VIEW_CELL                    = "CollectionImageViewCell"
    /** Material selection view cell */
    public static let MATERIAL_SELECTION_VIEW_CELL                  = "MaterialSelectionCell"
    /** Table view cell order type */
    public static let TABLE_VIEW_CELL_ORDER_TYPE                    = "TableCellOrderType"
    /** Table view cell Promotion */
    public static let PROMOTION_TABLE_VIEW_CELL                     = "PromotionTableViewCell"
    //++ BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    /** Table view cell Customer Family List */
    public static let CUSTOMER_FAMILY_LIST_TABLE_VIEW_CELL          = "CustomerFamilyListCell"
    public static let WORKING_REPORT_LIST_TABLE_VIEW_CELL          = "WorkingReportListCell"
    public static let G06_F00_S01_VC                                = "G06F00S01VC"
    public static let G06_F00_S02_VC                                = "G06F00S02VC"
    public static let G06_F00_S04_VC                                = "G06F00S04VC"
    //-- BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    
    //++ BUG0054-SPJ (NguyenPT 20170407) Add new key for new function G07
    /** Order Family list of Employee */
    public static let G07_F00_S01_VC                                = "G07F00S01VC"
    //-- BUG0054-SPJ (NguyenPT 20170407) Add new key for new function G07
    //++ BUG0073-SPJ (NguyenPT 20170503) Add new function G08
    public static let G08_F00_S01_VC                                = "G08F00S01VC"
    //-- BUG0073-SPJ (NguyenPT 20170503) Add new function G08
    
    //++ BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    public static let G09_F00_S01_VC                                = "G09F00S01VC"
    public static let G09_F00_S03_VC                                = "G09F00S03VC"
    //-- BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    
    //++ BUG0098-SPJ (NguyenPT 20170531) Add new function G10
    public static let G10_F00_S01_VC                                = "G10F00S01VC"
    //-- BUG0098-SPJ (NguyenPT 20170531) Add new function G10
    
    //++ BUG0100-SPJ (NguyenPT 20170602) Update function G01 for Family Uphold
    /** Uphold Family List */
    public static let G01_F00_S04_VC                                = "G01F00S04VC"
    /** Uphold Family View */
    public static let G01_F00_S05_VC                                = "G01F00S05VC"
    //-- BUG0100-SPJ (NguyenPT 20170602) Update function G01 for Family Uphold
    
    //++ BUG0102-SPJ (NguyenPT 20170604) Update function G11
    /** Ticket List */
    public static let G11_F00_S01_VC                                = "G11F00S01VC"
    /** Ticket View */
    public static let G11_F00_S02_VC                                = "G11F00S02VC"
    //-- BUG0102-SPJ (NguyenPT 20170604) Update function G11
    
    //++ BUG0049-SPJ (NguyenPT 20170622) Handle notification
    /** Order VIP List of Employee */
    public static let G05_F00_S02_VC                                = "G05F00S02VC"
    /** Order VIP View of Employee */
    public static let G05_F00_S03_VC                                = "G05F00S03VC"
    //-- BUG0049-SPJ (NguyenPT 20170622) Handle notification
    
    /** Pop overmenu identifier */
    public static let POPOVER_MENU_IDENTIFIER                       = "popOverMenu"
    /** G01F02S06 table view cell */
    public static let G01_F02_S06_CELL                              = "ImageTableViewCell"
    
    // MARK: -----Notification name-----
    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//    public static let NOTIFY_NAME_LOGIN_ITEM                        = "loginItemTapped"
    public static let NOTIFY_NAME_LOGOUT_ITEM                       = "logoutItemTapped"
//    public static let NOTIFY_NAME_REGISTER_ITEM                     = "registerItemTapped"
//    public static let NOTIFY_NAME_GAS_SERVICE_ITEM                  = "gasServiceItemTapped"
//    public static let NOTIFY_NAME_ISSUE_ITEM                        = "issueItemTapped"
//    public static let NOTIFY_NAME_COFIG_ITEM                        = "configItemTapped"
//    public static let NOTIFY_NAME_COFIG_ITEM_ACCOUNTVIEW            = "configItemTappedAccountView"
//    public static let NOTIFY_NAME_COFIG_ITEM_UPHOLDLISTVIEW         = "configItemTappedUpholdListView"
//    public static let NOTIFY_NAME_COFIG_ITEM_CREATE_UPHOLD          = "configItemTappedCreateUphold"
//    public static let NOTIFY_NAME_COFIG_ITEM_UPHOLDDETAILVIEW       = "configItemTappedUpholdDetailView"
//    public static let NOTIFY_NAME_COFIG_ITEM_CHANGEPASSVIEW         = "configItemTappedChangePassView"
//    public static let NOTIFY_NAME_COFIG_ITEM_REGISTERVIEW           = "configItemTappedRegisterView"
    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    //++ BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
//    public static let NOTIFY_NAME_SET_DATA_ACCOUNTVIEW              = "G00AccountVC.setData"
//    public static let NOTIFY_NAME_SET_DATA_UPHOLDLIST_VIEW          = "G01F00S01VC.setData"
//    public static let NOTIFY_NAME_RELOAD_DATA_UPHOLDLIST_VIEW       = "G01F00S01VC.reloadData"
//    public static let NOTIFY_NAME_SHOW_SEARCH_BAR_UPHOLDLIST_VIEW   = "G01F00S01VC.showSearchBarTableView"
//    public static let NOTIFY_NAME_SET_DATA_UPHOLD_DETAIL_VIEW       = "UpholdDetailViewController.setData"
//    public static let NOTIFY_NAME_COFIG_ITEM_G01F02                 = "G01F2VC.configItemTapped"
    public static let NOTIFY_NAME_SET_DATA_G01F01                   = "G01F1VC.setData"
    public static let NOTIFY_NAME_SET_DATA_G01F02                   = "G01F2VC.setData"
    public static let NOTIFY_NAME_SET_DATA_G01F03                   = "G01F3VC.setData"
//    public static let NOTIFY_NAME_SET_DATA_HOMEVIEW                 = "G00HomeVC.setData"
    //-- BUG0046-SPJ (NguyenPT 20170301) Use action for Request server completion
    //++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
//    public static let NOTIFY_NAME_COFIG_ITEM_HOMEVIEW               = "G00HomeVC.configItemTapped"
    //-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
    //++ BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
//    public static let NOTIFY_NAME_UPDATE_NOTIFY_HOMEVIEW            = "G00HomeVC.updateNotify"
    //-- BUG0046-SPJ (NguyenPT 20170302) Use action for Request server completion
    public static let NOTIFY_NAME_RELOAD_DATA_UPHOLD_DETAIL_VIEW    = "G01F00S02.reloadData"
    
    // MARK: -----Domain constants-----
    /** Logo image name */
    public static let GAS24H_AGENT_ANNOTATION               = "gas24h_agent_annotation.png"
    public static let GAS24H_USER_ANNOTAION                 = "gas24h_user_annotation.png"
    public static let GAS24H_AGENT_48_ANNOTATION            = "icon_map_agent_48_48.png"
    public static let GAS24H_USER_48_ANNOTATION             = "icon_map_user_48_48.png"
    public static let LOGO_GAS_SERVICE_IMG_NAME             = "gasservice_logo.png"
    public static let LOGO_GAS_24H_IMG_NAME                 = "gas24h_logo.png"
    /** Contact image name */
    public static let CONTACT_IMG_NAME                      = "contact.png"
    /** Next icon image name */
    public static let NEXT_ICON_IMG_NAME                    = "ic_number_next.png"
    /** Back icon image name */
    public static let BACK_ICON_IMG_NAME                    = "ic_number_back.png"
    /** Phone image name */
    public static let PHONE_IMG_NAME                        = "phone-ios.png"
    /** Address image name */
    public static let ADDRESS_IMG_NAME                      = "icon34-user-iso.png"
    /** Menu image name */
    public static let MENU_IMG_NAME                         = "menubtn.png"
    /** Back image name */
    public static let BACK_IMG_NAME                         = "back.png"
    /** Back image name */
    public static let BACK_2_IMG_NAME                       = "back_2.png"
    /** Back image name */
    public static let DELETE_IMG_NAME                       = "delete.png"
    /** Uncheck image name */
    public static let UNCHECK_IMG_NAME                      = "checkbox-unchecked.png"
    /** Checked image name */
    public static let CHECKED_IMG_NAME                      = "checkbox-checked.png"
    /** Login image name */
    public static let LOGIN_MENU_IMG_NAME                   = "login.png"
    /** Logout image name */
    public static let LOGOUT_MENU_IMG_NAME                  = "logoutitem.png"
    /** Register image name */
    public static let REGISTER_MENU_IMG_NAME                = "register.png"
    /** Issue image name */
    public static let ISSUE_MENU_IMG_NAME                   = "issueMenu.png"
    /** Config image name */
    public static let CONFIG_MENU_IMG_NAME                  = "configuration.png"
    /** Training mode image name */
    public static let TRAINING_MODE_IMG_NAME                = "trainingMode.png"
    /** Information image name */
    public static let INFORMATION_IMG_NAME                  = "thongtin.png"
    /** Order gas image name */
    public static let ORDER_GAS_IMG_NAME                    = "ordergas.png"
    /** Logo of agent image name */
    public static let LOGO_AGENT_GAS_24H_IMG_NAME           = "logo_agent.png"
    /** Logo of agent image name */
    public static let LOGO_AGENT_GAS_SERVICE_IMG_NAME       = "icon10-active.png"
    /** Uphold request image name */
    public static let UPHOLD_REQUEST_IMG_NAME               = "upholdRequest.png"
    /** Uphold list image name */
    public static let UPHOLD_LIST_IMG_NAME                  = "UpHoldList.jpeg"
    /** Service rating image name */
    public static let SERVICE_RATING_IMG_NAME               = "ServiceRating.jpeg"
    /** Account image name */
    public static let ACCOUNT_IMG_NAME                      = "Account.jpeg"
    /** Done image name */
    public static let DONE_IMG_NAME                         = "done.png"
    /** Username image */
    public static let USERNAME_IMG_NAME                     = "icon2.png"
    /** Password image */
    public static let PASSWORD_IMG_NAME                     = "icon3.png"
    /** Login image */
    public static let LOGIN_IMG_NAME                        = "icon4-ios.png"
    /** Confirm image name */
    public static let CONFIRM_IMG_NAME                      = "icon20.png"
    /** Cancel image name */
    public static let CANCEL_IMG_NAME                       = "icon21.png"
    /** Cancel image name */
    public static let ADD_ICON_IMG_NAME                     = "cong.png"
    /** Rating image name */
    public static let RATING_IMG_NAME                       = "icon25.png"
    /** User name image */
    public static let USER_NAME_IMG_NAME                    = "icon32-user-iso.png"
    /** User phone image */
    public static let USER_PHONE_IMG_NAME                   = "icon33-user-iso.png"
    /** Save information image */
    public static let SAVE_INFO_IMG_NAME                    = "icon35-user-ios.png"
    /** Change password image */
    public static let CHANGE_PASS_IMG_NAME                  = "icon36-user-ios.png"
    /** Logout image */
    public static let LOGOUT_IMG_NAME                       = "icon37-user-ios.png"
    /** Old password image */
    public static let OLD_PASS_IMG_NAME                     = "icon38-user-ios.png"
    /** New password image */
    public static let NEW_PASS_IMG_NAME                     = "icon39-doimatkhau-ios.png"
    /** Order icon image */
    public static let ORDER_ICON_IMG_NAME                   = "ic_custom_order_top.png"
    /** Material selection logo image name */
    public static let MATERIAL_SELECTION_IMG_NAME           = "icon12.png"
    /** Promotion icon image name */
    public static let PROMOTION_ICON_IMG_NAME               = "icon13.png"
    /** Money icon image name */
    public static let MONEY_ICON_IMG_NAME                   = "icon16.png"
    /** Money icon image name */
    public static let AGENT_ICON_IMG_NAME                   = "icon17.png"
    /** Money icon image name */
    public static let PHONE_ICON_IMG_NAME                   = "icon18.png"
    /** Money icon image name */
    public static let SUPPORT_ICON_IMG_NAME                 = "icon19.png"
    /** Employee code image name */
    public static let EMPLOYEE_ICON_IMG_NAME                = "icon23.png"
    /** Default material image name */
    public static let DEFAULT_MATERIAL_IMG_NAME             = "icon24.png"
    /** Rating empty image name */
    public static let RATING_EMPTY_IMG_NAME                 = "icon27.png"
    /** Problem icon image name */
    public static let PROBLEM_ICON_IMG_NAME                 = "icon59.png"
    /** Save icon image name */
    public static let SAVE_ICON_IMG_NAME                    = "save.png"
    /** Human icon image name */
    public static let HUMAN_ICON_IMG_NAME                   = "icon47.png"
    /** Status icon image name */
    public static let STATUS_ICON_IMG_NAME                  = "icon48.png"
    /** Address icon image name */
    public static let ADDRESS_ICON_IMG_NAME                 = "icon49.png"
    /** Customer feeling image name: Normal */
    public static let COMMENT_IMG_NAME                      = "icon51.png"
    /** Customer feeling image name: Normal */
    public static let CUST_FEELING_NORMAL_IMG_NAME          = "icon52.png"
    /** Customer feeling image name: Glad */
    public static let CUST_FEELING_GLAD_IMG_NAME            = "icon53.png"
    /** Customer feeling image name: Sad */
    public static let CUST_FEELING_SAD_IMG_NAME             = "icon54.png"
    /** Customer icon image name */
    public static let CUSTOMER_ICON_IMG_NAME                = "icon55.png"
    /** Contact icon image name */
    public static let CONTACT_ICON_IMG_NAME                 = "icon58.png"
    /** Problem type icon image name */
    public static let PROBLEM_TYPE_IMG_NAME                 = "icon59.png"
    /** Content icon image name */
    public static let CONTENT_ICON_IMG_NAME                 = "icon60.png"
    /** Content icon image name */
    public static let REPORT_ICON_IMG_NAME                  = "icon62.png"
    /** Content icon image name */
    public static let CONTACT_HOTLINE_IMG_NAME              = "icon64.png"
    /** Content icon image name */
    public static let ORDER_ID_ICON_IMG_NAME                = "icon65.png"
    /** Content icon image name */
    public static let ORDER_STATUS_ICON_IMG_NAME            = "icon66.png"
    /** Content icon image name */
    public static let ORDER_CAR_NUMBER_ICON_IMG_NAME        = "icon67.png"
    /** Content icon image name */
    public static let ORDER_PAYMENT_METHOD_ICON_IMG_NAME    = "icon68.png"
    /** Money icon image name */
    public static let MONEY_ICON_GREY_IMG_NAME              = "icon69.png"
    /** Money icon image name */
    public static let MONEY_ICON_PAPER_IMG_NAME              = "icon70.png"
    /** Order icon image name */
    public static let ORDER_START_ICON_IMG_NAME             = "icon76.png"
    /** Order status new image name */
    public static let ORDER_STATUS_NEW_ICON_IMG_NAME        = "new-icon.png"
    /** Order status process image name */
    public static let ORDER_STATUS_PROCESS_ICON_IMG_NAME    = "icon80.png"
    /** Order status Cancel image name */
    public static let ORDER_STATUS_CANCEL_ICON_IMG_NAME     = "icon81.png"
    /** Type 1 backgroud image name */
    public static let TYPE_1_BKG_IMG_NAME                   = "bg1.jpg"
    /** Menu backgroud body image name */
    public static let MENU_BKG_BODY_IMG_NAME                = "bg_sliding_menu_body.jpg"
    /** Menu backgroud top image name */
    public static let MENU_BKG_TOP_IMG_NAME                 = "bg_sliding_menu_top.jpg"
    /** Menu item Home image name */
    public static let MENU_ITEM_HOME_IMG_NAME               = "ic_menu_home.png"
    /** Menu item Home image name */
    public static let MENU_ITEM_GIFT_IMG_NAME               = "ic_menu_gift.png"
    /** Menu item Profile image name */
    public static let MENU_ITEM_PROFILE_IMG_NAME            = "ic_menu_profile.png"
    /** Menu item Uphold list image name */
    public static let MENU_ITEM_UPHOLD_LIST_IMG_NAME        = "list.png"
    /** Menu item Message image name */
    public static let MENU_ITEM_MSG_IMG_NAME                = "message.png"
    /** Menu item Working report image name */
    public static let MENU_ITEM_WORKING_REPORT_IMG_NAME     = "report.png"
    /** Menu item Order list image name */
    public static let MENU_ITEM_ORDER_LIST_IMG_NAME         = "ic_menu_shoping_cart.png"
    //++ BUG0073-SPJ (NguyenPT 20170503) Add new function G08
    /** Menu item Family image name */
    public static let MENU_ITEM_FAMILY_IMG_NAME             = "ic_menu_family.png"
    /** Menu item Report image name */
    public static let MENU_ITEM_REPORT_IMG_NAME             = "ic_menu_report.png"
    /** Menu item Support image name */
    public static let MENU_ITEM_SUPPORT_IMG_NAME            = "ic_menu_support.png"
    /** Menu item Cash book image name */
    public static let MENU_ITEM_CASH_BOOK_IMG_NAME          = "ic_menu_cash_book.png"
    //-- BUG0073-SPJ (NguyenPT 20170503) Add new function G08
    /** Finish status image name */
    public static let FINISH_STATUS_IMG_NAME                = "icon29.png"
    /** Date time icon image name */
    public static let DATETIME_ICON_IMG_NAME                = "icon45.png"
    /** Category image name: VIP */
    public static let CATEGORY_VIP_IMG_NAME                 = "icon9.png"
    /** Category image name: VIP active */
    public static let CATEGORY_VIP_ACTIVE_IMG_NAME          = "icon9-active.png"
    /** Category image name: GAS */
    public static let CATEGORY_GAS_IMG_NAME                 = "icon10.png"
    /** Category image name: Uphold */
    public static let CATEGORY_UPHOLD_IMG_NAME              = "icon77.png"
    /** Category image name: GAS active */
    public static let CATEGORY_GAS_ACTIVE_IMG_NAME          = "icon10-active.png"
    /** Category image name: Utility */
    public static let CATEGORY_UTILITY_IMG_NAME             = "icon11.png"
    /** Category image name: GAS active */
    public static let CATEGORY_UTILITY_ACTIVE_IMG_NAME      = "icon11-active.png"
    /** Center marker image name */
    public static let CENTER_MARKER_IMG_NAME                = "ic_checkpoint.png"
    //++ BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    /** Search image name */
    public static let SEARCH_ICON_IMG_NAME                  = "search.png"
    //-- BUG0050-SPJ (NguyenPT 20170323) Add new key for new function G06
    /** Reload image */
    public static let RELOAD_IMG_NAME                       = "reload-1.png"
    /** Default image */
    public static let DEFAULT_IMG_NAME                      = "default-thumbnail.jpg"
    /** Edit image icon */
    public static let EDIT_ICON_IMG_NAME                    = "icon79.png"
    /** Report image icon */
    public static let REPORT_SUM_ICON_IMG_NAME              = "icon-baocao.png"
    /** Family image icon */
    public static let FAMILY_ICON_IMG_NAME                  = "hogiadinh.png"
    //++ BUG0102-SPJ (NguyenPT 20170604) Update function G11
    /** Ticket image icon */
    public static let TICKET_ICON_IMG_NAME                  = "ticket.png"
    /** Map image icon */
    public static let MAP_ICON_IMG_NAME                     = "map.png"
    /** Map image icon */
    public static let TICKET_REPLY_ICON_IMG_NAME            = "traloi.png"
    /** Map image icon */
    public static let TICKET_CLOSE_ICON_IMG_NAME            = "close.png"
    //-- BUG0102-SPJ (NguyenPT 20170604) Update function G11
    /** Cancel image name */
    public static let CLEAR_ALL_ICON_IMG_NAME               = "delete-all.png"
    /** Order type image name */
    public static let ORDER_TYPE_ICON_IMG_NAME              = "loaidonhang.png"
    /** Store card type image name */
    public static let STORE_CARD_TYPE_ICON_IMG_NAME         = "loaithekho.png"
    /** CCS code image name */
    public static let CCS_CODE_ICON_IMG_NAME                = "mapttt.png"
    /** Other task image name */
    public static let OTHER_TASK_ICON_IMG_NAME              = "tacvukhac.png"
    /** Add material image name */
    public static let ADD_MATERIAL_ICON_IMG_NAME            = "themvattu-2.png"
    /** Information image name */
    public static let SUPPORT_INFO_ICON_IMG_NAME            = "thongtinhotro.png"
    /** Cash type image name */
    public static let CASH_TYPE_ICON_IMG_NAME               = "thutien.png"
    /** Sum image name */
    public static let SUM_ICON_IMG_NAME                     = "tongcong.png"
    /** Version image name */
    public static let VERSION_TYPE_ICON_IMG_NAME            = "version.png"
    /** Version image name */
    public static let LOGO_LOGIN_ICON_IMG_NAME              = "logo_login.png"
    /** Version image name */
    public static let NEXT_BUTTON_ICON_IMG_NAME             = "nextbutton.png"
    /** Version image name */
    public static let LOGO_FACEBOOK_ICON_IMG_NAME           = "logo_fb.png"
    /** Version image name */
    public static let LOGO_ZALO_ICON_IMG_NAME               = "logo_zalo.png"
    /** Version image name */
    public static let CATEGORY_DETAIL_ICON_IMG_NAME         = "categoryDetail.png"
    /** Version image name */
    public static let CATEGORY_GAS_ICON_IMG_NAME            = "categoryGAS.png"
    /** Version image name */
    public static let CATEGORY_VIP_ICON_IMG_NAME            = "categoryVIP.png"
    /** Version image name */
    public static let ORDER_BUTTON_ICON_IMG_NAME            = "orderbtn.png"
    /** Version image name */
    public static let SUPPORT_BUTTON_ICON_IMG_NAME          = "supportbtn.png"
    /** Version image name */
    public static let PROMOTE_BUTTON_ICON_IMG_NAME          = "promoteBtn.png"
    /** Version image name */
    public static let GAS_BUTTON_ICON_IMG_NAME              = "gasbtn.png"
    /** Version image name */
    public static let PROCESSING_BUTTON_ICON_IMG_NAME       = "processingbtn.png"
    /** Version image name */
    public static let CONFIRMED_BUTTON_ICON_IMG_NAME        = "confirmedbtn.png"
    /** Version image name */
    public static let EMAIL_ICON_IMG_NAME                   = "icon_email.png"
    /** Version image name */
    public static let REFER_BUTTON_ICON_IMG_NAME            = "referBtn.png"
    /** Version image name */
    public static let CANCEL_ORDER_BUTTON_ICON_IMG_NAME     = "cancelOrderbtn.png"
    /** Version image name */
    public static let SOURCE_MARKER_IMG_NAME                = "sourceMarker.png"
    /** Version image name */
    public static let DESTINATION_MARKER_IMG_NAME           = "destinationMarker.png"
    /** Version image name */
    public static let COLLAPSE_BUTTON_ICON_IMG_NAME         = "collapseBtn.png"
    /** Version image name */
    public static let CHAT_BUTTON_ICON_IMG_NAME             = "chatbtn.png"
    /** Version image name */
    public static let PHONE_BUTTON_ICON_IMG_NAME            = "phonebtn.png"
    /** Version image name */
    public static let EDIT_BUTTON_ICON_IMG_NAME             = "editbtn.png"
    /** Version image name */
    public static let FINISH_BUTTON_ICON_IMG_NAME           = "finishbtn.png"
    /** Version image name */
    public static let DISCOUNT_PLUS_ICON_IMG_NAME           = "ic_discount_plus.png"
    /** Version image name */
    public static let DISCOUNT_SHARE_ICON_IMG_NAME           = "ic_discount_share.png"
    /** Menu backgroud body image name */
    public static let MENU_BKG_BODY_NEW_IMG_NAME            = "bg_sliding_menu_body_new.png"
    /** Menu backgroud top image name */
    public static let MENU_BKG_TOP_NEW_IMG_NAME             = "bg_sliding_menu_top_new.png"
    /** Login background image [iphone] */
    public static let LOGIN_BKG_IPHONE_IMG_NAME             = "signup_bg_1080_1920.png"
    /** Login background image [ipad] */
    public static let LOGIN_BKG_IPAD_IMG_NAME               = "signup_bg_1536_2048.png"
    /** Login background image [ipad landscape]*/
    public static let LOGIN_BKG_IPAD_LANDSCAPE_IMG_NAME     = "signup_bg_2048_1536.png"
    /** Order status image: Create - Active */
    public static let ORDER_STATUS_CREATE_ACTIVE_IMG_NAME       = "orderStatus_Create_Active.png"
    /** Order status image: Create - Inactive */
    public static let ORDER_STATUS_CREATE_INACTIVE_IMG_NAME     = "orderStatus_Create_Inactive.png"
    /** Order status image: Waiting confirm - Active */
    public static let ORDER_STATUS_WAITING_ACTIVE_IMG_NAME      = "orderStatus_Waiting_Active.png"
    /** Order status image: Waiting confirm - Inactive */
    public static let ORDER_STATUS_WAITING_INACTIVE_IMG_NAME    = "orderStatus_Waiting_Inactive.png"
    /** Order status image: Confirmed - Active */
    public static let ORDER_STATUS_CONFIRMED_ACTIVE_IMG_NAME    = "orderStatus_Confirmed_Active.png"
    /** Order status image: Confirmed - Inactive */
    public static let ORDER_STATUS_CONFIRMED_INACTIVE_IMG_NAME  = "orderStatus_Confirmed_Inactive.png"
    /** Order status image: Delivering - Active */
    public static let ORDER_STATUS_DELIVERING_ACTIVE_IMG_NAME   = "orderStatus_Delivering_Active.png"
    /** Order status image: Delivering - Inactive */
    public static let ORDER_STATUS_DELIVERING_INACTIVE_IMG_NAME = "orderStatus_Delivering_Inactive.png"
    /** Order status image: Complete - Active */
    public static let ORDER_STATUS_COMPLETE_ACTIVE_IMG_NAME     = "orderStatus_Complete_Active.png"
    /** Order status image: Complete - Inactive */
    public static let ORDER_STATUS_COMPLETE_INACTIVE_IMG_NAME   = "orderStatus_Complete_Inactive.png"
    /** Hotline image */
    public static let HOTLINE_IMG_NAME                          = "hotline.png"
    /** Status finish image */
    public static let STATUS_FINISH_IMG_NAME                    = "status_finish.png"
    /** Status finish [Small] image */
    public static let STATUS_FINISH_SMALL_IMG_NAME              = "status_finish_small.png"
    /** Status cancel [Small] image */
    public static let STATUS_CANCEL_SMALL_IMG_NAME              = "status_cancel_small.png"
    /** Status new [Small] image */
    public static let STATUS_NEW_SMALL_IMG_NAME                 = "status_new.png"
    /** Status waiting [Small] image */
    public static let STATUS_WAITING_SMALL_IMG_NAME             = "status_waiting.png"
    /** Name icon image */
    public static let NAME_ICON_IMG_NAME                        = "name_icon.png"
    /** Phone icon image */
    public static let PHONE_ICON_NEW_IMG_NAME                   = "phone_icon.png"
    /** Address icon image */
    public static let ADDRESS_ICON_NEW_IMG_NAME                 = "address_icon.png"
    //++ BUG0171-SPJ (NguyenPT 20171127	) Add new menu
    /** Menu item Promotion Policy */
    public static let MENU_ITEM_PROMOTION_POLICY                = "ic_page_promotion.png"
    /** Menu item App guide */
    public static let MENU_ITEM_APP_GUIDE                       = "ic_page_guide.png"
    /** Background of share content */
    public static let SHARE_BACKGROUND_IMG_NAME                 = "background_share.jpg"
    /** Background of share content */
    public static let SHARE_ICON_IMG_NAME                       = "icon_share.png"
    /** Image qr code */
    public static let QR_CODE_ICON_IMG_NAME                     = "icon_qr.png"
    /** Image qr code */
    public static let MENU_NOTICE_ICON_IMG_NAME                 = "ico-menu-notice.png"
    public static let MENU_MAP_ICON_IMG_NAME                    = "ico-menu-map.png"
    
    /** HTTP Post request method */
    public static let HTTP_POST_REQUEST                     = "POST"
    /** HTTP Post request method */
    public static let GOOGLE_API_KEY                        = "AIzaSyCOXWFIXGsvZqkOziYt5CQj7Y-bB7Ej40U"
    /** HTTP Post request method */
    public static let GOOGLE_API_KEY1                       = "AIzaSyDw5SP_bZzyuO130sTtioXwd25JfOKyjEk"
    
    // MARK: -----Version code-----
    public static let VERSION_CODE                          = Bundle.main.releaseVersionNumber!
    public static let VERSION_BUILD_NUMBER                  = Bundle.main.buildVersionNumber!
    public static let VERSION_CODE_WITH_NAME                = String.init(format: "%@ %@.%@",
                                                                          BaseModel.shared.getAppName(),
                                                                          VERSION_CODE,
                                                                          VERSION_BUILD_NUMBER)
    public static let COMPANY_NAME                          = "@2016 Southern Petroleum"
    public static let VERSION_CODE_FULL_NAME                = String.init(format: "%@ %@",
                                                                          VERSION_CODE_WITH_NAME,
                                                                          COMPANY_NAME)
    public static let EMAIL                                 = "it@spj.vn"
    public static let WEBSITE                               = "http://daukhimiennam.com"
    public static let VERSION_CODE_STR                      = "110"
    
    
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
    public static let CONTENT00140 = "vd: 0123456789-0908070605"
    public static let CONTENT00141 = "Cập nhật"
    public static let CONTENT00142 = "Đã có phiên bản mới, vui lòng cập nhật!"
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
    public static let CONTENT00163 = "Đầu tư"
    public static let CONTENT00168 = "Gửi báo cáo công việc"
    public static let CONTENT00170 = "Số điện thoại người nhận"
    public static let CONTENT00176 = "Không tìm thấy đại lý quanh vị trí hiện tại!"
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
    //public static let CONTENT00196 = "Lỗi kết nối đến máy chủ"
    public static let CONTENT00196 = "Lỗi kết nối internet. Bạn có muốn tải lại không?"
    public static let CONTENT00197 = "Chức năng đã bị khoá, vui lòng thử lại sau!"
    public static let CONTENT00198 = "Thông tin phiên bản"
    public static let CONTENT00199 = "Email góp ý"
    public static let CONTENT00200 = "Trang chủ"
    public static let CONTENT00201 = "Xin vui lòng chọn Loại sự cố"
    public static let CONTENT00202 = "Hủy"
    public static let CONTENT00203 = "Sự cố khác"
    public static let CONTENT00204 = "Xin vui lòng chọn Người liên hệ"
    public static let CONTENT00205 = "Bạn đang gửi thông tin sự cố như bên dưới cho chúng tôi. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00206 = "Xin vui lòng đánh giá Mức độ hài lòng"
    public static let CONTENT00207 = "Xin vui lòng đánh giá Nhân viên bảo trì"
    public static let CONTENT00208 = "Nội dung cần đánh giá và góp ý"
    public static let CONTENT00209 = "Xin cảm ơn quý khách hàng đã đánh giá dịch vụ của chúng tôi. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu quý khách hàng đồng ý."
    public static let CONTENT00210 = "Mức hài lòng"
    public static let CONTENT00212 = "Xem ảnh"
    public static let CONTENT00217 = "Xác nhận"
    public static let CONTENT00218 = "Tổng cộng"
    public static let CONTENT00219 = "Khuyến mãi"
    public static let CONTENT00220 = "Hủy bỏ"
    public static let CONTENT00222 = "Thêm mã khuyến mại"
    public static let CONTENT00223 = "Xem"
    public static let CONTENT00224 = "Để sau"
    public static let CONTENT00225 = "Bảo trì miễn phí"
    public static let CONTENT00226 = "Gas24h"
    public static let CONTENT00227 = "Quên mật khẩu?"
    public static let CONTENT00228 = "Tạo tài khoản mới"
    public static let CONTENT00229 = "Lưu thông tin"
    public static let CONTENT00230 = "Xác thực"
    public static let CONTENT00231 = "Đơn hàng"
    public static let CONTENT00232 = "Chi tiết đơn hàng"
    public static let CONTENT00233 = "Nhân viên giao hàng"
    public static let CONTENT00234 = "Camera"
    public static let CONTENT00235 = "Thư viện"
    public static let CONTENT00236 = "Mua hàng"
    public static let CONTENT00237 = "Chọn loại gas"
    public static let CONTENT00238 = "Chọn quà tặng"
    public static let CONTENT00239 = "Chiết khấu"
    public static let CONTENT00240 = "Đại lý"
    public static let CONTENT00241 = "Gọi GAS"
    public static let CONTENT00242 = "Hỗ trợ Khách hàng"
    public static let CONTENT00243 = "Địa chỉ người nhận"
    public static let CONTENT00244 = "Không lấy quà"
    public static let CONTENT00245 = "Mã nhân viên"
    public static let CONTENT00246 = "Bù vỏ"
    public static let CONTENT00247 = "Khuyến mãi"
    public static let CONTENT00248 = "Hết hạn vào"
    public static let CONTENT00249 = "Nhập mã khuyến mãi"
    public static let CONTENT00250 = "Mã khuyến mãi"
    public static let CONTENT00251 = "Thử lại"
    public static let CONTENT00252 = "Đặt hàng"
    public static let CONTENT00253 = "Thông tin đơn hàng"
    public static let CONTENT00254 = "Loại bình"
    public static let CONTENT00255 = "Số lượng"
    public static let CONTENT00256 = "Quý khách chắc chắn muốn hủy đơn hàng?"
    public static let CONTENT00257 = "Mã đơn hàng"
    public static let CONTENT00258 = "Số xe"
    public static let CONTENT00259 = "Hình thức thanh toán"
    public static let CONTENT00260 = "Tiền gas"
    public static let CONTENT00261 = "Tiền gas dư"
    public static let CONTENT00262 = "Tổng thanh toán"
    public static let CONTENT00263 = "Thông tin vỏ"
    public static let CONTENT00279 = "Bạn không có quyền sử dụng chức năng này"
    public static let CONTENT00280 = "Đăng xuất thành công"
    public static let CONTENT00281 = "KH Hộ gia đình"
    public static let CONTENT00282 = "Từ ngày"
    public static let CONTENT00283 = "Đến ngày"
    public static let CONTENT00284 = "Tất cả"
    public static let CONTENT00285 = "Đã mua"
    public static let CONTENT00286 = "Chưa mua"
    public static let CONTENT00287 = "Tìm kiếm"
    public static let CONTENT00288 = "Thông tin khách hàng"
    public static let CONTENT00289 = "Loại khách hàng"
    public static let CONTENT00290 = "Vị trí"
    public static let CONTENT00291 = "Loại điểm"
    public static let CONTENT00292 = "Thời gian dự kiến hết gas"
    public static let CONTENT00293 = "Thương hiệu đối thủ"
    public static let CONTENT00294 = "Tên đối thủ"
    public static let CONTENT00295 = "Báo cáo công việc"
    public static let CONTENT00296 = "Chi tiết báo cáo"
    public static let CONTENT00297 = "Bạn đang gửi thông tin Khách hàng như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00298 = "Tỉnh/Thành Phố"
    public static let CONTENT00299 = "Quận/Huyện"
    public static let CONTENT00300 = "Phường/Xã"
    public static let CONTENT00301 = "Xin vui lòng nhập Địa chỉ của Khách hàng"
    public static let CONTENT00302 = "Xin vui lòng nhập Thông tin thêm"
    public static let CONTENT00303 = "Thương hiệu"
    public static let CONTENT00304 = "T.gian sử dụng"
    public static let CONTENT00305 = "Xin vui lòng chọn Loại khách hàng"
    public static let CONTENT00306 = "Xin vui lòng chọn Vật tư đầu tư"
    public static let CONTENT00307 = "Tạo Báo cáo công việc"
    public static let CONTENT00308 = "Xin vui lòng nhập Nội dung báo cáo"
    public static let CONTENT00309 = "Bạn đang gửi thông tin Báo cáo như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00310 = "Đơn hàng Hộ gia đình"
    public static let CONTENT00311 = "Hoàn thành"
    public static let CONTENT00312 = "Thêm sản phẩm"
    public static let CONTENT00313 = "Quà khuyến mãi"
    public static let CONTENT00314 = "Chọn loại sản phẩm"
    public static let CONTENT00315 = "Vật tư Vỏ"
    public static let CONTENT00316 = "Vật tư Khác"
    public static let CONTENT00317 = "Bạn muốn xoá vật tư này?"
    public static let CONTENT00318 = "Thu tiền"
    public static let CONTENT00319 = "Chọn lý do hủy đơn hàng"
    public static let CONTENT00320 = "Hủy đơn hàng"
    public static let CONTENT00321 = "Chọn vật tư"
    public static let CONTENT00322 = "Xác nhận đơn hàng thành công. Bạn có muốn xem chi tiết đơn hàng hay không?"
    public static let CONTENT00323 = "Hủy xác nhận đơn hàng thành công."
    public static let CONTENT00324 = "Bạn chưa nhập vỏ thu về cho đơn hàng này. Bạn có chắc tiếp tục thao tác thu tiền?"
    public static let CONTENT00325 = "Thêm vỏ"
    public static let CONTENT00326 = "Tiếp tục"
    public static let CONTENT00327 = "Xác nhận hủy đơn hàng?"
    public static let CONTENT00328 = "Đang giao hàng"
    public static let CONTENT00329 = "Đang xử lý đơn hàng"
    public static let CONTENT00330 = "Đã giao"
    public static let CONTENT00331 = "Đã huỷ"
    public static let CONTENT00332 = "Đơn hàng Bò Mối"
    public static let CONTENT00333 = "Gas"
    public static let CONTENT00334 = "Thực tế"
    public static let CONTENT00335 = "Tên"
    public static let CONTENT00336 = "Serial"
    public static let CONTENT00337 = "Vỏ"
    public static let CONTENT00338 = "Cân"
    public static let CONTENT00339 = "Dư"
    public static let CONTENT00340 = "Ngày giao hàng"
    public static let CONTENT00341 = "Thêm vật tư"
    public static let CONTENT00342 = "Tiền mặt"
    public static let CONTENT00343 = "Xoá vật tư"
    public static let CONTENT00344 = "Cập nhật số lượng giao"
    public static let CONTENT00345 = "Cập nhật thông tin vỏ"
    public static let CONTENT00346 = "Khối lượng vỏ bình"
    public static let CONTENT00347 = "Khối lượng vỏ bình + gas dư"
    public static let CONTENT00348 = "Xác nhận hoàn thành đơn hàng?"
    public static let CONTENT00349 = "Xác nhận hủy đơn hàng với lý do: %@?"
    public static let CONTENT00350 = "Giá gas"
    public static let CONTENT00351 = "Cập nhật số lượng đặt hàng"
    public static let CONTENT00352 = "Danh sách Thẻ kho"
    public static let CONTENT00353 = "Tạo Thẻ kho"
    public static let CONTENT00354 = "Chi tiết Thẻ kho"
    public static let CONTENT00355 = "Ngày nhập xuất"
    public static let CONTENT00356 = "Mã Thẻ kho"
    public static let CONTENT00357 = "Loại Thẻ kho"
    public static let CONTENT00358 = "Tổng số"
    public static let CONTENT00359 = "Xin vui lòng chọn đối tượng để tạo Thẻ kho"
    public static let CONTENT00360 = "Khách hàng"
    public static let CONTENT00361 = "Xoá thông tin"
    public static let CONTENT00362 = "Chức năng hiện đang hoàn thiện. Xin vui lòng thử lại sau"
    public static let CONTENT00363 = "Xin vui lòng chọn Ngày nhập xuất"
    public static let CONTENT00364 = "Ngày nhập xuất"
    public static let CONTENT00365 = "Hôm nay"
    public static let CONTENT00366 = "Bạn đang gửi thông tin Thẻ kho như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00367 = "Xin vui lòng chọn Vật tư"
    public static let CONTENT00368 = "Xin nhập thông tin Ghi chú"
    public static let CONTENT00369 = "Mật khẩu mới phải khác mật khẩu cũ!"
    public static let CONTENT00370 = "Loại hỗ trợ"
    public static let CONTENT00371 = "Loại bán hàng"
    public static let CONTENT00372 = "Thu"
    public static let CONTENT00373 = "Chi"
    public static let CONTENT00374 = "Xin vui lòng chọn khách hàng"
    public static let CONTENT00375 = "Bạn đang gửi thông tin Đơn hàng Bò/Mối như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00376 = "Tạo đơn hàng"
    public static let CONTENT00377 = "Xin vui lòng chọn Đại lý giao hàng"
    public static let CONTENT00378 = "Bạn có muốn thoát ra không?"
    public static let CONTENT00379 = "Bình gas 50Kg"
    public static let CONTENT00380 = "Bình gas 45Kg"
    public static let CONTENT00381 = "Bình gas 12Kg"
    public static let CONTENT00382 = "Bình gas 6Kg"
    public static let CONTENT00383 = "Số điện thoại mới"
    public static let CONTENT00384 = "Bình 50kg"
    public static let CONTENT00385 = "Bình 45kg"
    public static let CONTENT00386 = "Bình 12kg"
    public static let CONTENT00387 = "Bình 6kg"
    public static let CONTENT00388 = "Quỹ tiền mặt"
    public static let CONTENT00389 = "Bạn đang gửi thông tin Thu-Chi như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00390 = "Tạo Thu chi"
    public static let CONTENT00391 = "Xin vui lòng chọn đối tượng để tạo Thu chi"
    public static let CONTENT00392 = "Loại Thu chi"
    public static let CONTENT00393 = "Xin vui lòng chọn số điện thoại"
    public static let CONTENT00394 = "Số tiền"
    public static let CONTENT00395 = "Xin vui lòng nhập Số tiền"
    public static let CONTENT00396 = "Cập nhật Thẻ kho"
    public static let CONTENT00397 = "Cập nhật Thu chi"
    public static let CONTENT00398 = "Xin vui lòng chọn Loại Thu chi"
    public static let CONTENT00399 = "Chi tiết Thu chi"
    public static let CONTENT00400 = "Lịch thu tiền"
    public static let CONTENT00401 = "Chọn thao tác"
    public static let CONTENT00402 = "Tạo Ticket"
    public static let CONTENT00403 = "Báo cáo vật tư"
    public static let CONTENT00404 = "Báo cáo hộ gia đình"
    public static let CONTENT00405 = "Báo cáo Quỹ tiền mặt"
    public static let CONTENT00406 = "T.Đầu"
    public static let CONTENT00407 = "Nhập"
    public static let CONTENT00408 = "Xuất"
    public static let CONTENT00409 = "T.Cuối"
    public static let CONTENT00410 = "Refresh"
    public static let CONTENT00411 = "Vật tư"
    public static let CONTENT00412 = "Từ"
    public static let CONTENT00413 = "Đến"
    public static let CONTENT00414 = "Doanh thu"
    public static let CONTENT00415 = "SL"
    public static let CONTENT00416 = "Giá"
    public static let CONTENT00417 = "Thành tiền"
    public static let CONTENT00418 = "Tồn"
    public static let CONTENT00419 = "Loại"
    public static let CONTENT00420 = "Bảo trì HGĐ"
    public static let CONTENT00421 = "Mã bảo trì"
    public static let CONTENT00422 = "Đang xử lý"
    public static let CONTENT00423 = "Đã xử lý xong"
    public static let CONTENT00424 = "Ticket"
    public static let CONTENT00425 = "Thông tin hỗ trợ"
    public static let CONTENT00426 = "Chi tiết hỗ trợ"
    public static let CONTENT00427 = "Trả lời Ticket"
    public static let CONTENT00428 = "Nội dung trả lời"
    public static let CONTENT00429 = "Bạn chưa nhập nội dung trả lời"
    public static let CONTENT00430 = "Xác nhận đóng ticket?"
    public static let CONTENT00431 = "Xin nhập thông tin cần hỗ trợ"
    public static let CONTENT00432 = "Bạn đang gửi thông tin cần hỗ trợ như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00433 = "Người xử lý"
    public static let CONTENT00434 = "Nợ"
    public static let CONTENT00435 = "Tìm kiếm Khách hàng"
    public static let CONTENT00436 = "Tác vụ khác"
    public static let CONTENT00437 = "Xin chọn tác vụ cần thực hiện"
    public static let CONTENT00438 = "Xác nhận đơn hàng nợ"
    public static let CONTENT00439 = "Bạn đang gửi thông tin Xác nhận đơn hàng nợ như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00440 = "Chi gas dư"
    public static let CONTENT00441 = "Cập nhật phiên bản"
    public static let CONTENT00442 = "Cập nhật tài khoản"
    public static let CONTENT00443 = "Email"
    public static let CONTENT00444 = "Bạn đang gửi thông tin Cập nhật tài khoản như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00445 = "PTTT Code"
    public static let CONTENT00446 = "Chọn chi nhánh"
    public static let CONTENT00447 = "Id khách hàng đang rỗng"
    public static let CONTENT00448 = "Vui lòng đánh giá dịch vụ của chúng tôi"
    public static let CONTENT00449 = "Bạn cần chúng tôi cải thiện về?"
    public static let CONTENT00450 = "Rất vui vì bạn hài lòng với dịch vụ của chúng tôi. Bán có thêm nhận xét gì không nào?"
    public static let CONTENT00451 = "Thái độ"
    public static let CONTENT00452 = "Tay nghề"
    public static let CONTENT00453 = "Đúng giờ"
    public static let CONTENT00454 = "An toàn"
    public static let CONTENT00455 = "Vật tư"
    public static let CONTENT00456 = "Khác"
    public static let CONTENT00457 = "Bổ sung ý kiến của bạn"
    public static let CONTENT00458 = "Chuyển đại lý giao hàng"
    public static let CONTENT00459 = "Bạn đang gửi thông tin Thay đổi đại lý giao hàng như bên dưới. Xin hãy kiểm tra lại các thông tin cho thật chính xác và nhấn nút Gửi nếu bạn đồng ý."
    public static let CONTENT00460 = "Đại lý hiện tại"
    public static let CONTENT00461 = "Đại lý mới"
    public static let CONTENT00462 = "Bạn chưa chọn Đại lý cần chuyển"
    public static let CONTENT00463 = "Bạn vừa chọn Đại lý cần chuyển là Đại lý hiện tại. Xin hãy kiểm tra lại lần nữa."
    public static let CONTENT00464 = "Xoá tất cả"
    public static let CONTENT00465 = "Bạn có muốn xoá tất cả vỏ?"
    public static let CONTENT00466 = "Seri"
    //public static let CONTENT00467 = "Trừ tiền thiếu đầu vào"
    public static let CONTENT00467 = "Số Kg thiếu"
    public static let CONTENT00468 = "Giảm giá"
    public static let CONTENT00469 = "Điều hướng"
    public static let CONTENT00470 = "Thêm hình từ camera"
    public static let CONTENT00471 = "Thêm hình từ thư viện"
    public static let CONTENT00472 = "---------- hoặc ----------"
    public static let CONTENT00473 = "Sử dụng tài khoản Facebook"
    public static let CONTENT00474 = "Sử dụng tài khoản Zalo"
    public static let CONTENT00475 = "Nhập mã pin"
    public static let CONTENT00476 = "Mã pin"
    public static let CONTENT00477 = "Mã pin vừa được gửi đến số điện thoại"
    public static let CONTENT00478 = "Vui lòng xem tin nhắn"
    public static let CONTENT00479 = "và nhập mã pin vào ô bên trên để"
    public static let CONTENT00480 = "hoàn tất đăng ký sử dụng ứng dụng"
    public static let CONTENT00481 = "Chưa nhận được mã PIN?"
    public static let CONTENT00482 = "Gửi lại"
    public static let CONTENT00483 = "Chạm vào biểu tượng để đặt gas"
    public static let CONTENT00484 = "Hỗ trợ"
    public static let CONTENT00485 = "Chọn gas"
    public static let CONTENT00486 = "Chọn quà"
    public static let CONTENT00487 = "Đơn hàng của bạn đang được xử lý"
    public static let CONTENT00488 = "vui lòng chờ trong giây lát..."
    public static let CONTENT00489 = "Đơn hàng hoàn tất!"
    public static let CONTENT00490 = "Chạm vào biểu tượng để xem hoá đơn."
    public static let CONTENT00491 = "Cám ơn Quý Khách"
    public static let CONTENT00492 = "Giới thiệu người thân cài đặt ứng dụng, NHẬN MÃ GIẢM GIÁ"
    public static let CONTENT00493 = "Nhân viên giao gas"
    public static let CONTENT00494 = "Chưa nhập mã pin"
    public static let CONTENT00495 = "Bạn có thể chọn loại Gas và Quà trước khi đặt Gas\nHoặc chờ nhân viên Gas24h liên hệ để xác nhận"
    public static let CONTENT00496 = "Quý khách vui lòng chờ trong giây lát\nNhân viên Gas24h sẽ liên hệ Quý khách trong vài phút"
    public static let CONTENT00497 = "Quý khách vừa hoàn tất đơn hàng đầu tiên\nĐiểm thưởng +300. Tổng số điểm hiện tại 4300"
    public static let CONTENT00498 = "Chạm vào đơn hàng XXXXXX để xem lại chi tiết\nLộ trình giao hàng khoảng 3km"
    public static let CONTENT00499 = "Giới thiệu"
    public static let CONTENT00500 = "Sử dụng mã"
    public static let CONTENT00501 = "Mã code"
    public static let CONTENT00502 = "QR code"
    public static let CONTENT00503 = "Chia sẻ mã KM"
    public static let CONTENT00504 = "Thêm mã khuyến mãi"
    public static let CONTENT00505 = "Đơn hàng của bạn đã bị huỷ"
    public static let CONTENT00506 = "Hoá đơn mua hàng"
    public static let CONTENT00507 = "Bình chọn"
    public static let CONTENT00508 = "Sai số điện thoại?"
    public static let CONTENT00509 = "Trở về"
    public static let CONTENT00510 = "Xin quý khách vui lòng nhập số điện thoại để nhân viên Gas24h liên hệ với quý khách"
    public static let CONTENT00511 = "Người dùng không cho phép"
    public static let CONTENT00512 = "Trạng thái đơn hàng"
    public static let CONTENT00513 = "Chờ\nxác nhận"
    public static let CONTENT00514 = "Đã\nxác nhận"
    public static let CONTENT00515 = "Đang\ngiao gas"
    public static let CONTENT00516 = "Xem trước đơn hàng"
    public static let CONTENT00517 = "Thay đổi"
    public static let CONTENT00518 = "Thông tin giao hàng"
    public static let CONTENT00519 = "Tiếp tục đơn hàng"
    public static let CONTENT00520 = "Đơn hàng\nhoàn tất"
    public static let CONTENT00521 = "Đơn hàng của bạn đã được xác nhận."
    public static let CONTENT00522 = "Chúng tôi sẽ gọi cho bạn trong giây lát!"
    public static let CONTENT00523 = "Loại gas được chọn sẽ được mặc định trong đơn hàng nếu Quý khách không thay đổi"
    public static let CONTENT00524 = "Chọn loại gas"
    public static let CONTENT00525 = "Điểm thưởng hiện tại: 500 điểm\nĐặt 1 bình gas mới, điểm thưởng 300 điểm\nBạn có thể chọn quà đến 800 điểm"
//    public static let CONTENT00526 = "Chia sẻ mã giới thiệu của bạn: %@ hoặc truy cập địa chỉ: %@"
    public static let CONTENT00526 = "Dùng mã giới thiệu %@ trong ứng dụng Gas24h để nhận ưu đãi. Truy cập địa chỉ: %@ để tải ứng dụng."
    public static let CONTENT00527 = "Lịch sử đơn hàng"
    public static let CONTENT00528 = "Thông tin tài khoản"
    public static let CONTENT00529 = "Bật dịch vụ định vị để ứng dụng tự động tìm thấy địa chỉ giao hàng"
    public static let CONTENT00530 = "Thông tin chưa được lưu lại, bạn chắc chắn muốn huỷ?"
    public static let CONTENT00531 = "Quà tặng"
    public static let CONTENT00532 = "Không lấy quà"
    public static let CONTENT00533 = "Nội dung đang được cập nhật"
    public static let CONTENT00534 = "Bạn đã giới thiệu %d người sử dụng"
    public static let CONTENT00535 = "Bạn đang có %@ điểm thưởng"
    public static let CONTENT00536 = "Chính sách khuyến mãi"
    public static let CONTENT00537 = "Hướng dẫn sử dụng"
    public static let CONTENT00538 = "Chia sẻ với bạn bè"
    public static let CONTENT00539 = "---------- Hỗ trợ ----------"
    public static let CONTENT00540 = "Chưa nhập mã pin"
    public static let CONTENT00541 = "Đóng"
    public static let CONTENT00542 = "Tin nhắn từ Gas24h"
    public static let CONTENT00543 = "Đặt gas ngay"
    public static let CONTENT00544 = "Chi tiết khuyến mãi"
    public static let CONTENT00545 = "Hệ thống Đại lý"
    public static let CONTENT00546 = "Vị trí hiện tại"
}
