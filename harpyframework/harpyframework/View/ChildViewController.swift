//
//  ChildViewController.swift
//  harpyframework
//
//  Created by SPJ on 3/8/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ChildViewController: BaseViewController {
    /**
     * View did load
     */
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let slideMenuController = BaseViewController.getRootController() {
            slideMenuController.removeLeftGestures()
        }
    }
    
    /**
     * Did receive memory warning
     */
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * Create navigation bar
     * - parameter title: Title of view controller
     */
    public func createNavigationBar(title: String) {
        // Set title
        setNavigationBarTitle(title: title)
        setupNavigationBarChildItems()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
