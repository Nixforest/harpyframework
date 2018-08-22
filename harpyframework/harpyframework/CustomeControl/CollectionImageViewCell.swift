//
//  CollectionViewCell1.swift
//  TestCollectionView
//
//  Created by HungHa on 10/13/16.
//  Copyright © 2016 HungHa. All rights reserved.
//

import UIKit
public protocol CollectionImageDelegte{
    func deleteImage(cell:CollectionImageViewCell)
}
public class CollectionImageViewCell: UICollectionViewCell {
    @IBOutlet weak public var imageView: UIImageView!

    @IBOutlet weak public var btnDelete: UIButton!
    @IBAction func deleteImage(_ sender: Any) {
        delegate?.deleteImage(cell: self)
    }
    public var delegate: CollectionImageDelegte?
    /*override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.translatesAutoresizingMaskIntoConstraints = true
        //imageView1.frame  = CGRect(x: 0,  y: 0,  width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
    }*/

}
