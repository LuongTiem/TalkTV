//
//  SongVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/9/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class SongVC: BaseTabHomeVC {
    fileprivate lazy var songVM : SongVM = SongVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension SongVC {
    
    override func loadData() {
        baseVM = self.songVM
        songVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
        
    }
    
    
}
