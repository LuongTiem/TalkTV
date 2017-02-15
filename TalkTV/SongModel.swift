//
//  SongModel.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import Foundation
import SwiftyJSON

class SongModel {
    
    var roomId: Int?
    var currentViewers: String?
    var title : String?
    var live : String?
    var image = [Image]()
    var share : Share?
    var subtitle: String?
    
    init() {
        
    }
    
    init(from json : JSON) {
        self.parse(from: json)
    }
    
    
    func parse(from json: JSON) {
        
        if let extra : Dictionary = json["extra"].dictionaryObject {
            let roomId = extra["roomId"] as! Int
            self.roomId = roomId
        }
        
        
        if let currentViewers : String = json["currentViewers"].string {
            self.currentViewers = currentViewers
        }
        
        
        if let title : String = json["title"].string {
            self.title = title
        }
        
        
        if let live : String = json["live"].string {
            self.live = live
        }
        
        
        if let images : Array = json["image"].array {
            
            for item in images {
                let cast = Image(from: item)
                self.image.append(cast)
            }
            
        }
        
        if let subtitle : String = json["subtitle"].string {
            self.subtitle = subtitle
        }
        
        if let share = json["share"].dictionaryObject {
//            let cast = Share(from: share)
        }
        
        
    }


    
    
}

