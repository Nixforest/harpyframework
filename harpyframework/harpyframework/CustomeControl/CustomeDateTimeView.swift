//
//  CustomeDateTimeView.swift
//  harpyframework
//
//  Created by SPJ on 1/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class CustomeDateTimeView: UIView {
    private var timeLabel: UILabel = UILabel()
    private var dateIcon: UIImageView = UIImageView()
    private var dateLabel: UILabel = UILabel()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    /**
     * Setup layout for control
     * - parameter x: X position
     * - parameter y: Y position
     * - parameter w: Width value
     * - parameter h: Height value
     */
    open func setup(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.frame = CGRect(x: x, y: y, width: w, height: h)
        // Time label
        self.timeLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                      y: 0,
                                      width: w,
                                      height: h / 2)
        self.timeLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.BIG_FONT_SIZE)
        self.timeLabel.text = DomainConst.BLANK
        // Date icon
        self.dateIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                     y: self.timeLabel.frame.maxY + GlobalConst.MARGIN_CELL_Y,
                                     width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                     height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.dateIcon.image = UIImage(named: "icon31.png")
        // Date label
        self.dateLabel.frame = CGRect(x: self.dateIcon.frame.maxX,
                                      y: self.timeLabel.frame.maxY,
                                      width: w,
                                      height: self.dateIcon.frame.height)
        self.dateLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        self.dateLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.dateLabel.text = DomainConst.BLANK
        self.addSubview(self.timeLabel)
        self.addSubview(self.dateIcon)
        self.addSubview(self.dateLabel)
    }
    /**
     * Set value for control
     * - parameter dateTime: String of date time value
     */
    open func setValue(dateTime: String) {
        var time: String = DomainConst.BLANK
        var date: String = DomainConst.BLANK
        var dateTimeArr = dateTime.components(separatedBy: DomainConst.SPACE_STR)
        if dateTimeArr.count == 2 {
            time = dateTimeArr[1]
            date = dateTimeArr[0]
        } else {
            time = "08:00"
            date = dateTime
        }
        self.timeLabel.text = time
        self.dateLabel.text = date
    }
}
