//
//  FavouriteDataModel.swift
//  harpyframework
//
//  Created by SPJ on 8/17/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class FavouriteDataModel: NSObject {
    /**
     * Object instance
     */
    public static let shared: FavouriteDataModel = {
        let instance = FavouriteDataModel()
        return instance
    }()
    /** Default Setting */
    let defaults = UserDefaults.standard

    /** List of Gas material */
    private var _listGas:   [String: FavouriteModel<OrderDetailBean>] = [String: FavouriteModel<OrderDetailBean>]()
    /** List of gas material (when login) */
    private var _listGasLogin:  [String: FavouriteModel<OrderDetailBean>] = [String: FavouriteModel<OrderDetailBean>]()
    
    // MARK - Methods
    override init() {
        super.init()
        self.readDataFromUserDefault(key: DomainConst.KEY_SETTING_FAVOURITE_GAS)
        self.readDataFromUserDefault(key: DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN)
    }
    
    /**
     * Get list of gas material after sort by selected times
     * - parameter key: Key of setting
     * - returns: List of OrderDetailBean objects
     */
    public func getListGas(key: String = DomainConst.KEY_SETTING_FAVOURITE_GAS) -> [OrderDetailBean] {
        var temp: [FavouriteModel<OrderDetailBean>] = [FavouriteModel<OrderDetailBean>]()
        switch key {
        case DomainConst.KEY_SETTING_FAVOURITE_GAS:
            // Get from [_listGas] value and sort by selected times
            temp =  self._listGas.values.sorted(by: {$0.getSelectedCnt() > $1.getSelectedCnt()})
            break
        case DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN:
            // Get from [_listGasLogin] value and sort by selected times
            temp =  self._listGasLogin.values.sorted(by: {$0.getSelectedCnt() > $1.getSelectedCnt()})
            break
        default:
            break
        }
        var retVal: [OrderDetailBean] = [OrderDetailBean]()
        // Loop and append to return value
        for item in temp {
            retVal.append(item.getData())
        }
        return retVal
    }
    
    /**
     * Update list material gas
     * - parameter agentInfo: Information of agent list, include info_gas and info_cylinder
     * - parameter key: Key of setting
     */
    public func updateListMaterialGas(agentInfo: [AgentInfoBean],
                                      key: String = DomainConst.KEY_SETTING_FAVOURITE_GAS) {
        for item in agentInfo {
            // Get current agent
            if item.info_agent.agent_id == BaseModel.shared.getAgentId() {
                updateListMaterialGas(data: item.info_gas, key: key)
                break
            }
        }
    }
    
    /**
     * Update data for list material gas
     * - parameter data: List of data
     * - parameter key: Key of setting
     */
    public func updateListMaterialGas(data: [MaterialBean],
                                      key: String = DomainConst.KEY_SETTING_FAVOURITE_GAS) {
        switch key {
        case DomainConst.KEY_SETTING_FAVOURITE_GAS:
            for item in data {
                // Not exist yet
                if !_listGas.keys.contains(item.material_id) {
                    // Insert with selected times is zero
                    _listGas[item.material_id] = FavouriteModel(count: 0, data: OrderDetailBean(data: item))
                } else {
                    // Update data: keep selected times value, change content of data
                    _listGas[item.material_id] = FavouriteModel(
                        count: (_listGas[item.material_id]?.getSelectedCnt())!,
                        data: OrderDetailBean(data: item,
                                              qty: ((_listGas[item.material_id]?.getData())! as OrderDetailBean).qty))
                }
            }
            break
        case DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN:
            for item in data {
                // Not exist yet
                if !_listGasLogin.keys.contains(item.material_id) {
                    // Insert with selected times is zero
                    _listGasLogin[item.material_id] = FavouriteModel(count: 0, data: OrderDetailBean(data: item))
                } else {
                    // Update data: keep selected times value, change content of data
                    _listGasLogin[item.material_id] = FavouriteModel(
                        count: (_listGasLogin[item.material_id]?.getSelectedCnt())!,
                        data: OrderDetailBean(data: item,
                                              qty: ((_listGasLogin[item.material_id]?.getData())! as OrderDetailBean).qty))
                }
            }
            break
        default:
            break
        }
        
        saveDataToUserDefault(key: key)
    }
    
    /**
     * Increase selected times of material gas
     * - parameter id: Id of material
     * - parameter count: Count of selected times need to increase
     * - parameter key: Key of setting
     */
    public func increaseMaterialGas(id: String, count: Int = 1,
                                    key: String = DomainConst.KEY_SETTING_FAVOURITE_GAS) {
        switch key {
        case DomainConst.KEY_SETTING_FAVOURITE_GAS:
            if _listGas.keys.contains(id) {
                _listGas[id]?.increase(count: count)
            }
            break
        case DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN:
            if _listGasLogin.keys.contains(id) {
                _listGasLogin[id]?.increase(count: count)
            }
            break
        default:
            break
        }
        
        saveDataToUserDefault(key: key)
    }
    
    /**
     * Save list data to user default
     * - parameter key: Key of setting
     */
    public func saveDataToUserDefault(key: String = DomainConst.KEY_SETTING_FAVOURITE_GAS) {
        var data: [String: Int] = [String: Int]()
        switch key {
        case DomainConst.KEY_SETTING_FAVOURITE_GAS:
            // Loop for all element in list data
            for item in self._listGas.keys {
                // Assign selected times
                data[item] = self._listGas[item]?.getSelectedCnt()
            }
            break
        case DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN:
            // Loop for all element in list data
            for item in self._listGasLogin.keys {
                // Assign selected times
                data[item] = self._listGasLogin[item]?.getSelectedCnt()
            }
            break
        default:
            break
        }
        
        // Encode data
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
        // Save
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
    
    /**
     * Read data from user default setting
     * - parameter key: Key of setting
     */
    public func readDataFromUserDefault(key: String) {
        var archiveData: [String: Int] = [String: Int]()
        // Check data was saved before
        if let data = defaults.object(forKey: key) {
            // Unarchive
            archiveData = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! [String: Int]
            switch key {
            case DomainConst.KEY_SETTING_FAVOURITE_GAS:            // Gas material
                // Remove all current elements
                self._listGas.removeAll()
                // Loop for archive data
                for item in archiveData.keys {
                    // Setup new value
                    self._listGas[item] = FavouriteModel(count: archiveData[item]!, data: OrderDetailBean.init())
                }
                break
            case DomainConst.KEY_SETTING_FAVOURITE_GAS_LOGIN:            // Gas material
                // Remove all current elements
                self._listGasLogin.removeAll()
                // Loop for archive data
                for item in archiveData.keys {
                    // Setup new value
                    self._listGasLogin[item] = FavouriteModel(count: archiveData[item]!, data: OrderDetailBean.init())
                }
                break
            default:
                break
            }
        }
    }
}
