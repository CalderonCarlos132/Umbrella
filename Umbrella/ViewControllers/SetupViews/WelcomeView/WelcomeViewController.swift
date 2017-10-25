//
//  WelcomeViewController.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class WelcomeViewController: SetupViewController {
    lazy var viewModel:WelcomeViewModel = WelcomeViewModel(delegate: self)

    override func viewDidLoad() {
        self.color1 = UIColor(red: 70/255, green: 167/255, blue: 228/255, alpha: 1).cgColor
        self.color2 = UIColor(red: 107/255, green: 167/255, blue: 184/255, alpha: 1).cgColor
        super.viewDidLoad()
        viewModel.initialSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

fileprivate typealias ViewModelDelegate = WelcomeViewController
extension ViewModelDelegate:SetupVMDelegate{}
