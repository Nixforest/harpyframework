//
//  CustomeDateTimeView.swift
//  harpyframework
//
//  Created by SPJ on 1/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class CustomeDateTimeView: UIView {
    /** Time label */
    private var timeLabel: UILabel = UILabel()
    /** Date icon */
    private var dateIcon: UIImageView = UIImageView()
    /** Date label */
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
     * - parameter type: Type of control
     *                   Blank: Show both time and date (Default value)
     *                   "1":   Show only date
     */
    //++ BUG0093-SPJ (NguyenPT 20170520) Update only show date
    //open func setup(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
    open func setup(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, type: String = DomainConst.BLANK) {
    //-- BUG0093-SPJ (NguyenPT 20170520) Update only show date
        self.frame = CGRect(x: x, y: y, width: w, height: h)
        // Time label
        self.timeLabel.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                      y: 0,
                                      width: w,
                                      height: h / 2)
        self.timeLabel.font = UIFont.boldSystemFont(ofSize: GlobalConst.BIG_FONT_SIZE)
        self.timeLabel.text = DomainConst.BLANK
        //++ BUG0093-SPJ (NguyenPT 20170520) Update only show date
        var offset: CGFloat = 0.0
        offset = self.timeLabel.frame.maxY + GlobalConst.MARGIN_CELL_Y
        if type == DomainConst.NUMBER_ONE_VALUE {
            self.timeLabel.isHidden = true
            offset = GlobalConst.MARGIN_CELL_X * 2
        }
        //-- BUG0093-SPJ (NguyenPT 20170520) Update only show date
        // Date icon
        self.dateIcon.frame = CGRect(x: GlobalConst.MARGIN_CELL_X,
                                     //++ BUG0093-SPJ (NguyenPT 20170520) Update only show date
                                     //y: self.timeLabel.frame.maxY + GlobalConst.MARGIN_CELL_Y,
                                     y: offset,
                                     //-- BUG0093-SPJ (NguyenPT 20170520) Update only show date
                                     width: GlobalConst.CELL_HEIGHT_SHOW / 5,
                                     height: GlobalConst.CELL_HEIGHT_SHOW / 5)
        self.dateIcon.image = ImageManager.getImage(named: DomainConst.DATETIME_ICON_IMG_NAME)
        // Date label
        self.dateLabel.frame = CGRect(x: self.dateIcon.frame.maxX,
                                      //++ BUG0093-SPJ (NguyenPT 20170520) Update only show date
                                      //y: self.timeLabel.frame.maxY,
                                      y: offset,
                                      //-- BUG0093-SPJ (NguyenPT 20170520) Update only show date
                                      width: w,
                                      height: self.dateIcon.frame.height)
        self.dateLabel.font = UIFont.systemFont(ofSize: GlobalConst.SMALL_FONT_SIZE)
        //++ BUG0093-SPJ (NguyenPT 20170520) Update only show date
        if type == DomainConst.NUMBER_ONE_VALUE {
            self.dateLabel.font = UIFont.systemFont(ofSize: GlobalConst.NORMAL_FONT_SIZE_1)
        }
        //-- BUG0093-SPJ (NguyenPT 20170520) Update only show date
        self.dateLabel.textColor = GlobalConst.TEXT_COLOR_GRAY
        self.dateLabel.text = DomainConst.BLANK
        self.addSubview(self.timeLabel)
        self.addSubview(self.dateIcon)
        self.addSubview(self.dateLabel)
        self.makeComponentsColor()
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
            time = DomainConst.DEFAULT_TIME_VALUE
            date = dateTime
        }
        self.timeLabel.text = time
        self.dateLabel.text = date
    }
}
