//
//  TableCellOrderType.swift
//  harpyframework
//
//  Created by SPJ on 12/28/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
open class TableCellOrderType: UITableViewCell {
    // MARK: Properties
    private var topView:    UIView = UIView()
    private var leftView:   UIView = UIView()
    private var centerView: UIView = UIView()
    private var rightView:  UIView = UIView()
    private var bottomView: UIView = UIView()
    
    // Top control
    private var customerLabel: UILabel = UILabel()
    
    // Left controls
    private var dateTime: CustomeDateTimeView = CustomeDateTimeView()
    
    // Center controls
    private var codeLabel: UILabel = UILabel()
    private var totalLabel: UILabel = UILabel()
    private var materialLabel: UILabel = UILabel()
    
    // Right control
    private var statusIcon: UIImageView = UIImageView()
    public static var CELL_HEIGHT: CGFloat = 0.0
    
    // Bottom control
    private var addressIcon: UIImageView = UIImageView()
    private var addressLabel: UILabel = UILabel()
    
    //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
    private var btnAction:      UIButton            = UIButton()
    private var btnCancel:      UIButton            = UIButton()
    /** Delegate */
    public var delegate: OrderConfirmDelegate?
    //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
    private let topHeight: CGFloat = GlobalConst.CONFIGURATION_ITEM_HEIGHT - GlobalConst.MARGIN_CELL_X * 3
    
    // MARK: Methods
    /**
     * Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
     */
    override open func awakeFromNib() {
        super.awakeFromNib()
        let contentHeight       = GlobalConst.CELL_HEIGHT_SHOW / 3 * 2
        let contentWidthLeft    = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthRight   = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthMid     = GlobalConst.SCREEN_WIDTH / 2
        let verticalMargin      = GlobalConst.MARGIN_CELL_X * 2
        var offset: CGFloat     = 0.0
        
        /** ---- Left view ------ */
        self.dateTime.setup(x: 0, y: 0, w: contentWidthLeft, h: contentHeight)
        offset += self.dateTime.frame.height
        //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
        //TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4
        TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4 + GlobalConst.BUTTON_H
        //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
        
        self.topView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: GlobalConst.SCREEN_WIDTH,
                                    height: topHeight)
        self.leftView.frame = CGRect(x: 0,
                                     y: topView.frame.maxY,
                                     width: GlobalConst.SCREEN_WIDTH / 4,
                                     height: offset)
        self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                       y: topView.frame.maxY,
                                       width: GlobalConst.SCREEN_WIDTH / 2,
                                       height: offset)
        self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                      y: 0,
                                      width: GlobalConst.SCREEN_WIDTH / 4,
                                      height: TableCellOrderType.CELL_HEIGHT)
        self.bottomView.frame = CGRect(x: 0,
                                       y: self.leftView.frame.maxY - verticalMargin * 2,
                                       width: GlobalConst.SCREEN_WIDTH - GlobalConst.CELL_HEIGHT_SHOW / 5,
                                       height: GlobalConst.LABEL_H + GlobalConst.BUTTON_H + verticalMargin)
        
        /** ----- Top view ----- */
        // Customer label
        self.customerLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X, y: 0,
                                         width: GlobalConst.SCREEN_WIDTH - 2 * GlobalConst.MARGIN_CELL_X,
                                         height: topHeight)
        self.customerLabel.font = UIFont.systemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE)
        self.customerLabel.textColor = GlobalConst.BUTTON_COLOR_YELLOW
        self.customerLabel.text = DomainConst.BLANK
        self.customerLabel.numberOfLines = 0
        self.customerLabel.lineBreakMode = .byWordWrapping
        
        /** ---- Center view ------ */
        offset = verticalMargin
        // Code label
        self.codeLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                      y: offset,
                                      width: contentWidthMid / 3 * 2 - GlobalConst.MARGIN_CELL_X,
                                      height: contentHeight / 3)
        self.codeLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE)
        self.codeLabel.text = DomainConst.BLANK
        // Total label
        self.totalLabel.frame = CGRect(x: self.codeLabel.frame.maxX,
                                      y: offset,
                                      width: contentWidthMid / 3 + GlobalConst.MARGIN_CELL_X,
                                      height: contentHeight / 3)
        self.totalLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        self.totalLabel.text = DomainConst.BLANK
        self.totalLabel.textColor = GlobalConst.BUTTON_COLOR_YELLOW
        offset += self.codeLabel.frame.height
        // Material label
        self.materialLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                       y: offset,
                                       width: contentWidthMid,
                                       height: contentHeight / 3 + verticalMargin)
        self.materialLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.materialLabel.text = DomainConst.BLANK
        self.materialLabel.numberOfLines = 0
        self.materialLabel.lineBreakMode = .byWordWrapping
        self.materialLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        
        /** ---- Right view ------ */
        // Status icon
        self.statusIcon.frame = CGRect(x: (contentWidthRight - contentHeight / 3) / 2,
                                     y: (rightView.frame.height - GlobalConst.ICON_SIZE) / 2,
                                     width: GlobalConst.ICON_SIZE,
                                     height: GlobalConst.ICON_SIZE)
        self.statusIcon.image = ImageManager.getImage(named: DomainConst.BLANK)
        /** ---- Bottom view ------ */
        //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
        var botOffset: CGFloat = 0
        //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
        // Address icon
        self.addressIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                        y: GlobalConst.CELL_HEIGHT_SHOW / 40,
                                        width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                        height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        //++ BUG0095-SPJ (NguyenPT 20170520) Fix Bug show human icon in VIP order
        //self.addressIcon.image = ImageManager.getImage(named: DomainConst.HUMAN_ICON_IMG_NAME)
        self.addressIcon.image = ImageManager.getImage(named: DomainConst.ADDRESS_ICON_IMG_NAME)
        //-- BUG0095-SPJ (NguyenPT 20170520) Fix Bug show human icon in VIP order
        self.addressIcon.contentMode = .scaleAspectFit
        // Address label
        self.addressLabel.frame = CGRect(x: self.addressIcon.frame.maxX,
                                         y: 0,
                                         width: GlobalConst.SCREEN_WIDTH - GlobalConst.MARGIN_CELL_X - self.addressIcon.frame.width,
                                         height: GlobalConst.LABEL_H)
        self.addressLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        self.addressLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.addressLabel.text = DomainConst.BLANK
        self.addressLabel.numberOfLines = 0
        //++ BUG0150-SPJ (NguyenPT 20170817) VIP customer order of Driver: Update list order UI
        //self.addressLabel.lineBreakMode = .byWordWrapping
        self.addressLabel.lineBreakMode = .byTruncatingTail
        //-- BUG0150-SPJ (NguyenPT 20170817) VIP customer order of Driver: Update list order UI
        
        //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
        botOffset += addressLabel.frame.height + verticalMargin
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
        //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
        
        self.topView.addSubview(self.customerLabel)
        self.leftView.addSubview(dateTime)
        self.centerView.addSubview(self.codeLabel)
        self.centerView.addSubview(self.totalLabel)
        self.centerView.addSubview(self.materialLabel)
        self.rightView.addSubview(self.statusIcon)
        
        self.bottomView.addSubview(self.addressIcon)
        self.bottomView.addSubview(self.addressLabel)
        self.bottomView.addSubview(self.btnAction)
        self.bottomView.addSubview(self.btnCancel)
        self.addSubview(self.topView)
        self.addSubview(self.leftView)
        self.addSubview(self.centerView)
        self.addSubview(self.rightView)
        self.addSubview(self.bottomView)
        self.makeComponentsColor()
    }
    
    //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
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
    //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
    
    /**
     * Set selected
     */
    override open func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /**
     * Set data for Order List
     * - parameter data: OrderListBean
     */
    open func setData(data: OrderListBean) {
        self.dateTime.setValue(dateTime: data.created_date)
        self.codeLabel.text = data.code_no + " -"
        self.totalLabel.text = data.grand_total
        self.materialLabel.text = data.title
        self.statusIcon.image = ImageManager.getImage(named: getStatusIcon(status: data.status_number))
    }
    
    /**
     * Set data for Order VIP List
     * - parameter vipData: OrderVIPListBean
     */
    open func setData(vipData: OrderVIPListBean) {
        self.dateTime.setValue(dateTime: vipData.created_date)
        //++ BUG0066-SPJ (NguyenPT 20170628) Handle show full code label
        //self.codeLabel.text = DomainConst.ORDER_CODE_PREFIX + vipData.code_no + " -"
        self.codeLabel.text = vipData.code_no + " -"
        //-- BUG0066-SPJ (NguyenPT 20170628) Handle show full code label
        var width = self.codeLabel.text?.widthOfString(usingFont: self.codeLabel.font)
        let contentWidthMid     = GlobalConst.SCREEN_WIDTH / 3 * 2
        let contentHeight       = GlobalConst.CELL_HEIGHT_SHOW / 3 * 2
        //++ BUG0150-SPJ (NguyenPT 20170817) VIP customer order of Driver: Update list order UI
        if width! > contentWidthMid / 2 {
            width = contentWidthMid / 2
        }
        //-- BUG0150-SPJ (NguyenPT 20170817) VIP customer order of Driver: Update list order UI
        // Total label
        self.totalLabel.frame = CGRect(x: self.codeLabel.frame.minX + width! + GlobalConst.MARGIN_CELL_X,
                                       y: self.totalLabel.frame.minY,
                                       width: contentWidthMid / 3 + GlobalConst.MARGIN_CELL_X,
                                       height: contentHeight / 3)
        self.totalLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        self.totalLabel.text = DomainConst.BLANK
        self.totalLabel.textColor = GlobalConst.BUTTON_COLOR_YELLOW
        self.totalLabel.text = vipData.grand_total
        self.materialLabel.text = vipData.name_gas
        
        self.statusIcon.image = ImageManager.getImage(named: getStatusIcon(status: vipData.status_number))
        let verticalMargin      = GlobalConst.MARGIN_CELL_X * 2
        if BaseModel.shared.isCustomerUser() {
            //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
            //TableCellOrderType.CELL_HEIGHT = contentHeight + verticalMargin
            TableCellOrderType.CELL_HEIGHT = contentHeight + verticalMargin * 2
            self.addressLabel.text = vipData.app_status_text
            self.addressIcon.image = ImageManager.getImage(named: DomainConst.ORDER_STATUS_ICON_IMG_NAME)
            //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        } else {
            //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
            //TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4
            TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4 + GlobalConst.BUTTON_H
            //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
            
            //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
            self.addressLabel.text = vipData.customer_address.normalizateString()
            self.addressIcon.image = ImageManager.getImage(named: DomainConst.ADDRESS_ICON_IMG_NAME)
            //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        }
        //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        //self.addressLabel.text = vipData.customer_address.normalizateString()
        self.customerLabel.text = vipData.customer_name
        //self.bottomView.isHidden = BaseModel.shared.isCustomerUser()
        self.topView.isHidden = BaseModel.shared.isCustomerUser()
        if BaseModel.shared.isCustomerUser() && BaseModel.shared.isVIPCustomerHasSubStores() {
            self.customerLabel.text = vipData.customer_name_chain
            self.topView.isHidden = false
            TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin * 2
        }
        self.bottomView.isHidden = (self.addressLabel.text?.isEmpty)!
        //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        //++ BUG0060-SPJ (NguyenPT 20170426)Handle action buttons
        // Update layout
        handleActionButton(data: vipData)
        self.updateLayout(isCustomer: BaseModel.shared.isCustomerUser())
        //-- BUG0060-SPJ (NguyenPT 20170426)Handle action buttons
        self.btnAction.accessibilityIdentifier = vipData.id
        self.btnCancel.accessibilityIdentifier = vipData.id
    }
    
    /**
     * Update layout 
     * - parameter isCustomer: Flag check if current user is customer
     */
    private func updateLayout(isCustomer: Bool) {
        let verticalMargin      = GlobalConst.MARGIN_CELL_X * 2
        let offset = self.dateTime.frame.height
        //++ BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
        //if isCustomer {
        if isCustomer && !BaseModel.shared.isVIPCustomerHasSubStores() {
        //-- BUG0116-SPJ (NguyenPT 20170628) Handle VIP customer order: select sub-agent
            self.leftView.frame = CGRect(x: 0, y: 0,
                                         width: GlobalConst.SCREEN_WIDTH / 4,
                                         height: offset)
            self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                           y: 0,
                                           width: GlobalConst.SCREEN_WIDTH / 2,
                                           height: offset)
            self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                          y: 0,
                                          width: GlobalConst.SCREEN_WIDTH / 4,
                                          height: TableCellOrderType.CELL_HEIGHT)
            self.bottomView.frame = CGRect(x: 0,
                                           y: self.leftView.frame.maxY - verticalMargin * 2,
                                           width: GlobalConst.SCREEN_WIDTH - GlobalConst.CELL_HEIGHT_SHOW / 5,
                                           height: GlobalConst.LABEL_H + GlobalConst.BUTTON_H + verticalMargin)
        } else {
            self.topView.frame = CGRect(x: 0,
                                            y: 0,
                                            width: GlobalConst.SCREEN_WIDTH,
                                            height: topHeight)
            self.leftView.frame = CGRect(x: 0,
                                         y: topView.frame.maxY,
                                         width: GlobalConst.SCREEN_WIDTH / 4,
                                         height: offset)
            self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                           y: topView.frame.maxY,
                                           width: GlobalConst.SCREEN_WIDTH / 2,
                                           height: offset)
            self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                          y: 0,
                                          width: GlobalConst.SCREEN_WIDTH / 4,
                                          height: TableCellOrderType.CELL_HEIGHT)
            self.bottomView.frame = CGRect(x: 0,
                                           y: self.leftView.frame.maxY - verticalMargin * 2,
                                           width: GlobalConst.SCREEN_WIDTH - GlobalConst.CELL_HEIGHT_SHOW / 5,
                                           height: GlobalConst.LABEL_H + GlobalConst.BUTTON_H + verticalMargin)
        }
        
        //++ BUG0145-SPJ (NguyenPT 20170817) VIP customer order list: Change status icon position
        var yPos = (rightView.frame.height - GlobalConst.ICON_SIZE - GlobalConst.BUTTON_H) / 2
        if isCustomer {
            yPos = (rightView.frame.height - GlobalConst.ICON_SIZE) / 2
        }
        //-- BUG0145-SPJ (NguyenPT 20170817) VIP customer order list: Change status icon position
        self.statusIcon.frame = CGRect(x: self.statusIcon.frame.origin.x,
                                       //++ BUG0145-SPJ (NguyenPT 20170817) VIP customer order list: Change status icon position
                                       //y: (rightView.frame.height - GlobalConst.ICON_SIZE - GlobalConst.BUTTON_H) / 2,
                                       y: yPos,
                                       //-- BUG0145-SPJ (NguyenPT 20170817) VIP customer order list: Change status icon position
                                       width: GlobalConst.ICON_SIZE,
                                       height: GlobalConst.ICON_SIZE)
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
    
    //++ BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
    /**
     * Handle show/hide button
     * - parameter data: Data of cell
     */
    private func handleActionButton(data: OrderVIPListBean) {
        let contentHeight       = GlobalConst.CELL_HEIGHT_SHOW / 3 * 2
        let verticalMargin      = GlobalConst.MARGIN_CELL_X * 2
        if (data.show_nhan_giao_hang == DomainConst.NUMBER_ZERO_VALUE)
            && (data.show_huy_giao_hang == DomainConst.NUMBER_ZERO_VALUE) {
            // 0-0 => Decrease height
            if !BaseModel.shared.isCustomerUser() {
                TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4
            }
            //++ BUG0075-SPJ (NguyenPT 20170506) Fix bug Show button Action when flag is "0"
//            if data.status_number == DomainConst.ORDER_STATUS_NEW {
//                data.show_nhan_giao_hang = DomainConst.NUMBER_ONE_VALUE
//                btnAction.frame = CGRect(
//                    x: (GlobalConst.SCREEN_WIDTH - GlobalConst.BUTTON_W) / 2,
//                    y: btnAction.frame.origin.y,
//                    width: GlobalConst.BUTTON_W,
//                    height: GlobalConst.BUTTON_H)
//                if !BaseModel.shared.isCustomerUser() {
//                    OrderEmployeeTableViewCell.CELL_HEIGHT = GlobalConst.LABEL_H * 4 + 4 * GlobalConst.MARGIN_CELL_X + GlobalConst.BUTTON_H
//                }
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
            if !BaseModel.shared.isCustomerUser() {
                TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4 + GlobalConst.BUTTON_H
            }
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
    //-- BUG0060-SPJ (NguyenPT 20170421) Add 2 button for confirm and cancel confirm
}
