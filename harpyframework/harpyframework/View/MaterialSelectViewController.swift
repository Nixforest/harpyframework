//
//  MaterialSelectViewController.swift
//  harpyframework
//
//  Created by SPJ on 1/22/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

open class MaterialSelectViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: Properties
    private static var _data: [MaterialBean]    = [MaterialBean]()
    // MARK: Properties
    /** Icon image view */
    private var _iconImg: UIImageView           = UIImageView()
    /** Collection view */
    private var _cltMaterial: UICollectionView! = nil
    
    // MARK: Methods
    /**
     * Set data for controller
     * - parameter data: List MaterialBean
     */
    public static func setMaterialData(data: [MaterialBean]) {
        MaterialSelectViewController._data = data
    }
    
    public func getData(index: Int) -> MaterialBean {
        return MaterialSelectViewController._data[index]
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Get height of status bar + navigation bar
        let heigh = self.getTopHeight()
        let width = GlobalConst.LOGIN_LOGO_W / 3
        // Image logo
        _iconImg.image = ImageManager.getImage(named: DomainConst.MATERIAL_SELECTION_IMG_NAME)
        _iconImg.frame = CGRect(x: (GlobalConst.SCREEN_WIDTH - width) / 2,
                                y: heigh + GlobalConst.MARGIN,
                                width: width,
                                height: GlobalConst.LOGIN_LOGO_H / 3)
        _iconImg.contentMode = .scaleAspectFit
        self.view.addSubview(_iconImg)
        // Collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: GlobalConst.MATERIAL_SELECTION_WIDTH,
                                 height: GlobalConst.MATERIAL_SELECTION_HEIGHT)
        self._cltMaterial = UICollectionView(frame: CGRect(x: 0,
                                                           y: _iconImg.frame.maxY,
                                                           width: self.view.frame.width,
                                                           height: GlobalConst.SCREEN_HEIGHT - _iconImg.frame.maxY), collectionViewLayout: layout)
        let frameworkBundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        self._cltMaterial.register(UINib(nibName: DomainConst.MATERIAL_SELECTION_VIEW_CELL, bundle: frameworkBundle), forCellWithReuseIdentifier: DomainConst.MATERIAL_SELECTION_VIEW_CELL)
        self._cltMaterial.dataSource = self
        self._cltMaterial.delegate = self
        self._cltMaterial.alwaysBounceVertical = true
        self._cltMaterial.bounces = true
        if let layout = self._cltMaterial.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        self._cltMaterial.backgroundColor = UIColor.white
        self._cltMaterial.contentSize = CGSize(
            width: self.view.frame.width,
            height: GlobalConst.SCREEN_HEIGHT - _iconImg.frame.maxY)
        self.view.addSubview(self._cltMaterial)
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
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MaterialSelectViewController._data.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DomainConst.MATERIAL_SELECTION_VIEW_CELL, for: indexPath) as! MaterialSelectionCell
        cell.setData(data: MaterialSelectViewController._data[indexPath.row], width: GlobalConst.MATERIAL_SELECTION_WIDTH, height: GlobalConst.MATERIAL_SELECTION_HEIGHT)
        //cell.sel
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: GlobalConst.MATERIAL_SELECTION_WIDTH,
                      height: GlobalConst.MATERIAL_SELECTION_HEIGHT)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
