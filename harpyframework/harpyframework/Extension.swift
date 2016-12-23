//
//  Extension.swift
//  harpyframework
//
//  Created by SPJ on 12/17/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation

/**
 * Class get color from RGB value.
 */
class ColorFromRGB: NSObject {
    /**
     * Get color value from RGB value
     * - parameter rgbValue: RGB value
     * - returns: UIColor value
     */
    internal func getColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red:    CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:   CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha:  CGFloat(1.0)
        )
    }
}

/**
 * Uphold image information item.
 */
class UpholdImageInfoItem: NSObject {
    /** Thumbnail */
    var thumb = ""
    /** Large image */
    var large = ""
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    init(jsonData: [String: AnyObject]) {
        self.thumb       = jsonData[DomainConst.KEY_IMG_THUMB] as? String ?? ""
        self.large       = jsonData[DomainConst.KEY_IMG_LARGE] as? String ?? ""
    }
}

/**
 * Mutable data extension
 */
extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

/**
 * Menu item enum
 */
enum MenuItemEnum {
    case LOGIN
    case LOGOUT
    case REGISTER
    case DYNAMIC_MENU_LIST
    case CONFIG
    case MENUITEM_NUM
}
