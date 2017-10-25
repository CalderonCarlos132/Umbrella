//
//  WeatherViewModel.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

protocol WeatherVMDelegate:class{
    var imageView:UIImageView! {get set}
    func updateTemp(to text: String?)
    func updateLocation(to text:String?)
    func updateBackgroundColor(to colors:(color1:CGColor,color2:CGColor))
    func presentAlert(_ alert:UIAlertController)
    func reloadTableView()
    func updateDescription(to text:String?)
}

class WeatherViewModel{
    weak var viewController:WeatherVMDelegate!
    var timer:Timer?
    var valuesForCell:[String:String]?
    
    init(delegate:WeatherVMDelegate){
        self.viewController = delegate
    }
    
    @objc func getWeather(_ sender:AnyObject? = nil){
        guard let zipCode:NetworkService.ZipCode = UmbrellaSettings.zipCode else {return}
        NetworkService.getForecast(for: zipCode) { [unowned self](forecast, error) in
            guard error == nil else{
                self.sendAlert(message: error!.localizedDescription)
                return
            }
            guard let forecast = forecast else {
                self.sendAlert(message: "Unknown error ocurred, Please try again later")
                return
            }
            self.updateForecastOnView(forecast: forecast)
            self.setDictionaryFotTV(forecast: forecast)
            self.timer = Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(self.getWeather(_:)), userInfo: nil, repeats: false)
        }
    }
    
    func stopTimer(){
        self.timer?.invalidate()
    }
    
    func numberOfRows() -> Int{
        return valuesForCell?.count ?? 0
    }
    
    func getInfoFor(indexPath:IndexPath) -> (title:String?,detail:String?){
        let detail = valuesForCell?.values.enumerated().filter{$0.offset == indexPath.row}
        let title = valuesForCell?.keys.enumerated().filter{$0.offset == indexPath.row}
        return (title:title?.first?.element,detail:detail?.first?.element)
    }
    
    private func updateForecastOnView(forecast:WeatherForecast){
        viewController.updateTemp(to: "\(forecast.main.temperature)º")
        forecast.weather.first?.setIcon(to: viewController.imageView)
        viewController.updateLocation(to: UmbrellaSettings.locationName)
        viewController.updateBackgroundColor(to: getColors(for: forecast.main.temperature))
        viewController.updateDescription(to: forecast.weather.first?.description)
    }
    
    private func setDictionaryFotTV(forecast:WeatherForecast){
        var dict:[String:String] = [:]
        dict["Humidity"] = String(forecast.main.humidity) + "%"
        dict["Presure"] = String(forecast.main.pressure)
        self.valuesForCell = dict
        self.viewController.reloadTableView()
    }
    
    private func getColors(for temperature:Int) -> (color1:CGColor,color2:CGColor){
        if temperature >= Constants.kColorWeather{
            let color1 = UIColor(red: 215/255, green: 168/255, blue: 51/255, alpha: 1).cgColor
            let color2 = UIColor(red: 252/255, green: 169/255, blue: 6/255, alpha: 1).cgColor
            return (color1:color1,color2:color2)
        } else {
            let color1 = UIColor(red: 70/255, green: 167/255, blue: 228/255, alpha: 1).cgColor
            let color2 = UIColor(red: 107/255, green: 167/255, blue: 184/255, alpha: 1).cgColor
            return (color1:color1,color2:color2)
        }
    }
    
    private func sendAlert(message:String){
        let settings = AlertSettings(title: "Error", message: message)
        let alert = AlertService.getAlert(type: .simple, settings: settings)
        viewController.presentAlert(alert)
    }
}

