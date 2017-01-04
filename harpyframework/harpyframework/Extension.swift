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
extension UIButton {
    public func centerLabelVerticallyWithPadding(spacing: CGFloat) {
        // update positioning of image and title
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
        
        // reset contentInset, so intrinsicContentSize() is still accurate
        let trueContentSize = (self.titleLabel?.frame)!.union((self.imageView?.frame)!).size
        let oldContentSize = self.intrinsicContentSize
        let heightDelta = trueContentSize.height - oldContentSize.height
        let widthDelta = trueContentSize.width - oldContentSize.width
        self.contentEdgeInsets = UIEdgeInsets(top:heightDelta/2.0,
                                              left:widthDelta/2.0,
                                              bottom:heightDelta/2.0,
                                              right:widthDelta/2.0)
    }
}
extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func normalizateString() -> String {
        var ret: String = self
        if self.contains(DomainConst.ADDRESS_UNKNOWN) {
            ret = self.replacingOccurrences(of: DomainConst.ADDRESS_UNKNOWN, with: DomainConst.BLANK)
        }
        return ret
    }
}
