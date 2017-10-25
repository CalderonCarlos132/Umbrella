//
//  UmbrellaSettings.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import Foundation

class UmbrellaSettings {
    
    enum MeticsType:String{
        case Farenheith = "Farenheith"
        case Celcius = "Celsius"
        
        static var Default:MeticsType{
            return .Farenheith
        }
    }
    static var chosenMetrics:MeticsType {
        set {UserDefaults.standard.set(newValue.rawValue, forKey: "ChosenMetrics")}
        get {
            guard let selected = UserDefaults.standard.object(forKey: "ChosenMetrics") as? String else {return MeticsType.Default}
            return MeticsType(rawValue: selected) ?? MeticsType.Default
        }
    }
    
    static var zipCode:String? {
        get{return UserDefaults.standard.object(forKey: "ZipCode") as? String}
        set{UserDefaults.standard.set(newValue, forKey: "ZipCode")}
    }
    
    static var locationName:String?{
        get{return UserDefaults.standard.object(forKey: "LocationName") as? String}
        set{UserDefaults.standard.set(newValue, forKey: "LocationName")}
    }
    
    static var setupComplete:Bool {return zipCode != nil}
    
}
