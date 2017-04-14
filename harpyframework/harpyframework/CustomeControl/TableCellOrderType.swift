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
    @IBOutlet weak var _parentView: UIView!
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
        TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4
        
        self._parentView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: GlobalConst.SCREEN_WIDTH,
                                        height: TableCellOrderType.CELL_HEIGHT)
        self.topView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: GlobalConst.SCREEN_WIDTH,
                                    height: topHeight)
        self.leftView.frame = CGRect(x: 0,
                                     y: topView.frame.maxY,
                                     width: GlobalConst.SCREEN_WIDTH / 4,
                                     //height: TableCellOr derType.CELL_HEIGHT)
                                     height: offset)
        self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                       y: topView.frame.maxY,
                                       width: GlobalConst.SCREEN_WIDTH / 2,
                                       //height: TableCellOrderType.CELL_HEIGHT)
                                       height: offset)
        self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                      y: 0,
                                      width: GlobalConst.SCREEN_WIDTH / 4,
                                      height: TableCellOrderType.CELL_HEIGHT)
        self.bottomView.frame = CGRect(x: 0,
                                       y: self.leftView.frame.maxY - verticalMargin * 2,
                                       width: GlobalConst.SCREEN_WIDTH - GlobalConst.CELL_HEIGHT_SHOW / 5,
                                       height: GlobalConst.CELL_HEIGHT_SHOW / 4)
        
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
        // Address icon
        self.addressIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                        y: GlobalConst.CELL_HEIGHT_SHOW / 40,
                                        width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                        height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.addressIcon.image = ImageManager.getImage(named: DomainConst.HUMAN_ICON_IMG_NAME)
        self.addressIcon.contentMode = .scaleAspectFit
        // Address label
        self.addressLabel.frame = CGRect(x: self.addressIcon.frame.maxX,
                                         y: 0,
                                         width: GlobalConst.SCREEN_WIDTH - GlobalConst.MARGIN_CELL_X - self.addressIcon.frame.width,
                                         height: self.bottomView.frame.height + verticalMargin)
        self.addressLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE_LIST)
        self.addressLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.addressLabel.text = DomainConst.BLANK
        self.addressLabel.numberOfLines = 0
        self.addressLabel.lineBreakMode = .byWordWrapping
        
        self.leftView.addSubview(dateTime)
        self.centerView.addSubview(self.codeLabel)
        self.centerView.addSubview(self.totalLabel)
        self.centerView.addSubview(self.materialLabel)
        self.rightView.addSubview(self.statusIcon)
        
        self.bottomView.addSubview(self.addressIcon)
        self.bottomView.addSubview(self.addressLabel)
        self.topView.addSubview(self.customerLabel)
        
        self._parentView.addSubview(self.topView)
        self._parentView.addSubview(self.leftView)
        self._parentView.addSubview(self.centerView)
        self._parentView.addSubview(self.rightView)
        self._parentView.addSubview(self.bottomView)
        self._parentView.makeComponentsColor()
    }
    
    /**
     * Set selected
     */
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    open func setData(data: OrderListBean) {
        self.dateTime.setValue(dateTime: data.created_date)
        self.codeLabel.text = data.code_no + " -"
        self.totalLabel.text = data.grand_total
        self.materialLabel.text = data.title
//        if data.status_number == DomainConst.ORDER_STATUS_COMPLETE {
//            self.statusIcon.image = ImageManager.getImage(named: DomainConst.FINISH_STATUS_IMG_NAME)
//        } else if data.status_number == DomainConst.ORDER_STATUS_NEW {
//            self.statusIcon.image = ImageManager.getImage(named: DomainConst.ORDER_STATUS_NEW_ICON_IMG_NAME)
//        }
        
        self.statusIcon.image = ImageManager.getImage(named: getStatusIcon(status: data.status_number))
    }
    
    open func setData(vipData: OrderVIPListBean) {
        self.dateTime.setValue(dateTime: vipData.created_date)
        self.codeLabel.text = "#" + vipData.code_no + " -"
        let width = self.codeLabel.text?.widthOfString(usingFont: self.codeLabel.font)
        let contentWidthMid     = GlobalConst.SCREEN_WIDTH / 3 * 2
        let contentHeight       = GlobalConst.CELL_HEIGHT_SHOW / 3 * 2
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
            TableCellOrderType.CELL_HEIGHT = contentHeight + verticalMargin
        } else {
            TableCellOrderType.CELL_HEIGHT = topHeight + contentHeight + verticalMargin + GlobalConst.CELL_HEIGHT_SHOW / 4
        }
        // Update layout
        self.updateLayout(isCustomer: BaseModel.shared.isCustomerUser())
        self.addressLabel.text = vipData.customer_address.normalizateString()
        self.customerLabel.text = vipData.customer_name
        self.bottomView.isHidden = BaseModel.shared.isCustomerUser()
        self.topView.isHidden = BaseModel.shared.isCustomerUser()
    }
    
    private func updateLayout(isCustomer: Bool) {
        let verticalMargin      = GlobalConst.MARGIN_CELL_X * 2
        let offset = self.dateTime.frame.height
        if isCustomer {
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
                                           height: GlobalConst.CELL_HEIGHT_SHOW / 4)
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
                                           height: GlobalConst.CELL_HEIGHT_SHOW / 4)
        }
    }
    
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
}
