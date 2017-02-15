//
//  BaseVM.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/11/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseVM : NSObject {
    
    lazy var datas : [SongModel] = [SongModel]()
    func loadAnchorGroupData(url : String, params : [String: Any]?,
                             success : @escaping () -> ()) {
        
        NetworkTool.request(url: url, mothed: .get, params: params, success: { (json, msg) in
            let doc = (json?["doc"])! as JSON
            let child = doc["child"].array
            for item in child! {
                let cast = SongModel(from: item)
                self.datas.append(cast)
            }
            success()
        }) { (msg) in
            
        }
        
    }
    
    
    
}

