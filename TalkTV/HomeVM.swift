//
//  HomeVM.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/14/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeVM : BaseVM {
//    lazy var pageHome: HomeModel = HomeModel()
    func requestData(success : @escaping () -> ()) {
        
        let url = "http://mapi.talktv.vn/toc/tab/category_200_default_tab2/0"
        let pagrams : [String : Any] = [ "t" : "1486621167.672044",
                                                     "version" : "3",
                                                     "platform" : "ios",
                                                     "build_version" : "3.1.5",
                                                     "uin" : "168580032",
                                                     "w": "\(UIScreen.main.bounds.width)",
                                                     "h": "\(UIScreen.main.bounds.height)",
                                                     "device" : "iPhone",
                                                     "sid" : "9b40f83a98e35ee2edc75739949afe201486575249"
                                                    ]
        
        
       loadAnchorGroupData(url: url, params: pagrams, success: success)
      
    }
    
    
//    func loadDataLive(success : @escaping () -> ()) {
//        
//        let url = "http://mapi.talktv.vn/toc/tab/category_200_default_tab2/0"
//        let pagrams : [String : Any] = [ "t" : "1486621167.672044",
//                                         "version" : "3",
//                                         "platform" : "ios",
//                                         "build_version" : "3.1.5",
//                                         "uin" : "168580032",
//                                         "sid" : "9b40f83a98e35ee2edc75739949afe201486575249"
//        ]
//        
//        loadAnchorGroupData(url: url, params: pagrams, success: success)
//        
//    }
//    
//    override func loadAnchorGroupData(url : String, params : [String: Any]?,
//                             success : @escaping () -> ()) {
//        
//        NetworkTool.request(url: url, mothed: .get, params: params, success: { (json, msg) in
//            let homePage = HomeModel(from: json!)
//            self.pageHome = homePage
//            success()
//        }) { (msg) in
//           
//        }
//
//    }
}
