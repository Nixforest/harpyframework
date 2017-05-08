//
//  MaterialSelectionCell.swift
//  harpyframework
//
//  Created by SPJ on 1/22/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class MaterialSelectionCell: UICollectionViewCell {
    // MARK: Properties
    /** Data */
    private var _data: MaterialBean     = MaterialBean()
    /** Image */
    private var _imageView: UIImageView = UIImageView()
    /** Material name label */
    private var _lblName: UILabel       = UILabel()
    /** Material price label */
    private var _lblPrice: UILabel      = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /**
     * Set data for cell
     * - parameter data:    Data of cell
     * - parameter width:   Width of cell
     * - parameter height:  Height of cell
     */
    public func setData(data: MaterialBean, width: CGFloat, height: CGFloat) {
        self._data = data
        // Image
        if !_data.material_image.isEmpty {
            _imageView.getImgFromUrl(link: _data.material_image, contentMode: _imageView.contentMode)
        } else {
            _imageView.setImage(imgPath: DomainConst.DEFAULT_IMG_NAME)
        }
        
        _imageView.frame = CGRect(x: 0, y: 0,
                            width: width,
                            height: height * 3 / 6)
        _imageView.contentMode = .scaleAspectFit
        self.addSubview(_imageView)
        // Name
        _lblName.frame = CGRect(x: 0, y: _imageView.frame.maxY,
                                width: width,
                                height: height * 5 / 12)
        //_lblName.text          = _data.materials_name_short
        if BaseModel.shared.getDebugUseMaterialNameShort() {
            //++ BUG0076-SPJ (NguyenPT 20170506) Name of cylinder not show when open add cylinder OrderFamily
            //_lblName.text          = _data.materials_name_short
            if _data.materials_name_short.isEmpty {
                _lblName.text = _data.material_name
            } else {
                _lblName.text = _data.materials_name_short
            }
            //-- BUG0076-SPJ (NguyenPT 20170506) Name of cylinder not show when open add cylinder OrderFamily
        } else {
            _lblName.text          = _data.material_name
        }
        _lblName.textColor     = GlobalConst.BUTTON_COLOR_RED
        _lblName.font          = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        _lblName.textAlignment = .center
        _lblName.numberOfLines = 0
        _lblName.lineBreakMode = .byWordWrapping
        self.addSubview(_lblName)
        // Price label
        _lblPrice.frame = CGRect(x: 0,
                                 y: _lblName.frame.maxY,
                                 width: width,
                                 height: height / 12)
        let priceText = _data.material_price
        if priceText == DomainConst.NUMBER_ZERO_VALUE ||
            priceText.isEmpty {
            _lblPrice.isHidden = true
        } else {
            _lblPrice.isHidden = false
        }
        
        //++ BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
        //if !priceText.isEmpty {
        //    priceText = priceText + DomainConst.VIETNAMDONG
        //}
        //-- BUG0037-SPJ (NguyenPT 20170222) Remove Currency symbol
        _lblPrice.text          = priceText
        _lblPrice.textColor     = GlobalConst.BUTTON_COLOR_RED
        _lblPrice.font          = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        _lblPrice.textAlignment = .center
        _lblPrice.numberOfLines = 0
        _lblPrice.lineBreakMode = .byWordWrapping
        self.addSubview(_lblPrice)
        self.makeComponentsColor()
    }
}
