//
//  ChildExtViewController.swift
//  harpyframework
//
//  Created by SPJ on 8/31/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ChildExtViewController: ChildViewController {

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
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        }
    }
    
    /**
     * Build items on navigation bar for children view
     */
    public override func setupNavigationBarChildItems() {
        // Create back button
        let back = ImageManager.getImage(named: DomainConst.BACK_IMG_NAME)
        let tintedBack = back?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        let btnBack = UIButton()
        btnBack.setImage(tintedBack, for: UIControlState())
        btnBack.tintColor = UIColor.white
        btnBack.frame = CGRect(x: 0, y: 0,
                               width: GlobalConst.MENU_BUTTON_W,
                               height: GlobalConst.MENU_BUTTON_W)
        btnBack.setTitle(DomainConst.BLANK, for: UIControlState())
        btnBack.addTarget(self, action: #selector(backButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        // iOS 10 support
        if #available(iOS 10, *) {
            btnBack.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
            btnBack.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        } else if #available(iOS 9, *) {
            btnBack.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
            btnBack.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        } else if #available(iOS 8, *) {
        } else {
        }
        
        let backNavBar = UIBarButtonItem()
        backNavBar.customView = btnBack
        backNavBar.isEnabled = true
        self.navigationItem.setLeftBarButton(backNavBar, animated: false)
        
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
//        self.navigationItem.setRightBarButton(notifyNavBar, animated: true)
    }
}
