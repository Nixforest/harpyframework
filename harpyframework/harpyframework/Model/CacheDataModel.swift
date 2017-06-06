//
//  CacheDataModel.swift
//  harpyframework
//
//  Created by SPJ on 5/7/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CacheDataModel: NSObject {
    /** List type of store card */
    private var _listStoreCardType:     [ConfigBean]        = [ConfigBean]()
    /** List all materials */
    private var _listAllMaterials:      [OrderDetailBean]   = [OrderDetailBean]()
    /** List cashbook master lookup */
    private var _listCashBook:          [ConfigBean]        = [ConfigBean]()
    //++ BUG0102-SPJ (NguyenPT 20170605) Add new key setting
    /** List ticket handler */
    private var _listTicketHandler:     [ConfigBean]        = [ConfigBean]()
    //-- BUG0102-SPJ (NguyenPT 20170605) Add new key setting
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        super.init()
        self._listStoreCardType = getListConfig(json: jsonData, key: DomainConst.KEY_LIST_TYPE_IN_OUT)
        if let materials = jsonData[DomainConst.KEY_LIST_ALL_MATERIAl] as? [[String: AnyObject]] {
            for item in materials {
                self._listAllMaterials.append(OrderDetailBean(jsonData: item))
            }
        }
        
        self._listCashBook = getListConfig(json: jsonData, key: DomainConst.KEY_LIST_CASHBOOK_MATER_LOOKUP)
        //++ BUG0102-SPJ (NguyenPT 20170605) Add new key setting
        self._listTicketHandler = getListConfig(json: jsonData, key: DomainConst.KEY_LIST_TICKET_HANDLE)
        //-- BUG0102-SPJ (NguyenPT 20170605) Add new key setting
    }
    
    public override init() {
        super.init()
    }
    
    /**
     * Check if object is empty
     * - returns: True if list member data have zero element, False otherwise
     */
    public func isEmpty() -> Bool {
        return _listStoreCardType.count == 0
    }
    
    /**
     * Get list store card types
     * - returns: List store card types
     */
    public func getListStoreCardType() -> [ConfigBean] {
        return _listStoreCardType
    }
    
    /**
     * Get store card type by id
     * - parameter id: Id of store card type
     * - returns: Name of store card type
     */
    public func getStoreCardTypeById(id: String) -> String {
        for item in _listStoreCardType {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    
    /**
     * Get list of gas materials
     * - returns: List of gas materials
     */
    public func getGasMaterials() -> [OrderDetailBean] {
        var retVal: [OrderDetailBean] = [OrderDetailBean]()
        for item in self._listAllMaterials {
            if item.isGas() {
                retVal.append(item)
            }
        }
        return retVal
    }
    
    /**
     * Get list of cylinder materials
     * - returns: List of cylinder materials
     */
    public func getCylinderMaterials() -> [OrderDetailBean] {
        var retVal: [OrderDetailBean] = [OrderDetailBean]()
        for item in self._listAllMaterials {
            if item.isCylinder() {
                retVal.append(item)
            }
        }
        return retVal
    }
    
    /**
     * Get list of all materials
     * - returns: List of all materials
     */
    public func getAllMaterials() -> [OrderDetailBean] {
        return self._listAllMaterials
    }
    
    /**
     * Get list cashbook types
     * - returns: List store card types
     */
    public func getListCashBookType() -> [ConfigBean] {
        return _listCashBook
    }
    
    /**
     * Get cashbook type by id
     * - parameter id: Id of cashbook type
     * - returns: Name of cashbook type
     */
    public func getCashBookTypeById(id: String) -> String {
        for item in _listCashBook {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    
    //++ BUG0102-SPJ (NguyenPT 20170605) Add new key setting
    /**
     * Get list ticket handler
     * - returns: List ticket handler
     */
    public func getListTicketHandler() -> [ConfigBean] {
        return _listTicketHandler
    }
    
    /**
     * Get ticket handler by id
     * - parameter id: Id of ticket handler
     * - returns: Name of ticket handler
     */
    public func getTicketHandlerById(id: String) -> String {
        for item in _listTicketHandler {
            if item.id == id {
                return item.name
            }
        }
        return DomainConst.BLANK
    }
    //-- BUG0102-SPJ (NguyenPT 20170605) Add new key setting
}
