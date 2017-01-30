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
        setupNavigationBar(title: DomainConst.CONTENT00128, isNotifyEnable: false, isHiddenBackBtn: false, isEnabledMenuBtn: false)
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DomainConst.CONFIGURATION_TABLE_VIEW_CELL,
                                                 for: indexPath) as! ConfigurationTableViewCell
        switch indexPath.row {
        case 0:
            cell.setData(leftImg: DomainConst.INFORMATION_IMG_NAME,
                         name: DomainConst.CONTENT00139,
                         value: DomainConst.VERSION_CODE)
            
        case 1:
            cell.setData(leftImg: DomainConst.TRAINING_MODE_IMG_NAME,
                         name: DomainConst.CONTENT00138,
                         switchValue: BaseModel.shared.checkTrainningMode(),
                         action: #selector(updateTrainingMode(_:)),
                         target: self)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
}
