//
//  FullAddressPicker.swift
//  harpyframework
//
//  Created by SPJ on 6/16/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class FullAddressPicker: UIView, AddressPickerViewDelegate {
    // MARK: Properties
    /** Province Picker */
    private var _pkrProvince:           AddressPickerView = AddressPickerView()
    /** District Picker */
    private var _pkrDistrict:           AddressPickerView = AddressPickerView()
    /** Ward Picker */
    private var _pkrWard:               AddressPickerView = AddressPickerView()
    /** Street Picker */
    private var _pkrStreet:             AddressPickerView = AddressPickerView()
    /** House number */
    private var _pkrHouseNum:           AddressPickerView = AddressPickerView()
    /** Address model */
    private var _model:                 FullAddressBean   = FullAddressBean()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    /**
     * Default initializer.
     */
    public init() {
        super.init(frame: UIScreen.main.bounds)
        return
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /**
     * Setup control
     */
    public func setup() {
        var offset: CGFloat = GlobalConst.MARGIN
        // Province control
        offset = addAddressControl(control: _pkrProvince, offset: offset,
                                   label: DomainConst.CONTENT00298,
                                   data: BaseModel.shared.getListProvinces())
        if BaseModel.shared.getListProvinces().count != 0 {
            _pkrProvince.setData(data: BaseModel.shared.getListProvinces())
        } else {
            ProvincesListRequest.requestProvinces(action: #selector(finishRequestProvinces(_:)), view: self)
        }
        // District control
        offset = addAddressControl(control: _pkrDistrict, offset: offset,
                                   label: DomainConst.CONTENT00299,
                                   data: [ConfigBean]())
        // Ward control
        offset = addAddressControl(control: _pkrWard, offset: offset,
                                   label: DomainConst.CONTENT00300,
                                   data: [ConfigBean]())
        // Street control
        _pkrStreet.setup(frame: CGRect(x: 0, y: offset,
                                       width: GlobalConst.SCREEN_WIDTH,
                                       height: GlobalConst.BUTTON_H),
                         lbl: DomainConst.CONTENT00058,
                         data: BaseModel.shared.getListStreets(),
                         isPicker: true, isStreet: true)
        _pkrStreet.delegate = self
        self.addSubview(_pkrStreet)
        offset = (offset + GlobalConst.BUTTON_H)
        _pkrHouseNum.setup(frame: CGRect(x: 0, y: offset,
                                         width: GlobalConst.SCREEN_WIDTH,
                                         height: GlobalConst.BUTTON_H),
                           lbl: DomainConst.CONTENT00057,
                           data: [ConfigBean](), isPicker: false)
        _pkrHouseNum.delegate = self
        self.addSubview(_pkrHouseNum)
        offset += GlobalConst.BUTTON_H
        self.frame = CGRect(x: 0, y: 0, width: GlobalConst.SCREEN_WIDTH,
                            height: offset)
    }
    
    /**
     * Add address control to view
     * - parameter control: Control to add
     * - parameter offset:  Y offset
     * - parameter label:   Label of control
     * - parameter data:    Data
     * - returns: Offset after add control
     */
    private func addAddressControl(control: AddressPickerView, offset: CGFloat,
                                   label: String, data: [ConfigBean]) -> CGFloat {
        control.setup(frame: CGRect(x: 0, y: offset,
                                    width: GlobalConst.SCREEN_WIDTH,
                                    height: GlobalConst.BUTTON_H),
                      lbl: label,
                      data: data)
        control.delegate = self
        self.addSubview(control)
        return (offset + GlobalConst.BUTTON_H)
    }
    
    /**
     * Handle when change address value
     */
    public func valueChanged(_ sender: AnyObject) {
        let picker = (sender as! AddressPickerView)
        // Change value of province
        if picker == _pkrProvince {
            // Save current province id
            //++ BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
            //self._model.provinceId = _pkrProvince.getSelectedID()
            if !_pkrProvince.getSelectedID().isEmpty {
                self._model.provinceId = _pkrProvince.getSelectedID()
            }
            //-- BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
            
            // Check if list of district inside this provice have data
            if BaseModel.shared.getListDistricts(provinceId: _pkrProvince.getSelectedID()) != nil {
                // Set data
                _pkrDistrict.setData(data: BaseModel.shared.getListDistricts(
                    provinceId: _pkrProvince.getSelectedID()))
            } else {
                // Request data from server
                DistrictsListRequest.requestDistricts(
                    action: #selector(finishRequestDistricts(_:)),
                    view: self,
                    provinceId: _pkrProvince.getSelectedID())
            }
        } else if (picker == _pkrDistrict) {    // Change value of district
            // Save current district id
            //++ BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
            //self._model.districtId = _pkrDistrict.getSelectedID()
            if !_pkrDistrict.getSelectedID().isEmpty {
                self._model.districtId = _pkrDistrict.getSelectedID()
            }
            //-- BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
            
            // Check if list of ward inside this district have data
            if BaseModel.shared.getListWards(districtId: _pkrDistrict.getSelectedID()) != nil {
                // Set data
                _pkrWard.setData(data: BaseModel.shared.getListWards(
                    districtId: _pkrDistrict.getSelectedID()))
            } else {
                // Request data from server
                WardsListRequest.requestWards(
                    action: #selector(finishRequestWards(_:)),
                    view: self,
                    provinceId: self._model.provinceId,
                    districtId: self._model.districtId)
            }
        } else if (picker == _pkrWard) {    // Change value of ward
            self._model.wardId = _pkrWard.getSelectedID()
        } else if (picker == _pkrStreet) {    // Change value of street
            self._model.streetId = _pkrStreet.getSelectedID()
        } else {
            self._model.houseNumber = _pkrHouseNum.getSelectedValue()
        }
    }
    
    /**
     * Handle when finish request districts list
     */
    internal func finishRequestDistricts(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = DistrictsListRespModel(jsonString: data)
        if model.isSuccess() {  // Request success
            // Save data to BaseModel
            BaseModel.shared.setListDistricts(provinceId: self._model.provinceId, data: model.getRecord())
            // Set data to picker
            _pkrDistrict.setData(data: model.getRecord())
        }
    }
    
    /**
     * Handle when finish request wards list
     */
    internal func finishRequestWards(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = WardsListRespModel(jsonString: data)
        if model.isSuccess() {  // Request success
            // Save data to BaseModel
            BaseModel.shared.setListWards(districtId: self._model.districtId, data: model.getRecord())
            // Set data to picker
            _pkrWard.setData(data: model.getRecord())
        }
    }
    
    /**
     * Handle when finish request provinces list
     */
    internal func finishRequestProvinces(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = ProvincesListRespModel(jsonString: data)
        if model.isSuccess() {  // Request success
            // Save data to BaseModel
            BaseModel.shared.setListProvinces(data: model.getRecord())
            // Set data to picker
            _pkrProvince.setData(data: model.getRecord())
        }
    }
    
    /**
     * Get current data of control
     * - returns: FullAddressBean object
     */
    public func getData() -> FullAddressBean {
        return self._model
    }
    
    /**
     * Set current data of control
     * - parameter bean: FullAddressBean object
     */
    public func setData(bean: FullAddressBean) {
        self._model = bean
        //++ BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
        // Update street value
        setStreetValue(id: _model.streetId)
        // Update house number value
        _pkrHouseNum.setTextValue(value: _model.houseNumber)
        // Start set province value
        startSetProvince()
        //-- BUG0119-SPJ (NguyenPT 20170704) Handle update customer in Order Family
    }
    
    /**
     * Set province value
     * - parameter id: Id of province
     */
    public func setProvinceValue(id: String) {
        let bool = _pkrProvince.setValue(id: id)
        if bool {
            valueChanged(_pkrProvince)
        }
    }
    
    /**
     * Set District value
     * - parameter id: Id of District
     */
    public func setDistrictValue(id: String) {
        let bool = _pkrDistrict.setValue(id: id)
        if bool {
            valueChanged(_pkrDistrict)
        }
    }
    
    /**
     * Set Ward value
     * - parameter id: Id of Ward
     */
    public func setWardValue(id: String) {
        let bool = _pkrWard.setValue(id: id)
        if bool {
            valueChanged(_pkrWard)
        }
    }
    
    /**
     * Set Street value
     * - parameter id: Id of Ward
     */
    public func setStreetValue(id: String) {
        if _pkrStreet.isDataEmpty() {
            _pkrStreet.setData(data: BaseModel.shared.getListStreets())
        }
        let bool = _pkrStreet.setValue(id: id)
        if bool {
            valueChanged(_pkrStreet)
        }
    }
    
    /**
     * Handle when finish request province list data (while set data)
     */
    internal func finishRequestProvinceListData(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = ProvincesListRespModel(jsonString: data)
        if model.isSuccess() {  // Request success
            // Save data to BaseModel
            BaseModel.shared.setListProvinces(data: model.getRecord())
            // Set data to picker
            _pkrProvince.setData(data: model.getRecord())
            setProvinceValue(id: _model.provinceId)
        }
        startSetDistrict()
    }
    
    /**
     * Handle when finish request district list data (while set data)
     */
    internal func finishRequestDistrictListData(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = DistrictsListRespModel(jsonString: data)
        if model.isSuccess() {  // Request success
            // Save data to BaseModel
            BaseModel.shared.setListDistricts(provinceId: self._model.provinceId, data: model.getRecord())
            // Set data to picker
            _pkrDistrict.setData(data: model.getRecord())
            setDistrictValue(id: _model.districtId)
        }
        startSetWard()
    }
    
    /**
     * Handle when finish request ward list data (while set data)
     */
    internal func finishRequestWardListData(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = WardsListRespModel(jsonString: data)
        if model.isSuccess() {  // Request success
            // Save data to BaseModel
            BaseModel.shared.setListWards(districtId: self._model.districtId, data: model.getRecord())
            // Set data to picker
            _pkrWard.setData(data: model.getRecord())
            setWardValue(id: _model.wardId)
        }
    }
    
    /**
     * Start set province value
     */
    internal func startSetProvince() {
        print(_model.provinceId)
        // Check if list provinces does exist
        if BaseModel.shared.getListProvinces().count > 0 {
            // Set value
            setProvinceValue(id: _model.provinceId)
            // Start set district value
            startSetDistrict()
        } else {
            // Request from server
            ProvincesListRequest.requestProvinces(action: #selector(finishRequestProvinceListData(_:)), view: self)
        }
    }
    
    /**
     * Start set district value
     */
    internal func startSetDistrict() {
        print(_model.districtId)
        // Check if list of district inside this provice have data
        if BaseModel.shared.getListDistricts(provinceId: _model.provinceId) != nil {
            // Set value
            setDistrictValue(id: _model.districtId)
            // Start set ward value
            startSetWard()
        } else {
            // Request data from server
            DistrictsListRequest.requestDistricts(
                action: #selector(finishRequestDistrictListData(_:)),
                view: self,
                provinceId: _model.provinceId)
        }
    }
    
    /**
     * Start set ward value
     */
    internal func startSetWard() {
        print(_model.wardId)
        // Check if list of ward inside this district have data
        if BaseModel.shared.getListWards(districtId: _model.districtId) != nil {
            // Set data
            setWardValue(id: _model.wardId)
        } else {
            // Request data from server
            WardsListRequest.requestWards(
                action: #selector(finishRequestWardListData(_:)),
                view: self,
                provinceId: _model.provinceId,
                districtId: _model.districtId)
        }
    }
}
