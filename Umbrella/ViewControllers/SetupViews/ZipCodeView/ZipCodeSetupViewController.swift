//
//  ZipCodeSetupViewController.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class ZipCodeSetupViewController: SetupViewController {
    lazy var viewModel:ZipCodeViewModel = ZipCodeViewModel(delegate: self)
    @IBOutlet weak var zipInput: UITextField!
    

    override func viewDidLoad() {
        self.color1 = UIColor(red: 160/255, green: 168/255, blue: 118/255, alpha: 1).cgColor
        self.color2 = UIColor(red: 215/255, green: 168/255, blue: 51/255, alpha: 1).cgColor
        super.viewDidLoad()
        guard let zipCode = UmbrellaSettings.zipCode else {return}
        self.zipInput.text = zipCode
        guard let name = UmbrellaSettings.locationName else {return}
        self.descriptionLabel.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verifyZipCode(_ sender: AnyObject){
        viewModel.testZipCode(zipInput.text)
    }

}
extension ZipCodeSetupViewController:zipCodeVMDelegate{
    func presentAlert(_ alert:UIAlertController){
        DispatchQueue.main.async {
            [unowned self] in
            self.present(alert, animated: true)
        }
    }
}
