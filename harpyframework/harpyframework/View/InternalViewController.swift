//
//  InternalViewController.swift
//  harpyframework
//
//  Created by SPJ on 1/24/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

//++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
//class InternalViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, HSBColorPickerDelegate {
class InternalViewController: ChildViewController, UITableViewDelegate, UITableViewDataSource, HSBColorPickerDelegate {
//-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
    /** Table view */
    @IBOutlet weak var _tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //++ BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
        //setupNavigationBar(title: "Debug values", isNotifyEnable: false, isHiddenBackBtn: false, isEnabledMenuBtn: false)
        createNavigationBar(title: "Debug values")
        //-- BUG0048-SPJ (NguyenPT 20170309) Create slide menu view controller
        
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
        return 21
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
        case 5:
            cell.setData(leftImg: DomainConst.TRAINING_MODE_IMG_NAME,
                         name: DomainConst.CONTENT00138,
                         switchValue: BaseModel.shared.checkTrainningMode(),
                         action: #selector(updateTrainingMode(_:)),
                         target: self)
        case 6:
            cell.setData(leftImg: DomainConst.TRAINING_MODE_IMG_NAME,
                         name: "Training mode color",
                         value: "00000", isHideRightImg: true)
            cell.setValueColor(color: GlobalConst.TRAINING_COLOR)
        case 7:
            cell.setData(leftImg: DomainConst.TRAINING_MODE_IMG_NAME,
                         name: "Map default zoom value",
                         value: String.init(describing: BaseModel.shared.getZoomValue()), isHideRightImg: true)
            break
        case 8:
            cell.setData(leftImg: DomainConst.TRAINING_MODE_IMG_NAME,
                         name: BaseModel.shared.getAppName(),
                         switchValue: BaseModel.shared.getDebugGasServiceFlag(),
                         action: #selector(updateGasServiceFlag(_:)),
                         target: self)
        case 9:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Show number picker", switchValue: BaseModel.shared.getDebugShowNumPickerFlag(),
                         action: #selector(updateDebugShowNumPickerFlag(_:)), target: self)
        case 10:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Show top icon", switchValue: BaseModel.shared.getDebugShowTopIconFlag(),
                         action: #selector(updateDebugShowTopIconFlag(_:)), target: self)
        case 11:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Base API Tester",
                         value: DomainConst.BLANK, isHideRightImg: false)
        case 12:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "G06: API Tester",
                         value: DomainConst.BLANK, isHideRightImg: false)
        case 13:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Use [materials_name_short]", switchValue: BaseModel.shared.getDebugUseMaterialNameShort(),
                         action: #selector(updateDebugUseMaterialNameShort(_:)), target: self)
        case 14:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "G05: API Tester",
                         value: DomainConst.BLANK, isHideRightImg: false)
        case 15:
            var str = BaseModel.shared.getDeviceToken()
            if !str.isEmpty {
                let index = str.index(str.startIndex, offsetBy: 8)
                str = str.substring(to: index)
            }
            
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "APNS Device token",
                         value: str, isHideRightImg: true)
            break
        case 16:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Get call history",
                         value: DomainConst.BLANK, isHideRightImg: false)
        case 17:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Error detail",
                         value: DomainConst.BLANK, isHideRightImg: false)
        case 18:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Log detail",
                         value: DomainConst.BLANK, isHideRightImg: false)
        case 19:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Create app log",
                         value: DomainConst.BLANK, isHideRightImg: true)
        case 20:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: "Scan code",
                         value: DomainConst.BLANK, isHideRightImg: true)
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
        case 6:
            let colorPicker = HSBColorPicker(frame: CGRect(x: 0,
                                                           y: getTopHeight(),
                                                           width: GlobalConst.SCREEN_WIDTH,
                                                           height: GlobalConst.SCREEN_HEIGHT - getTopHeight()))
            colorPicker.delegate = self
            self.view.addSubview(colorPicker)
            break
        case 7:
            inputZoomValueAlert()
            break
        case 11:
            self.pushToView(name: DomainConst.BASE_API_TEST_VIEW_CTRL)
            break
        case 12:
            if BaseModel.shared.getDebugGasServiceFlag() {
                self.pushToView(name: DomainConst.G06_API_TEST_VIEW_CTRL)
            }
            break
        case 14:
            if BaseModel.shared.getDebugGasServiceFlag() {
                self.pushToView(name: DomainConst.G05_API_TEST_VIEW_CTRL)
            }
            break
        case 16:
            handleGetCallHistory()
            break
        case 17:
            handleShowErrorDetailVC()
            break
        case 18:
            handleShowLogDetailVC()
            break
        case 19:
            handleCreateAppLog()
            break
        case 20:
            handleScanCode()
            break
        default:
            break
        }
        self._tblView.reloadData()
    }
    
    /**
     * Handle tap on cell.
     */
    public func updateDebugShowTopIconFlag(_ sender: UISwitch) {
        BaseModel.shared.setDebugShowTopIconFlag(isOn: sender.isOn)
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
    
    /**
     * Handle tap on cell.
     */
    public func updateGasServiceFlag(_ sender: UISwitch) {
        BaseModel.shared.setDebugGasServiceFlag(isOn: sender.isOn)
        _tblView.reloadData()
    }
    
    /**
     * Handle tap on cell.
     */
    public func updateTrainingMode(_ sender: UISwitch) {
        if sender.isOn {
            BaseModel.shared.setTrainningMode(true)
        } else {
            BaseModel.shared.setTrainningMode(false)
        }
    }
    
    /**
     * Handle tap on cell.
     */
    public func updateDebugShowNumPickerFlag(_ sender: UISwitch) {
        BaseModel.shared.setDebugShowNumPickerFlag(isOn: sender.isOn)
    }
    
    /**
     * Handle tap on cell.
     */
    public func updateDebugUseMaterialNameShort(_ sender: UISwitch) {
        BaseModel.shared.setDebugUseMaterialNameShort(isOn: sender.isOn)
    }
    
    internal func HSBColorColorPickerTouched(sender: HSBColorPicker, color: UIColor, point: CGPoint, state: UIGestureRecognizerState) {
        GlobalConst.TRAINING_COLOR = color
        sender.removeFromSuperview()
        _tblView.reloadData()
        // Handle display color when training mode is on
//        if BaseModel.shared.checkTrainningMode() {
//            GlobalConst.BUTTON_COLOR_RED = GlobalConst.TRAINING_COLOR
//        } else {    // Training mode off
//            GlobalConst.BUTTON_COLOR_RED = GlobalConst.MAIN_COLOR
//        }
    }
    
    private func inputZoomValueAlert() {
        var tbxValue: UITextField?
        
        // Create alert
        let alert = UIAlertController(title: "Input zoom value",
                                      message: DomainConst.BLANK,
                                      preferredStyle: .alert)
        // Add textfield
        alert.addTextField(configurationHandler: { textField -> Void in
            tbxValue = textField
            tbxValue?.placeholder = "Zoom value"
            tbxValue?.clearButtonMode = .whileEditing
            tbxValue?.returnKeyType = .done
            tbxValue?.keyboardType = .numberPad
        })
        // Add cancel action
        let cancel = UIAlertAction(title: DomainConst.CONTENT00202, style: .cancel, handler: nil)
        
        // Add ok action
        let ok = UIAlertAction(title: DomainConst.CONTENT00008, style: .default) { action -> Void in
            if let n = NumberFormatter().number(from: (tbxValue?.text)!) {
                BaseModel.shared.setDebugZoom(value: CGFloat(n))
                self._tblView.reloadData()
            } else {
                self.showAlert(message: "Re-input", okTitle: DomainConst.CONTENT00251,
                               okHandler: {_ in
                                self.inputZoomValueAlert()
                },
                               cancelHandler: {_ in
                                
                })
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    private func handleGetCallHistory() {
//        var msg = DomainConst.BLANK
//        var fileManager: FileManager = FileManager.default
//        var dirNum = fileManager.enumerator(atPath: "/private/")
//        var nextItem = dirNum?.nextObject()
//        while (nextItem != nil) {
//            msg += nextItem as! String
//            nextItem = dirNum?.nextObject()
//        }
//        self.showAlert(message: msg)
    }
    
    /**
     * Handle show error detail View controller
     */
    private func handleShowErrorDetailVC() {
        self.pushToView(name: ErrorDetailVC.theClassName)
    }
    
    /**
     * Handle show error detail View controller
     */
    private func handleShowLogDetailVC() {
        ErrorDetailVC.content = Logger.shared.read()
        self.pushToView(name: ErrorDetailVC.theClassName)
    }
    
    /**
     * Handle create app log
     */
    private func handleCreateAppLog() {
        let msg = "This is a test content for support/appLog request. Please ignore this message."
        CreateErrorLogRequest.request(action: #selector(self.finishRequestCreateErrLog(_:)), view: self, msg: msg)
    }
    internal func finishRequestCreateErrLog(_ notification: Notification) {
        let data = (notification.object as! String)
        let model = BaseRespModel(jsonString: data)
        showAlert(message: model.message)
    }
    
    /**
     * Handle show error detail View controller
     */
    private func handleScanCode() {
        let frameworkBundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        let scan = ScanCodeVC(nibName: ScanCodeVC.theClassName, bundle: frameworkBundle)
        self.navigationController?.pushViewController(scan, animated: true)
    }
}
