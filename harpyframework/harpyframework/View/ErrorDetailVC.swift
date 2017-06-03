//
//  ErrorDetailVC.swift
//  harpyframework
//
//  Created by SPJ on 6/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ErrorDetailVC: ChildViewController {
    /** Result text view */
    private var _resultTextView: UITextView         = UITextView()

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationBar(title: "Error detail")
        var offset: CGFloat = 0.0
        // Result
        _resultTextView.frame = CGRect(x: GlobalConst.MARGIN,
                                       y: offset,
                                       width: GlobalConst.SCREEN_WIDTH - 2 * GlobalConst.MARGIN,
                                       height: GlobalConst.SCREEN_HEIGHT)
        CommonProcess.setBorder(view: _resultTextView)
        _resultTextView.text = BaseModel.shared.getErrorDetail()
        self.view.addSubview(_resultTextView)
        offset += _resultTextView.frame.height
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
