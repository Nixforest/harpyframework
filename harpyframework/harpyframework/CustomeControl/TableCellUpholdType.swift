//
//  TableCellUpholdType.swift
//  harpyframework
//
//  Created by SPJ on 1/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class TableCellUpholdType: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var _parentView: UIView!
    private var leftView:   UIView = UIView()
    private var centerView: UIView = UIView()
    private var rightView:  UIView = UIView()
    private var bottomView: UIView = UIView()
    // Left controls
    private var dateTime: CustomeDateTimeView = CustomeDateTimeView()
    private var employeeIcon: UIImageView = UIImageView()
    private var employeeLabel: CustomLabel = CustomLabel()
    
    // Center controls
    private var customerNameLabel: UILabel = UILabel()
    private var problemIcon: UIImageView = UIImageView()
    private var problemLabel: UILabel = UILabel()
    private var statusStaticIcon: UIImageView = UIImageView()
    private var statusLabel: UILabel = UILabel()
    
    // Right control
    private var statusIcon: UIImageView = UIImageView()
    private var commentIcon: UIImageView = UIImageView()
    public static var CELL_HEIGHT: CGFloat = 0.0
    
    // Bottom control
    private var addressIcon: UIImageView = UIImageView()
    private var addressLabel: UILabel = UILabel()
    var _id: String = ""
    
    // MARK: Methods
    /**
     * Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
     */
    override open func awakeFromNib() {
        super.awakeFromNib()
        var contentHeight = GlobalConst.CELL_HEIGHT_SHOW
        let contentWidthLeft = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthRight = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthMid = GlobalConst.SCREEN_WIDTH / 4 * 3 - GlobalConst.MARGIN_CELL_X
        let verticalMargin = GlobalConst.MARGIN_CELL_X
        var offset: CGFloat = verticalMargin * 2
        
        /** ---- Left view ------ */
        self.dateTime.setup(x: 0, y: offset, w: contentWidthLeft, h: contentHeight / 2 - GlobalConst.CELL_HEIGHT_SHOW / 5)
        offset += self.dateTime.frame.height + GlobalConst.MARGIN_CELL_X
        // Employee icon
        self.employeeIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                     y: offset + GlobalConst.CELL_HEIGHT_SHOW / 40,
                                     width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                     height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.employeeIcon.contentMode = .scaleAspectFit
        self.employeeIcon.image = UIImage(named: "icon23.png")
        // Employee label
        self.employeeLabel.frame = CGRect(x: self.employeeIcon.frame.maxX,
                                      y: offset,
                                      width: contentWidthLeft,
                                      height: GlobalConst.CELL_HEIGHT_SHOW / 4)
        self.employeeLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.employeeLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.employeeLabel.text = DomainConst.BLANK
        self.employeeLabel.updateLayout()
        offset += self.employeeIcon.frame.height
        
        TableCellOrderType.CELL_HEIGHT = contentHeight + verticalMargin
        
        self._parentView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: GlobalConst.SCREEN_WIDTH,
                                        height: TableCellOrderType.CELL_HEIGHT)
        self.leftView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: GlobalConst.SCREEN_WIDTH / 4,
                                     height: offset + verticalMargin)
        self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                       y: 0,
                                       width: GlobalConst.SCREEN_WIDTH / 2,
                                       height: TableCellOrderType.CELL_HEIGHT - GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                      y: 0,
                                      width: GlobalConst.SCREEN_WIDTH / 4,
                                      height: TableCellOrderType.CELL_HEIGHT)
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
        
        // Problem icon
        self.problemIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                         y: offset,
                                         width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                         height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.problemIcon.contentMode = .scaleAspectFit
        self.problemIcon.image = UIImage(named: "icon23.png")
        // Total label
        self.problemLabel.frame = CGRect(x: self.problemIcon.frame.maxX,
                                          y: offset,
                                          width: contentWidthMid,
                                          height: self.problemIcon.frame.height)
        self.problemLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.problemLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.problemLabel.text = DomainConst.BLANK
        offset += self.problemIcon.frame.height + GlobalConst.MARGIN_CELL_Y
        
        // Status static icon
        self.statusStaticIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                        y: offset,
                                        width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                        height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.statusStaticIcon.image = UIImage(named: "icon23.png")
        self.statusStaticIcon.contentMode = .scaleAspectFit
        // Status label
        self.statusLabel.frame = CGRect(x: self.statusStaticIcon.frame.maxX,
                                         y: offset,
                                         width: contentWidthMid,
                                         height: self.statusStaticIcon.frame.height)
        self.statusLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.statusLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.statusLabel.text = DomainConst.BLANK
        offset += self.statusStaticIcon.frame.height
        
        /** ---- Right view ------ */
        var height = contentHeight
        if BaseModel.shared.isCustomerUser() {
            height -= GlobalConst.CELL_HEIGHT_SHOW / 5
        }
        // Status icon
        self.statusIcon.frame = CGRect(x: (contentWidthRight - GlobalConst.CELL_HEIGHT_SHOW / 5) / 2,
                                       y: (height - GlobalConst.CELL_HEIGHT_SHOW / 5) / 2,
                                       width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                       height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.statusIcon.image = UIImage(named: "icon29.png")
        // Comment icon
        self.commentIcon.frame = CGRect(x: (contentWidthRight - GlobalConst.CELL_HEIGHT_SHOW / 5) / 2,
                                       y: /*self.rightView.frame.maxY - GlobalConst.CELL_HEIGHT_SHOW / 5 - verticalMargin*/
            self.bottomView.frame.minY,
                                       width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                       height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.commentIcon.image = UIImage(named: "icon23.png")
        self.commentIcon.contentMode = .scaleAspectFit
        self.commentIcon.isHidden = true
        
        /** ---- Bottom view ------ */
        // Address icon
        self.addressIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                             y: GlobalConst.CELL_HEIGHT_SHOW / 40,
                                             width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                             height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.addressIcon.image = UIImage(named: "icon6.png")
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
        self.leftView.addSubview(self.employeeIcon)
        self.leftView.addSubview(self.employeeLabel)
        
        self.centerView.addSubview(self.customerNameLabel)
        self.centerView.addSubview(self.problemIcon)
        self.centerView.addSubview(self.problemLabel)
        self.centerView.addSubview(self.statusStaticIcon)
        self.centerView.addSubview(self.statusLabel)
        
        self.rightView.addSubview(self.statusIcon)
        self.rightView.addSubview(self.commentIcon)
        
        self.bottomView.addSubview(self.addressIcon)
        self.bottomView.addSubview(self.addressLabel)
        
        self._parentView.addSubview(self.leftView)
        self._parentView.addSubview(self.centerView)
        self._parentView.addSubview(self.rightView)
        self._parentView.addSubview(self.bottomView)
    }
    
    /**
     * Set selected
     */
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    open func setData(model: UpholdBean) {
        self._id            = model.id
        self.dateTime.setValue(dateTime: model.created_date)
        self.customerNameLabel.text = model.customer_name
        if model.uphold_type != DomainConst.UPHOLD_TYPE_PERIODICALLY {
            self.problemLabel.text = model.type_uphold
        } else {
            
            self.problemLabel.text = model.schedule_month
        }
        self.statusLabel.text = model.status
        self.employeeLabel.text = model.employee_name
        self.addressLabel.text = model.customer_address.normalizateString()
        self.statusIcon.isHidden = (model.status_number != DomainConst.UPHOLD_STATUS_COMPLETE)
        //self.statusIcon.image = UIImage(named: "icon29.png")
        if BaseModel.shared.isCustomerUser() {
            if model.uphold_type != DomainConst.UPHOLD_TYPE_PERIODICALLY {
                self.customerNameLabel.text = model.type_uphold
            } else {
                
                self.customerNameLabel.text = model.schedule_month
            }
            self.problemIcon.isHidden = true
            self.problemLabel.isHidden = true
            self.statusStaticIcon.frame = self.problemIcon.frame
            self.statusLabel.frame = self.problemLabel.frame
            self.addressIcon.isHidden = true
            self.addressLabel.isHidden = true
        }
    }
}
