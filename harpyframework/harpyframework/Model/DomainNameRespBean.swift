//
//  DomainNameRespBean.swift
//  harpyframework
//
//  Created by Pham Trung Nguyen on 5/30/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit

public class DomainNameRespBean: BaseRespModel {
    public var data:       String = DomainConst.BLANK
    
    /**
     * Initializer
     */
    override public init(jsonString: String) {
        // Call super initializer
        super.init(jsonString: jsonString)
        
        // Start parse
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                self.data = getString(json: json, key: DomainConst.KEY_DATA)
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
}
