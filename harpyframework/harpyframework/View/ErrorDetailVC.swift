//
//  ErrorDetailVC.swift
//  harpyframework
//
//  Created by SPJ on 6/3/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class ErrorDetailVC: ChildViewController {
    private var _scrollView:        UIScrollView        = UIScrollView()
    /** Result text view */
    private var _resultTextView:    UITextView          = UITextView()
    /** Content */
    public static var content:      String              = BaseModel.shared.getErrorDetail()

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationBar(title: "Error detail")
        var offset: CGFloat = 0.0
        _scrollView.frame = CGRect(x: 0.0,
                                   y: getTopHeight(),
                                   width: GlobalConst.SCREEN_WIDTH,
                                   height: GlobalConst.SCREEN_HEIGHT - getTopHeight())
        // Result
        _resultTextView.frame = CGRect(x: 0.0,
                                       y: 0.0,
                                       width: GlobalConst.SCREEN_WIDTH * 5,
                                       height: GlobalConst.SCREEN_HEIGHT * 5)
        CommonProcess.setBorder(view: _scrollView)
        //_resultTextView.text = BaseModel.shared.getErrorDetail()
        _resultTextView.text = ErrorDetailVC.content
        _scrollView.addSubview(_resultTextView)
        _scrollView.contentSize = CGSize(width: GlobalConst.SCREEN_WIDTH * 5, height: GlobalConst.SCREEN_HEIGHT * 5)
        self.view.addSubview(_scrollView)
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
    
    public static func setContent(text: String) {
        ErrorDetailVC.content = text
    }
}
