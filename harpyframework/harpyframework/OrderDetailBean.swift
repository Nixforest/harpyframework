//
//  OrderDetailBean.swift
//  harpyframework
//
//  Created by SPJ on 12/31/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import UIKit

public class OrderDetailBean: NSObject {
    /** Material type id */
    public var materials_type_id: String = ""
    /** Material id */
    public var material_id: String = ""
    /** Material name */
    public var material_name: String = ""
    /** Material price */
    public var material_price: String = ""
    /** Price */
    public var price: String = ""
    /** Quantity */
    public var qty: String = ""
    /** Amount */
    public var amount: String = ""
    /** Material image */
    public var material_image: String = ""
    
    /**
     * Initializer
     * - parameter jsonData: List of data
     */
    public init(jsonData: [String: AnyObject]) {
        self.materials_type_id  = jsonData[DomainConst.KEY_MATERIALS_TYPE_ID] as? String ?? ""
        self.material_id        = jsonData[DomainConst.KEY_MATERIALS_ID] as? String ?? ""
        self.material_name      = jsonData[DomainConst.KEY_MATERIALS_NAME] as? String ?? ""
        self.material_price     = jsonData[DomainConst.KEY_MATERIALS_PRICE] as? String ?? ""
        self.price              = jsonData[DomainConst.KEY_PRICE] as? String ?? ""
        self.qty                = jsonData[DomainConst.KEY_QUANTITY] as? String ?? ""
        self.amount             = jsonData[DomainConst.KEY_AMOUNT] as? String ?? ""
        self.material_image     = jsonData[DomainConst.KEY_MATERIAL_IMAGE] as? String ?? ""
    }

}
