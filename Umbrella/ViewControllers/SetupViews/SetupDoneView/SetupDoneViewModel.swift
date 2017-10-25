//
//  SetupDoneViewModel.swift
//  Umbrella
//
//  Created by Carlos C. on 10/20/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import Foundation

class SetupDoneViewModel{
    
    weak var viewController:SetupDoneVMDelegate!
    
    init(delegate:SetupDoneVMDelegate) {
        self.viewController = delegate
        self.setupView()
    }
    
    func setupView(){
        UmbrellaSettings.setupComplete ? loadSetupComplete() : loadSetupIncomplete()
    }
    
    private func loadSetupComplete(){
        let title = "All Done!"
        let message = "Looks like everithing is allright! Click on the button below to go to your weather. Remember that you can run this setup any time you want by going to the menu on the app."
        viewController.updateTitle(to: title)
        viewController.updateDescription(to: message)
        viewController.buttonEnabled(true)
    }
    
    private func loadSetupIncomplete(){
        let title = "Ohh Noooo!!!"
        let message = "Something is missing, Probably the Zip Code you provided is not yet verified, Enter your zipcode on the previous view and click on verify to finish this setup"
        viewController.updateTitle(to: title)
        viewController.updateDescription(to: message)
        viewController.buttonEnabled(false)
    }
}
