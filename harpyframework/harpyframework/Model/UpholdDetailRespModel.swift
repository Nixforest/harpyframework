//
//  UpholdDetailRespModel.swift
//  project
//
//  Created by Nixforest on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
public class UpholdDetailRespModel: BaseRespModel {
    /** Model uphold */
    public var model_uphold: UpholdBean = UpholdBean()
    
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
                
                if self.status != DomainConst.RESPONSE_STATUS_SUCCESS {
                    return
                }
                if let dataArr = json[DomainConst.KEY_MODEL_UPHOLD] as? [String: AnyObject] {
                    self.model_uphold = UpholdBean(jsonData: dataArr)
                }
            } catch let error as NSError {
                print(DomainConst.JSON_ERR_FAILED_LOAD + "\(error.localizedDescription)")
            }
            
        } else {
            print(DomainConst.JSON_ERR_WRONG_FORMAT)
        }
    }
}
