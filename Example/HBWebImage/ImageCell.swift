//
//  ImageCell.swift
//  HBWebImage
//
//  Created by 徐浩博 on 2021/11/25.
//

import UIKit

class ImageCell: UITableViewCell {
    
    static let identifier = "ImageCell"
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
