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
public class ColorFromRGB: NSObject {
    /**
     * Get color value from RGB value
     * - parameter rgbValue: RGB value
     * - returns: UIColor value
     */
    public func getColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red:    CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:   CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha:  CGFloat(1.0)
        )
    }
}
public class ImageManager {
    public static func getImage(named: String) -> UIImage? {
        let frameworkBundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        return UIImage(named: named, in: frameworkBundle, compatibleWith: nil)
    }
}

/**
 * Uphold image information item.
 */
public class UpholdImageInfoItem: NSObject {
    /** Thumbnail */
    public var thumb = ""
    /** Large image */
    public var large = ""
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

/**
 * Download image async extension
 */
extension UIImageView {
    /**
     * Get image from url
     * - parameter link: Image url
     * - parameter mode: Image view content mode
     */
    public func getImgFromUrl(link: String, contentMode mode: UIViewContentMode) {
        // Reset image
        self.image = nil // Here you can put nil to have a blank image or a placeholder image
        contentMode = mode
        let serverUrl: URL  = URL(string: link)!
        let request         = NSMutableURLRequest(url: serverUrl)
        request.httpMethod  = DomainConst.HTTP_POST_REQUEST
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        // Execute task
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? HTTPURLResponse , httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType , mimeType.hasPrefix("image"),
                let data = data , error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                self.image = image
            }
            LoadingView.shared.hideOverlayView()
        }).resume()
    }
}

/**
 * Draw border extension for layer
 */
extension CALayer {
    /**
     * Add border
     * - parameter egde:        Edge want to draw border
     * - parameter color:       Color of border
     * - parameter thickness:   Thickness of border
     */
    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(
                x: 0,
                y: self.frame.height - thickness,
                width: UIScreen.main.bounds.width,
                height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(
                x: self.frame.width - thickness,
                y: 0,
                width: thickness,
                height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
    /**
     * Add border with gray color and thickness = 1
     * - parameter egde:        Edge want to draw border
     */
    public func addBorder(edge: UIRectEdge) {
        addBorder(edge: edge, color: GlobalConst.BACKGROUND_COLOR_GRAY, thickness: 1)
    }
}

/**
 * Protocol to define delegate with match select button event.
 */
public protocol ScrollButtonListDelegate {
    /**
     * Handle select button event.
     * - parameter sender: Button object
     */
    func selectButton(_ sender: AnyObject)
}

/**
 * Protocol to define delegate with match step done event.
 */
public protocol StepDoneDelegate {
    /**
     * Handle step done event.
     */
    func stepDone()
}

/**
 * Extension of button control.
 */
extension UIButton {
    /**
     * Make label center vertically with padding
     * - parameter spacing: Padding value
     */
    public func centerLabelVerticallyWithPadding(spacing: CGFloat) {
        // Update positioning of image and title
        let imageSize = self.imageView?.frame.size
        self.titleEdgeInsets = UIEdgeInsets(top:0,
                                            left:-(imageSize?.width)!,
                                            bottom:-((imageSize?.height)! + spacing),
                                            right:0)
        let titleSize = self.titleLabel?.frame.size
        self.imageEdgeInsets = UIEdgeInsets(top:-((titleSize?.height)! + spacing),
                                            left:0,
                                            bottom: 0,
                                            right:-(titleSize?.width)!)
        
        // Reset contentInset, so intrinsicContentSize() is still accurate
        let trueContentSize = (self.titleLabel?.frame)!.union((self.imageView?.frame)!).size
        let oldContentSize = self.intrinsicContentSize
        let heightDelta = trueContentSize.height - oldContentSize.height
        let widthDelta = trueContentSize.width - oldContentSize.width
        self.contentEdgeInsets = UIEdgeInsets(top:heightDelta/2.0,
                                              left:widthDelta/2.0,
                                              bottom:heightDelta/2.0,
                                              right:widthDelta/2.0)
    }
    
    /**
     * Set image to the right
     */
    public func setImageToRight() {
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }
    
    /**
     * Set image to left with padding
     * - parameter imageName: Name of image
     * - parameter padding: Padding value
     */
    public func setLeftImage(imageName:String, padding:CGFloat) {
        //Set left image
        let back = UIImage(named: imageName)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.setImage(tintedBack, for: UIControlState())
        self.tintColor          = UIColor.white
        self.imageView?.contentMode = .scaleAspectFit
        
        //Calculate and set image inset to keep it left aligned
        let imageWidth = back?.size.width
        let textWidth = self.titleLabel?.intrinsicContentSize.width
        let buttonWidth = self.bounds.width
        
        let rightInset = buttonWidth - imageWidth! - textWidth! - padding 
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightInset)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightInset)
    }
}

/**
 * String extension
 */
extension String {
    /**
     * Get height of string with constant width
     * - parameter width: Width value
     * - parameter font: Font value
     * - returns: Height of string
     */
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    /**
     * Normalizate string value
     * - returns: String after normalization
     * - Remove "Không rõ, "
     */
    public func normalizateString() -> String {
        var ret: String = self
        if self.contains(DomainConst.ADDRESS_UNKNOWN) {
            ret = self.replacingOccurrences(of: DomainConst.ADDRESS_UNKNOWN, with: DomainConst.BLANK)
        }
        return ret
    }
    
    /**
     * Normalizate phone string
     * - returns: String after normalization
     * - Remove " "
     */
    public func normalizatePhoneString() -> String {
        let retVal = self.replacingOccurrences(of: DomainConst.SPACE_STR, with: DomainConst.BLANK)
        return retVal
    }
}

public extension NSObject {    
    /**
     * Get string value from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of string match with key value
     */
    public func getString(json: [String: AnyObject], key: String) -> String {
        return json[key] as? String ?? DomainConst.BLANK
    }
    
    /**
     * Get int value from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of int match with key value
     */
    public func getInt(json: [String: AnyObject], key: String) -> Int {
        return json[key] as? Int ?? 0
    }
    
    /**
     * Get string value from key in json list, really value is Int
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of string match with key value
     */
    public func getStringFromInt(json: [String: AnyObject], key: String) -> String {
        let intValue = json[key] as? Int ?? 0
        if intValue != 0 {
            return String(intValue)
        } else {
            return DomainConst.BLANK
        }
    }
    
    /**
     * Get list config data from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of list config data match with key value
     */
    public func getListConfig(json: [String: AnyObject], key: String) -> [ConfigBean] {
        var retVal = [ConfigBean]()
        let list = json[key] as? [[String: AnyObject]]
        if list != nil {
            for item in list! {
                retVal.append(ConfigBean(jsonData: item))
            }
        }
        
        return retVal
    }
    
    /**
     * Get list uphold data from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of list uphold data match with key value
     */
    public func getListUphold(json: [String: AnyObject], key: String) -> [UpholdBean] {
        var retVal = [UpholdBean]()
        let list = json[key] as? [[String: AnyObject]]
        if list != nil {
            for item in list! {
                retVal.append(UpholdBean(jsonData: item))
            }
        }
        return retVal
    }
    
    /**
     * Get list uphold reply data from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of list uphold reply data match with key value
     */
    public func getListUpholdReply(json: [String: AnyObject], key: String) -> [UpholdReplyBean] {
        var retVal = [UpholdReplyBean]()
        let list = json[key] as? [[String: AnyObject]]
        if list != nil {
            for item in list! {
                retVal.append(UpholdReplyBean(jsonData: item))
            }
        }
        return retVal
    }
}
