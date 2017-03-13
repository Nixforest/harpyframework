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
    public static let SCREEN_WIDTH                      : CGFloat = UIScreen.main.bounds.width
    public static let SCREEN_HEIGHT                     : CGFloat = UIScreen.main.bounds.height
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
    public static let BUTTON_CATEGORY_SIZE              : CGFloat = 40.0
    public static let CENTER_MARKER_SIZE_WIDTH          : CGFloat = 20.0
    public static let CENTER_MARKER_SIZE_HEIGHT         : CGFloat = 40.0
    
    public static let MATERIAL_SELECTION_WIDTH          : CGFloat = GlobalConst.SCREEN_WIDTH / 4
    public static let MATERIAL_SELECTION_HEIGHT         : CGFloat = MATERIAL_SELECTION_WIDTH * 2
    public static let CONFIGURATION_ITEM_HEIGHT         : CGFloat = 44.0
    public static let CONFIGURATION_ITEM_RIGHT_SIZE     : CGFloat = 15.0
    
    
    // ----- Color defines -----
    /** Application main color */
    //public static let MAIN_COLOR:                  = ColorFromRGB().getColorFromRGB(0xF00020)
    public static let MAIN_COLOR                    = ColorFromRGB().getColorFromRGB(0xFC4513)
    public static let BUTTON_COLOR_RED_TRUE         = ColorFromRGB().getColorFromRGB(0xF00020)
    public static var TRAINING_COLOR                = MAIN_COLOR//ColorFromRGB().getColorFromRGB(0x08C011)
    //public static let TRAINING_COLOR              = ColorFromRGB().getColorFromRGB(0xF00020)
    public static var BUTTON_COLOR_RED              = MAIN_COLOR
    public static let BUTTON_COLOR_GRAY             = ColorFromRGB().getColorFromRGB(0xD5D5D5)
    public static let BUTTON_COLOR_YELLOW           = ColorFromRGB().getColorFromRGB(0xFF9E19)
    public static let BUTTON_COLOR_DISABLE          = ColorFromRGB().getColorFromRGB(0x535353)
    public static let COLOR_SELECTING_GREEN         = ColorFromRGB().getColorFromRGB(0x08C011)
    public static let PARENT_BORDER_COLOR_GRAY      = UIColor.gray
    public static let TEXT_COLOR_GRAY               = ColorFromRGB().getColorFromRGB(0x666666)
    public static let PARENT_BORDER_COLOR_YELLOW    = UIColor.yellow
    public static let BACKGROUND_COLOR_GRAY         = ColorFromRGB().getColorFromRGB(0xECECEC)
    public static let SCROLLBUTTONLIST_BKG_COLOR    = BUTTON_COLOR_GRAY
    public static let INFOR_TITLE_COLOR             = ColorFromRGB().getColorFromRGB(0x1899E5)
    public static let TEXT_COLOR                    = ColorFromRGB().getColorFromRGB(0x333333)
    public static let SCROLLBUTTONLIST_BTN_BKG_COLOR_DISABLE    = BUTTON_COLOR_GRAY
    public static let SCROLLBUTTONLIST_BTN_BKG_COLOR_SELECTING  = COLOR_SELECTING_GREEN
    public static let SCROLLBUTTONLIST_BTN_BKG_COLOR_ENABLE     = BUTTON_COLOR_GRAY
}