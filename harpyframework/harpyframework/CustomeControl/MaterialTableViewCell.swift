//
//  MaterialTableViewCell.swift
//  harpyframework
//
//  Created by SPJ on 1/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class MaterialTableViewCell: UITableViewCell {
    private var _content: MaterialSelector?     = nil

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let width       = GlobalConst.SCREEN_WIDTH
        self._content   = MaterialSelector(iconPath: DomainConst.CATEGORY_VIP_IMG_NAME,
                                        name: DomainConst.CONTENT00237,
                                        price: DomainConst.BLANK,
                                        width: width,
                                        height: GlobalConst.CELL_HEIGHT_SHOW * 2/3)
        self.addSubview(self._content!)
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     * Set data for cell
     * - parameter data: OrderDetail Bean
     */
    public func setData(data: OrderDetailBean) {
        self._content?.updateContent(iconPath: data.material_image,
                                     name: data.material_name,
                                     price: data.material_price)
        self._content?.updateFont()
    }
}
