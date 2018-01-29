//
//  WebService.swift
//  AlamofireSingletonDemo
//
//  Created by Abhi's Mac on 29/01/18.
//  Copyright © 2018 Abhi's Mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WebService {

    static let sharedInstance = WebService()

    //This function return response as JSON (Using SwiftyJSON)
    func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    //This function return response as [String:Any]
    func requestGETURL2(_ strURL: String, success:@escaping ([String:Any]) -> Void, failure:@escaping (Error) -> Void)
    {
        Alamofire.request(strURL).responseJSON { (response) in
            if let test = response.result.value as? [String:Any]{
                success(test)
        }
        }
    }
    
    func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            //print(responseObject)
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}
