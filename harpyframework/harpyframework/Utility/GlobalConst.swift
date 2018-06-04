//
//  GlobalConst.swift
//  harpyframework
//
//  Created by SPJ on 12/17/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
public class GlobalConst {    
    // ----- Size of control -----
    public static var SCREEN_WIDTH                      : CGFloat = UIScreen.main.bounds.width
    public static var SCREEN_HEIGHT                     : CGFloat = UIScreen.main.bounds.height
    public static let BUTTON_HEIGHT                     : CGFloat = 50.0
    public static var PARENT_BORDER_WIDTH               : CGFloat = 0.0
    public static let BUTTON_BORDER_WIDTH               : CGFloat = 1.0
    public static let BUTTON_CORNER_RADIUS              : CGFloat = 7.0
    public static let STATUS_BAR_HEIGHT                 : CGFloat = 20.0
    public static let NAV_BAR_HEIGHT                    : CGFloat = 44.0
    public static let SEARCH_BOX_HEIGHT                 : CGFloat = 44.0
    public static let POPOVER_WIDTH                     : CGFloat = SCREEN_WIDTH * 2 / 3
    public static let LABEL_HEIGHT                      : CGFloat = 34.0
    public static let CELL_HEIGHT_SHOW                  : CGFloat = 100.0
    public static let CELL_HEIGHT_HIDE                  : CGFloat = 0.0
    public static let CELL_BORDER_WIDTH                 : CGFloat = 2.0
    public static let CELL_IN_SEARCHBAR_TABLE_HEIGHT    : CGFloat = 50.0
    public static let LOGIN_USERNAME_EDITTEXT_X         : CGFloat = 30.0
    public static let LOGIN_USERNAME_EDITTEXT_Y         : CGFloat = 230.0
    public static let LOGIN_PASSWORD_EDITTEXT_Y         : CGFloat = 280.0
    public static let LOGIN_SHOWPASS_CHECKBOX_Y         : CGFloat = 340.0
    public static let LOGIN_SHOWPASS_LABEL_X            : CGFloat = 50.0
    public static let LOGIN_SHOWPASS_LABEL_Y            : CGFloat = 338.0
    public static let LOGIN_LOGIN_BUTTON_Y              : CGFloat = 400.0
    public static let LOGIN_REGISTER_BUTTON_Y           : CGFloat = 450.0
    public static let EDITTEXT_W                        : CGFloat = SCREEN_WIDTH - 30.0
    public static let EDITTEXT_H                        : CGFloat = 30.0
    public static let CHECKBOX_W                        : CGFloat = 20.0
    public static let CHECKBOX_H                        : CGFloat = 20.0
    public static let LABEL_W                           : CGFloat = 120.0
    public static let LABEL_H                           : CGFloat = 20.0
    public static let BUTTON_W                          : CGFloat = SCREEN_WIDTH - 50.0
    public static let BUTTON_H                          : CGFloat = 40.0
    public static let LOGIN_BUTTON_CORNER_RADIUS        : CGFloat = 20.0
    public static let MENU_BUTTON_W                     : CGFloat = 30.0
    public static let MENU_BUTTON_H                     : CGFloat = 25.0
    public static let NOTIFY_BUTTON_H                   : CGFloat = 30.0
    public static let LOGIN_LOGO_W                      : CGFloat = 250.0
    public static let LOGIN_LOGO_H                      : CGFloat = 140.0
    public static let NAVIGATION_BAR_H                  : CGFloat = 70.0
    public static let MARGIN                            : CGFloat = 10.0
    public static let MARGIN_CELL_Y                     : CGFloat = 1.0
    public static let MARGIN_CELL_X                     : CGFloat = 3.0
    public static let ACCOUNT_AVATAR_W                  : CGFloat = 140.0
    public static let ACCOUNT_AVATAR_H                  : CGFloat = 140.0
    public static let ACCOUNT_ICON_SIZE                 : CGFloat = 35.0
    public static let SCROLL_BUTTON_LIST_HEIGHT         : CGFloat = BUTTON_HEIGHT / 5.0
    public static let STEPPER_LAYOUT_HEIGHT             : CGFloat = 29.0
    public static let STEPPER_LAYOUT_WIDTH              : CGFloat = 94.0
    public static let RATING_BAR_HEIGHT                 : CGFloat = GlobalConst.LABEL_HEIGHT * 1.5
    
    public static let NORMAL_FONT_SIZE                  : CGFloat = UIFont.systemFontSize
    public static let NORMAL_FONT_SIZE_1                : CGFloat = 13.0
    public static let SMALL_FONT_SIZE                   : CGFloat = 10.0
    public static let BIG_FONT_SIZE                     : CGFloat = 14.0
    public static let LARGE_FONT_SIZE                   : CGFloat = 18.0
    //++ BUG0048-SPJ (NguyenPT 20170309) Create navigation bar
    public static let NOTIFY_FONT_SIZE                  : CGFloat = 25.0
    //-- BUG0048-SPJ (NguyenPT 20170309) Create navigation bar
    public static let NORMAL_FONT_SIZE_LIST             : CGFloat = 13.0
    public static let SMALL_FONT_SIZE_LIST              : CGFloat = 11.0
    public static let TEXTFIELD_FONT_SIZE               : CGFloat = 12.0
    public static let BUTTON_FONT_SIZE                  : CGFloat = NORMAL_FONT_SIZE
    public static let LABEL_IN_CELL_HEIGHT              : CGFloat = (GlobalConst.CELL_HEIGHT_SHOW - GlobalConst.MARGIN_CELL_Y * 2) / 5
    
    public static let ICON_SIZE                         : CGFloat = GlobalConst.CELL_HEIGHT_SHOW / 5
    
    public static let BUTTON_CATEGORY_SIZE              : CGFloat = 40.0
    public static let CENTER_MARKER_SIZE_WIDTH          : CGFloat = 20.0
    public static let CENTER_MARKER_SIZE_HEIGHT         : CGFloat = 40.0
    
    public static let MATERIAL_SELECTION_WIDTH          : CGFloat = GlobalConst.SCREEN_WIDTH / 4
    public static let MATERIAL_SELECTION_HEIGHT         : CGFloat = MATERIAL_SELECTION_WIDTH * 2
    public static let CONFIGURATION_ITEM_HEIGHT         : CGFloat = 44.0
    public static let CONFIGURATION_ITEM_RIGHT_SIZE     : CGFloat = 15.0
    public static let BASE_FONT_SIZE                    : CGFloat = UIFont.systemFontSize
    public static let BASE_FONT                         : UIFont = UIFont.systemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
    public static let BASE_ITALIC_FONT                  : UIFont = UIFont.italicSystemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
    public static let BASE_BOLD_FONT                    : UIFont = UIFont.boldSystemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
    public static let PREVIEW_LABEL_FONT_SIZE           : CGFloat = 20.0
    public static let BASE_SMALL_FONT                   : UIFont = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    
    
    // ----- Color defines -----
    /** Application main color */
    //public static let MAIN_COLOR:                  = ColorFromRGB().getColorFromRGB(0xF00020)
    public static let MAIN_COLOR                    = ColorFromRGB().getColorFromRGB(0xFC4513)
    public static let MAIN_COLOR_GAS_24H            = ColorFromRGB().getColorFromRGB(0xED1A3B)
    public static let BUTTON_COLOR_RED_TRUE         = ColorFromRGB().getColorFromRGB(0xF00020)
    public static var TRAINING_COLOR                = ColorFromRGB().getColorFromRGB(0x08C011)
//    public static var TRAINING_COLOR              = ColorFromRGB().getColorFromRGB(0xF00020)
    public static var BUTTON_COLOR_RED              = MAIN_COLOR
    public static let BUTTON_COLOR_GRAY             = ColorFromRGB().getColorFromRGB(0xD5D5D5)
    public static let BUTTON_COLOR_YELLOW           = ColorFromRGB().getColorFromRGB(0xFF9E19)
    public static let BUTTON_COLOR_YELLOW_NEW       = ColorFromRGB().getColorFromRGB(0xFAA61A)
    public static let BUTTON_COLOR_DISABLE          = ColorFromRGB().getColorFromRGB(0x535353)
    public static let COLOR_SELECTING_GREEN         = ColorFromRGB().getColorFromRGB(0x08C011)
    public static let PARENT_BORDER_COLOR_GRAY      = UIColor.gray
    public static let TEXT_COLOR_GRAY               = ColorFromRGB().getColorFromRGB(0x666666)
    public static let PARENT_BORDER_COLOR_YELLOW    = UIColor.yellow
    public static let BACKGROUND_COLOR_GRAY         = ColorFromRGB().getColorFromRGB(0xECECEC)
    //public static let TEXT_COLOR_GRAY               = ColorFromRGB().getColorFromRGB(0x9FA0A2)
    public static let SCROLLBUTTONLIST_BKG_COLOR    = BUTTON_COLOR_GRAY
    public static let INFOR_TITLE_COLOR             = ColorFromRGB().getColorFromRGB(0x1899E5)
    public static let TEXT_COLOR                    = ColorFromRGB().getColorFromRGB(0x333333)
    public static let BORDER_TEXTFIELD_COLOR        = ColorFromRGB().getColorFromRGB(0xC7C7C7)
    public static let BORDER_BUTTON_COLOR           = ColorFromRGB().getColorFromRGB(0xDCDCDC)
    public static let URL_BUTTON_COLOR              = ColorFromRGB().getColorFromRGB(0x3C6B86)
    public static let SCROLLBUTTONLIST_BTN_BKG_COLOR_DISABLE    = BUTTON_COLOR_GRAY
    public static let SCROLLBUTTONLIST_BTN_BKG_COLOR_SELECTING  = COLOR_SELECTING_GREEN
    public static let SCROLLBUTTONLIST_BTN_BKG_COLOR_ENABLE     = BUTTON_COLOR_GRAY
    //++ BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    public static var MONEY_COLOR                   = ColorFromRGB().getColorFromRGB(0x4F852F)
    //-- BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    public static var REPORT_PARENT_COLOR           = ColorFromRGB().getColorFromRGB(0x4DA4E7)
    public static var REPORT_PARENT_COLOR_1         = ColorFromRGB().getColorFromRGB(0x92BDDF)
    public static var TEXTVIEW_BORDER_COLOR         = ColorFromRGB().getColorFromRGB(0xCECECE)
    public static var FACEBOOK_BKG_COLOR            = ColorFromRGB().getColorFromRGB(0x3B5998)
    public static var ZALO_BKG_COLOR                = ColorFromRGB().getColorFromRGB(0x1987C4)
    public static var PROMOTION_BKG_COLOR           = ColorFromRGB().getColorFromRGB(0xEFEFEF)
    public static var CANCEL_BKG_COLOR              = ColorFromRGB().getColorFromRGB(0x9F9F9F)
    //++ BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
    /** Time interval for animation in Step view controller */
    public static let STEP_MOVE_TIME_INTERVAL       = 0.1
    //-- BUG0050-SPJ (NguyenPT 20170330) Update Step VC: Use animation for move view
    
    // ----- New constants -----
    /** Width of animating loading */
    public static let ANIMATING_LOADING_WIDTH:      CGFloat = 30
    /** Height of animating loading */
    public static let ANIMATING_LOADING_HEIGHT:     CGFloat = 30
    /** HD screen bound size */
    public static let HD_SCREEN_BOUND:          (w: CGFloat, h: CGFloat)    = (1080, 1920)
    /** Full 10HD screen bound size */
    public static let FULL_HD_SCREEN_BOUND:     (w: CGFloat, h: CGFloat)    = (1536, 2048)
    /** Width of Login logo */
    public static let LOGIN_LOGO_WIDTH:             CGFloat = 625
    /** Height of Login logo */
    public static let LOGIN_LOGO_HEIGHT:            CGFloat = 250
    /** Y position of Login logo */
    public static let LOGIN_LOGO_Y_POS:             CGFloat = 370
    /** Y position of Login logo */
    public static let LOGIN_LOGO_Y_POS_FHD:         CGFloat = 530
    /** Y position of Login logo */
    public static let LOGIN_LOGO_Y_POS_FHD_LAND:    CGFloat = 130
    /** Width of Logi       n textfield */
    public static let LOGIN_TEXTFIELD_WIDTH:        CGFloat = 860
    /** Height of Login textfield */
    public static let LOGIN_TEXTFIELD_HEIGHT:       CGFloat = 135
    /** Size of Login next button */
//    public static let LOGIN_NEXT_BUTTON_SIZE:       CGFloat = 100
    public static let LOGIN_NEXT_BUTTON_SIZE:       CGFloat = 135
    /** Butotn corner radius */
    public static let BUTTON_CORNER_RADIUS_NEW:     CGFloat = 5.0
    /** Time interval for animation in Step view controller */
    public static let ROTATED_TIME_INTERVAL:        CGFloat = 0.5
    /** Width of resend button */
    public static let RESEND_BUTTON_WIDTH:          CGFloat = 230
    /** Size of button category */
    public static let BUTTON_CATEGORY_SIZE_NEW:     CGFloat = 170.0
    /** Y position of Login logo */
    public static let ORDER_LABEL_Y_POS:            CGFloat = 555
    /** Size of Order button */
    public static let ORDER_BUTTON_SIZE:            CGFloat = 250
    /** Size of button action */
    public static let BUTTON_ACTION_SIZE:           CGFloat = 250
    /** Width of Cancel order button */
    public static let BUTTON_CANCEL_ORDER_WIDTH:    CGFloat = 600
    /** Height of delivery map top view */
    public static let DELIVERY_MAP_TOP_VIEW_HEIGHT: CGFloat = 335
    /** Height of bottom message view */
    public static let BOTTOM_MESSAGE_HEIGHT:        CGFloat = 250
    /** Height of navigation bar */
    public static let NAVIGATION_BAR_HEIGHT:        CGFloat = 64
    /** Bottom message view corner radius */
    public static let BOTTOM_MSG_VIEW_CORNER_RADIUS:    CGFloat = 5.0
    /** Height of segment promote */
    public static let SEGMENT_PROMOTE_HEIGHT:       CGFloat = GlobalConst.LOGIN_TEXTFIELD_HEIGHT
    /** Width of textfield promote */
    public static let TEXTFIELD_PROMOTE_WIDTH:      CGFloat = GlobalConst.LOGIN_TEXTFIELD_WIDTH
    /** Width of Share code button */
    public static let BUTTON_SHARE_PROMOTE_WIDTH:   CGFloat = GlobalConst.BUTTON_CANCEL_ORDER_WIDTH
    /** Size of QR code image */
    public static let QR_CODE_SIZE:                 CGFloat = 500
    /** Width of refer button */
    public static let REFER_BUTTON_WIDTH:           CGFloat = 590
    /** Height of refer button */
    public static let REFER_BUTTON_HEIGHT:          CGFloat = 270
    /** Time wait to show Resend button on Confirm code screen */
    public static let RESEND_BTN_TIME_WAIT:                 Int  = 30000
    /** Time wait to request Transaction status again */
    public static let RESEND_TRANSACTION_STATUS_TIME_WAIT:  Int  = 5000
    /** Time wait to change Confirmed status */
    public static let CHANGE_CONFIRMED_STATUS_TIME_WAIT:    Int  = 15000
    /** Width of submit button */
    public static let SUBMIT_BUTTON_WIDTH:          CGFloat = 330
    /** Height of submit button */
    public static let SUBMIT_BUTTON_HEIGHT:         CGFloat = 135
    /** Size of status icon */
    public static let STATUS_ICON_SIZE:             CGFloat = 60
}
