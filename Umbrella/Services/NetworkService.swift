//
//  NetworkService.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class NetworkService{
    typealias ZipCode = String
    static func getForecast(for zipCode:ZipCode, completion: @escaping (WeatherForecast?,Error?)->()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?zip=\(zipCode),us&appid=43d46281c1e4f31f54aa2cfeb008b34d") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil,nil)
                return
            }
            do{
                let wf:WeatherForecast = try JSONDecoder().decode(WeatherForecast.self, from: data)
                completion(wf, nil)
            } catch let error{
                completion(nil, error)
            } 
        }
        task.resume()
    }
    
    static func getIcon(named:String, completion:@escaping (UIImage?,Error?)->()){
        if let image = GlobalCache.shared.imageCache.object(forKey: named as NSString){
            completion(image, nil)
            return
        }
        guard let url = URL(string:"https://openweathermap.org/img/w/\(named).png") else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            guard let image = UIImage(data:data) else {
                completion(nil,nil)
                return
            }
            completion(image, nil)
        }
        task.resume()
        
    }
    
}
