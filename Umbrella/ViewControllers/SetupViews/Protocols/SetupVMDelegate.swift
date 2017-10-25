//
//  SetupVMDelegate.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

protocol SetupVMDelegate:class {
    weak var descriptionLabel:UILabel!{get set}
    func updateDescription(to text:String)
}
extension SetupVMDelegate{
    func updateDescription(to text:String){
        DispatchQueue.main.async {
            [unowned self] in
            self.descriptionLabel.text = text
        }
    }
}
protocol MetricsSetupVMDelegate:SetupVMDelegate {}
protocol zipCodeVMDelegate:SetupVMDelegate {
    func presentAlert(_ alert:UIAlertController)
}
protocol SetupDoneVMDelegate:SetupVMDelegate {
    func updateTitle(to text:String)
    func buttonEnabled(_ bool:Bool)
}
