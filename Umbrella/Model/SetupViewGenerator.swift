//
//  SetupViewGenerator.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

enum SetupViewGenerator{
    case welcome
    case metrics
    case zipCode
    case done
    
    func generate()->SetupViewController{
        switch self {
        case .welcome:
            return self.getViewController(name: "Welcome")
        case .metrics:
            return self.getViewController(name: "Metrics")
        case .zipCode:
            return self.getViewController(name: "ZipCode")
        case .done:
            return self.getViewController(name: "Exit")
        }
    }
    
    private func getViewController(name: String) -> SetupViewController {
        guard let vc = UIStoryboard(name: "FirstTime", bundle: nil) .
            instantiateViewController(withIdentifier: "\(name)VC") as? SetupViewController else {fatalError("ViewController \(name) was not found")}
        vc.type = self
        return vc
    }
}

