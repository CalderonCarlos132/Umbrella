//
//  WelcomeViewModel.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewModel {
    weak var viewController:SetupVMDelegate!
    
    init(delegate:SetupVMDelegate){
        self.viewController = delegate
    }
    
    func initialSetup(){
        let text = "Looks like it is the first time you open our app. Before we can start loading the weather for you there is a couple of things we need to know. Swipe this screen to setup your preferences."
        viewController.updateDescription(to: text)
    }
    
}
