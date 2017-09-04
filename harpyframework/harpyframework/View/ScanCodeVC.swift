//
//  ScanCodeVC.swift
//  harpyframework
//
//  Created by SPJ on 8/30/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class ScanCodeVC: ChildExtViewController {
    @IBOutlet weak var txtCodeValue: UITextField!
    @IBOutlet weak var imgQRCode: UIImageView!

    @IBAction func btnCameraTapped(_ sender: Any) {
        let frameworkBundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        let scan = ScannerVC(nibName: ScannerVC.theClassName, bundle: frameworkBundle)
        self.navigationController?.pushViewController(scan, animated: true)
    }
    @IBAction func btnAddTapped(_ sender: Any) {
        imgQRCode.image = {
            if var qrCode = QRCode(txtCodeValue.text!) {
            qrCode.size = imgQRCode.bounds.size
            qrCode.errorCorrection = .High;
            return qrCode.image
            } else {
                return UIImage()
            }
        }()
        view.endEditing(true)
    }
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationBar(title: "Thử nghiệm mã QR")
        self.view.makeComponentsColor()
    }

    override public func didReceiveMemoryWarning() {
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
