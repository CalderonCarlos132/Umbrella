//
//  Constants.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import Foundation

class Constants{
    static let kColorWeatherF = 65
    static let kColorWeatherC = 18
    static var kColorWeather:Int {
        switch UmbrellaSettings.chosenMetrics{
        case .Celcius:
            return kColorWeatherC
        case .Farenheith:
            return kColorWeatherF
        }
    }
    
}

class ErrorConstants{
    static let noViewController:(String)->String = {
        return "No initial View Controller set for Storiboard:\($0)"
    }
    
}
