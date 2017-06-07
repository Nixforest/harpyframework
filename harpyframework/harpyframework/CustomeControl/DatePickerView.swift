//
//  DatePickerView.swift
//  harpyframework
//
//  Created by SPJ on 5/6/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class DatePickerView: UIView, UITextFieldDelegate {
    // MARK: Properties
    /** Autolayout flag */
    private var _shouldSetupConstraints:    Bool        = true
    /** Title label */
    private var _lblTitle:                  UILabel     = UILabel()
    /** Date textfield */
    private var _txtDate:                   UITextField = UITextField()
    /** Static height */
    public static let STATIC_HEIGHT = GlobalConst.MARGIN * 2 + GlobalConst.LABEL_H + GlobalConst.EDITTEXT_H
    /** Current date value */
    private var _currentDate:               Date        = Date()
    /** Today button */
    private var _btnToday:                  UIButton    = UIButton()
    private var _isInputting:               Bool        = false

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    // MARK: Methods
    /**
     * Initialize
     * - parameter frame: Frame of view
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 1, alpha: 1)
        self.layer.cornerRadius = GlobalConst.BUTTON_CORNER_RADIUS
        let leftMargin = GlobalConst.MARGIN
        let contentWidth = self.frame.width - 2 * leftMargin
        var offset = GlobalConst.MARGIN
        // Title label
        _lblTitle.frame = CGRect(x: leftMargin,
                                 y: offset,
                                 width: contentWidth,
                                 height: GlobalConst.LABEL_H)
        _lblTitle.text          = "Date"
        _lblTitle.textColor     = UIColor.black
        _lblTitle.textAlignment = .left
        _lblTitle.font          = GlobalConst.BASE_FONT
        self.addSubview(_lblTitle)
        offset += GlobalConst.LABEL_H
        // Date input
        _txtDate.frame = CGRect(x: leftMargin,
                                y: offset,
                                width: contentWidth,
                                height: GlobalConst.EDITTEXT_H)
        _txtDate.text           = CommonProcess.getCurrentDate()
        _txtDate.textColor      = UIColor.black
        _txtDate.textAlignment  = .left
        _txtDate.font           = GlobalConst.BASE_FONT
        _txtDate.delegate       = self
        CommonProcess.setLeftImgTextField(textField: _txtDate,
                                          name: DomainConst.DATETIME_ICON_IMG_NAME)
        self.addSubview(_txtDate)
        offset += GlobalConst.EDITTEXT_H
        
        // Button Today
        CommonProcess.createButtonLayout(btn: _btnToday,
                                         x: (self.frame.width - GlobalConst.BUTTON_W) / 2,
                                         y: offset + GlobalConst.MARGIN,
                                         text: DomainConst.CONTENT00365.uppercased(),
                                         action: #selector(btnTodayTapped),
                                         target: self,
                                         img: DomainConst.CANCEL_IMG_NAME,
                                         tintedColor: UIColor.white)
        self._btnToday.imageEdgeInsets = UIEdgeInsets(top: GlobalConst.MARGIN,
                                                            left: GlobalConst.MARGIN,
                                                            bottom: GlobalConst.MARGIN,
                                                            right: GlobalConst.MARGIN)
        self.addSubview(_btnToday)
        offset += GlobalConst.BUTTON_H
        self.makeComponentsColor()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     * Updates constraints for the view.
     * Override this method to optimize changes to your constraints.
     */
    override public func updateConstraints() {
        if _shouldSetupConstraints {
            // AutoLayout constraints
            _shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    // MARK: Utility
    /**
     * Mark textfield is selected
     * - parameter isMark: True if want to mark this view, False otherwise
     */
    private func markSelected(isMark: Bool = true) {
        let normalColor     = UIColor.black
        let selectedColor   = GlobalConst.BUTTON_COLOR_RED
        let currentColor = isMark ? selectedColor : normalColor
        self._lblTitle.textColor            = currentColor
        self._txtDate.textColor             = currentColor
        self._txtDate.leftView?.tintColor   = currentColor
    }
    
    /**
     * Hide keyboard
     */
    func hideKeyboard() {
        self.endEditing(true)
    }
    
    /**
     * Tells the responder when one or more fingers touch down in a view or window.
     */
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if _isInputting {
            hideKeyboard()
        } else {
            _txtDate.becomeFirstResponder()
        }
    }
    
    /**
     * Set title for view
     * - parameter title: String title
     */
    public func setTitle(title: String) {
        _lblTitle.text = title
    }
    
    /**
     * Get current value
     * - returns: Value of date string
     */
    public func getValue() -> String {
        return _txtDate.text!
    }
    
    /**
     * Set value
     * - parameter value: Value
     */
    public func setValue(value: String) {
        _txtDate.text = value
        //++ BUG0104-SPJ (NguyenPT 20170606) Fix bug when start input date
        _currentDate = value.getDateFromString()
        //-- BUG0104-SPJ (NguyenPT 20170606) Fix bug when start input date
    }
    
    /**
     * Handle tap on Today button
     */
    internal func btnTodayTapped(_ sender: AnyObject) {
        _currentDate = Date()
        _txtDate.text = CommonProcess.getDateString(date: _currentDate)
    }
    
    // MARK: UITextFieldDelegate
    /**
     * Tells the delegate that editing began in the specified text field.
     */
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        _isInputting = true
        let datePicker = UIDatePicker()
        datePicker.datePickerMode   = .date
        datePicker.date             = _currentDate
        textField.inputView         = datePicker
        datePicker.addTarget(self,
                             action: #selector(datePickerChanged(sender:)),
                             for: .valueChanged)
        markSelected()
        //++ BUG0101-SPJ (NguyenPT 20170603) Fix bug change value of from date and to date in Report screens
        addDoneButtonOnKeyboard()
        //-- BUG0101-SPJ (NguyenPT 20170603) Fix bug change value of from date and to date in Report screens
    }
    
    /**
     * Tells the delegate that editing stopped for the specified text field.
     */
    public func textFieldDidEndEditing(_ textField: UITextField) {
        _isInputting = false
        markSelected(isMark: false)
    }
    
    /**
     * Handle finish edit textfield
     * - parameter textField: Current focus textfield
     */
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _isInputting = false
        textField.resignFirstResponder()
        return true
    }
    
    /**
     * Handle when change value in From date picker
     * - parameter sender: From date picker
     */
    internal func datePickerChanged(sender: UIDatePicker) {
        _currentDate = sender.date
        _txtDate.text = CommonProcess.getDateString(date: _currentDate)
    }
    
    //++ BUG0101-SPJ (NguyenPT 20170603) Fix bug change value of from date and to date in Report screens
    /**
     * Show/hide today button
     * - parameter isShow: Flag show/hide
     */
    public func showTodayButton(isShow: Bool = true) {
        self._btnToday.isHidden = !isShow
    }
    
    /**
     * Set text alignment for control
     * - parameter alignment: NSTextAlignment
     */
    public func setTextAlignment(alignment: NSTextAlignment) {
        _lblTitle.textAlignment = alignment
        _txtDate.textAlignment = alignment
    }
    
    /**
     * Add a done button when keyboard show
     */
    func addDoneButtonOnKeyboard() {
        // Create toolbar
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyboard(_:)))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        // Add toolbar to keyboard
        self._txtDate.inputAccessoryView = doneToolbar
    }
    
    /**
     * Hide keyboard
     */
    func hideKeyboard(_ sender: AnyObject) {
        // Hide keyboard
        self.endEditing(true)
    }
    //-- BUG0101-SPJ (NguyenPT 20170603) Fix bug change value of from date and to date in Report screens
}
