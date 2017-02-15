//
//  GameVM.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import Foundation

class GameVM: BaseVM {
    
    func requestData(succes : @escaping () ->() ){
        let url = "http://mapi.talktv.vn/toc/tab/game_hot_tab/0"
        let pagrams : [String : Any ] = [ "t" : "1486621167982.364014",
                                          "version" : "0",
                                          "platform" : "ios",
                                          "build_version" : "3.1.5",
                                          "uin": "168580032",
                                          "sid" : "9b40f83a98e35ee2edc75739949afe201486575249"
            
        ]
        
        loadAnchorGroupData(url: url, params: pagrams, success: succes)
    }

}
