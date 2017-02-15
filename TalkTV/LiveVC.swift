//
//  LiveVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class LiveVC: BaseTabHomeVC {
    lazy var liveVM : HomeVM = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          collectionView.register(UINib(nibName: "LiveCell", bundle: nil), forCellWithReuseIdentifier: "LiveCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
extension LiveVC {
    
    override func loadData() {
        baseVM  = self.liveVM
        liveVM.requestData { 
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCell", for: indexPath) as! LiveCell
            cell.liveModel = liveVM.datas[indexPath.row]
        return cell
        
    }
    
   
}
