//
//  ImageTableViewCell.swift
//  harpyframework
//
//  Created by SPJ on 12/25/16.
//  Copyright © 2016 SPJ. All rights reserved.
//

import Foundation
/**
 * Image table view cell delegate protocol
 */
public protocol ImageTableViewCellDelegate {
    func removeAtRow(row :Int)
}

public class ImageTableViewCell: UITableViewCell {
    /** Row index */
    public var indexRow = Int()
    /** Delegate */
    public var delegate :ImageTableViewCellDelegate?
    /** Image picker */
    @IBOutlet weak public var imgPicker: UIImageView!
    /** Delete button */
    @IBOutlet weak public var btnDelete: UIButton!
    
    /**
     * Handle when tap on delete button
     */
    @IBAction func btnDeleteTapped(_ sender: AnyObject) {
        delegate?.removeAtRow(row: indexRow)
    }
    
    /**
     * Awake from nib
     */
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    /**
     * Set selected
     */
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
