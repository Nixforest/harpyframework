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
    private var leftView:   UIView = UIView()
    private var centerView: UIView = UIView()
    private var rightView:  UIView = UIView()
    // Left controls
    private var dateTime: CustomeDateTimeView = CustomeDateTimeView()
    
    // Center controls
    private var codeLabel: UILabel = UILabel()
    private var totalLabel: UILabel = UILabel()
    private var materialLabel: UILabel = UILabel()
    
    // Right control
    private var statusIcon: UIImageView = UIImageView()
    public static var CELL_HEIGHT: CGFloat = 0.0
    
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
        var offset              = verticalMargin
        
        /** ---- Left view ------ */
        self.dateTime.setup(x: 0, y: 0, w: contentWidthLeft, h: contentHeight)
        
        TableCellOrderType.CELL_HEIGHT = contentHeight + verticalMargin
        
        self._parentView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: GlobalConst.SCREEN_WIDTH,
                                        height: TableCellOrderType.CELL_HEIGHT)
        self.leftView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: GlobalConst.SCREEN_WIDTH / 4,
                                     height: TableCellOrderType.CELL_HEIGHT)
        self.centerView.frame = CGRect(x: self.leftView.frame.maxX,
                                       y: 0,
                                       width: GlobalConst.SCREEN_WIDTH / 2,
                                       height: TableCellOrderType.CELL_HEIGHT)
        self.rightView.frame = CGRect(x: self.centerView.frame.maxX,
                                      y: 0,
                                      width: GlobalConst.SCREEN_WIDTH / 4,
                                      height: TableCellOrderType.CELL_HEIGHT)

        
        
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
                                     y: contentHeight / 3,
                                     width: contentHeight / 3,
                                     height: contentHeight / 3)
        self.statusIcon.image = ImageManager.getImage(named: DomainConst.BLANK)
        
        self.leftView.addSubview(dateTime)
        self.centerView.addSubview(self.codeLabel)
        self.centerView.addSubview(self.totalLabel)
        self.centerView.addSubview(self.materialLabel)
        self.rightView.addSubview(self.statusIcon)
        self._parentView.addSubview(self.leftView)
        self._parentView.addSubview(self.centerView)
        self._parentView.addSubview(self.rightView)
        self.makeComponentsColor()
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
        if data.status_number == DomainConst.ORDER_STATUS_COMPLETE {
            self.statusIcon.image = ImageManager.getImage(named: DomainConst.FINISH_STATUS_IMG_NAME)
        } else if data.status_number == DomainConst.ORDER_STATUS_NEW {
            self.statusIcon.image = ImageManager.getImage(named: DomainConst.ORDER_STATUS_NEW_ICON_IMG_NAME)
        }
    }
}
