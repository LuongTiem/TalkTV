//
//  SongCell.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class SongCell: UICollectionViewCell {

    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var avatarSmall: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var btncurrentViews: UIButton!
    @IBOutlet weak var btnRoomID: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnIsLive: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        super.contentView.updateConstraintsIfNeeded()
        avatarSmall.layer.cornerRadius = avatarSmall.frame.width/2
        avatarSmall.layer.masksToBounds = true
    }
    
    var songModel : SongModel? {
        
        didSet{
            
            if let bgImage = songModel?.image[1].imageUrl{
                guard let imgURL = URL(string: bgImage) else { return  }
                imageViews.kf.setImage(with: imgURL, placeholder: UIImage(named: "homepage_refresh_tv"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            }
            
            if let bgImage = songModel?.image[0].imageUrl{
                guard let imgURL = URL(string: bgImage) else { return  }
                avatarSmall.kf.setImage(with: imgURL, placeholder: UIImage(named: "homepage_refresh_tv"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            }
            
            if let lbTitle = songModel?.title {
                title.text = lbTitle
            }
            
            if let views = songModel?.currentViewers {
                btncurrentViews.setTitle(views, for: .normal)
            }
            
            if let live = songModel?.live{
                btnIsLive.setTitle(live, for: .normal)
            }
            
            if let roomID = songModel?.roomId {
                btnRoomID.setTitle(String(roomID), for: .normal)
            }
            
         
            
        }
    }
    
    
}

extension SongCell {
    
    func handleShare(){
        print("Share")
    }
}
