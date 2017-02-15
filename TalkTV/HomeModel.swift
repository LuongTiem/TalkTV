//
//  PageHomeModel.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/13/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit
import SwiftyJSON


class HomeModel {
    
    
    var landingTabIndex : Int?
    var backendId : Int?
    var title: String?
    var browseTab =  [BrowseTab]()
    
    init() {
        
    }
    
    init(from json : JSON) {
        self.parse(from: json)
    }
    
    func parse(from json: JSON) {
        
        if let landingTabIndex : Int = json["landingTabIndex"].int {
            self.landingTabIndex = landingTabIndex
        }
        
        if let title : String = json["title"].string {
            self.title = title
        }
        
        if let backendId : Int = json["backendId"].int {
            self.backendId = backendId
        }
        
        if let browseTabs : Array = json["browseTab"].array {
            for item in browseTabs {
                let cast = BrowseTab(from: item)
                self.browseTab.append(cast)
            }
            
        }
    }
    
    
}


class BrowseTab {
    
    
    var listUrl : String?
    var title : String?
    
    init() {
        
    }
    
    init(from json : JSON) {
        self.parse(from: json)
    }
    
    
    func parse(from json: JSON) {
        
        if let listUrl : String = json["listUrl"].string {
            self.listUrl = listUrl
        }
        
        if let title : String = json["title"].string {
            self.title = title
        }
        
    }
}
