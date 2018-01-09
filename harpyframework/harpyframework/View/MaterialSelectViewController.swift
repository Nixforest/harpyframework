//
//  MaterialSelectViewController.swift
//  harpyframework
//
//  Created by SPJ on 1/22/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

//++ BUG0048-SPJ (NguyenPT 20170313) Create slide menu view controller
//open class MaterialSelectViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
open class MaterialSelectViewController: ChildExtViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,
    UISearchBarDelegate {
//-- BUG0048-SPJ (NguyenPT 20170313) Create slide menu view controller
    // MARK: Properties
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Change type of data
    //private static var _data: [MaterialBean]    = [MaterialBean]()
    private static var _data: [OrderDetailBean]    = [OrderDetailBean]()
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Change type of data
    // MARK: Properties
    /** Icon image view */
//    private var _iconImg: UIImageView           = UIImageView()
    /** Collection view */
    private var _cltMaterial: UICollectionView! = nil
    //++ BUG0054-SPJ (NguyenPT 20170417) Add new function G07 - Add search bar
    /** Search bar */
    private var _searchBar:         UISearchBar         = UISearchBar()
    /** Flag begin search */
    private var _beginSearch:       Bool                = false
    /** Original data */
    private static var _originData: [OrderDetailBean]   = [OrderDetailBean]()
    /** Flag search active */
    private var _searchActive:      Bool                = false
    /** Current select */
    private static var _selected:   OrderDetailBean     = OrderDetailBean.init()
    //-- BUG0054-SPJ (NguyenPT 20170417) Add new function G07 - Add search bar
    
    /** Type of material */
    public static var _type:        String              = DomainConst.BLANK
    
    // MARK: Methods
    /**
     * Set data for controller
     * - parameter data: List MaterialBean
     */
    public static func setMaterialData(data: [MaterialBean]) {
        //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Change type of data
        //MaterialSelectViewController._data = data
        MaterialSelectViewController._data.removeAll()
        for item in data {
            MaterialSelectViewController._data.append(OrderDetailBean(data: item))
        }
        MaterialSelectViewController._originData = _data
        //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Change type of data
    }
    
    //++ BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Change type of data
    /**
     * Set data for controller
     * - parameter orderDetails: List OrderDetailBean
     */
    public static func setMaterialData(orderDetails: [OrderDetailBean]) {
        MaterialSelectViewController._data = orderDetails
        MaterialSelectViewController._originData = orderDetails
    }
    //-- BUG0054-SPJ (NguyenPT 20170411) Add new function G07 - Change type of data
    
    /**
     * Get material object from index
     * - parameter index: Index of object
     * - returns: MaterialBean
     */
//    public func getData(index: Int) -> MaterialBean {
    public func getData(index: Int) -> OrderDetailBean {
        return MaterialSelectViewController._data[index]
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Get height of status bar + navigation bar
        let height = self.getTopHeight()
//        let width = GlobalConst.LOGIN_LOGO_W / 3
        //++ BUG0054-SPJ (NguyenPT 20170417) Add new function G07 - Add search bar
        var offset: CGFloat = height
        _searchBar.delegate = self
        _searchBar.frame = CGRect(x: 0, y: offset,
                                  width: GlobalConst.SCREEN_WIDTH,
                                  height: GlobalConst.SEARCH_BOX_HEIGHT)
        _searchBar.placeholder = DomainConst.CONTENT00287
        _searchBar.layer.shadowColor = UIColor.black.cgColor
        _searchBar.layer.shadowOpacity = 0.5
        _searchBar.layer.masksToBounds = false
        _searchBar.showsCancelButton = true
        _searchBar.showsBookmarkButton = false
        _searchBar.searchBarStyle = .default
        self.view.addSubview(_searchBar)
        offset += _searchBar.frame.height
        //-- BUG0054-SPJ (NguyenPT 20170417) Add new function G07 - Add search bar
//        // Image logo
//        _iconImg.image = ImageManager.getImage(named: DomainConst.MATERIAL_SELECTION_IMG_NAME)
//        _iconImg.frame = CGRect(x: (GlobalConst.SCREEN_WIDTH - width) / 2,
//                                y: offset + GlobalConst.MARGIN,
//                                width: width,
//                                height: GlobalConst.LOGIN_LOGO_H / 3)
//        _iconImg.contentMode = .scaleAspectFit
//        self.view.addSubview(_iconImg)
//        offset += _iconImg.frame.height
        // Collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: GlobalConst.MATERIAL_SELECTION_WIDTH,
                                 height: GlobalConst.MATERIAL_SELECTION_HEIGHT)
        self._cltMaterial = UICollectionView(frame: CGRect(x: 0,
                                                           y: offset,
                                                           width: self.view.frame.width,
                                                           height: GlobalConst.SCREEN_HEIGHT - offset - GlobalConst.MARGIN), collectionViewLayout: layout)
        let frameworkBundle = Bundle(identifier: DomainConst.HARPY_FRAMEWORK_BUNDLE_NAME)
        self._cltMaterial.register(UINib(nibName: DomainConst.MATERIAL_SELECTION_VIEW_CELL, bundle: frameworkBundle), forCellWithReuseIdentifier: DomainConst.MATERIAL_SELECTION_VIEW_CELL)
        self._cltMaterial.dataSource            = self
        self._cltMaterial.delegate              = self
        self._cltMaterial.alwaysBounceVertical  = true
        self._cltMaterial.bounces               = true
        if let layout = self._cltMaterial.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        self._cltMaterial.backgroundColor = UIColor.white
        self._cltMaterial.contentSize = CGSize(
            width: self.view.frame.width,
            height: GlobalConst.SCREEN_HEIGHT - offset - GlobalConst.MARGIN)
        self.view.addSubview(self._cltMaterial)
    }
    
    /**
     * Update layout of view with a bottom height value
     * - parameter bottomHeight: Height of bottom part
     * - returns: Value maxY of Material collection
     */
    public func updateLayout(bottomHeight: CGFloat) -> CGFloat {
        self._cltMaterial.frame = CGRect(
            x: 0, y: self._searchBar.frame.maxY,
            width: self.view.frame.width,
            height: GlobalConst.SCREEN_HEIGHT - _searchBar.frame.maxY - bottomHeight)
        self._cltMaterial.contentSize = CGSize(
            width: self.view.frame.width,
            height: GlobalConst.SCREEN_HEIGHT - _searchBar.frame.maxY - bottomHeight)
        return self._cltMaterial.frame.maxY
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
    
    /**
     * Tells the delegate that the item at the specified index path was selected.
     */
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        MaterialSelectViewController._selected = OrderDetailBean(data: self.getData(index: indexPath.row))
        MaterialSelectViewController._selected = self.getData(index: indexPath.row)
        //++ BUG0151-SPJ (NguyenPT 20170819) Handle favourite when select material
        FavouriteDataModel.shared.increaseMaterialGas(id: MaterialSelectViewController._selected.material_id,
                                                      key: MaterialSelectViewController._type)
        
        //-- BUG0151-SPJ (NguyenPT 20170819) Handle favourite when select material
        self.backButtonTapped(self)
    }
    
    //++ BUG0054-SPJ (NguyenPT 20170417) Add new function G07 - Add search bar
    // MARK: - SearchbarDelegate
    /**
     * Handle begin search
     */
    func beginSearching()  {
        if _beginSearch == false {
            _beginSearch = true
        }
        //LoadingView.shared.showOverlay()
        LoadingView.shared.showOverlay(view: self.view, className: self.theClassName)
        MaterialSelectViewController._data.removeAll()
        if _searchBar.text != nil {
            // Get keyword
            let keyword = _searchBar.text!.removeSign().lowercased()
            // Loop for all original dat
            for item in MaterialSelectViewController._originData {
                // Get name of material and make it lower case + remove sign
                var name = BaseModel.shared.getDebugUseMaterialNameShort()
                    ? item.materials_name_short : item.material_name
                //++ BUG0076-SPJ (NguyenPT 20170506) Name of cylinder not show when open add cylinder OrderFamily
                if name.isEmpty {
                    name = item.material_name
                }
                //-- BUG0076-SPJ (NguyenPT 20170506) Name of cylinder not show when open add cylinder OrderFamily
                // Check if name contain keyword
                if (name.removeSign().lowercased().range(of: keyword) != nil) {
                    // Add to result list
                    MaterialSelectViewController._data.append(item)
                }
            }
        }
        _cltMaterial.reloadData()
        LoadingView.shared.hideOverlayView(className: self.theClassName)
    }
    
    /**
     * Tells the delegate that the user changed the search text.
     */
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filteredStr = searchText
        if filteredStr.characters.count > (DomainConst.SEARCH_MATERIAL_MIN_LENGTH - 1) {
            _beginSearch = false
            _searchActive = true
            // Start count
            /** Timer for search auto complete */
            var timer = Timer()
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(beginSearching), userInfo: nil, repeats: false)
            
        } else {
            _beginSearch = false
            _searchActive = false
            // Check if need reload data
            if MaterialSelectViewController._data.count != MaterialSelectViewController._originData.count {
                MaterialSelectViewController._data = MaterialSelectViewController._originData
                _cltMaterial.reloadData()
            }
        }
    }
    
    /**
     * Tells the delegate that the cancel button was tapped.
     */
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Clear textbox
        if _searchBar.text != nil {
            _searchBar.text = DomainConst.BLANK
        }
        // Check if need reload data
        if MaterialSelectViewController._data.count != MaterialSelectViewController._originData.count {
            MaterialSelectViewController._data = MaterialSelectViewController._originData
            _cltMaterial.reloadData()
        }
        // Hide keyboard
        self.view.endEditing(true)
    }
    
    /**
     * Get current selected item
     * - returns: Selected item
     */
    public static func getSelectedItem() -> OrderDetailBean {
        return MaterialSelectViewController._selected
    }
    
    /**
     * Set current selected item
     * - parameter item: Selected item
     */
    public static func setSelectedItem(item: OrderDetailBean) {
        MaterialSelectViewController._selected = item
    }
    //-- BUG0054-SPJ (NguyenPT 20170417) Add new function G07 - Add search bar
    
    public static func setMaterialDataFromFavourite(key: String) {
        MaterialSelectViewController._type = key
        MaterialSelectViewController.setMaterialData(
            orderDetails: FavouriteDataModel.shared.getListGas(key: key))
        
    }
    
    open override func clearData() {
        MaterialSelectViewController._type = DomainConst.BLANK
        MaterialSelectViewController._data.removeAll()
        MaterialSelectViewController._originData.removeAll()
//        MaterialSelectViewController._selected = OrderDetailBean.init()
    }
}
