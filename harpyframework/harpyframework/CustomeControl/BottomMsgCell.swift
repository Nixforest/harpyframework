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
    var _lblTitle:          UILabel         = UILabel()
    /** Content text field */
    var _txtContent:        UITextField     = UITextField()
    /** Content view */
    var _webViewContent:    UIWebView       = UIWebView()
    /** Background image */
    var _bkgImage:          UIImageView     = UIImageView()
    /** Action button */
    /** Visible: Code no have data */
    var _btnAction:         UIButton        = UIButton()
    /** Action button 2 */
    /** Visible: Link web have data */
    var _btnAction2:        UIButton        = UIButton()
    /** Type */
    var _type:              BottomMsgCellTypeEnum = .type_num
    /** Data */
    var _data:              NewsListBean    = NewsListBean()
    
    // MARK: Const
    static let SHARE_CELL_HEIGHT = (GlobalConst.MARGIN * 4 + GlobalConst.LABEL_H * 2)
    static let NORMAL_CELL_HEIGHT = (GlobalConst.MARGIN * 4 + GlobalConst.LABEL_H * 2) + SHARE_CELL_HEIGHT * 4
    static var USING_CODE_CELL_HEIGHT = (GlobalConst.MARGIN * 4 + GlobalConst.LABEL_H * 3) + SHARE_CELL_HEIGHT * 4

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(_lblTitle)
        self.contentView.addSubview(_txtContent)
        self.contentView.addSubview(_webViewContent)
        self.contentView.addSubview(_btnAction)
        self.contentView.addSubview(_btnAction2)
        self.contentView.insertSubview(_bkgImage, at: 0)
        _btnAction.addTarget(self, action: #selector(qrCodeBtnTapped(_:)), for: .touchUpInside)
        _btnAction2.addTarget(self, action: #selector(actionBtn2Tapped(_:)), for: .touchUpInside)
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
        self._type = data.0
        if let bean = data.1 as? NewsListBean {
            self._data = bean
        }
        switch data.0 {
        case .shareCode:
            setupShareCell(referCode: BaseModel.shared.getInviteCode().uppercased())
        case .normal:
            if let newsListBean = data.1 as? NewsListBean {
                setupNormalCell(data: newsListBean)
            }
        case .usingCode:
            if let newsListBean = data.1 as? NewsListBean {
                setupUsingCodeCell(data: newsListBean)
            }
            break
        case .openWeb:
            if let newsListBean = data.1 as? NewsListBean {
                setupOpenWebCell(data: newsListBean)
            }
        case .openWebUsingCode:
            if let newsListBean = data.1 as? NewsListBean {
                setupOpenWebUsingCodeCell(data: newsListBean)
            }
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
        case .shareCode:
            return BottomMsgCell.SHARE_CELL_HEIGHT
        case .normal:
            return BottomMsgCell.NORMAL_CELL_HEIGHT
        case .usingCode:
            return BottomMsgCell.USING_CODE_CELL_HEIGHT
        case .openWeb:
            return BottomMsgCell.USING_CODE_CELL_HEIGHT
        case .openWebUsingCode:
            return BottomMsgCell.USING_CODE_CELL_HEIGHT
        default:
            break
        }
        return UITableViewAutomaticDimension
    }
    
    /**
     * Show/hide children views
     */
    public func showHideChildren(type: BottomMsgCellTypeEnum) {
        switch type {
        case .shareCode:
            self._lblTitle.isHidden         = false            
            self._webViewContent.isHidden   = true
            self._txtContent.isHidden       = false
            self._bkgImage.isHidden         = false
            self._btnAction.isHidden        = false
            self._btnAction2.isHidden       = true
        case .normal:
            self._lblTitle.isHidden         = false            
            self._webViewContent.isHidden   = false
            self._txtContent.isHidden       = true
            self._bkgImage.isHidden         = false
            self._btnAction.isHidden        = false
            self._btnAction2.isHidden       = true
        case .usingCode:
            self._lblTitle.isHidden         = false            
            self._webViewContent.isHidden   = false
            self._txtContent.isHidden       = true
            self._bkgImage.isHidden         = false
            self._btnAction.isHidden        = false
            self._btnAction2.isHidden       = true
            break
        case .openWeb:
            self._lblTitle.isHidden         = false            
            self._webViewContent.isHidden   = false
            self._txtContent.isHidden       = true
            self._bkgImage.isHidden         = false
            self._btnAction.isHidden        = false
            self._btnAction2.isHidden       = true
            break
        case .openWebUsingCode:
            self._lblTitle.isHidden         = false            
            self._webViewContent.isHidden   = false
            self._txtContent.isHidden       = true
            self._bkgImage.isHidden         = false
            self._btnAction.isHidden        = false
            self._btnAction2.isHidden       = false
            break
        default:
            break
        }
        self._btnAction.isHidden = self._data.code_no.isEmpty
        self._btnAction2.isHidden = self._data.link_web.isEmpty
    }
    
    // MARK: Layout
    /**
     * Setup title label for share type
     * - parameter lbl: Lable for setup
     * - parameter text: Text of label
     * - parameter yPos: Y position
     */
    private func setupTitleLabelShare(lbl: UILabel, text: String, yPos: CGFloat = GlobalConst.MARGIN, color: UIColor = UIColor.white) {
        lbl.frame = CGRect(
            x: GlobalConst.MARGIN,
            y: yPos,
            width: self.contentView.frame.width,
            height: GlobalConst.LABEL_H)
        lbl.text = text.uppercased()
        lbl.textColor = color
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
        _btnAction.accessibilityIdentifier = DomainConst.BLANK
//        btn.addTarget(self, action: action, for: .touchUpInside)
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
        showHideChildren(type: .shareCode)
    }
    
    /**
     * Setup normal cell
     * - parameter data: NewsListBean object
     */
    private func setupNormalCell(data: NewsListBean) {
        self.setupUsingCodeCell(data: data)
        _btnAction.setTitle(data.link_web_text, for: UIControlState())
        _btnAction.accessibilityIdentifier = data.link_web
    }
    
    /**
     * Setup normal cell
     * - parameter data: NewsListBean object
     */
    private func setupOpenWebCell(data: NewsListBean) {
        self.setupUsingCodeCell(data: data)
        _btnAction.setTitle(data.link_web_text, for: UIControlState())
        _btnAction.accessibilityIdentifier = data.link_web
    }
    
    /**
     * Setup title label for share type
     * - parameter lbl: Lable for setup
     * - parameter text: Text of label
     * - parameter yPos: Y position
     */
    private func setupTitleLabelNormal(lbl: UILabel, text: String, yPos: CGFloat = GlobalConst.MARGIN) {
        lbl.frame = CGRect(
            x: GlobalConst.MARGIN,
            y: yPos,
            width: self.contentView.frame.width,
            height: GlobalConst.LABEL_H)
        lbl.text = text
        lbl.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        lbl.textColor = GlobalConst.MAIN_COLOR_GAS_24H
        lbl.textAlignment = .left
    }
    
    /**
     * Setup webview content
     * - parameter data: Html string
     */
    private func setupWebViewContent(data: String) {
        self._webViewContent.frame = CGRect(
            x: 0, y: _bkgImage.frame.maxY + GlobalConst.MARGIN,
            width: self.frame.width,
            height: BottomMsgCell.SHARE_CELL_HEIGHT * 2)
        self._webViewContent.loadHTMLString(data, baseURL: nil)
//        self._webViewContent.frame.size.height = 1
//        self._webViewContent.frame.size = self._webViewContent.sizeThatFits(.zero)
//        self._webViewContent.scrollView.isScrollEnabled = false
    }
    
    /**
     * Setup using code cell
     * - parameter data: NewsListBean object
     */
    private func setupUsingCodeCell(data: NewsListBean) {      
        // Setup label
        setupTitleLabelUsingCode(lbl: _lblTitle, text: data.title)
        
        // Setup banner
        _bkgImage.getImgFromUrl(link: data.url_banner, contentMode: .scaleAspectFit)
        _bkgImage.frame = CGRect(x: 0, y: _lblTitle.frame.maxY + GlobalConst.MARGIN,
                                 width: self.frame.width,
                                 height: BottomMsgCell.SHARE_CELL_HEIGHT * 2)
//        _bkgImage.backgroundColor = UIColor.white
        setupWebViewContent(data: data.name)
        setupActionButtonUsingCode(data: data)
        showHideChildren(type: .usingCode)
        self.contentView.makeComponentsColor()
    }
    
    /**
     * Setup title label for share type
     * - parameter lbl: Lable for setup
     * - parameter text: Text of label
     * - parameter yPos: Y position
     */
    private func setupTitleLabelUsingCode(lbl: UILabel, text: String, yPos: CGFloat = GlobalConst.MARGIN) {
//        lbl.backgroundColor = UIColor.white
        setupTitleLabelNormal(lbl: lbl, text: text, yPos: yPos)
    }
    
    /**
     * Setup action button using code
     * - parameter btn:         Button to setup
     * - parameter iconPath:    Icon image path
     * - parameter action:      Action when tap on button
     */
    private func setupActionButtonUsingCode(data: NewsListBean) {
        var width = self.frame.width
        if data.type == BottomMsgCellTypeEnum.openWebUsingCode.rawValue {
            width = self.frame.width / 2
        }
        let sizeBtn = GlobalConst.BUTTON_H
        _btnAction.frame = CGRect(
            x: 0,
            y: BottomMsgCell.USING_CODE_CELL_HEIGHT - sizeBtn - GlobalConst.MARGIN,
            width: width,
            height: sizeBtn)
        
        _btnAction.setImage(ImageManager.getImage(named: ""),
                     for: .normal)
        _btnAction.setTitle(data.code_no_text, for: UIControlState())
        _btnAction.setTitleColor(GlobalConst.URL_BUTTON_COLOR, for: UIControlState())
//        _btnAction.contentHorizontalAlignment = .left
        _btnAction.layer.borderColor = GlobalConst.BORDER_BUTTON_COLOR.cgColor
        _btnAction.layer.borderWidth = 1
        _btnAction.accessibilityIdentifier = data.code_no
//        _btnAction.backgroundColor = UIColor.white
//        _btnAction.addTarget(self, action: #selector(usingCodeHandler(_:)), for: .touchUpInside)
    }
    
    /**
     * Setup open web - using code cell
     * - parameter data: NewsListBean object
     */
    private func setupOpenWebUsingCodeCell(data: NewsListBean) {
        self.setupUsingCodeCell(data: data)
//        _btnAction.setTitle(data.link_web_text, for: UIControlState())
//        _btnAction.accessibilityIdentifier = data.link_web
        setupOpenWebButton(data: data)
        showHideChildren(type: .openWebUsingCode)
    }
    
    private func setupOpenWebButton(data: NewsListBean) {
        let width = self.frame.width / 2
        let sizeBtn = GlobalConst.BUTTON_H
        _btnAction2.frame = CGRect(
            x: self.frame.width / 2,
            y: BottomMsgCell.USING_CODE_CELL_HEIGHT - sizeBtn - GlobalConst.MARGIN,
            width: width,
            height: sizeBtn)
        
        _btnAction2.setImage(ImageManager.getImage(named: ""),
                            for: .normal)
        _btnAction2.setTitle(data.link_web_text, for: UIControlState())
        _btnAction2.setTitleColor(GlobalConst.URL_BUTTON_COLOR, for: UIControlState())
        _btnAction2.layer.borderColor = GlobalConst.BORDER_BUTTON_COLOR.cgColor
        _btnAction2.layer.borderWidth = 1
        _btnAction2.accessibilityIdentifier = data.link_web
//        _btnAction2.backgroundColor = UIColor.white
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
        switch self._type {
        case .shareCode:
            if let curVC = BaseViewController.getCurrentViewController() {
                curVC.openPromotionActiveQR()
            }
        case .usingCode:
            if let curVC = BaseViewController.getCurrentViewController() {
                curVC.openPromotionActiveUsingCode(code: (sender as! UIButton).accessibilityIdentifier!)
            }
        case .normal:
            if let url = (sender as! UIButton).accessibilityIdentifier {
//                UIApplication.shared.openURL(URL(string: url)!)
                CommonProcess.openWeb(link: url)
            }
        case .openWeb:
            if let url = (sender as! UIButton).accessibilityIdentifier {
//                UIApplication.shared.openURL(URL(string: url)!)
                CommonProcess.openWeb(link: url)
            }
        case .openWebUsingCode:
            if let curVC = BaseViewController.getCurrentViewController() {
                curVC.openPromotionActiveUsingCode(code: (sender as! UIButton).accessibilityIdentifier!)
            }
        default:
            break
        }
        
    }
    
    internal func actionBtn2Tapped(_ sender: AnyObject) {
        if let url = (sender as! UIButton).accessibilityIdentifier {
//            UIApplication.shared.openURL(URL(string: url)!)
            CommonProcess.openWeb(link: url)
        }
    }
}

/**
 * Type of bottom message cell enum
 */
public enum BottomMsgCellTypeEnum : Int {
    case shareCode          // Share refer code
    case normal             // Normal               // NEWS_NORMAL = 1
    case usingCode          // Using refer code     // NEWS_INPUT_PROMOTION = 2
    case openWeb            // Click go to web      // NEWS_OPEN_WEB = 3
    case openWebUsingCode   // Click go to web      // NEWS_INPUT_PROMOTION_AND_WEB = 4
    case type_num           // Number of items
}
