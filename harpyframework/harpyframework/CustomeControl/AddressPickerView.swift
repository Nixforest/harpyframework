//
//  AddressPickerView.swift
//  harpyframework
//
//  Created by SPJ on 4/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class AddressPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate,
    //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address
    UITableViewDelegate, UITableViewDataSource {
    //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address
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
    //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address
    /** Search bar table view */
    private var _tblSearch:     UITableView     = UITableView()
    /** Data */
    private var _dataSearch:    [ConfigBean]    = [ConfigBean]()
    /** Flag begin search */
    private var _beginSearch:   Bool            = false
    /** Flag search active */
    private var _searchActive:  Bool            = false
    /** Current value */
    private var _currentValue:  ConfigBean      = ConfigBean()
    //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address
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
    public func setup(frame: CGRect, lbl: String, data: [ConfigBean], isPicker: Bool = true,
                      //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address
                      isStreet: Bool = false) {
                      //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address
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
                            width: rightWidth - GlobalConst.MARGIN,
                            height: GlobalConst.LABEL_H)
        _tbx.placeholder     = lbl
        _tbx.font            = UIFont.boldSystemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
        _tbx.textAlignment   = .left
        _tbx.textColor       = UIColor.black
        _tbx.clearButtonMode = .whileEditing
        _tbx.clearsOnBeginEditing = true
        _bIsPicker           = isPicker
        if isPicker {
            //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
//            // Set input view is picker view
//            _tbx.inputView = _pickerView
            if !isStreet {
                _tbx.inputView = _pickerView
            }
            //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        } else {
            // Normal input view is keyboar, return type is Done
            _tbx.returnKeyType = .done
        }
        _tbx.delegate = self
        self.addSubview(_tbx)
        
        // Picker
        self._pickerView.backgroundColor = UIColor.white
        self._pickerView.delegate        = self
        self._pickerView.dataSource      = self
        
        //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        if isPicker {
            if isStreet {
                // Table search
                //_tblSearch.isHidden = !_searchActive
                showHideTableView(isShow: _searchActive)
                // Put in bottom of window
                _tblSearch.frame = CGRect(x: 0,
                                          y: GlobalConst.SCREEN_HEIGHT - (GlobalConst.CELL_IN_SEARCHBAR_TABLE_HEIGHT * 5),
                                          width: GlobalConst.SCREEN_WIDTH,
                                          height: GlobalConst.CELL_IN_SEARCHBAR_TABLE_HEIGHT * 5)
                _tblSearch.delegate = self
                _tblSearch.dataSource = self
                // Add table search to top most windows
                UIApplication.shared.keyWindow!.addSubview(_tblSearch)
                // Add handler when change value of text
                _tbx.addTarget(self, action: #selector(textFieldDidChange(_:)),
                               for: .editingChanged)
                _dataSearch.append(contentsOf: data)
            }
        }
        //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        
        self.setData(data: data)
        self.makeComponentsColor()
    }
    
    /**
     * Called by the picker view when it needs the number of components.
     */
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /**
     * Called by the picker view when it needs the number of rows for a specified component.
     */
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self._data.count
    }
    
    /**
     * Called by the picker view when it needs the row width to use for drawing row content.
     */
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.frame.width
    }
    
    /**
     * Called by the picker view when it needs the row height to use for drawing row content.
     */
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.frame.height
    }
    
    /**
     * Called by the picker view when it needs the title to use for a given row in a given component.
     */
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //++ BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
        //return self._data[row].name
        if self._data.count > row {
            return self._data[row].name
        }
        return DomainConst.BLANK
        //-- BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
    }
    
    /**
     * Called by the picker view when the user selects a row in a component.
     */
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self._tbx.resignFirstResponder()
        
        //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        if _data.count > row {
            _currentValue = _data[row]
        }
        //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        
        self._tbx.text = getSelectedValue()
        if _bIsPicker {
            delegate?.valueChanged(self)
        }
    }
    
    /**
     * Handle start editing
     * - parameter textField: Current focus textfield
     */
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self._pickerView.isHidden = false
        _searchActive = true
//        _tblSearch.isHidden  = !_searchActive
        _dataSearch.append(contentsOf: self._data)
        showHideTableView(isShow: _searchActive)
        _tblSearch.reloadData()
    }
    
    /**
     * Handle finish edit textfield
     * - parameter textField: Current focus textfield
     */
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        _currentValue.name = textField.text!
        //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
        textField.resignFirstResponder()
        return true
    }
    
    /**
     * Tells the delegate that editing stopped for the specified text field.
     */
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if !_bIsPicker {
            delegate?.valueChanged(self)
        }
    }
    
    //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
    /**
     * Handler when change text of textfield
     */
    public func textFieldDidChange(_ textField: UITextField) {
        let filteredStr = _tbx.text!
        if filteredStr.characters.count > (DomainConst.SEARCH_TARGET_MIN_LENGTH - 1) {
            _beginSearch = false
            _searchActive = true
            // Start count
            /** Timer for search auto complete */
            var timer = Timer()
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(beginSearching), userInfo: nil, repeats: false)
            
        } else {
            _beginSearch            = false
            _searchActive           = false
            // Hide search bar table view
            //_tblSearch.isHidden  = !_searchActive
            _dataSearch.removeAll()
            _dataSearch.append(contentsOf: self._data)
            _tblSearch.reloadData()
        }
    }
    
    /**
     * Handle begin search
     */
    func beginSearching()  {
        if _beginSearch == false {
            _beginSearch = true
        }
        // Remove all current data
        _dataSearch.removeAll()
        
        if _tbx.text != nil {
            // Get keyword
            let keyword = _tbx.text!.removeSign().lowercased()
            for item in self._data {
                if item.data.count != 0 {
                    if item.data[0].name.contains(keyword) {
                        _dataSearch.append(item)
                    }
                }
                
            }
        }
        //_tblSearch.isHidden = !_searchActive
        _tblSearch.reloadData()
        _tblSearch.layer.zPosition = CGFloat(MAXFLOAT)
    }
    //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
    
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
        //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
//        if _bIsPicker {
//            if self._data.count > self._pickerView.selectedRow(inComponent: 0) {
//                return self._data[self._pickerView.selectedRow(inComponent: 0)].id
//            }
//            return DomainConst.BLANK
//        }
//        return _tbx.text!
        return _currentValue.id
        //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
    }
    
    /**
     * Get selected name
     * - returns: Selected name
     */
    public func getSelectedValue() -> String {
        //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
//        if _bIsPicker {
//            if self._data.count > self._pickerView.selectedRow(inComponent: 0) {
//                return self._data[self._pickerView.selectedRow(inComponent: 0)].name
//            }
//            return DomainConst.BLANK
//        }
//        return _tbx.text!
        return _currentValue.name
        //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
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
            return true
        }
        return false
    }
    
    //++ BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
    // MARK: - UITableViewDataSource
    /**
     * Tells the data source to return the number of rows in a given section of a table view.
     */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return _dataSearch.count
    }
    
    /**
     * Asks the data source for a cell to insert in a particular location of the table view.
     */
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = _dataSearch[indexPath.row].name
        return cell
    }
    
    /**
     * Asks the delegate for the height to use for a row in a specified location.
     */
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    /**
     * Tells the delegate that the specified row is now selected.
     */
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self._tbx.resignFirstResponder()
        _currentValue = _dataSearch[indexPath.row]
        self._tbx.text = getSelectedValue()
        if _bIsPicker {
            delegate?.valueChanged(self)
        }
        _searchActive = false
        //_tblSearch.isHidden = !_searchActive
        showHideTableView(isShow: _searchActive)
    }
    //-- BUG0109-SPJ (NguyenPT 20170617) Handle search address when pick street
    
    /**
     * Handle show/hide tableview
     * - parameter isShow: Flag show/hide
     */
    private func showHideTableView(isShow: Bool) {
        if isShow { // Want to show
            if self._data.count > 0 {   // Check if data is not empty
                _tblSearch.isHidden = false
            }
        } else {    // Want to hide
            _tblSearch.isHidden = true
        }
    }
    
    /**
     * Get value of textfield
     * - returns: Value of textfield
     */
    public func getTextValue() -> String {
        return self._tbx.text!
    }
    
    /**
     * Set select row for picker
     * - parameter row: Row for set select
     */
    public func setSelectRow(row: Int) {
        if _bIsPicker {
            if _pickerView.numberOfRows(inComponent: 0) > row {
                _pickerView.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    
    /**
     * Set value with Id
     * - parameter id: Id of item need to set
     * - returns: True if set value is success, False otherwise
     */
    public func setValue(id: String) -> Bool {
        if _bIsPicker {
            for i in 0..<_data.count {
                if id == _data[i].id {
                    _tbx.text = _data[i].name
                    setSelectRow(row: i)
                    return true
                }
            }
        }
        return false
    }
    
    /**
     * Set value for textbox
     * - parameter value: Value for textbox
     */
    public func setTextValue(value: String) {
        _tbx.text = value
    }
    
    //++ BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
    /**
     * Check if data of picker is empty
     */
    public func isDataEmpty() -> Bool {
        return (self._data.count == 0)
    }
    //-- BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
}
