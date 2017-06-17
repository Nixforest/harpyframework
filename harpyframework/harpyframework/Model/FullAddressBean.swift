//
//  FullAddressBean.swift
//  harpyframework
//
//  Created by SPJ on 6/16/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class FullAddressBean: ConfigBean {
    /** Province */
    public var provinceId:      String = DomainConst.BLANK
    /** District */
    public var districtId:      String = DomainConst.BLANK
    /** Ward */
    public var wardId:          String = DomainConst.BLANK
    /** Street */
    public var streetId:        String = DomainConst.BLANK
    /** House number */
    public var houseNumber:     String = DomainConst.BLANK
    
    /**
     * Constructor
     * - parameter provinceId:  Id of Province
     * - parameter districtId:  Id of District
     * - parameter wardId:      Id of Ward
     * - parameter streetId:    Id of Street
     * - parameter houseNumber: House number
     */
    public init(provinceId: String, districtId: String,
                wardId: String, streetId: String, houseNumber: String) {
        super.init()
        self.provinceId = provinceId
        self.districtId = districtId
        self.wardId     = wardId
        self.streetId   = streetId
        self.houseNumber = houseNumber
    }
    
    /**
     * Constructor
     * - parameter provinceId:  Id of Province
     * - parameter districtId:  Id of District
     * - parameter wardId:      Id of Ward
     * - parameter streetId:    Id of Street
     * - parameter houseNumber: House number
     * - parameter fullAddress: Full address
     */
    public init(provinceId: String, districtId: String,
                wardId: String, streetId: String,
                houseNumber: String, fullAddress: String) {
        super.init()
        self.provinceId = provinceId
        self.districtId = districtId
        self.wardId     = wardId
        self.streetId   = streetId
        self.houseNumber = houseNumber
        self.name       = fullAddress
    }
    
    override public init() {
        super.init()
    }
    
    /**
     * Get Province name
     * - returns: Name of province
     */
    public func getProvinceName() -> String {
        return BaseModel.shared.getProvinceNameById(id: self.provinceId)
    }
    
    /**
     * Get District name
     * - returns: Name of district
     */
    public func getDistrictName() -> String {
        return BaseModel.shared.getDistrictNameById(id: self.districtId,
                                                    provinceId: self.provinceId)
    }
    
    /**
     * Get Ward name
     * - returns: Name of ward
     */
    public func getWardName() -> String {
        return BaseModel.shared.getWardNameById(id: self.wardId,
                                                districtId: self.districtId)
    }
    
    /**
     * Get full address string
     * - returns: String
     */
    public func getFullAddress() -> String {
        let addressLst = [
            self.houseNumber,
            BaseModel.shared.getStreetNameById(id: self.streetId),
            getWardName(),
            getDistrictName(),
            getProvinceName()
        ]
        return addressLst.joined(separator: DomainConst.ADDRESS_SPLITER_WITH_SPACE)
    }
}
