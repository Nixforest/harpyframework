//
//  DetailInformationColumnView.swift
//  harpyframework
//
//  Created by SPJ on 3/29/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class DetailInformationColumnView: UIView {
    /** Width of parent */
    private var parentWidth = GlobalConst.SCREEN_WIDTH
    /** Width of left column */
    private var leftWidth   = (GlobalConst.SCREEN_WIDTH - (GlobalConst.MARGIN_CELL_X * 2)) / 3
    /** Width of right column */
    private var rightWidth  = (GlobalConst.SCREEN_WIDTH - (GlobalConst.MARGIN_CELL_X * 2)) * 2 / 3
    /** Normal font */
    private static let font        = UIFont.systemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
    /** Bold font */
    private static let lblFont     = UIFont.boldSystemFont(ofSize: GlobalConst.BASE_FONT_SIZE)
    /** Scrollview */
    private var _scrollView: UIScrollView = UIScrollView()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    /**
     * Set data for this view
     * - parameter listValues: List of data values
     * - returns: Y Offset
     */
    public func setData(listValues: [(String, String)]) -> CGFloat {
        parentWidth = self.frame.width
        leftWidth   = (parentWidth - (GlobalConst.MARGIN_CELL_X * 2)) / 3
        rightWidth  = (parentWidth - (GlobalConst.MARGIN_CELL_X * 2)) * 2 / 3
        self._scrollView.frame = CGRect(x: 0, y: 0,
                                        width: parentWidth,
                                        height: self.frame.height)
        var offset: CGFloat = 0.0
        for item in listValues {
            offset = addItem(value: item, offset: offset)
        }
        //CommonProcess.setBorder(view: self, radius: GlobalConst.BUTTON_CORNER_RADIUS)
        self._scrollView.contentSize = CGSize(width: parentWidth,
                                              height: offset)
        self.addSubview(_scrollView)
        return offset
    }
    
    /**
     * Update data
     * - parameter listValues: List of data values
     * - returns: Y Offset
     */
    public func updateData(listValues: [(String, String)]) -> CGFloat {
        for view in _scrollView.subviews {
            view.removeFromSuperview()
        }
        return setData(listValues: listValues)
    }
    
    /**
     * Add new item to view
     * - parameter value: Value of item
     * - parameter offset: Current Y offset
     * - parameter isDrawTopBorder: Flag draw top border
     * - returns: Value Y offset
     */
    private func addItem(value: (String, String), offset: CGFloat, isDrawTopBorder: Bool = true) -> CGFloat {
        if value.1.isEmpty {
            return offset
        }
        // Calculate the height of item
        var height = GlobalConst.LABEL_HEIGHT
        let valueHeight = value.1.heightWithConstrainedWidth(width: rightWidth,
                                                             font: DetailInformationColumnView.font) + 2 * GlobalConst.MARGIN
        if height < valueHeight {
            height = valueHeight
        }
        
        // Label
        let lbl = UILabel()
        lbl.frame = CGRect(x: GlobalConst.MARGIN, y: offset,
                           width: leftWidth,
                           height: height)
        lbl.text = value.0
        lbl.font = DetailInformationColumnView.lblFont
        lbl.layer.addBorder(edge: UIRectEdge.right)
        lbl.lineBreakMode   = .byWordWrapping
        lbl.numberOfLines   = 0
        
        // Value
        let txt = UITextView()
        txt.frame = CGRect(x: lbl.frame.maxX, y: offset,
                           width: rightWidth,
                           height: height)
        txt.text = value.1
        txt.font = DetailInformationColumnView.font
        txt.isEditable = false
        
        // Draw top border
        if isDrawTopBorder {
            txt.layer.addBorder(edge: UIRectEdge.top)
            lbl.layer.addBorder(edge: UIRectEdge.top)
        }
        
        // Add to parent view
        self._scrollView.addSubview(lbl)
        self._scrollView.addSubview(txt)
        // Return offset
        return (offset + height)
    }
}
