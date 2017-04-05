//
//  AddressPickerView.swift
//  harpyframework
//
//  Created by SPJ on 4/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class AddressPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    // MARK: Properties
    private var _data:          [ConfigBean]    = [ConfigBean]()
    /** Blur view */
    private var _viewBlur:      UIView          = UIView()
    /** Number picker */
    private var _pickerView:    UIPickerView    = UIPickerView()
    /** Label */
    private var _lbl:           UILabel         = UILabel()
    /** Value */
    private var _tbx:           UITextField     = UITextField()
    /** Input view is picker view */
    private var _bIsPicker:     Bool            = true
    /** Action */
    public var delegate: AddressPickerViewDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * Setup layout
     * - parameter frame: Frame of control
     * - parameter checkboxLabel: Label of checkbox
     */
    public func setup(frame: CGRect, lbl: String, data: [ConfigBean], isPicker: Bool = true) {
        self.frame = frame
        self.backgroundColor = UIColor.white
        
        let leftWidth = self.frame.width / 3
        let rightWidth = self.frame.width * 2 / 3
        let yOffset = (self.frame.height - GlobalConst.LABEL_H) / 2
        
        // Label
        _lbl.frame = CGRect(x: 0, y: yOffset,
                            width: leftWidth,
                            height: GlobalConst.LABEL_H)
        _lbl.text = lbl
        _lbl.textColor = UIColor.black
        _lbl.font = UIFont.systemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
        _lbl.textAlignment = .right
        self.addSubview(_lbl)
        //self.addSubview(_pickerView)
        
        // Value
        _tbx.frame = CGRect(x: leftWidth + GlobalConst.MARGIN, y: yOffset,
                            width: rightWidth,
                            height: GlobalConst.LABEL_H)
        _tbx.placeholder = lbl
        _tbx.font = UIFont.boldSystemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
        _tbx.textAlignment = .left
        _tbx.textColor = UIColor.black
        _bIsPicker = isPicker
        if isPicker {
            // Set input view is picker view
            _tbx.inputView = _pickerView
        } else {
            // Normal input view is keyboar, return type is Done
            _tbx.returnKeyType = .done
        }
        _tbx.delegate = self
        self.addSubview(_tbx)
        
        // Picker
//        self._pickerView.frame = CGRect(x: 0,
//                                        y: GlobalConst.SCREEN_HEIGHT / 2,
//                                        width: GlobalConst.SCREEN_WIDTH,
//                                        height: GlobalConst.SCREEN_HEIGHT / 3)
        self._pickerView.backgroundColor = UIColor.white
        self._pickerView.delegate = self
        self._pickerView.dataSource = self
        self.setData(data: data)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self._data.count
    }
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.frame.width
    }
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.frame.height
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self._data[row].name
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self._tbx.resignFirstResponder()
        self._tbx.text = getSelectedValue()
        delegate?.valueChanged(self)
    }
    
    /**
     * Handle start editing
     * - parameter textField: Current focus textfield
     */
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self._pickerView.isHidden = false
    }
    
    /**
     * Handle finish edit textfield
     * - parameter textField: Current focus textfield
     */
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /**
     * Set data for picker view
     * - parameer data: Data to set
     */
    public func setData(data: [ConfigBean]) {
        self._data.removeAll()
        self._data.append(contentsOf: data)
    }
    
    /**
     * Get selected id
     * - returns: Selected id
     */
    public func getSelectedID() -> String {
        if _bIsPicker {
            if self._data.count > self._pickerView.selectedRow(inComponent: 0) {
                return self._data[self._pickerView.selectedRow(inComponent: 0)].id
            }
            return DomainConst.BLANK
        }
        return _tbx.text!
    }
    
    /**
     * Get selected name
     * - returns: Selected name
     */
    public func getSelectedValue() -> String {
        if _bIsPicker {
            if self._data.count > self._pickerView.selectedRow(inComponent: 0) {
                return self._data[self._pickerView.selectedRow(inComponent: 0)].name
            }
            return DomainConst.BLANK
        }
        return _tbx.text!
    }
    
    /**
     * Set value for address
     * - parameter value:        Value string
     * - parameter isRemoveSign: Flag check if need remove sign in result
     * - parameter value: Value string
     */
    public func setValue(value: String, isRemoveSign: Bool = false) -> Bool {
        if _bIsPicker {
            // Reset text
            _tbx.text = DomainConst.BLANK
            // Search value in data
            for i in 0..<self._data.count {
                // Need remove sign
                if isRemoveSign {
                    if self._data[i].name.removeSign().lowercased().range(of: value) != nil {
                        self._pickerView.selectRow(i, inComponent: 0, animated: true)
                        _tbx.text = self._data[i].name
                        return true
                    }
                } else {    // No need remove sign
                    if self._data[i].name.lowercased().range(of: value) != nil {
                        self._pickerView.selectRow(i, inComponent: 0, animated: true)
                        _tbx.text = self._data[i].name
                        return true
                    }
                }
            }
        } else {
            // Input view is keyboard
            _tbx.text = value
        }
        return false
    }
}
