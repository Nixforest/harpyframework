//
//  OrderEmployeeTableViewCell.swift
//  harpyframework
//
//  Created by SPJ on 4/8/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class OrderEmployeeTableViewCell: UITableViewCell {
    // MARK: Properties
    private var leftView:       UIView              = UIView()
    private var centerView:     UIView              = UIView()
    private var rightView:      UIView              = UIView()
    private var bottomView:     UIView              = UIView()
    
    // Left controls
    private var dateTime:       CustomeDateTimeView = CustomeDateTimeView()
    
    // Center controls
    private var codeLabel:      UILabel             = UILabel()
    private var totalLabel:     UILabel             = UILabel()
    private var materialLabel:  UILabel             = UILabel()
    
    // Right control
    private var statusIcon:     UIImageView         = UIImageView()
    
    // Bottom control
    private var customerIcon:   UIImageView         = UIImageView()
    private var customerLabel:  UILabel             = UILabel()
    private var addressIcon:    UIImageView         = UIImageView()
    private var addressLabel:   UILabel             = UILabel()
    private var btnAction:      UIButton            = UIButton()
    private var btnCancel:      UIButton            = UIButton()
    /** Current id */
    private var _id:            String              = DomainConst.BLANK
    public static var CELL_HEIGHT: CGFloat = 0.0
    /** Delegate */
    public var delegate: OrderConfirmDelegate?

    /**
     * Prepares the receiver for service after it has been loaded from
     * an Interface Builder archive, or nib file.
     */
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let verticalMargin      = GlobalConst.MARGIN_CELL_X
        let contentWidthLeft    = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthRight   = GlobalConst.SCREEN_WIDTH / 8
        let contentWidthMid     = GlobalConst.SCREEN_WIDTH / 8 * 5
        
        var offset              = verticalMargin
        /** ---- Left view ------ */
        self.dateTime.setup(x: 0, y: offset,
                            w: contentWidthLeft,
                            h: GlobalConst.LABEL_H * 2)
        offset += self.dateTime.frame.height + verticalMargin
        
        OrderEmployeeTableViewCell.CELL_HEIGHT = GlobalConst.LABEL_H * 4 + 4 * verticalMargin + GlobalConst.BUTTON_H
        
        self.frame = CGRect(x: 0, y: 0,
                            width: GlobalConst.SCREEN_WIDTH,
                            height: OrderEmployeeTableViewCell.CELL_HEIGHT)
        self.leftView.frame = CGRect(
            x: 0,  y: 0,
            width: contentWidthLeft,
            height: offset)
        self.centerView.frame = CGRect(
            x: self.leftView.frame.maxX, y: 0,
            width: contentWidthMid,
            height: offset)
        self.rightView.frame = CGRect(
            x: self.centerView.frame.maxX, y: 0,
            width: contentWidthRight,
            height: OrderEmployeeTableViewCell.CELL_HEIGHT)
        self.bottomView.frame = CGRect(
            x: 0, y: offset,
            width: GlobalConst.SCREEN_WIDTH / 4 * 3,
            height: GlobalConst.LABEL_H * 2 + GlobalConst.BUTTON_H + verticalMargin)
        
        /** ---- Center view ------ */
        offset = verticalMargin
        // Code label
        self.codeLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                      y: offset,
                                      width: contentWidthMid / 3 * 2 - GlobalConst.MARGIN_CELL_X,
                                      height: GlobalConst.LABEL_H)
        self.codeLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE)
        self.codeLabel.text = DomainConst.BLANK
        // Total label
        self.totalLabel.frame = CGRect(x: self.codeLabel.frame.maxX,
                                       y: offset,
                                       width: contentWidthMid / 3 + GlobalConst.MARGIN_CELL_X,
                                       height: GlobalConst.LABEL_H)
        self.totalLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        self.totalLabel.text = DomainConst.BLANK
        self.totalLabel.textColor = GlobalConst.BUTTON_COLOR_YELLOW
        offset += self.codeLabel.frame.height
        // Material label
        self.materialLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                          y: offset,
                                          width: contentWidthMid,
                                          height: GlobalConst.LABEL_H)
        self.materialLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.materialLabel.text = DomainConst.BLANK
        self.materialLabel.lineBreakMode = .byTruncatingTail
        self.materialLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        
        /** ---- Right view ------ */
        // Status icon
        self.statusIcon.frame = CGRect(
            x: (contentWidthRight - GlobalConst.ICON_SIZE) / 2,
            y: (GlobalConst.LABEL_H * 4 + 2 * verticalMargin - GlobalConst.ICON_SIZE) / 2,
            width: GlobalConst.ICON_SIZE,
            height: GlobalConst.ICON_SIZE)
        self.statusIcon.image = ImageManager.getImage(named: DomainConst.BLANK)
        
        /** ---- Bottom view ------ */
        var botOffset: CGFloat = 0
        // Customer icon
        self.customerIcon.frame = CGRect(x: verticalMargin,
                                        y: botOffset,
                                        width: GlobalConst.ICON_SIZE,
                                        height: GlobalConst.ICON_SIZE)
        self.customerIcon.image = ImageManager.getImage(named: DomainConst.HUMAN_ICON_IMG_NAME)
        self.customerIcon.contentMode = .scaleAspectFit
        // Customer label
        self.customerLabel.frame = CGRect(x: self.customerIcon.frame.maxX,
                                         y: botOffset,
                                         width: contentWidthMid + GlobalConst.MARGIN_CELL_X - self.customerIcon.frame.width,
                                         height: GlobalConst.LABEL_H)
        self.customerLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        self.customerLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.customerLabel.text = DomainConst.BLANK
        if #available(iOS 9.0, *) {
            self.customerLabel.allowsDefaultTighteningForTruncation = true
        } else {
            // Fallback on earlier versions
        }
        botOffset += GlobalConst.LABEL_H
        // Address icon
        self.addressIcon.frame = CGRect(x: verticalMargin,
                                        y: botOffset,
                                        width: GlobalConst.ICON_SIZE,
                                        height: GlobalConst.ICON_SIZE)
        self.addressIcon.image = ImageManager.getImage(named: DomainConst.ADDRESS_ICON_IMG_NAME)
        self.addressIcon.contentMode = .scaleAspectFit
        // Address label
        self.addressLabel.frame = CGRect(x: self.addressIcon.frame.maxX,
                                         y: botOffset,
                                         width: GlobalConst.SCREEN_WIDTH - self.addressIcon.frame.maxX,
                                         height: GlobalConst.LABEL_H)
        self.addressLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        self.addressLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.addressLabel.text = DomainConst.BLANK
        self.addressLabel.lineBreakMode = .byTruncatingTail
        botOffset += GlobalConst.LABEL_H + verticalMargin
        
        // Button action
        setupButton(button: btnAction,
                    x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
                    y: botOffset, title: DomainConst.CONTENT00217,
                    icon: DomainConst.CONFIRM_IMG_NAME,
                    color: GlobalConst.BUTTON_COLOR_RED,
                    action: #selector(btnActionHandler(_:)))
        setupButton(button: btnCancel,
                    x: GlobalConst.SCREEN_WIDTH / 2,
                    y: botOffset, title: DomainConst.CONTENT00220,
                    icon: DomainConst.CANCEL_IMG_NAME,
                    color: GlobalConst.BUTTON_COLOR_YELLOW,
                    action: #selector(btnCancelHandler(_:)))
        botOffset += btnCancel.frame.height + GlobalConst.MARGIN
        
        // Add control to view
        self.leftView.addSubview(self.dateTime)
        
        self.centerView.addSubview(self.codeLabel)
        self.centerView.addSubview(self.totalLabel)
        self.centerView.addSubview(self.materialLabel)
        
        self.rightView.addSubview(self.statusIcon)
        
        self.bottomView.addSubview(self.customerIcon)
        self.bottomView.addSubview(self.customerLabel)
        self.bottomView.addSubview(self.addressIcon)
        self.bottomView.addSubview(self.addressLabel)
        self.bottomView.addSubview(self.btnAction)
        self.bottomView.addSubview(self.btnCancel)
        
        self.addSubview(self.leftView)
        self.addSubview(self.centerView)
        self.addSubview(self.rightView)
        self.addSubview(self.bottomView)
        self.makeComponentsColor()
    }
    
    /**
     * Setup button for this view
     * - parameter button:  Button to setup
     * - parameter x:       X position of button
     * - parameter y:       Y position of button
     * - parameter title:   Title of button
     * - parameter icon:    Icon of button
     * - parameter color:   Color of button
     * - parameter action:  Action of button
     */
    private func setupButton(button: UIButton, x: CGFloat, y: CGFloat, title: String,
                             icon: String, color: UIColor, action: Selector) {
        button.frame = CGRect(x: x,
                              y: y,
                              width: GlobalConst.BUTTON_W / 2,
                              height: GlobalConst.BUTTON_H)
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.backgroundColor          = color
        button.titleLabel?.font         = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        button.layer.cornerRadius       = GlobalConst.LOGIN_BUTTON_CORNER_RADIUS
        button.imageView?.contentMode   = .scaleAspectFit
        button.setImage(ImageManager.getImage(named: icon), for: UIControlState())
        button.addTarget(self, action: action, for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: GlobalConst.MARGIN,
                                              left: GlobalConst.MARGIN,
                                              bottom: GlobalConst.MARGIN,
                                              right: GlobalConst.MARGIN)
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     * Set data for cell
     * - parameter data: Data to set
     */
    public func setData(data: OrderListBean) {
        self.dateTime.setValue(dateTime: data.created_date)
        self.addressLabel.text = data.address.normalizateString()
        self.customerLabel.text = data.first_name + " - " + data.phone
        self.statusIcon.image = ImageManager.getImage(named: getStatusIcon(status: data.status_number))
        self.codeLabel.text = data.code_no
        self.totalLabel.text = data.grand_total
        self.materialLabel.text = data.title
        handleActionButton(data: data)
        self.btnAction.accessibilityIdentifier = data.id
        self.btnCancel.accessibilityIdentifier = data.id
    }
    
    /**
     * Get status icon from status string
     * - parameter status: Status string
     * - returns: Status icon path
     */
    private func getStatusIcon(status: String) -> String {
        var retVal = DomainConst.BLANK
        switch status {
        case DomainConst.ORDER_STATUS_NEW:
            retVal = DomainConst.ORDER_STATUS_NEW_ICON_IMG_NAME
            break
        case DomainConst.ORDER_STATUS_PROCESSING:
            retVal = DomainConst.ORDER_STATUS_PROCESS_ICON_IMG_NAME
            break
        case DomainConst.ORDER_STATUS_COMPLETE:
            retVal = DomainConst.FINISH_STATUS_IMG_NAME
            break
        case DomainConst.ORDER_STATUS_CANCEL:
            retVal = DomainConst.ORDER_STATUS_CANCEL_ICON_IMG_NAME
            break
        default:
            break
        }
        return retVal
    }
    
    /**
     * Handle show/hide button
     * - parameter data: Data of cell
     */
    private func handleActionButton(data: OrderListBean) {
        if (data.show_nhan_giao_hang == DomainConst.NUMBER_ZERO_VALUE)
            && (data.show_huy_giao_hang == DomainConst.NUMBER_ZERO_VALUE) {
            // 0-0 => Decrease height
            OrderEmployeeTableViewCell.CELL_HEIGHT = GlobalConst.LABEL_H * 4 + 2 * GlobalConst.MARGIN_CELL_X
            //++ BUG0075-SPJ (NguyenPT 20170506) Fix bug Show button Action when flag is "0"
//            if data.status_number == DomainConst.ORDER_STATUS_NEW {
//                data.show_nhan_giao_hang = DomainConst.NUMBER_ONE_VALUE
//                btnAction.frame = CGRect(
//                    x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
//                    y: btnAction.frame.origin.y,
//                    width: GlobalConst.BUTTON_W,
//                    height: GlobalConst.BUTTON_H)
//                OrderEmployeeTableViewCell.CELL_HEIGHT = GlobalConst.LABEL_H * 4 + 4 * GlobalConst.MARGIN_CELL_X + GlobalConst.BUTTON_H
//            }
            //-- BUG0075-SPJ (NguyenPT 20170506) Fix bug Show button Action when flag is "0"
        } else if (data.show_nhan_giao_hang == DomainConst.NUMBER_ONE_VALUE)
            && (data.show_huy_giao_hang == DomainConst.NUMBER_ONE_VALUE) {
            // 1-1 => Do nothing
            btnAction.frame = CGRect(
                x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
                y: btnAction.frame.origin.y,
                width: GlobalConst.BUTTON_W / 2,
                height: GlobalConst.BUTTON_H)
            btnCancel.frame = CGRect(
                x: GlobalConst.SCREEN_WIDTH / 2,
                y: btnCancel.frame.origin.y,
                width: GlobalConst.BUTTON_W / 2,
                height: GlobalConst.BUTTON_H)
        } else {
            // 0-1 or 1-0 => Move button to center
            btnAction.frame = CGRect(
                x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
                y: btnAction.frame.origin.y,
                width: GlobalConst.BUTTON_W,
                height: GlobalConst.BUTTON_H)
            btnCancel.frame = CGRect(
                x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
                y: btnCancel.frame.origin.y,
                width: GlobalConst.BUTTON_W,
                height: GlobalConst.BUTTON_H)
            OrderEmployeeTableViewCell.CELL_HEIGHT = GlobalConst.LABEL_H * 4 + 4 * GlobalConst.MARGIN_CELL_X + GlobalConst.BUTTON_H
        }
        self.btnAction.isHidden = (data.show_nhan_giao_hang == DomainConst.NUMBER_ZERO_VALUE)
        self.btnCancel.isHidden = (data.show_huy_giao_hang == DomainConst.NUMBER_ZERO_VALUE)
    }
    
    /**
     * Handle when tap action button
     */
    internal func btnActionHandler(_ sender: AnyObject) {
        delegate?.btnActionTapped(sender)
    }
    
    /**
     * Handle when tap action button
     */
    internal func btnCancelHandler(_ sender: AnyObject) {
        delegate?.btnCancelTapped(sender)
    }
}
