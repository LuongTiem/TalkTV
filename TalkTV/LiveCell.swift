//
//  LiveCell.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit
import Kingfisher

class LiveCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var avatarSmall: UIImageView!
    @IBOutlet weak var btnViews: UIButton!
    @IBOutlet weak var btnLive: UIButton!
    @IBOutlet weak var imageViews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        super.contentView.updateConstraintsIfNeeded()
        avatarSmall.layer.cornerRadius = avatarSmall.frame.width/2
        avatarSmall.layer.masksToBounds = true
    }
    
    var liveModel: SongModel? {
        didSet {
            
            if let titles = liveModel?.title {
                title.text = titles
            }
            
            if let subTitles = liveModel?.subtitle {
                subTitle.text = subTitles
            }
            
            if let views = liveModel?.currentViewers {
                btnViews.setTitle(views, for: .normal)
            }
            
            if let lives = liveModel?.live {
                btnLive.setTitle(lives, for: .normal)
            }
            
            if let imagesCell = liveModel?.image[1].imageUrl {
                guard let imgURL = URL(string: imagesCell) else { return  }
                imageViews.kf.setImage(with: imgURL, placeholder: UIImage(named: "homepage_refresh_tv"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            }
            
            if let imagesAvatar = liveModel?.image[0].imageUrl{
                guard let imgURL = URL(string: imagesAvatar) else { return  }
                avatarSmall.kf.setImage(with: imgURL, placeholder: UIImage(named: "homepage_refresh_tv"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            }
            
        }
    }

}
