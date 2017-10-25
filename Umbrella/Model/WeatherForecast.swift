//
//  WeatherForecast.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class WeatherDescription:Decodable{
    private(set) var  id:Int
    private(set) var main:String
    private(set) var description:String
    private var icon:String
    
    func setIcon(to view:UIImageView){
        NetworkService.getIcon(named: icon) { (image, error) in
            //add appropiate errors (New Enum subclassing error)
            guard error == nil else {return}
            DispatchQueue.main.async {
                view.image = image
            }
        }
    }
    
}

class WeatherData:Decodable{
    private var temp:Double
    private(set) var pressure:Double
    private(set) var humidity:Int
    private var temp_min:Double
    private var temp_max:Double
    
    var temperature:Int {
        get{
            switch UmbrellaSettings.chosenMetrics {
            case .Celcius:
                return celsiusTemp()
            default:
                return farenheitTemp()
            }
        }
    }
    
    private func farenheitTemp()->Int{
        let f = temp * (9/5) - 459.67
        return Int(f)
    }
    private func celsiusTemp()->Int{
        return Int(temp - 273)
    }
}

struct WeatherForecast:Decodable{
    private(set) var weather:[WeatherDescription]
    private(set) var main:WeatherData
}
extension WeatherForecast{
    enum CodingKeys: String, CodingKey { // declaring our keys
        case weather = "weather"
        case main = "main"
    }

}
