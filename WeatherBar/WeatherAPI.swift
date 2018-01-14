//
//  WeatherAPI.swift
//  WeatherBar
//
//  Created by zhuangqi on 2018/1/14.
//  Copyright © 2018年 zhuangqi. All rights reserved.
//

import Foundation
import Cocoa

class WeatherAPI {
    let API_KEY = "50f1a5d2d546f297286e8587cba16e4d"
//    let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
    let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(query: String) -> Void {
        let session = URLSession.shared
        
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL.init(string: "\(BASE_URL)?APPID=\(API_KEY)&units=imperical&q=\(escapedQuery!)")
        
        let request = NSMutableURLRequest.init(url: url as! URL)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: url as! URL, completionHandler: {(data, response, err) -> Void in
            
            if let httpResponse = response as? HTTPURLResponse {
                let dataString = NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
                NSLog("hahah %@", dataString)
            }
        })
        task.resume()
        
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err in
//            
//            if let error = err {
//                NSLog("weather api err\(error)")
//            }
//            
//            if let httpResponse = response as? HTTPURLResponse {
//                switch httpResponse.statusCode {
//                case 200:
//                    
//                    let dataString = NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
//                    NSLog(dataString)
//                case 401:
//                    NSLog("weather api returned an 'unauthorized' response. Did you set your API key?")
//                default:
//                    
//                    NSLog("weather api returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
//                }
//                
//            }
//            
//        })
//        task.resume()
        
        
    }
    
}
