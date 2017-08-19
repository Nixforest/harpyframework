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
    
    /**
     * Get list of gas material after sort by selected times
     * - returns: List of OrderDetailBean objects
     */
    public func getListGas() -> [OrderDetailBean] {
        var temp: [FavouriteModel<OrderDetailBean>] = [FavouriteModel<OrderDetailBean>]()
        // Get from [_listGas] value and sort by selected times
        temp =  self._listGas.values.sorted(by: {$0.getSelectedCnt() > $1.getSelectedCnt()})
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
     */
    public func updateListMaterialGas(agentInfo: [AgentInfoBean]) {
        for item in agentInfo {
            // Get current agent
            if item.info_agent.agent_id == BaseModel.shared.getAgentId() {
                updateListMaterialGas(data: item.info_gas)
                break
            }
        }
    }
    
    /**
     * Update data for list material gas
     * - parameter data: List of data
     */
    public func updateListMaterialGas(data: [MaterialBean]) {
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
        saveDataToUserDefault(listData: self._listGas)
    }
    
    /**
     * Increase selected times of material gas
     * - parameter id: Id of material
     * - parameter count: Count of selected times need to increase
     */
    public func increaseMaterialGas(id: String, count: Int = 1) {
        if _listGas.keys.contains(id) {
            _listGas[id]?.increase(count: count)
        }
        saveDataToUserDefault(listData: self._listGas)
    }
    
    /**
     * Save list data to user default
     * - parameter listData: List data to save
     */
    public func saveDataToUserDefault(listData: [String: FavouriteModel<OrderDetailBean>] = [String: FavouriteModel<OrderDetailBean>]()) {
        var data: [String: Int] = [String: Int]()
        // Loop for all element in list data
        for item in listData.keys {
            // Assign selected times
            data[item] = listData[item]?.getSelectedCnt()
        }
        // Encode data
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
        // Save
        defaults.set(encodedData, forKey: DomainConst.KEY_LIST_FAVOURITE_GAS)
        defaults.synchronize()
    }
    
    /**
     * Read data from user default setting
     * - parameter key: Key of setting
     */
    public func readDataFromUserDefault(key: String) {
        var archiveData: [String: Int] = [String: Int]()
        switch key {
        case DomainConst.KEY_LIST_FAVOURITE_GAS:            // Gas material
            // Check data was saved before
            if let data = defaults.object(forKey: key) {
                // Unarchive
                archiveData = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! [String: Int]
                // Remove all current elements
                self._listGas.removeAll()
                // Loop for archive data
                for item in archiveData.keys {
                    // Setup new value
                    self._listGas[item] = FavouriteModel(count: archiveData[item]!, data: OrderDetailBean.init())
                }
            }
            break
        default:
            break
        }
    }
}
