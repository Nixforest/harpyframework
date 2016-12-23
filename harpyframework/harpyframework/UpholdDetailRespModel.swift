//
//  UpholdDetailRespModel.swift
//  project
//
//  Created by Nixforest on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import Foundation
class UpholdDetailRespModel: BaseRespModel {
    /** Model uphold */
    var model_uphold: UpholdBean = UpholdBean()
    
    /**
     * Initializer
     */
    override init(jsonString: String) {
        // Call super initializer
        super.init(jsonString: jsonString)
        
        // Start parse
        if let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                
                if self.status != "1" {
                    return
                }
                if let dataArr = json[DomainConst.KEY_MODEL_UPHOLD] as? [String: AnyObject] {
//                    for listItem in dataArr {
//                        self.model_uphold.append(UpholdBean(jsonData: listItem))
//                    }
                    self.model_uphold = UpholdBean(jsonData: dataArr)
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
        } else {
            print("json is of wrong format")
        }
    }
}
