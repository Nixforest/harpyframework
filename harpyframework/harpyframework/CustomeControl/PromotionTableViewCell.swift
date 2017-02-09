//
//  PromotionTableViewCell.swift
//  harpyframework
//
//  Created by SPJ on 2/8/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class PromotionTableViewCell: UITableViewCell {
    // MARK: Properties
    /** Name of item */
    private var _lblName: UILabel       = UILabel()
    /** Note of item */
    private var _lblNote: UILabel       = UILabel()
    /** Expiration label */
    private var _lblExp: UILabel        = UILabel()
    /** Date icon */
    private var _imgDate: UIImageView   = UIImageView()
    /** Expiration value label */
    private var _lblExpValue: UILabel   = UILabel()
    /** Parent width */
    public static var PARENT_WIDTH      = GlobalConst.SCREEN_WIDTH

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let parentWidth: CGFloat = PromotionTableViewCell.PARENT_WIDTH
        // Name label
        _lblName.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                y: GlobalConst.MARGIN_CELL_Y,
                                width: parentWidth - 2 * GlobalConst.MARGIN_CELL_X,
                                height: GlobalConst.LABEL_H)
        _lblName.textAlignment = .left
        _lblName.textColor     = GlobalConst.MAIN_COLOR
        _lblName.font          = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        self.addSubview(_lblName)
        // Note label
        _lblNote.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                y: _lblName.frame.maxY,
                                width: parentWidth - 2 * GlobalConst.MARGIN_CELL_X,
                                height: GlobalConst.LABEL_H * 3)
        _lblNote.textAlignment = .left
        _lblNote.textColor     = UIColor.black
        _lblNote.font          = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        _lblNote.numberOfLines = 0
        _lblNote.lineBreakMode = .byWordWrapping
        self.addSubview(_lblNote)
        // Exp label
        _lblExp.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                y: _lblNote.frame.maxY,
                                width: (parentWidth - 2 * GlobalConst.MARGIN_CELL_X) / 3,
                                height: GlobalConst.LABEL_H)
        _lblExp.textAlignment = .left
        _lblExp.textColor     = UIColor.black
        _lblExp.font          = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        _lblExp.text  = DomainConst.CONTENT00248 + DomainConst.TEXT_SPLITER
        //_lblExp.sizeToFit()
        self.addSubview(_lblExp)
        
        // Date icon
        let left = GlobalConst.MARGIN_CELL_X + (_lblExp.text?.widthOfString(usingFont: _lblExp.font))!
        _imgDate.frame = CGRect(x: left + GlobalConst.MARGIN_CELL_X,
                                y: _lblNote.frame.maxY,
                                width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        let img = ImageManager.getImage(named: DomainConst.DATETIME_ICON_IMG_NAME)
        let tinted = img?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        _imgDate.image = tinted
        _imgDate.tintColor = GlobalConst.BUTTON_COLOR_YELLOW
        self.addSubview(_imgDate)
        
        // Expiry date value label
        _lblExpValue.frame = CGRect(x: _imgDate.frame.maxX + GlobalConst.MARGIN_CELL_X,
                                y: _lblNote.frame.maxY,
                                width: parentWidth - 2 * GlobalConst.MARGIN_CELL_X - _imgDate.frame.maxX,
                                height: GlobalConst.LABEL_H)
        _lblExpValue.textAlignment = .left
        _lblExpValue.textColor     = GlobalConst.BUTTON_COLOR_YELLOW
        _lblExpValue.font          = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        self.addSubview(_lblExpValue)
        
        self.makeComponentsColor()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(data: PromotionBean) {
        self._lblName.text = data.name.uppercased()
        self._lblNote.text = data.note
        self._lblExpValue.text = data.expiry_date
    }
}
