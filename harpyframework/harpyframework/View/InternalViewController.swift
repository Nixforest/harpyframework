//
//  InternalViewController.swift
//  harpyframework
//
//  Created by SPJ on 1/24/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

class InternalViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    /** Table view */
    @IBOutlet weak var _tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar(title: "Debug values", isNotifyEnable: false, isHiddenBackBtn: false, isEnabledMenuBtn: false)
        
        // Config view
        _tblView.translatesAutoresizingMaskIntoConstraints = true
        _tblView.backgroundColor = GlobalConst.BACKGROUND_COLOR_GRAY
        _tblView.frame = CGRect(x: 0, y: 0,
                                width: GlobalConst.SCREEN_WIDTH,
                                height: GlobalConst.SCREEN_HEIGHT)
    }

    override func didReceiveMemoryWarning() {
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        ConfigurationTableViewCell.PARENT_WIDTH = GlobalConst.SCREEN_WIDTH
        let cell = tableView.dequeueReusableCell(withIdentifier: DomainConst.CONFIGURATION_TABLE_VIEW_CELL,
                                                 for: indexPath) as! ConfigurationTableViewCell
        switch indexPath.row {
        case 0:
            var str = BaseModel.shared.getTransactionData().name
            if !str.isEmpty {
                let index = str.index(str.startIndex, offsetBy: 8)
                str = str.substring(to: index)
            }
            
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Reset transaction key",
                         value: str, isHideRightImg: true)
            break
        case 1:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Test loading view",
                         value: DomainConst.BLANK, isHideRightImg: true)
            break
        case 2:
            var str = BaseModel.shared.getUserToken()
            if !str.isEmpty {
                let index = str.index(str.startIndex, offsetBy: 8)
                str = str.substring(to: index)
            }
            
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "User token",
                         value: str, isHideRightImg: true)
            break
        case 3:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Color", switchValue: BaseModel.shared.getDebugColor(),
                         action: #selector(updateDebugColorMode(_:)), target: self)
        case 4:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Show toast message", switchValue: BaseModel.shared.getDebugToast(),
                         action: #selector(updateDebugToastMode(_:)), target: self)
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            BaseModel.shared.setTransactionData(transaction: TransactionBean.init())
            break
        case 1:
            LoadingView.shared.showOverlay(view: self.view)
            break
        case 2:
            UIPasteboard.general.string = BaseModel.shared.getUserToken()
            self.showAlert(message: "Đã copy giá trị User token vào clipboard. Nhấn OK để tiếp tục.")
            break
        default:
            break
        }
        self._tblView.reloadData()
    }
    
    /**
     * Handle tap on cell.
     */
    public func updateDebugColorMode(_ sender: UISwitch) {
        BaseModel.shared.setDebugColor(isOn: sender.isOn)
    }
    
    /**
     * Handle tap on cell.
     */
    public func updateDebugToastMode(_ sender: UISwitch) {
        BaseModel.shared.setDebugToast(isOn: sender.isOn)
    }
}