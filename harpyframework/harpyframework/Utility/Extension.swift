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
    
    /**
     * Create random color
     * - returns: UIColor value
     */
    public func getRandomColor() -> UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}

/**
 * Image manager
 */
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

// MARK: Enum
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
 * Role enum define
 */
enum RoleType: Int {
    case ROLE_MANAGER = 1,
    ROLE_ADMIN,
    ROLE_SALE,				            // Nhân Viên Kinh Doanh
    ROLE_CUSTOMER,                      // Khách hàng
    ROLE_AGENT,
    ROLE_MEMBER,
    ROLE_EMPLOYEE_MAINTAIN,				// NV Phục Vụ Khách Hàng
    ROLE_CHECK_MAINTAIN,				// NV Test Bảo Trì
    ROLE_ACCOUNTING_AGENT,				// NV Kế Toán Bán Hàng
    ROLE_ACCOUNTING_AGENT_PRIMARY,		// NV Kế Toán Đại Lý
    ROLE_ACCOUNTING_ZONE,				// NV Kế Toán Khu Vực
    ROLE_MONITORING,				    // NV Giám Sát
    ROLE_MONITORING_MAINTAIN,
    ROLE_MONITORING_MARKET_DEVELOPMENT,	// Mar0216 Chuyên Viên CCS <- Giám Sát PTTT
    ROLE_EMPLOYEE_MARKET_DEVELOPMENT,	// NV PTTT
    ROLE_MONITORING_STORE_CARD,			// Quản Lý Kho
    ROLE_DIEU_PHOI,			            // Điều Phối
    ROLE_SCHEDULE_CAR,				    // Điều Xe
    ROLE_DIRECTOR,				        // Giám Đốc
    ROLE_SUB_USER_AGENT,			    // User Đại Lý
    ROLE_DRIVER,				        // Lái Xe
    ROLE_ACCOUNT_RECEIVABLE,		    // Kế Toán Công Nợ
    ROLE_HEAD_GAS_BO,				    // Trưởng Phòng KD Gas Bò
    ROLE_HEAD_GAS_MOI,				    // Trưởng Phòng KD Gas mối
    ROLE_DIRECTOR_BUSSINESS,		    // Giám Đốc Kinh Doanh
    ROLE_RECEPTION,				        // lễ tân
    ROLE_CHIEF_ACCOUNTANT,			    // Kế Toán Trưởng
    ROLE_CHIEF_MONITOR,				    // Tổng giám sát
    ROLE_MONITOR_AGENT,				    // giám sát đại lý
    ROLE_SECRETARY_OF_THE_MEETING,	    // THƯ KÝ CUỘC HỌP
    ROLE_HEAD_OF_LEGAL,				    // Trưởng Phòng Pháp Lý
    ROLE_EMPLOYEE_OF_LEGAL,			    // Nhân Viên Pháp Lý
    ROLE_ACCOUNTING,				    // Nhân Viên Kế Toán
    ROLE_DEBT_COLLECTION,			    // Nhân Viên Thu Nợ
    ROLE_HEAD_TECHNICAL,			    // Trưởng Phòng Kỹ Thuật
    ROLE_HEAD_OF_MAINTAIN,			    // Tổ Trưởng Tổ Bảo Trì
    ROLE_E_MAINTAIN,				    // NV Bảo Trì
    ROLE_SECURITY_SYSTEM,			    // Security System - Setting cho hệ thống
    ROLE_BUSINESS_PROJECT,			    // NV Kinh Doanh Dự Án
    ROLE_HEAD_OF_BUSINESS,			    // Trưởng Phòng Kinh Doanh Dec 26, 2014
    ROLE_WORKER,				        // Công nhân Dec 26, 2014
    ROLE_SECURITY,				        // Bảo Vệ Dec 26, 2014
    ROLE_MANAGING_DIRECTOR,				// Quản Đốc Dec 29, 2014
    ROLE_CRAFT_WAREHOUSE,				// Thủ Kho Dec 29, 2014
    ROLE_HEAD_GAS_FAMILY,				// Trưởng Phòng Gas Gia Đình Jan 20, 2015
    ROLE_TEST_CALL_CENTER,				// NV test tổng đài Sep 03, 2015
    ROLE_CHIET_NAP,				        // NV chiết nạp Sep 03, 2015
    ROLE_PHU_XE,				        // NV Phụ Xe Sep 03, 2015
    ROLE_SUB_DIRECTOR,			        // Phó Giám Đốc Chi Nhánh SEP 11, 2015
    ROLE_ITEMS,				            // Vật Tư SEP 11, 2015
    ROLE_CASHIER,				        // Thủ Quỹ SEP 11, 2015
    ROLE_MECHANIC,				        // Cơ Khí SEP 11, 2015
    ROLE_TECHNICAL,				        // NV Kỹ Thuật SEP 19, 2015
    ROLE_AUDIT,				            // NV AUDIT dec 15, 2015
    ROLE_SALE_ADMIN,			        // NV QUAN LY kh MAR 12, 2016
    ROLE_IT,				            // Phòng Công Nghệ Thông Tin Apr 04, 2016
    ROLE_IT_EMPLOYEE,			        // NV Công Nghệ Thông Tin Apr 04, 2016
    ROLE_BRANCH_DIRECTOR,		        // Giám Đốc Chi Nhánh May 08, 2016
    ROLE_CLEANER,				        // NV Tạp Vụ May 08, 2016
    ROLE_MANAGER_DRIVER,				// Quản Lý Đội Xe May 17, 2016,
    ROLETYPE_NUM
}
//++ BUG0054-SPJ (NguyenPT 20170418) Add new function G07
/** Action type */
public enum ActionTypeEnum: Int {
    case EMPLOYEE_CONFIRM = -1,
    EMPLOYEE_FREE,
    EMPLOYEE_NHAN_GIAO_HANG,
    EMPLOYEE_HUY_GIAO_HANG,
    EMPLOYEE_DROP,
    EMPLOYEE_CHANGE,
    EMPLOYEE_COMPLETE,
    EMPLOYEE_CHANGE_NOT_PAID
}
//-- BUG0054-SPJ (NguyenPT 20170418) Add new function G07
//++ BUG0060-SPJ (NguyenPT 20170426) Update function G05 for Employee
/** Action type of VIP customer */
public enum ActionTypeVIPCustomerEnum: Int {
    case EMPLOYEE_NHAN_GIAO_HANG = 1,
    EMPLOYEE_HUY_GIAO_HANG,
    EMPLOYEE_CHANGE,
    EMPLOYEE_COMPLETE,
    EMPLOYEE_DROP
}
//-- BUG0060-SPJ (NguyenPT 20170426) Update function G05 for Employee

// MARK: View extension
/**
 * Download image async extension
 */
extension UIImageView {
    /**
     * Set image for image view, if image does exist inside framework, take it. If not, download from server
     * - parameter imgPath: Image path
     */
    public func setImage(imgPath: String) {
        // Check from framework
        let image = ImageManager.getImage(named: imgPath)
        if image != nil {
            self.image     = image
        } else if !imgPath.isEmpty {
            // Get from server
            self.getImgFromUrl(link: imgPath, contentMode: self.contentMode)
        } else {
            //self.setImage(imgPath: DomainConst.DEFAULT_IMG_NAME)
            self.image = nil
        }
    }
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
        //request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.cachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
        // Execute task
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let phImage = UIImage(named: "default-thumbnail.jpg")
            guard
                let httpURLResponse = response as? HTTPURLResponse , httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType , mimeType.hasPrefix("image"),
                let data = data , error == nil,
                let image = UIImage(data: data)
                //else { return }
                else {
                    DispatchQueue.main.async {
                        self.image = phImage
                    }
                    return
                }
            DispatchQueue.main.async {
                self.image = image
            }
            LoadingView.shared.hideOverlayView()
        }).resume()
    }
}

//++ BUG0073-SPJ (NguyenPT 20170504) Init image by solid color
/**
 * Init image by solid color
 */
public extension UIImage {
    /**
     * Init image by solid color
     * - parameter color: Solid color
     * - parameter size: Size of image
     */
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
//-- BUG0073-SPJ (NguyenPT 20170504) Init image by solid color

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

// MARK: Protocols
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
 * Protocol to define delegate with match select button event.
 */
public protocol AddressPickerViewDelegate {
    /**
     * Handle valued changed event.
     * - parameter sender: Object
     */
    func valueChanged(_ sender: AnyObject)
}

/**
 * Protocol to define delegate with match check changed event.
 */
public protocol CheckBoxDelegate {
    /**
     * Handle check changed event.
     * - parameter sender: Button object
     */
    func checkChanged(_ sender: AnyObject)
}

//++ BUG0043-SPJ (NguyenPT 20170301) Change how to menu work
/**
 * Delegate of menu item
 */
public protocol MenuItemDelegate {
    /**
     * Handle tapped event
     * - parameter sender: Button object
     */
    func menuItemTapped(_ sender: AnyObject)
}
//-- BUG0043-SPJ (NguyenPT 20170301) Change how to menu work

/**
 * Protocol to define delegate with match step done event.
 */
public protocol StepDoneDelegate {
    /**
     * Handle step done event.
     */
    func stepDone()
}
//++ BUG0054-SPJ (NguyenPT 20170418) Add new function G07
/**
 * Protocol to define delegate with match order confirm event.
 */
public protocol OrderConfirmDelegate {
    /**
     * Handle tapped event on action button
     */
    func btnActionTapped(_ sender: AnyObject)
    /**
     * Handle tapped event on cancel button
     */
    func btnCancelTapped(_ sender: AnyObject)
}
//-- BUG0054-SPJ (NguyenPT 20170418) Add new function G07

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
        let back = ImageManager.getImage(named: imageName)
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
    
    /**
     * Make image show above title and make content center.
     */
    public func centerVertically() {
        // Get original image size and title size
        let imgSize = self.imageView?.frame.size
        let lblSize = self.titleLabel?.frame.size
        let btnSize: CGFloat = self.frame.width
        // Resize image and put at specific location
        self.imageEdgeInsets = UIEdgeInsets(top: 0.0,
                                            left: btnSize / 4,
                                            bottom: btnSize / 2,
                                            right: btnSize / 4)
        // Get natural width of title label
        let width       = self.titleLabel?.text?.widthOfString(usingFont: (self.titleLabel?.font)!)
        // Calculate left distance want to move
        var deltaLeft   = (btnSize - width! - (lblSize?.width)!) / 2
        // Calculate right distance want to move
        var deltaRight: CGFloat = 0.0
        if width! > btnSize {
            deltaLeft   = (width! - btnSize + (lblSize?.width)!)
            deltaRight  = (btnSize - width!)
        }
        
        // Resize title and put at specific location
        self.titleEdgeInsets = UIEdgeInsets(top: btnSize / 2,
                                            left: -(imgSize!.width) - deltaLeft,
                                            bottom: 0.0,
                                            right: deltaRight)
    }
    
    /**
     * Make image show above title and make content center.
     */
    public func centerVerticallyRect() {
        // Get original image size and title size
        let imgSize = self.imageView?.frame
        let lblSize = self.titleLabel?.frame.size
        let btnSize: CGFloat = self.frame.width
        let btnHeight: CGFloat = self.frame.height
        // Resize image and put at specific location
        self.imageEdgeInsets = UIEdgeInsets(top: 0.0,
                                            left: (btnSize - btnHeight / 2) / 2,
                                            bottom: btnHeight / 2,
                                            right: (btnSize - btnHeight / 2) / 2)
        // Get natural width of title label
        let width       = self.titleLabel?.text?.widthOfString(usingFont: (self.titleLabel?.font)!)
        // Calculate left distance want to move
        var deltaLeft   = (btnSize - width! - (lblSize?.width)!) / 2
        // Calculate right distance want to move
        var deltaRight: CGFloat = 0.0
        if width! > btnSize {
            deltaLeft   = (width! - btnSize + (lblSize?.width)!)
            deltaRight  = (btnSize - width!)
        }
        
        // Resize title and put at specific location
        self.titleEdgeInsets = UIEdgeInsets(top: btnHeight / 2,
                                            left: deltaLeft - (imgSize?.maxX)!,
                                            bottom: 0.0,
                                            right: deltaRight)
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
    public func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.width
    }
    
    public func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.height
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
        //++ BUG0073-SPJ (NguyenPT 20170504) Handle remove Không rõ,
        if self.contains(DomainConst.ADDRESS_UNKNOWN1) {
            ret = self.replacingOccurrences(of: DomainConst.ADDRESS_UNKNOWN1, with: DomainConst.BLANK)
        }
        //-- BUG0073-SPJ (NguyenPT 20170504) Handle remove Không rõ,
        return ret
    }
    
    /**
     * Normalizate phone string
     * - returns: String after normalization
     * - Remove " "
     */
    public func normalizatePhoneString() -> String {
        var retVal = DomainConst.BLANK
        if self.range(of: DomainConst.PHONE_SPLITER) != nil {
            let arrString = self.components(separatedBy: DomainConst.PHONE_SPLITER)
            if arrString.count > 0 {
                retVal = arrString[0]
            }
        } else {
            retVal = self
        }
        retVal = retVal.replacingOccurrences(of: DomainConst.SPACE_STR, with: DomainConst.BLANK)
        
        return retVal
    }
    
    //++ BUG0050-SPJ (NguyenPT 20170405) Add new function G06
    /**
     * Normalize province/city name
     * - returns: Name of province/city after normalized
     */
    public func normalizeProvinceStr() -> String {
        // Make lower case
        var retVal = self.lowercased()
        // Remove city string
        if retVal.range(of: DomainConst.CITY) != nil {
            retVal = retVal.replacingOccurrences(of: DomainConst.CITY, with: DomainConst.BLANK)
        }
        retVal = retVal.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return retVal
    }
    
    /**
     * Normalize District name
     * - returns: Name of District after normalized
     */
    public func normalizeDistrictStr() -> String {
        var retVal = self.lowercased()
        retVal = retVal.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return retVal
    }
    
    /**
     * Normalize Ward name
     * - returns: Name of Ward after normalized
     */
    public func normalizeWardStr() -> String {
        var retVal = self.lowercased()
        retVal = retVal.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return retVal
    }
    
    /**
     * Normalize Street name
     * - returns: Name of Street after normalized
     */
    public func normalizeStreetStr() -> String {
        var retVal = self.removeSign().lowercased()
        if retVal.range(of: DomainConst.STREET) != nil {
            retVal = retVal.replacingOccurrences(of: DomainConst.STREET, with: DomainConst.BLANK)
        }
        retVal = retVal.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return retVal
    }
    
    /**
     * Remove sign
     * - returns: Sttring after remove sign
     */
    public func removeSign() -> String {
        var retVal = self
        for i in 1..<DomainConst.UNICODE_SIGNS.count {
            for j in 0..<(DomainConst.UNICODE_SIGNS[i].characters.count - 1) {
                retVal = retVal.replacingOccurrences(
                    of:     DomainConst.UNICODE_SIGNS[i].substring(with: j..<(j + 1)),
                    with:   DomainConst.UNICODE_SIGNS[0].substring(with: (i - 1)..<i))
            }
        }
        retVal = retVal.replacingOccurrences(of: "đ", with: "d")
        retVal = retVal.replacingOccurrences(of: "Đ", with: "D")
        return retVal
    }
    
    /**
     * Get index object
     * - returns: Index object
     */
    func index(from: Int) -> Index {
        guard from < self.characters.count else { return self.startIndex }
        return self.index(startIndex, offsetBy: from)
    }
    
    /**
     * Returns a new string containing the characters of the String from
     * the one at a given index to the end.
     * - parameter from: From index
     * - returns: New string
     */
    public func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    /**
     * Returns a new string containing the characters of the String up to,
     * but not including, the one at a given index.
     * - parameter to: To index
     * - returns: New string
     */
    public func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    /**
     * Returns a string object containing the characters of the String
     * that lie within a given range.
     * - parameter r: Range
     * - returns: New string
     */
    public func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        var endIndex = index(from: r.upperBound)
        if r.upperBound >= self.characters.count {
            endIndex = self.endIndex
        }
        return substring(with: startIndex..<endIndex)
    }
    //-- BUG0050-SPJ (NguyenPT 20170405) Add new function G06
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
     * Get int value from string with key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of int match with key value
     */
    public func getIntFromString(json: [String: AnyObject], key: String) -> Int {
        var retVal = 0
        let value = json[key] as? String ?? DomainConst.BLANK
        //++ BUG0070-SPJ (NguyenPT 20170426) Handle convert String -> Int
//        if value != DomainConst.BLANK {
//            retVal = Int(value)!
//        }
        if let number = Int(value) {
            retVal = number
        }
        //-- BUG0070-SPJ (NguyenPT 20170426) Handle convert String -> Int
        return retVal
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
    //++ BUG0050-SPJ (NguyenPT 20170326) Add new function G06
    /**
     * Get list string data from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of list string data data match with key value
     */
    public func getListString(json: [String: AnyObject], key: String) -> [String] {
        var retVal = [String]()
        let str = json[key] as? [String]
        if str != nil {
            for item in str! {
                retVal.append(item)
            }
        }
        return retVal
    }
    //-- BUG0050-SPJ (NguyenPT 20170326) Add new function G06
    /** The class name */
    public var theClassName: String {
        //++ BUG0050-SPJ (NguyenPT 20170403) Add new function G06
        //return NSStringFromClass(type(of: self))
        return String(describing: type(of: self))
        //-- BUG0050-SPJ (NguyenPT 20170403) Add new function G06
    }
    
    //++ BUG0050-SPJ (NguyenPT 20170403) Add new function G06
    /** The class name */
    class var theClassName: String {
        return String(describing: self)
    }
    //-- BUG0050-SPJ (NguyenPT 20170403) Add new function G06
}
public extension UIView {
    /**
     * Set random color for all components on view
     */
    public func makeComponentsColor() {
        if !BaseModel.shared.getDebugColor() {
            return
        }
        for view in self.subviews {
            for childView in view.subviews {
                childView.backgroundColor = ColorFromRGB().getRandomColor()
            }
            view.backgroundColor = ColorFromRGB().getRandomColor()
        }
        self.backgroundColor = ColorFromRGB().getRandomColor()
    }
}

//++ BUG0048-SPJ (NguyenPT 20170309) Get root view controller
public extension UIApplication {
    /**
     * Get current root view controller
     * - parameter controller: Current controller
     * - returns: Root view controller
     */
    class func getRootVC(controller: UIViewController?
        = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        // If controller is navigation controller
        if let navigationController = controller as? UINavigationController {
            return getRootVC(controller: navigationController.visibleViewController)
        }
        
        // If controller is tab bar controller
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return getRootVC(controller: selected)
            }
        }
        
        // If controller is presented controller
        if let presented = controller?.presentedViewController {
            return getRootVC(controller: presented)
        }
        return controller
    }
}
//-- BUG0048-SPJ (NguyenPT 20170309) Get root view controller

public extension Bundle {
    /** Release version number */
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    /** Build version number */
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
