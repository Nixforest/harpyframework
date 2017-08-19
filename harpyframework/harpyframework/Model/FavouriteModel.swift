//
//  FavouriteModel.swift
//  harpyframework
//
//  Created by SPJ on 8/17/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class FavouriteModel<T>: NSObject {
    /** Count of selected times */
    private var _selectedCount:     Int     = 0
    /** List of data */
    private var _data:              T?      = nil
    
    /**
     * Get selected times
     * - returns: Count of selected times
     */
    public func getSelectedCnt() -> Int {
        return self._selectedCount
    }
    
    /**
     * Get data object
     * - returns: Data object
     */
    public func getData() -> T {
        return _data!;
    }
    
    /**
     * Initialize
     * - parameter count: Selected times
     * - parameter data: Data object
     */
    public init(count: Int, data: T) {
        self._selectedCount = count
        self._data = data
    }

    /**
     * Increase selected times
     * - parameter count: Count of selected times need to increase
     */
    public func increase(count: Int = 1) {
        self._selectedCount += count
    }
}
