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
    
    public static func getImage(named: String, margin: CGFloat) -> UIImage? {
        return ImageManager.getImage(named: named)?.imageWithInsets(
            insets: UIEdgeInsets(
                top: margin,
                left: margin,
                bottom: margin,
                right: margin))
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
    /** Id */
    public var id    = DomainConst.BLANK
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        self.thumb       = jsonData[DomainConst.KEY_IMG_THUMB] as? String ?? ""
        self.large       = jsonData[DomainConst.KEY_IMG_LARGE] as? String ?? ""
        self.id          = jsonData[DomainConst.KEY_ID] as? String ?? ""
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
    //++ BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
    //case EMPLOYEE_CONFIRM = -1,
    case EMPLOYEE_CHANGE_AGENT = -2,
    EMPLOYEE_CONFIRM,
    //-- BUG0133-SPJ (NguyenPT 20170724) Family order: change agent delivery
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
//++ BUG0100-SPJ (NguyenPT 20170602) Update function G01 for Family Uphold
/** Action type of Family uphold */
public enum ActionTypeFamilyUpholdEnum: Int {
    case EMPLOYEE_CONFIRM = 2,
    EMPLOYEE_CANCEL_CONFIRM,
    EMPLOYEE_CANCEL,
    EMPLOYEE_COMPLETE
}
/** Family uphold status enum */
public enum FamilyUpholdStatusEnum: Int {
    case STATUS_NEW = 1,
    STATUS_CONFIRM,
    STATUS_UNCONFIRM,
    STATUS_CANCEL,
    STATUS_COMPLETE
}
//-- BUG0100-SPJ (NguyenPT 20170602) Update function G01 for Family Uphold

//++ BUG0156-SPJ (NguyenPT 20171005) Re-design Gas 24h
/**
 * Order status enum.
 */
public enum OrderStatusEnum: Int {
    case STATUS_CREATE = 0,
    STATUS_WAIT_CONFIRM,
    STATUS_CONFIRMED,
    STATUS_DELIVERING,
    STATUS_COMPLETE,
    STATUS_NUM
}
//-- BUG0156-SPJ (NguyenPT 20171005) Re-design Gas 24h

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
        if link.isEmpty {
            return
        }
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
            let phImage = UIImage(named: DomainConst.DEFAULT_IMG_NAME)
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
//            LoadingView.shared.hideOverlayView(className: self.theClassName)
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
    
    public func imageWithInsets(insets: UIEdgeInsets) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let _ = UIGraphicsGetCurrentContext()
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets
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
                width: self.frame.width,
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
extension UIButton {
    public func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
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

//++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
/**
 * Protocol to define delegate with match select rating value event.
 */
public protocol RatingBarDelegate {
    func rating(_ sender: AnyObject)
}

/**
 * Protocol to define delegate with match Send button tapped event.
 */
public protocol RatingViewDelegate {
    func requestRating(_ sender: AnyObject)
}
//-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
/**
 * Protocol to define delegate with match OrderPreview button tapped event.
 */
public protocol OrderPreviewDelegate {
    /**
     * Handle tap on Gas select button.
     */
    func btnGasTapped(_ sender: AnyObject)
    /**
     * Handle tap on Promote select button.
     */
    func btnPromoteTapped(_ sender: AnyObject)
    /**
     * Handle tap on Delivery info update button.
     */
    func btnDeliveryInfoUpdateTapped(_ sender: AnyObject)
    /**
     * Handle tap on Cancel button.
     */
    func btnCancelTapped(_ sender: AnyObject)
    /**
     * Handle tap on Next button.
     */
    func btnNextTapped(_ sender: AnyObject)
    /**
     * Handle dismiss view controller.
     */
    func dismissVC(_ sender: AnyObject)
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
//                                            left: btnSize / 4,
                                            left: (btnSize - (imgSize?.width)!) / 2,
                                            bottom: btnSize  / 3,
                                            right: (btnSize - (imgSize?.width)!) / 2)
//                                            right: btnSize / 4)
        // Get natural width of title label
        let width       = self.titleLabel?.text?.widthOfString(usingFont: (self.titleLabel?.font)!)
        let height      = self.titleLabel?.text?.heightOfString(usingFont: (self.titleLabel?.font)!)
        // Calculate left distance want to move
//        var deltaLeft   = (btnSize - width! + (lblSize?.width)!) - (btnSize - width!)
        var deltaLeft   = (lblSize?.width)!
        // Calculate right distance want to move
        var deltaRight: CGFloat = 0.0
        if width! > btnSize {
            deltaLeft   = (width! - btnSize + (lblSize?.width)!)
            deltaRight  = (btnSize - width!)
        }
        let deltaTop = btnSize - self.imageEdgeInsets.bottom + GlobalConst.MARGIN_CELL_X
        var deltaBottom = 0.0
        if deltaTop + height! > btnSize {
            deltaBottom = Double((deltaTop + height!) - btnSize)
        }
        
        // Resize title and put at specific location
        self.titleEdgeInsets = UIEdgeInsets(top: deltaTop,
                                            left: -(imgSize!.width) - deltaLeft,
                                            bottom: -CGFloat(deltaBottom),
                                            right: deltaRight)
//        self.titleEdgeInsets = UIEdgeInsets(top: btnSize - self.imageEdgeInsets.bottom,
//                                            left: 0,
//                                            bottom: 0,
//                                            right: 0)
    }
    
    /**
     * Make image show above title and make content center.
     */
    public func centerVerticallyRect() {
        // Get original image size and title size
        let imgSize = self.imageView?.frame
        let titleOriginSize = self.titleLabel?.frame.size
        let btnWidth: CGFloat = self.frame.width
        let btnHeight: CGFloat = self.frame.height
        // Resize image and put at specific location
        self.imageEdgeInsets = UIEdgeInsets(top: 0.0,
//                                            left: (btnWidth - btnHeight / 2) / 2,
                                            left: (btnWidth - (imgSize?.width)!) / 2,
                                            bottom: btnHeight / 2,
                                            right: (btnWidth - (imgSize?.width)!) / 2)
//                                            right: (btnWidth - btnHeight / 2) / 2)
        // Get natural width of title label
        let titleRealWidth       = self.titleLabel?.text?.widthOfString(usingFont: (self.titleLabel?.font)!)
        // Calculate left distance want to move
//        var deltaLeft   = (btnWidth - titleRealWidth! - (titleOriginSize?.width)!) / 2
        var deltaLeft: CGFloat    = 0.0
        // Calculate right distance want to move
        var deltaRight: CGFloat = 0.0
        if titleRealWidth! >= btnWidth {
            if UIDevice.current.userInterfaceIdiom == .phone {
                deltaLeft   = (titleRealWidth! - btnWidth + (titleOriginSize?.width)!)
            } else {
                deltaLeft   = (titleRealWidth! - btnWidth)
            }
//            deltaRight  = (btnWidth - titleRealWidth!)
            deltaRight  = (btnWidth - titleRealWidth!)
        }
        
        // Resize title and put at specific location
        self.titleEdgeInsets = UIEdgeInsets(top: btnHeight / 2,
//                                            left: deltaLeft - (imgSize?.maxX)!,
                                            left: -(imgSize?.maxX)! - deltaLeft,
                                            bottom: 0.0,
                                            right: deltaRight)
//                                            right: deltaLeft)
        self.titleLabel?.sizeToFit()
    }
    
    public func centerVerticallyRectTextUpper() {
        // Get original image size and title size
        let imgSize = self.imageView?.frame
        let titleOriginSize = self.titleLabel?.frame.size
        let btnWidth: CGFloat = self.frame.width
        let btnHeight: CGFloat = self.frame.height
        // Get natural width of title label
        let titleRealWidth  = self.titleLabel?.text?.widthOfString(usingFont: (self.titleLabel?.font)!)
        // Calculate left distance want to move
        var deltaLeft: CGFloat    = 0.0
        // Calculate right distance want to move
        var deltaRight: CGFloat = 0.0
        if titleRealWidth! >= btnWidth {
            if UIDevice.current.userInterfaceIdiom == .phone {
                deltaLeft   = (titleRealWidth! - btnWidth + (titleOriginSize?.width)!)
            } else {
                deltaLeft   = (titleRealWidth! - btnWidth)
            }
            //            deltaRight  = (btnWidth - titleRealWidth!)
            deltaRight  = (btnWidth - titleRealWidth!)
        } else {
            deltaLeft   = (btnWidth - titleRealWidth! - (titleOriginSize?.width)!) / 2
        }
        
        // Resize title and put at specific location
        self.titleEdgeInsets = UIEdgeInsets(top: -btnHeight / 2,
                                            left: (btnWidth)/2,
                                            bottom: (btnHeight / 2 - (titleOriginSize?.height)!),
                                            right: 0.0)
        // Resize image and put at specific location
//        self.imageEdgeInsets = UIEdgeInsets(top: (self.titleLabel?.frame.maxY)! / 2,
        self.imageEdgeInsets = UIEdgeInsets(top: (self.titleLabel?.frame.maxY)! / 2,
                                            left: (btnWidth - (imgSize?.width)!) / 2,
                                            bottom: 0.0,
                                            right: (btnWidth - (imgSize?.width)!) / 2)
        self.titleLabel?.sizeToFit()
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
    public func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
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
     * - returns: String after remove sign
     */
    public func removeSign() -> String {
        var retVal = self
//        for i in 1..<DomainConst.UNICODE_SIGNS.count {
//            for j in 0..<(DomainConst.UNICODE_SIGNS[i].characters.count - 1) {
//                retVal = retVal.replacingOccurrences(
//                    of:     DomainConst.UNICODE_SIGNS[i].substring(with: j..<(j + 1)),
//                    with:   DomainConst.UNICODE_SIGNS[0].substring(with: (i - 1)..<i))
//            }
//        }
        retVal = retVal.folding(options: .diacriticInsensitive,
                                locale: .current)
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
    //++ BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    /** Check if string is empty or white space */
    public var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    /**
     * Check if string is phone number
     * returns: True if string is phone number, False otherwise
     */
    public func isPhoneNumber() -> Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
    //-- BUG0094-SPJ (NguyenPT 20170519) Add function create order by Coordinator
    
    //++ BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    /**
     * Formatting text for currency textField
     * - returns: String after formated
     */
    public func currencyInputFormatting() -> String {
        let number: NSNumber! = currencyValue()
        let formatter                       = NumberFormatter()
        formatter.numberStyle               = .currency
        //formatter.currencySymbol = "$"
        formatter.currencySymbol            = DomainConst.BLANK
        formatter.maximumFractionDigits     = 0
        formatter.minimumFractionDigits     = 0
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }

    /**
     * Get currency value from string
     * - returns: NSNumber object
     */
    public func currencyValue() -> NSNumber {
        var number: NSNumber!
        let formatter                       = NumberFormatter()
        formatter.numberStyle               = .currency
        //formatter.currencySymbol = "$"
        formatter.currencySymbol            = DomainConst.BLANK
        formatter.maximumFractionDigits     = 0
        formatter.minimumFractionDigits     = 0
        
        var amountWithPrefix = self
        
        // Temove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(
            in:      amountWithPrefix,
            options: NSRegularExpression.MatchingOptions(rawValue: 0),
            range:   NSMakeRange(0, self.characters.count),
            withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return 0
        }
        return number
    }
    //-- BUG0093-SPJ (NguyenPT 20170520) Add new function G09
    
    //++ BUG0104-SPJ (NguyenPT 20170606) Fix bug when start input date
    /**
     * Capitalizing first letter of string
     * - returns: String after format
     */
    public func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    /**
     * Capitalizing first letter of string
     */
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    /**
     * Check flag value is ON
     * - returns: True if value is "1", False otherwise
     */
    public func isON() -> Bool {
        return (self == DomainConst.NUMBER_ONE_VALUE)
    }
    
    /**
     * Convert a string (format dd-mm-yyyy) to Date object
     * - returns: Date object
     */
    public func getDateFromString()-> Date {
        let calendar        = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let DateArray       = self.components(separatedBy: DomainConst.SPLITER_TYPE1)
        let components      = NSDateComponents()
        if DateArray.count >= 3 {            
            components.year     = Int(DateArray[2])!
            components.month    = Int(DateArray[1])!
            components.day      = Int(DateArray[0])!
        }
        let date            = calendar?.date(from: components as DateComponents)
        
        return date!
    }
    //-- BUG0104-SPJ (NguyenPT 20170606) Fix bug when start input date
    
    
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: String, options: CompareOptions = .literal) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
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
     * Get float value from key in json list
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of int match with key value
     */
    public func getFloat(json: [String: AnyObject], key: String) -> CGFloat {
        return json[key] as? CGFloat ?? 0.0
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
     * Get string value from key in json list, really value is Float
     * - parameter json: Json data
     * - parameter key: Key value
     * - returns: Value of string match with key value
     */
    public func getStringFromFloat(json: [String: AnyObject], key: String) -> String {
        let value = json[key] as? CGFloat ?? 0
        if value != 0 {
            return String(describing: value)
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
                //childView.backgroundColor = ColorFromRGB().getRandomColor()
                childView.layer.borderColor = ColorFromRGB().getRandomColor().cgColor
                childView.layer.borderWidth = 1
            }
            //view.backgroundColor = ColorFromRGB().getRandomColor()
            view.layer.borderColor = ColorFromRGB().getRandomColor().cgColor
            view.layer.borderWidth = 1
        }
        //self.backgroundColor = ColorFromRGB().getRandomColor()
        self.layer.borderColor = ColorFromRGB().getRandomColor().cgColor
        self.layer.borderWidth = 1
    }
    
    /** Get parent view controller in UITableViewCell */
    public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController!
            }
        }
        return nil
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

public extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
    var previousMonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }
    func addedBy(minutes:Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
}
