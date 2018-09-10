//
//  CommonProcess.swift
//  project
//
//  Created by Nixforest on 9/21/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation


public class CommonProcess {
    /**
     * Get string body request send to Server
     * - parameter dictionary: request parameter as Dictionary<String, AnyObject>
     */
    public static func getStringBody(parameter: Dictionary <String, AnyObject>) -> String {
        var output = ""
        for  (k,v) in  parameter {
            output = output + "\"\(k)\":\"\(v)\","
        }
        output = "q={\(output)\"platform\":\"0\",\"token\":\"\(BaseModel.shared.getUserToken())\"}"
        output = output.replacingOccurrences(of: "\"(", with: "[")
        output = output.replacingOccurrences(of: ")\"", with: "]")
        output = output.replacingOccurrences(of: "\"[", with: "[")
        output = output.replacingOccurrences(of: "]\"", with: "]")
        return output
    }
    /**
     * Set border for control.
     * - parameter view: Control to set border
     */
    public static func setBorder(view: UIView) {
        view.layer.borderWidth  = GlobalConst.BUTTON_BORDER_WIDTH
        view.layer.borderColor  = GlobalConst.BUTTON_COLOR_RED.cgColor
        view.clipsToBounds      = true
        view.layer.cornerRadius = GlobalConst.LOGIN_BUTTON_CORNER_RADIUS
    }
    
    /**
     * Set border for control.
     * - parameter view: Control to set border
     * - parameter radius: Corner radius of border
     */
    public static func setBorder(view: UIView, radius: CGFloat) {
        view.layer.borderWidth  = GlobalConst.BUTTON_BORDER_WIDTH
        view.layer.borderColor  = GlobalConst.BUTTON_COLOR_RED.cgColor
        view.clipsToBounds      = true
        view.layer.cornerRadius = radius
    }
    
    /**
     * Set border for control.
     * - parameter view: Control to set border
     * - parameter radius: Corner radius of border
     * - parameter borderColor: Color of border
     */
    public static func setBorder(view: UIView, radius: CGFloat, borderColor: UIColor) {
        view.layer.borderWidth  = GlobalConst.BUTTON_BORDER_WIDTH / 2
        view.layer.borderColor  = borderColor.cgColor
        view.clipsToBounds      = true
        view.layer.cornerRadius = radius
    }
    
    /**
     * Alignment text vertical center on TextView.
     * - parameter textView: TextView to set
     */
    public static func alignTextVerticalInTextView(textView :UITextView) -> CGFloat {
        //let size = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: CGFloat(MAXFLOAT)))
        let size = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: textView.bounds.height))
        var topoffset = (textView.bounds.size.height - size.height * textView.zoomScale) / 2.0
        topoffset = topoffset < 0.0 ? 0.0 : topoffset
        textView.contentOffset = CGPoint(x: 0, y: -topoffset)
        return topoffset
    }
    
    /**
     * Set layout for left controls
     * - parameter lbl:     Label control
     * - parameter offset:  Y offset
     * - parameter height:  Height of layout
     * - parameter text:    Control's text
     */
    public static func setLayoutLeft(lbl: UILabel, offset: CGFloat, height: CGFloat, text: String, isDrawTopBorder: Bool = true) {
        lbl.translatesAutoresizingMaskIntoConstraints = true
        lbl.frame = CGRect(x: GlobalConst.MARGIN_CELL_X, y: offset,
                           width: (GlobalConst.SCREEN_WIDTH - (GlobalConst.PARENT_BORDER_WIDTH + GlobalConst.MARGIN_CELL_X * 2) * 2) / 3,
                           height: height)
        lbl.text = text
        if isDrawTopBorder {
            lbl.layer.addBorder(edge: UIRectEdge.top)
        }
        lbl.layer.addBorder(edge: UIRectEdge.right)
    }
    
    /**
     * Set layout for left controls
     * - parameter lbl:     Label control
     * - parameter offset:  Y offset
     * - parameter width:   Width of layout
     * - parameter height:  Height of layout
     * - parameter text:    Control's text
     */
    public static func setLayoutLeft(lbl: UILabel, offset: CGFloat, width: CGFloat, height: CGFloat, text: String, isDrawTopBorder: Bool = true) {
        lbl.translatesAutoresizingMaskIntoConstraints = true
        lbl.frame = CGRect(x: GlobalConst.MARGIN_CELL_X, y: offset,
                           width: width,
                           height: height)
        lbl.text            = text
        lbl.lineBreakMode   = .byWordWrapping
        lbl.numberOfLines   = 0
        if isDrawTopBorder {
            lbl.layer.addBorder(edge: UIRectEdge.top)
        }
        lbl.layer.addBorder(edge: UIRectEdge.right)
    }
    
    /**
     * Set layout for right controls
     * - parameter lbl:     TextView control
     * - parameter offset:  Y offset
     * - parameter height:  Height of layout
     * - parameter text:    Control's text
     */
    public static func setLayoutRight(lbl: UITextView, offset: CGFloat, height: CGFloat, text: String, isDrawTopBorder: Bool = true) {
        lbl.translatesAutoresizingMaskIntoConstraints = true
        lbl.text = text
        let topOffset =
            CommonProcess.alignTextVerticalInTextView(textView: lbl)
        lbl.frame = CGRect(x: GlobalConst.MARGIN_CELL_X + (GlobalConst.SCREEN_WIDTH - (GlobalConst.PARENT_BORDER_WIDTH + GlobalConst.MARGIN_CELL_X * 2) * 2) / 3,
                           y: offset,
                           width: (GlobalConst.SCREEN_WIDTH - (GlobalConst.PARENT_BORDER_WIDTH + GlobalConst.MARGIN_CELL_X * 2) * 2) * 2 / 3,
                           height: height)
        lbl.contentOffset = CGPoint(x: 0, y: -topOffset)
        lbl.frame = CGRect(x: GlobalConst.MARGIN_CELL_X + (GlobalConst.SCREEN_WIDTH - (GlobalConst.PARENT_BORDER_WIDTH + GlobalConst.MARGIN_CELL_X * 2) * 2) / 3,
                           y: offset,
                           width: (GlobalConst.SCREEN_WIDTH - (GlobalConst.PARENT_BORDER_WIDTH + GlobalConst.MARGIN_CELL_X * 2) * 2) * 2 / 3,
                           height: height)
        if isDrawTopBorder {
            lbl.layer.addBorder(edge: UIRectEdge.top)
        }
        lbl.isEditable = false
    }
    
    /**
     * Set layout for right controls
     * - parameter lbl:     TextView control
     * - parameter x:       X offset
     * - parameter y:       Y offset
     * - parameter width:   Width of layout
     * - parameter height:  Height of layout
     * - parameter text:    Control's text
     */
    public static func setLayoutRight(lbl: UITextView, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, text: String, isDrawTopBorder: Bool = true) {
        lbl.translatesAutoresizingMaskIntoConstraints = true
        lbl.text = text
        let topOffset =
            CommonProcess.alignTextVerticalInTextView(textView: lbl)
        lbl.frame = CGRect(x: x,
                           y: y,
                           width: width,
                           height: height)
        lbl.contentOffset = CGPoint(x: 0, y: -topOffset)
        lbl.frame = CGRect(x: x,
                           y: y,
                           width: width,
                           height: height)
        if isDrawTopBorder {
            lbl.layer.addBorder(edge: UIRectEdge.top)
        }
        lbl.isEditable = false
    }
    
    /**
     * Mark button is selected
     * - parameter button: Buton to mark
     */
    public static func markButton(button: UIButton) {
        button.backgroundColor = GlobalConst.COLOR_SELECTING_GREEN
    }
    
    /**
     * Mark button is deselected
     * - parameter button: Buton to mark
     */
    public static func unMarkButton(button: UIButton) {
        button.backgroundColor = GlobalConst.BUTTON_COLOR_RED
    }
    
    /**
     * Create layout for normal button
     * - parameter btn:     Button to create layout
     * - parameter x:       X position
     * - parameter y:       Y position
     * - parameter text:    Button's title
     */
    public static func createButtonLayout(btn: UIButton,
                                          x: CGFloat, y: CGFloat,
                                          text: String) {
        
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.frame = CGRect(x: x, y: y,
                           width: GlobalConst.BUTTON_W,
                           height: GlobalConst.BUTTON_H)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor.white , for: .normal)
        btn.titleLabel?.font    = UIFont.systemFont(ofSize: GlobalConst.BUTTON_FONT_SIZE)
        btn.backgroundColor     = GlobalConst.MAIN_COLOR
        btn.layer.cornerRadius  = GlobalConst.LOGIN_BUTTON_CORNER_RADIUS
    }
    
    /**
     * Create layout for normal button
     * - parameter btn:     Button to create layout
     * - parameter x:       X position
     * - parameter y:       Y position
     * - parameter text:    Button's title
     * - parameter action:  Action when tap button
     * - parameter target:  Target of action
     */
    public static func createButtonLayout(btn: UIButton,
                                          x: CGFloat, y: CGFloat,
                                          text: String,
                                          action: Selector, target: Any?) {
        CommonProcess.createButtonLayout(btn: btn, x: x, y: y, text: text)
        btn.addTarget(target, action: action, for: .touchUpInside)
    }
    
    /**
     * Create layout for normal button
     * - parameter btn:     Button to create layout
     * - parameter x:       X position
     * - parameter y:       Y position
     * - parameter text:    Button's title
     * - parameter action:  Action when tap button
     * - parameter target:  Target of action
     * - parameter img:     Path of image
     * - parameter tintedColor:  Tinted color
     */
    public static func createButtonLayout(btn: UIButton,
                                          x: CGFloat, y: CGFloat,
                                          text: String,
                                          action: Selector, target: Any?,
                                          img: String,
                                          tintedColor: UIColor) {
        CommonProcess.createButtonLayout(btn: btn, x: x, y: y,
                                         text: text, action: action, target: target)
        let img = ImageManager.getImage(named: img)
        let tintedImg = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        btn.tintColor = tintedColor
        btn.setImage(tintedImg, for: UIControlState())
        btn.imageView?.contentMode = .scaleAspectFit
        //++ BUG0038-SPJ (NguyenPT 20170222) Decrease size of icon on Button
        btn.imageEdgeInsets = UIEdgeInsets(top: GlobalConst.MARGIN_CELL_X,
                                              left: GlobalConst.MARGIN_CELL_X,
                                              bottom: GlobalConst.MARGIN_CELL_X,
                                              right: GlobalConst.MARGIN_CELL_X)
        //-- BUG0038-SPJ (NguyenPT 20170222) Decrease size of icon on Button
    }
    //++ BUG0050-SPJ (NguyenPT 20170325) Add new function G06
    /**
     * Get current date value
     * - returns: Date value as string with format: dd-mm-yyyy
     */
    public static func getCurrentDate() -> String {
        var retVal = DomainConst.BLANK
        // Get current date and time
        let currentDate = Date()
        retVal = getDateString(date: currentDate)
        
        return retVal
    }
    
    /**
     * Convert date to string with format
     * - parameter date:    Date value
     * - parameter format:  Format value
     * - returns: Date value as string with format: dd-mm-yyyy
     */
    public static func getDateString(date: Date, format: String) -> String {
        var retVal = DomainConst.BLANK
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        retVal = dateFormatter.string(from: date)
        return retVal
    }
    
    /**
     * Get date from string
     * - parameter date: Date string value
     * - parameter format: Date format
     * - returns: Date value
     */
    public static func getDate(fromString strDate: String, withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let d = dateFormatter.date(from: strDate) {
            return d
        }
        return nil
    }
    
    /**
     * Get date string
     * - parameter date: Date value
     * - returns: Date value as string with format: dd-mm-yyyy
     */
    public static func getDateString(date: Date) -> String {
        var retVal = DomainConst.BLANK
        // Get user calendar
        let userCalendar = Calendar.current
        // Choose which date and time component are needed
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day
        ]
        
        // Get the components
        let dateComp = userCalendar.dateComponents(requestedComponents, from: date)
        
        retVal = String.init(format: "%02d-%02d-%04d",
        //retVal = String.init(format: "%02d/%02d/%04d",
                             dateComp.day!,
                             dateComp.month!,
                             dateComp.year!)
        
        return retVal
    }
    
    /**
     * Get first date of the month string
     * - parameter date: Date value
     * - returns: Date value as string with format: 01-mm-yyyy
     */
    public static func getFirstDateOfMonth(date: Date) -> String {
        var retVal = DomainConst.BLANK
        // Get user calendar
        let userCalendar = Calendar.current
        // Choose which date and time component are needed
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day
        ]
        
        // Get the components
        let dateComp = userCalendar.dateComponents(requestedComponents, from: date)
        
        retVal = String.init(format: "01-%02d-%04d",
                             dateComp.month!,
                             dateComp.year!)
        
        return retVal
    }
    //-- BUG0050-SPJ (NguyenPT 20170325) Add new function G06
    
    /**
     * Get current date string
     * - parameter widthSpliter: Spliter
     * - returns: Date value as string
     */
    public static func getCurrentDate(withSpliter: String) -> String {
        var retVal = CommonProcess.getCurrentDate()
        retVal = retVal.replacingOccurrences(
            of: DomainConst.SPLITER_TYPE1,
            with: withSpliter)
        return retVal
    }
    
    //++ BUG0104-SPJ (NguyenPT 20170606) Fix bug when start input date
    /**
     * Get yesterday string
     * - returns: String of yesterday with format dd-mm-yyyy
     */
    public static func getYesterday() -> String {
        return getDateString(date: Date().yesterday)
    }
    
    /**
     * Get previous month string
     * - returns: String of previous month with format dd-mm-yyyy
     */
    public static func getPrevMonth() -> String {
        return getDateString(date: Date().previousMonth)
    }
    //-- BUG0104-SPJ (NguyenPT 20170606) Fix bug when start input date
    
    /**
     * Set left image for textfield
     * - parameter textField: Current textField
     * - parameter name: Image name
     */
    public static func setLeftImgTextField(textField: UITextField, name: String) {        
        textField.leftViewMode = .always
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0,
                                                width: GlobalConst.EDITTEXT_H - GlobalConst.MARGIN,
                                                height: GlobalConst.EDITTEXT_H - GlobalConst.MARGIN))
        let img = ImageManager.getImage(named: name)
        let tinted = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        imgView.image = tinted
        imgView.tintColor = UIColor.black
        textField.leftView = imgView
    }
    
    /**
     * Generate random number
     * - parameter min: Minimum value
     * - parameter max: Maximum value
     * - returns: Random value
     */
    public static func generateRandom(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
    
    /**
     * Update view position
     * - parameter view: View need to update
     * - parameter x: X position
     * - parameter y: Y position
     * - parameter w: Width of view
     * - parameter h: Height of view
     */
    public static func updateViewPos(view: UIView, x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        view.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    /**
     * Make label multi color
     * - parameter lbl:         Label view
     * - parameter lstString:   List of sub strings
     * - parameter colors:      List of colors
     */
    public static func makeMultiColorLabel(lbl: UILabel, lstString: [String], colors: [UIColor]) {
        // Make sure list strings and list colors
        if lstString.count != colors.count {
            return
        }
        if let text = lbl.text, let font = lbl.font {
            let mutableStr = NSMutableAttributedString(
                string: lbl.text!,
                attributes: [NSFontAttributeName: font])
            for i in 0..<lstString.count {
                let str = lstString[i]
                let color = colors[i]
                // Get range of current color
                if let range = text.range(of: str) {
                    let startPos = text.distance(from: text.startIndex, to: range.lowerBound)
                    let nsRange = NSRange(location: startPos, length: str.characters.count)
                    mutableStr.addAttribute(NSForegroundColorAttributeName,
                                            value: color,
                                            range: nsRange)
                }
            }
            lbl.attributedText = mutableStr
        }
    }
    
    /**
     * Handle scale navigation button
     * - parameter btn: Button to scale
     */
    public static func scaleNavBtn(btn: UIButton) {
        // iOS 10 support
        if #available(iOS 10, *) {
            btn.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        } else if #available(iOS 9, *) {
            btn.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        } else if #available(iOS 8, *) {
        } else {
        }
        btn.imageView?.contentMode = .scaleAspectFit
    }
    
    /**
     *
     */
    public static func convertStringDecimal(stringValue: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        formatter.numberStyle = .decimal
        let str = formatter.string(from: formatter.number(from: stringValue)!)
        return str!
    }
    /*
     * check if a response is success
     * parameter: response status as Int
     */
    public static func isResponseSuccess(withResponseStatus status: Int) -> Bool {
        if "\(status)" == DomainConst.RESPONSE_STATUS_SUCCESS {
            return true
        }
        return false
    }
    
    /**
     *  convert dictionary to JSON string
     *  parameter: NSDictionary
     */
    public static func getJSONString(fromDictionary dict: NSDictionary) -> String {
        var output = ""
//        if let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
//            if let str = String(data: data, encoding: .ascii) {
//                output = str
//            }
//        }
        if let data = try? JSONSerialization.data(withJSONObject: dict, options: []) {
            if let str = String(data: data, encoding: .utf8) {
                output = str
            }
        }
        return output
    }
    
    
    /**
     *  convert JSON string to Dictionary
     *  parameter: String
     */
    public static func getDictionary(fromString str: String) -> NSDictionary? {
        if let data = str.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
