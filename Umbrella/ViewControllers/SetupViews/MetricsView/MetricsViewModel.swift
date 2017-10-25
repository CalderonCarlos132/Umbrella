//
//  MetricsViewModel.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import Foundation
class MetricsViewModel{
    weak var viewController:MetricsSetupVMDelegate!
    
    init(delegate:MetricsSetupVMDelegate) {
        self.viewController = delegate
    }
    
    func initialSetup(){
        let text = "We need to know what kind of temperature scale you prefer. \n\n There is Celsius, that takes as is base the boiling point (100 ºC) and freezing point (0 ºC) of water. \n\n And then there is Farenheit, that in the lower defining point (0 ºF), was established as the temperature of a solution of brine made from equal parts of ice and salt, and the highest point (96 ºF), was approximately the human body's temperature."
        viewController.updateDescription(to: text)
    }
}
