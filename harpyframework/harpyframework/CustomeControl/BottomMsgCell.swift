//
//  BottomMsgCell.swift
//  harpyframework
//
//  Created by SPJ on 11/29/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class BottomMsgCell: UITableViewCell {
    // MARK: Properties
    /** Title label */
    var _lblTitle:      UILabel     = UILabel()
    /** Content text field */
    var _txtContent:    UITextField = UITextField()
    /** Background image */
    var _bkgImage:      UIImageView = UIImageView()
    /** Action button */
    var _btnAction:     UIButton    = UIButton()
    
    // MARK: Const
    static let SHARE_CELL_HEIGHT = (GlobalConst.MARGIN * 4 + GlobalConst.LABEL_H * 2)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.addSubview(_lblTitle)
        self.contentView.addSubview(_txtContent)
        self.contentView.addSubview(_btnAction)
        self.contentView.insertSubview(_bkgImage, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /**
     * Set data for cell
     * - parameter data: Data of cell
     */
    public func setData(data: (BottomMsgCellTypeEnum, AnyObject)) {
        switch data.0 {
        case .shareCode:
            setupShareCell(referCode: BaseModel.shared.getInviteCode().uppercased())
            break
        default:
            break
        }
    }
    
    /**
     * Get height of cell
     * - parameter type: Type of cell
     */
    public static func getHeight(type: BottomMsgCellTypeEnum) -> CGFloat {
        switch type {
        case .news:
            break
        case .shareCode:
            return SHARE_CELL_HEIGHT
        case .usingCode:
            break
        default:
            break
        }
        return UITableViewAutomaticDimension
    }
    
    // MARK: Layout
    /**
     * Setup title label for share type
     * - parameter lbl: Lable for setup
     * - parameter text: Text of label
     * - parameter yPos: Y position
     */
    private func setupTitleLabelShare(lbl: UILabel, text: String, yPos: CGFloat = GlobalConst.MARGIN) {
        lbl.frame = CGRect(
            x: GlobalConst.MARGIN,
            y: yPos,
            width: self.contentView.frame.width,
            height: GlobalConst.LABEL_H)
        lbl.text = text.uppercased()
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
    }
    
    /**
     * Setup share textbox for share type
     * - parameter txt:         Textfield
     * - parameter text:        Text of label
     * - parameter yPos:        Y position
     * - parameter width:       Width of view
     * - parameter iconPath:    Icon image path
     * - parameter action:      Action when tap on button
     */
    private func setupShareTextbox(txt: UITextField, text: String, yPos: CGFloat,
                                   width: CGFloat, iconPath: String, nextAction: Selector) {
        txt.frame = CGRect(
            x: GlobalConst.MARGIN,
            y: yPos,
            width: width,
            height: GlobalConst.LABEL_H + GlobalConst.MARGIN)
        txt.text = text
        txt.textAlignment = .left
        txt.font = GlobalConst.BASE_FONT
        txt.backgroundColor = UIColor.white
        
        let sizeBtn = GlobalConst.LABEL_H
        let btnNext = UIButton(type: .custom)
        btnNext.frame = CGRect(
            x: txt.frame.width - sizeBtn - GlobalConst.MARGIN * 2,
            y: (txt.frame.height - sizeBtn) / 2,
            width: sizeBtn,
            height: sizeBtn)
        btnNext.setImage(ImageManager.getImage(named: iconPath),
                         for: .normal)
        btnNext.accessibilityIdentifier = text
        btnNext.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: GlobalConst.MARGIN_CELL_X)
        btnNext.imageView?.contentMode = .scaleAspectFit
        btnNext.addTarget(self, action: nextAction,
                          for: .touchUpInside)
        txt.rightView = btnNext
        txt.rightViewMode = .always
    }
    
    /**
     * Setup action button qr code
     * - parameter btn:         Button to setup
     * - parameter iconPath:    Icon image path
     * - parameter action:      Action when tap on button
     */
    private func setupActionButtonQR(btn: UIButton, iconPath: String,
                                     action: Selector) {
        let sizeBtn = self.contentView.frame.height / 2
        btn.frame = CGRect(
            x: self.contentView.frame.width - sizeBtn * 3 / 2,
            y: (self.contentView.frame.height - sizeBtn) / 2,
            width: sizeBtn,
            height: sizeBtn)
        
        btn.setImage(ImageManager.getImage(named: iconPath),
                     for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: action, for: .touchUpInside)
    }
    
    /**
     * Setup share cell
     * - parameter referCode: Refer code
     */
    private func setupShareCell(referCode: String) {
        self.contentView.frame = CGRect(x: 0, y: 0,
                            width: self.frame.width,
                            height: BottomMsgCell.SHARE_CELL_HEIGHT)
        _bkgImage.frame = self.contentView.frame
        _bkgImage.image = ImageManager.getImage(named: DomainConst.SHARE_BACKGROUND_IMG_NAME)
        _bkgImage.contentMode = .scaleToFill
        
        
        setupTitleLabelShare(lbl: _lblTitle, text: DomainConst.CONTENT00538)
        setupShareTextbox(
            txt: _txtContent,
            text: referCode,
            yPos: _lblTitle.frame.maxY,
            width: self.contentView.frame.width / 2,
            iconPath: DomainConst.SHARE_ICON_IMG_NAME,
            nextAction: #selector(shareCodeHandler(_:)))
        setupActionButtonQR(btn: _btnAction, iconPath: DomainConst.QR_CODE_ICON_IMG_NAME,
                            action: #selector(qrCodeBtnTapped(_:)))
    }
    
    // MARK: Event handlers
    /**
     * Handle when tap on share code button
     */
    internal func shareCodeHandler(_ sender: AnyObject) {
        if let curVC = BaseViewController.getCurrentViewController() {
            if let referCode = sender.accessibilityIdentifier {
                let text = String.init(format: DomainConst.CONTENT00526,
                                       referCode!,
                                       DomainConst.REFER_LINK + referCode!)
                
                let textToShare = [text]
                // Setup activity view controller
                let activityVC = UIActivityViewController(activityItems: textToShare,
                                                          applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self._txtContent
                
                // Present
                curVC.present(activityVC,
                             animated: true,
                             completion: nil)
            }
        }        
    }
    
    /**
     * Handle when tap on qr code button
     */
    internal func qrCodeBtnTapped(_ sender: AnyObject) {
        if let curVC = BaseViewController.getCurrentViewController() {
            curVC.openPromotionActiveQR()
        }
    }
}

/**
 * Type of bottom message cell enum
 */
enum BottomMsgCellTypeEnum {
    case shareCode          // Share refer code
    case usingCode          // Using refer code
    case news               // View news
    case type_num           // Number of items
}
