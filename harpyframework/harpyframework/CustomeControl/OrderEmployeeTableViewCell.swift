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
    /** Current id */
    private var _id:            String              = DomainConst.BLANK
    public static var CELL_HEIGHT: CGFloat = 0.0

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let verticalMargin      = GlobalConst.MARGIN_CELL_X
        let contentWidthLeft    = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthRight   = GlobalConst.SCREEN_WIDTH / 4
        let contentWidthMid     = GlobalConst.SCREEN_WIDTH / 4 * 3 - GlobalConst.MARGIN_CELL_X
        
        var offset              = verticalMargin
        /** ---- Left view ------ */
        self.dateTime.setup(x: 0, y: offset,
                            w: contentWidthLeft,
                            h: GlobalConst.LABEL_H)
        offset += self.dateTime.frame.height + verticalMargin
        
        OrderEmployeeTableViewCell.CELL_HEIGHT = GlobalConst.LABEL_H * 4 + 2 * verticalMargin
        
        self.frame = CGRect(x: 0, y: 0,
                            width: GlobalConst.SCREEN_WIDTH,
                            height: OrderEmployeeTableViewCell.CELL_HEIGHT)
        self.leftView.frame = CGRect(
            x: 0,  y: 0,
            width: GlobalConst.SCREEN_WIDTH / 4,
            height: offset)
        self.centerView.frame = CGRect(
            x: self.leftView.frame.maxX, y: 0,
            width: GlobalConst.SCREEN_WIDTH / 2,
            height: offset)
        self.rightView.frame = CGRect(
            x: self.centerView.frame.maxX, y: 0,
            width: GlobalConst.SCREEN_WIDTH / 4,
            height: OrderEmployeeTableViewCell.CELL_HEIGHT)
        self.bottomView.frame = CGRect(
            x: 0, y: offset,
            width: GlobalConst.SCREEN_WIDTH / 4 * 3,
            height: GlobalConst.LABEL_H * 2)
        
        // Add control to view
        self.leftView.addSubview(self.dateTime)
        
        self.addSubview(self.leftView)
        self.addSubview(self.centerView)
        self.addSubview(self.rightView)
        self.addSubview(self.bottomView)
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(data: OrderListBean) {
        self.dateTime.setValue(dateTime: data.created_date)
    }
}
