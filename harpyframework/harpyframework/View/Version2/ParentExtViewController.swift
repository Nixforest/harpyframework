//
//  ParentExtViewController.swift
//  harpyframework
//
//  Created by SPJ on 9/20/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ParentExtViewController: ParentViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    open override func setNavigationBarTitle(title: String) {
        self.navigationItem.title = title
        // Set color text
        if BaseModel.shared.isTrainningMode {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.TRAINING_COLOR]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: GlobalConst.BUTTON_COLOR_RED]
        }
    }
    
    /**
     * Build items on navigation bar for children view
     */
    public override func setupNavigationBarParentItems() {
        // Create menu button
        let menu                = ImageManager.getImage(named: DomainConst.MENU_IMG_NAME)
        let tintedImg           = menu?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let btnMenu = UIButton()
        btnMenu.setImage(tintedImg, for: UIControlState())
        btnMenu.tintColor    = GlobalConst.BUTTON_COLOR_RED
        btnMenu.frame        = CGRect(x: 0, y: 0,
                                      width: GlobalConst.MENU_BUTTON_W,
                                      height: GlobalConst.MENU_BUTTON_H)
        btnMenu.setTitle(DomainConst.BLANK, for: UIControlState())
        btnMenu.addTarget(self, action: #selector(btnMenuTapped(_:)), for: UIControlEvents.touchUpInside)
        let menuNavBar          = UIBarButtonItem()
        menuNavBar.customView   = btnMenu
        menuNavBar.isEnabled    = true
        self.navigationItem.setLeftBarButton(menuNavBar, animated: false)
        
        // Notify button
        let btnNotify = UIButton()
        btnNotify.frame = CGRect(x: 0, y: 0,
                                 width: GlobalConst.MENU_BUTTON_W,
                                 height: GlobalConst.NOTIFY_BUTTON_H)
        btnNotify.layer.cornerRadius = 0.5 * btnNotify.bounds.size.width
        btnNotify.setTitle("!", for: UIControlState())
        btnNotify.setTitleColor(UIColor.white, for: UIControlState())
        btnNotify.titleLabel?.font = UIFont.systemFont(ofSize: GlobalConst.NOTIFY_FONT_SIZE)
        btnNotify.addTarget(self, action: #selector(notificationButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        
        // Set status of notify button
        if BaseModel.shared.checkIsLogin() {
            btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_RED
        } else {
            btnNotify.backgroundColor = GlobalConst.BUTTON_COLOR_GRAY
        }
        let notifyNavBar = UIBarButtonItem()
        notifyNavBar.customView = btnNotify
        notifyNavBar.isEnabled = BaseModel.shared.checkIsLogin()
        self.navigationItem.setRightBarButton(notifyNavBar, animated: true)
    }
}
