//
//  CategoryCell.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var currentViews: UIButton!
    @IBOutlet weak var imageViews: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    var categoryModel: SongModel?{
        
        didSet{
            if let lbTitle = categoryModel?.title {
                title.text = lbTitle
            }
            
            if let lbSubTitle = categoryModel?.subtitle {
                subTitle.text = lbSubTitle
            }
            
            if let views = categoryModel?.currentViewers {
                currentViews.setTitle(views, for: .normal)
            }
            
            
            if let imagesCell = categoryModel?.image[0].imageUrl {
                guard let imgURL = URL(string: imagesCell) else { return  }
                imageViews.kf.setImage(with: imgURL, placeholder: UIImage(named: "homepage_refresh_tv"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            }
            
        }
        
    }

}
