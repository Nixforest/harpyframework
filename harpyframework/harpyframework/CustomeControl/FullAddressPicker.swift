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
            self._model.provinceId = _pkrProvince.getSelectedID()
            
            // Check if list of district inside this provice have data
            if BaseModel.shared.getListDistricts(provinceId: _pkrProvince.getSelectedID()) != nil {
                // Set data
                _pkrDistrict.setData(data: BaseModel.shared.getListDistricts(
                    provinceId: _pkrProvince.getSelectedID())!)
            } else {
                // Request data from server
                DistrictsListRequest.requestDistricts(
                    action: #selector(finishRequestDistricts(_:)),
                    view: self,
                    provinceId: _pkrProvince.getSelectedID())
            }
        } else if (picker == _pkrDistrict) {    // Change value of district
            // Save current district id
            self._model.districtId = _pkrDistrict.getSelectedID()
            
            // Check if list of ward inside this district have data
            if BaseModel.shared.getListWards(districtId: _pkrDistrict.getSelectedID()) != nil {
                // Set data
                _pkrWard.setData(data: BaseModel.shared.getListWards(
                    districtId: _pkrDistrict.getSelectedID())!)
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
    }
}
