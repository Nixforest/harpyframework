//
//  ChildViewController.swift
//  harpyframework
//
//  Created by SPJ on 3/8/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ChildViewController: BaseViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let top = UIApplication.topViewController() {
            if top.theClassName == NSStringFromClass(BaseSlideMenuViewController.self) {
                (top as! BaseSlideMenuViewController).removeLeftGestures()
            }
        }
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
