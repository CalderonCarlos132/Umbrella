//
//  ZipCodeViewModel.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBook

class ZipCodeViewModel{
    weak var viewController:zipCodeVMDelegate!
    weak var pageView:FirstTimeViewModel!
    typealias ZipCode = String
    typealias Place = (city:String,state:String)
    
    init(delegate:zipCodeVMDelegate) {
        self.viewController = delegate
    }
    
    func testZipCode(_ zipCode:ZipCode?){
        guard let zipCode = zipCode else {
            sendAlert(message: "The Zip Code field cannot be empty")
            return
        }
        guard zipCode.count == 5 else {
            sendAlert(message: "The Zip Code field must contain 5 numbers")
            return
        }
        verifyZipCode(zipCode) { [unowned self] (place, error) in
            guard error == nil else {
                self.sendAlert(message: "Error: \(error!.localizedDescription)")
                return
            }
            guard let place = place else {
                self.sendAlert(message: "Unknown error please try again")
                return
            }
            UmbrellaSettings.zipCode = zipCode
            let label = "\(place.city), \(place.state)"
            UmbrellaSettings.locationName = label
            self.viewController.updateDescription(to: label)
        }
    }
    
    private func verifyZipCode(_ zipCode:ZipCode, completion: @escaping (Place?,Error?)->()){
        let geoCoder =  CLGeocoder()
        geoCoder.geocodeAddressString(zipCode + "US", in: nil) {
            (placemark, error) in
            guard error == nil else {
                completion(nil,error!)
                return
            }
            guard let placemark = placemark?.first else {return}
            guard let locality = placemark.locality else {return}
            guard let state = placemark.administrativeArea else {return}
            let place = Place(city:locality,state:state)
            completion(place, nil)
        }
    }
    
    private func sendAlert(message:String){
        let settings = AlertSettings(title: "Error", message: message)
        let alert = AlertService.getAlert(type: .simple, settings: settings)
        viewController.presentAlert(alert)
    }
}
