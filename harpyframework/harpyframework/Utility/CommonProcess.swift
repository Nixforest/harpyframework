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
    public static func createButtonLayout(btn: UIButton, x: CGFloat, y: CGFloat,
                             text: String) {
        
        btn.translatesAutoresizingMaskIntoConstraints = true
        btn.frame = CGRect(x: x, y: y,
                           width: GlobalConst.BUTTON_W,
                           height: GlobalConst.BUTTON_H)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor.white , for: .normal)
        btn.titleLabel?.font    = UIFont.systemFont(ofSize: GlobalConst.BUTTON_FONT_SIZE)
        btn.backgroundColor     = GlobalConst.BUTTON_COLOR_RED
        btn.layer.cornerRadius  = GlobalConst.LOGIN_BUTTON_CORNER_RADIUS
    }
}
