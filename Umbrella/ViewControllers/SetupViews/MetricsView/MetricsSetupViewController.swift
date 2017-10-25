//
//  MetricsSetupViewController.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class MetricsSetupViewController: SetupViewController {
    
    lazy var viewModel:MetricsViewModel = MetricsViewModel(delegate:self)

    override func viewDidLoad() {
        self.color1 = UIColor(red: 107/255, green: 167/255, blue: 184/255, alpha: 1).cgColor
        self.color2 = UIColor(red: 160/255, green: 168/255, blue: 118/255, alpha: 1).cgColor
        super.viewDidLoad()
        viewModel.initialSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlChange(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            UmbrellaSettings.chosenMetrics = .Farenheith
        case 1:
            UmbrellaSettings.chosenMetrics = .Celcius
        default:
            UmbrellaSettings.chosenMetrics = .Farenheith
        }
    }

}
extension MetricsSetupViewController:MetricsSetupVMDelegate{}
