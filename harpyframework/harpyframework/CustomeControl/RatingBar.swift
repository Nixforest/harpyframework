//
//  RatingBar.swift
//  project
//
//  Created by Nixforest on 11/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

open class RatingBar: UIView {
    // MARK: Properties
    /** Spacing */
    public let _spacing: CGFloat = 5
    /** Number of stars */
    public var _starCount: Int = 5
    /** Width */
    public var _width: CGFloat = 0
    /** Rating value */
    public var _rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    /** Rating buttons */
    var _ratingButtons: [UIButton] = [UIButton]()
    //++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
    /** Delegate */
    public var delegate: RatingBarDelegate? = nil
    //-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
    
    // MARK: Initialization
    public init() {
        super.init(frame: UIScreen.main.bounds)
        self.addContent()
        return
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     * Add content function
     */
    public func addContent() {
        let filledStarImg = ImageManager.getImage(named: DomainConst.RATING_IMG_NAME)
        let emptyStarImg = ImageManager.getImage(named: DomainConst.RATING_EMPTY_IMG_NAME)
        
        // Create button
        for _ in 0..<self._starCount {
            let tintedFilled = filledStarImg?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            let tintedEmpty = emptyStarImg?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            button.translatesAutoresizingMaskIntoConstraints = true
            button.setImage(tintedEmpty, for: .normal)
            button.setImage(tintedFilled, for: .selected)
            button.setImage(tintedFilled, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingBar.ratingButtonTapped),
                             for: .touchDown)
            //++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
            //button.backgroundColor = GlobalConst.BACKGROUND_COLOR_GRAY
            //-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
            button.tintColor = GlobalConst.BUTTON_COLOR_YELLOW
            self._ratingButtons.append(button)
            addSubview(button)
        }
    }
    
    /**
     * Handle sub view
     */
    override open func layoutSubviews() {
        let buttonSize = CGFloat(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0,
                                 width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the buttn plus spacing
        for (index, button) in self._ratingButtons.enumerated() {
            buttonFrame.origin.x = (CGFloat)(index) * (buttonSize + self._spacing)
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    override open var intrinsicContentSize: CGSize {
        let buttonSize = CGFloat(frame.size.height)
        let width = (buttonSize * (CGFloat)(self._starCount)) + (self._spacing * (CGFloat)(self._starCount - 1))
        _width = width
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button actions
    /**
     * Handle when tap a rating button
     * - parameter button: Button is tapped
     */
    func ratingButtonTapped(button: UIButton) {
        self._rating = self._ratingButtons.index(of: button)! + 1
        updateButtonSelectionStates()
        //++ BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
        if delegate != nil {
            delegate?.rating(button)
        }
        //-- BUG0127-SPJ (NguyenPT 20170724) Uphold rating: merge to 1 step
    }
    
    /**
     * Set rating value
     * - parameter value: Value to set
     */
    public func setRatingValue(value: Int) {
        self._rating = value
        updateButtonSelectionStates()
    }
    
    /**
     * Update layout of rating bar after set value
     */
    func updateButtonSelectionStates() {
        for (index, button) in self._ratingButtons.enumerated() {
            // If index of a button is less than the rating, that button should be selected
            button.isSelected = index < self._rating
        }
    }
    
    /**
     * Set background color
     * - parameter color: Background color value
     */
    public func setBackgroundColor(color: UIColor) {
        for button in self._ratingButtons {
            button.backgroundColor = color
        }
        self.backgroundColor = color
    }
    
    /**
     * Enable/Disable buttons
     * - parameter isEnabled: Enable/Disable flag
     */
    public func setEnabled(isEnabled: Bool) {
        for button in self._ratingButtons {
            button.isEnabled = isEnabled
        }
    }
    
    
    /**
     * Get number of stars
     * - returns: Number of stars
     */
    public func getStarNumber() -> Int {
        return self._starCount
    }
    
    /**
     * Get space between stars
     * - returns: Space between stars
     */
    public func getStarSpace() -> CGFloat {
        return self._spacing
    }
    
    /**
     * Get rating value
     * - returns: Rating value
     */
    public func getRatingValue() -> Int {
        return self._rating
    }
}
