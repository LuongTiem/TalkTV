//
//  LiveModel.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import Foundation
import SwiftyJSON

class LiveModel {
    
    
    
}






class Image {
    
    var imageUrl : String?
    var imageType :Int?
    
    init() {
        
    }
    
    init(from json : JSON) {
        self.parse(from: json)
    }
    
    
    func parse(from json: JSON) {
        
        if let imageUrl : String = json["imageUrl"].string {
            self.imageUrl = imageUrl
        }
        
        if let imageType : Int = json["imageType"].int {
            self.imageType = imageType
        }
        
    }
}


class Share {
    
    var thumbnail : String?
    var link :String?
    var description : String?
    var title : String?
    
    init() {
        
    }
    
    init(from json : JSON) {
        self.parse(from: json)
    }
    
    
    func parse(from json: JSON) {
        
        if let thumbnail : String = json["thumbnail"].string {
            self.thumbnail = thumbnail
        }
        
        
        if let link : String = json["link"].string {
            self.link = link
        }
        
        
        if let description : String = json["description"].string {
            self.description = description
        }
        
        
        if let title : String = json["title"].string {
            self.title = title
        }
        
        
    }
}
