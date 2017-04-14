//
//  BaseAPITestViewController.swift
//  harpyframework
//
//  Created by SPJ on 3/23/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class BaseAPITestViewController: ChildViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    /** List API on this view */
    private var _listAPI: [ConfigBean]              = [ConfigBean]()
    /** Current API */
    private var _currentAPI: Int                    = 0
    /** List parameter */
    //private var _listParam: [String]                = [String]()
    /** API label */
    private var _lblAPI: UILabel                    = UILabel()
    /** API picker */
    private var _pickerAPI: UIPickerView            = UIPickerView()
    /** Blur view */
    private var _viewBlur: UIView                   = UIView()
    /** List parameter text */
    private var _listParamTextField: [UITextField]  = [UITextField]()
    /** Button add parameter */
    private var _btnAddParam: UIButton              = UIButton()
    /** Button execute */
    private var _btnExecute: UIButton               = UIButton()
    /** Result text view */
    private var _resultTextView: UITextView         = UITextView()
    /** Current text field */
    private var _currentTextField: UITextField? = nil
    /** Scroll view */
    var _scrollView: UIScrollView   = UIScrollView()

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationBar(title: "Test API")
        
        // Create data
        createData()
        
        var offset: CGFloat = 0.0
        _scrollView.frame = CGRect(
            x: 0,
            y: 0,
            width: GlobalConst.SCREEN_WIDTH,
            height: GlobalConst.SCREEN_HEIGHT)
        // Label API
        _lblAPI.textAlignment = .center
        _lblAPI.frame = CGRect(x: 0, y: offset,
                               width: GlobalConst.SCREEN_WIDTH,
                               height: GlobalConst.LABEL_HEIGHT)
        _lblAPI.textColor = UIColor.gray
        if _listAPI.count > 0 {
            _lblAPI.text = _listAPI[0].name
        }
        _lblAPI.isUserInteractionEnabled = true
        // Handle tap on this label API
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(showListAPI(_:)))
        gesture.numberOfTapsRequired = 1
        _lblAPI.addGestureRecognizer(gesture)
        offset += _lblAPI.frame.height + GlobalConst.MARGIN_CELL_Y                                                
        self._scrollView.addSubview(_lblAPI)
        
        // Picker view
        let height = GlobalConst.SCREEN_HEIGHT - getTopHeight()
        _pickerAPI.frame = CGRect(x: 0, y: height * 2 / 3,
                                  width: GlobalConst.SCREEN_WIDTH,
                                  height: height / 3)
        _pickerAPI.backgroundColor = UIColor.white
        _pickerAPI.delegate = self
        _pickerAPI.dataSource = self
        _pickerAPI.isHidden = false
        CommonProcess.setBorder(view: _pickerAPI)
        // Blur view
        _viewBlur.frame = CGRect(x: 0, y: 0, width: GlobalConst.SCREEN_WIDTH,
                                      height: GlobalConst.SCREEN_HEIGHT)
        _viewBlur.backgroundColor = UIColor(white: 0x444444, alpha: 0)
        _viewBlur.addSubview(_pickerAPI)
        _viewBlur.isHidden = true
        self._scrollView.insertSubview(_viewBlur, at: 0)
        //self._scrollView.addSubview(_viewBlur)
        // List param
        for i in 1...4 {
            createTextField(offset: offset, idx: i)
            offset += GlobalConst.EDITTEXT_H + GlobalConst.MARGIN_CELL_Y
        }
        
        // Button add parameter
        _btnAddParam.frame = CGRect(x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
                                        y: offset,
                                        width: GlobalConst.BUTTON_W / 2,
                                        height: GlobalConst.BUTTON_H)
        _btnAddParam.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        _btnAddParam.setTitle("Add param", for: UIControlState())
        _btnAddParam.setTitleColor(UIColor.white, for: UIControlState())
        _btnAddParam.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        _btnAddParam.addTarget(self, action: #selector(btnAddParamTapped), for: .touchUpInside)
        _btnAddParam.layer.cornerRadius = GlobalConst.LOGIN_BUTTON_CORNER_RADIUS
        self._scrollView.addSubview(_btnAddParam)
        
        // Button Execute
        _btnExecute.frame = CGRect(x: GlobalConst.SCREEN_WIDTH / 2,
                                    y: offset,
                                    width: GlobalConst.BUTTON_W / 2,
                                    height: GlobalConst.BUTTON_H)
        _btnExecute.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        _btnExecute.setTitle("Run", for: UIControlState())
        _btnExecute.setTitleColor(UIColor.white, for: UIControlState())
        _btnExecute.titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        _btnExecute.addTarget(self, action: #selector(btnExecuteTapped), for: .touchUpInside)
        _btnExecute.layer.cornerRadius = GlobalConst.LOGIN_BUTTON_CORNER_RADIUS
        self._scrollView.addSubview(_btnExecute)
        offset += _btnExecute.frame.height + GlobalConst.MARGIN_CELL_Y
        
        // Result
        _resultTextView.frame = CGRect(x: GlobalConst.MARGIN,
                                       y: offset,
                                       width: GlobalConst.SCREEN_WIDTH - 2 * GlobalConst.MARGIN,
                                       height: GlobalConst.SCREEN_HEIGHT)
        CommonProcess.setBorder(view: _resultTextView)
        self._scrollView.addSubview(_resultTextView)
        offset += _resultTextView.frame.height
        
        
        
        _scrollView.contentSize = CGSize(
            width: GlobalConst.POPOVER_WIDTH,
            height: offset)
        self.view.addSubview(_scrollView)
    }
    
    /**
     * Create data
     */
    open func createData() {
        var listAPI: [ConfigBean] = [ConfigBean]()
        listAPI.append(ConfigBean(id: "ProvincesListRequest", name: "Province List API"))
        listAPI.append(ConfigBean(id: "DistrictsListRequest", name: "District List API"))
        listAPI.append(ConfigBean(id: "WardsListRequest", name: "Ward List API"))
        listAPI.append(ConfigBean(id: OrderFamilyListRequest.theClassName, name: OrderFamilyListRequest.theClassName))
        listAPI.append(ConfigBean(id: OrderFamilyViewRequest.theClassName, name: OrderFamilyViewRequest.theClassName))
        setData(listAPI: listAPI)
    }
    
    /**
     * Handle when tap Add parameter button
     */
    func btnAddParamTapped(_ sender: AnyObject) {
        var offset = _lblAPI.frame.maxY + GlobalConst.MARGIN_CELL_Y
        if _listParamTextField.count > 0 {
            offset = _listParamTextField[_listParamTextField.count - 1].frame.maxY + GlobalConst.MARGIN_CELL_Y
        }
        createTextField(offset: offset, idx: _listParamTextField.count + 1)
        offset += GlobalConst.EDITTEXT_H + GlobalConst.MARGIN_CELL_Y
        updateLayout(offset: offset)
    }
    
    /**
     * Create text field
     * - parameter offset:  Y offset
     * - parameter idx:     Index
     */
    func createTextField(offset: CGFloat, idx: Int) {
        let textField: UITextField = UITextField()
        textField.frame = CGRect(x: GlobalConst.MARGIN,
                                 y: offset,
                                 width: GlobalConst.SCREEN_WIDTH - 2 * GlobalConst.MARGIN,
                                 height: GlobalConst.EDITTEXT_H)
        textField.placeholder = "Parameter " + String(idx)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.tag = idx
        textField.delegate = self
        self._listParamTextField.append(textField)
        self._scrollView.addSubview(textField)
    }
    
    /**
     * Handle when tap Execute button
     */
    func btnExecuteTapped(_ sender: AnyObject) {
        // Check value of current API is valid
        if (_currentAPI == -1) || (_currentAPI >= _listAPI.count)  {
            return
        }
        self.execute()
    }
    
    open func execute() {
        // Must override in Child class
        
        switch getCurrentAPIId() {
        case "ProvincesListRequest":
            ProvincesListRequest.request(
                //action: #selector(finishHandler(_:)),
                action: #selector(finishHandlerProvinceList(_:)),
                view: self)
            break
        case "DistrictsListRequest":
            DistrictsListRequest.request(
                action: #selector(finishHandler(_:)),
                view: self,
                provinceId: getParam(idx: 0))
            break
        case "WardsListRequest":
            WardsListRequest.request(
                action: #selector(finishHandler(_:)),
                view: self,
                provinceId: getParam(idx: 0),
                districtId: getParam(idx: 1))
            break
        case OrderFamilyListRequest.theClassName:
            OrderFamilyListRequest.request(
                action: #selector(finishHandler(_:)),
                view: self,
                page: getParam(idx: 0),
                status: getParam(idx: 1))
        case OrderFamilyViewRequest.theClassName:
            OrderFamilyViewRequest.request(
                action: #selector(finishHandler(_:)),
                view: self,
                id: getParam(idx: 0))
        default: break
        }
    }
    
    /**
     * Update layout of view
     * - parameter offset: Y Offset
     */
    func updateLayout(offset: CGFloat) {
        var off = offset
        _btnAddParam.frame = CGRect(x: _btnAddParam.frame.minX,
                                    y: off,
                                    width: _btnAddParam.frame.width,
                                    height: _btnAddParam.frame.height)
        _btnExecute.frame = CGRect(x: _btnExecute.frame.minX,
                                    y: off,
                                    width: _btnExecute.frame.width,
                                    height: _btnExecute.frame.height)
        off += _btnExecute.frame.height + GlobalConst.MARGIN_CELL_Y
        _resultTextView.frame = CGRect(x: _resultTextView.frame.minX,
                                   y: off,
                                   width: _resultTextView.frame.width,
                                   height: _resultTextView.frame.height)
        off += _resultTextView.frame.height
        _scrollView.contentSize = CGSize(
            width: GlobalConst.POPOVER_WIDTH,
            height: offset)
    }
    
    /**
     * Handle show list of APIs
     */
    internal func showListAPI(_ sender: AnyObject) {
        if _listAPI.count > 0 {
            self._scrollView.bringSubview(toFront: _viewBlur)
            _viewBlur.isHidden = false
        }
    }
    
    /**
     * Set data for list API
     * - parameter listAPI: List APIs
     */
    open func setData(listAPI: [ConfigBean]) {
        self._listAPI.removeAll()
        self._listAPI.append(contentsOf: listAPI)
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return _listAPI.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _listAPI[row].name
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self._viewBlur.isHidden = true
        self._currentAPI = row
        self._lblAPI.text = _listAPI[row].name
    }
    
    /**
     * Get current API Id
     * - returns: Id of current API
     */
    public func getCurrentAPIId() -> String {
        // Check value of current API is valid
        if (_currentAPI == -1) || (_currentAPI >= _listAPI.count)  {
            return DomainConst.BLANK
        }
        return _listAPI[_currentAPI].id
    }
    
    /**
     * Get value of parameters
     * - parameter idx: Index of parameter
     * - returns: Text value of parameter
     */
    public func getParam(idx: Int) -> String {
        if (idx >= 0) && (idx < _listParamTextField.count) {
            return _listParamTextField[idx].text!
        }
        return DomainConst.BLANK
    }
    
    /**
     * Finish executed handler
     */
    public func finishHandler(_ notification: Notification) {
        let dataStr = (notification.object as! String)
        // Convert String to NSData
        if let jsonData = dataStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as AnyObject
                let prettyJsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                let prettyJsonStr = NSString(data: prettyJsonData, encoding: String.Encoding.utf8.rawValue)
                
                _resultTextView.text = prettyJsonStr as String!
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
        
        //_resultTextView.text = dataStr
    }
    
    public func finishHandlerProvinceList(_ notification: Notification) {
        let dataStr = (notification.object as! String)
        let model = ProvincesListRespModel(jsonString: dataStr)
        print(model)
    }
    
    /**
     * Handle when leave focus edittext
     * - parameter textField: Textfield is focusing
     */
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // Try to find next responder
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
        
        if (nextResponder != nil){
            // Found next responder, so set it.
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame = CGRect(x: self.view.frame.origin.x, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            })
        }
        return true
    }
    
    /**
     * Handle when focus edittext
     * - parameter textField: Textfield will be focusing
     */
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self._currentTextField = textField
    }
    
    /**
     * Handle move textfield when keyboard overloading
     */
    override open func keyboardWillShow(_ notification: Notification) {
        super.keyboardWillShow(notification)
        if self._currentTextField != nil {
            let delta = (self._currentTextField?.frame.maxY)! - self.keyboardTopY
            if delta > 0 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y - delta, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
}
