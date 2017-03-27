//
//  CustomerFamilyListCell.swift
//  harpyframework
//
//  Created by SPJ on 3/27/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class CustomerFamilyListCell: UITableViewCell {
    // MARK: Properties
    private var _parentView: UIView = UIView()
    private var leftView:   UIView = UIView()
    private var centerView: UIView = UIView()
    private var rightView:  UIView = UIView()
    private var bottomView: UIView = UIView()
    // Left controls
    private var dateTime: CustomeDateTimeView = CustomeDateTimeView()
    
    // Center controls
    private var customerNameLabel: UILabel = UILabel()
    private var phoneIcon: UIImageView = UIImageView()
    private var phoneLabel: UILabel = UILabel()
    
    // Right control
    private var statusIcon: UIImageView = UIImageView()
    private var commentIcon: UIImageView = UIImageView()
    public static var CELL_HEIGHT: CGFloat = 0.0
    
    // Bottom control
    private var addressIcon: UIImageView = UIImageView()
    private var addressLabel: UILabel = UILabel()
    /** Current id */
    private var _id: String = DomainConst.BLANK

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let contentHeight       = GlobalConst.CELL_HEIGHT_SHOW
        let contentWidthLeft    = GlobalConst.SCREEN_WIDTH / 4
        //let contentWidthRight   = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthMid     = GlobalConst.SCREEN_WIDTH / 4 * 3 - GlobalConst.MARGIN_CELL_X
        let verticalMargin      = GlobalConst.MARGIN_CELL_X
        var offset              = verticalMargin * 2
        
        /** ---- Left view ------ */
        self.dateTime.setup(x: 0, y: offset, w: contentWidthLeft, h: contentHeight / 2 - GlobalConst.CELL_HEIGHT_SHOW / 5)
        offset += self.dateTime.frame.height + GlobalConst.MARGIN_CELL_X * 2
        
        CustomerFamilyListCell.CELL_HEIGHT = contentHeight + verticalMargin
        
        self._parentView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: GlobalConst.SCREEN_WIDTH,
                                        height: CustomerFamilyListCell.CELL_HEIGHT)
        self.leftView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: GlobalConst.SCREEN_WIDTH / 4,
                                     height: offset + verticalMargin)
        self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                       y: 0,
                                       width: GlobalConst.SCREEN_WIDTH / 2,
                                       height: CustomerFamilyListCell.CELL_HEIGHT - GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                      y: 0,
                                      width: GlobalConst.SCREEN_WIDTH / 4,
                                      height: CustomerFamilyListCell.CELL_HEIGHT)
        self.bottomView.frame = CGRect(x: 0,
                                       y: self.leftView.frame.maxY + GlobalConst.MARGIN_CELL_Y,
                                       width: GlobalConst.SCREEN_WIDTH / 4 * 3,
                                       height: GlobalConst.CELL_HEIGHT_SHOW / 4)
        
        /** ---- Center view ------ */
        offset = verticalMargin * 2
        // Customer name label
        self.customerNameLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                              y: offset,
                                              width: contentWidthMid ,
                                              height: self.dateTime.frame.height / 2)
        self.customerNameLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_LIST)
        self.customerNameLabel.textColor = GlobalConst.BUTTON_COLOR_YELLOW
        self.customerNameLabel.text = DomainConst.BLANK
        offset += self.customerNameLabel.frame.height + GlobalConst.MARGIN_CELL_Y
        
        // Phone icon
        self.phoneIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                        y: offset,
                                        width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                        height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.phoneIcon.contentMode = .scaleAspectFit
        self.phoneIcon.image = ImageManager.getImage(named: DomainConst.CONTACT_ICON_IMG_NAME)
        // Phone label
        self.phoneLabel.frame = CGRect(x: self.phoneIcon.frame.maxX,
                                         y: offset,
                                         width: contentWidthMid,
                                         height: self.phoneIcon.frame.height)
        self.phoneLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.phoneLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.phoneLabel.text = DomainConst.BLANK
        offset += self.phoneIcon.frame.height + GlobalConst.MARGIN_CELL_Y
        
        /** ---- Bottom view ------ */
        // Address icon
        self.addressIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                        y: GlobalConst.CELL_HEIGHT_SHOW / 40,
                                        width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                        height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.addressIcon.image = ImageManager.getImage(named: DomainConst.ADDRESS_ICON_IMG_NAME)
        self.addressIcon.contentMode = .scaleAspectFit
        // Address label
        self.addressLabel.frame = CGRect(x: self.addressIcon.frame.maxX,
                                         y: 0,
                                         width: contentWidthMid + contentWidthLeft - GlobalConst.MARGIN_CELL_X - self.addressIcon.frame.width,
                                         height: self.bottomView.frame.height)
        self.addressLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.addressLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.addressLabel.text = DomainConst.BLANK
        self.addressLabel.numberOfLines = 0
        self.addressLabel.lineBreakMode = .byWordWrapping
        
        self.leftView.addSubview(self.dateTime)
        
        self.centerView.addSubview(self.customerNameLabel)
        self.centerView.addSubview(self.phoneIcon)
        self.centerView.addSubview(self.phoneLabel)
        
        self.bottomView.addSubview(self.addressIcon)
        self.bottomView.addSubview(self.addressLabel)
        
        self._parentView.addSubview(self.leftView)
        self._parentView.addSubview(self.centerView)
        self._parentView.addSubview(self.rightView)
        self._parentView.addSubview(self.bottomView)
        self.addSubview(_parentView)
        self.makeComponentsColor()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    open func setData(model: CustomerFamilyListBean) {
        self._id            = model.id
        self.dateTime.setValue(dateTime: model.getCreatedDate())
        self.customerNameLabel.text = model.name
        self.phoneLabel.text = model.getPhone()
        self.addressLabel.text = model.getAddress().normalizateString()
        self.phoneIcon.isHidden = false
        self.phoneLabel.isHidden = false
        self.addressIcon.isHidden = false
        self.addressLabel.isHidden = false
    }
}
