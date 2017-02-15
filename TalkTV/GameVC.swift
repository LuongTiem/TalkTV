//
//  GameVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/9/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class GameVC:  BaseTabHomeVC {
    lazy var gameVM: GameVM = GameVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension GameVC {
    
    override func loadData() {
        baseVM = self.gameVM
        gameVM.requestData {
            
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
}
