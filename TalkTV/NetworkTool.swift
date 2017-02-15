//
//  BaseService.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/11/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class NetworkTool {

    class func request(url : String , mothed : Alamofire.HTTPMethod, params: [String: Any]?,
                 success : @escaping (_ data: JSON?, _ msg : String?) -> (),
                 fail: @escaping (_ msg : String?) -> ()) {
        
        
        Alamofire.request(url, method: mothed, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let result) :
                let json = JSON(result)
                if json != nil {
                    success(json, nil)
                }else{
                    let msg = "Error"
                    fail(msg)
                }
                
            case .failure:
                break
            
            }
            
        }
 
        
    }
    
    
}
