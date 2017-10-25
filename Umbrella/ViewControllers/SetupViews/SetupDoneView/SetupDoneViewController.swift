//
//  SetupDoneViewController.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class SetupDoneViewController: SetupViewController {
    @IBOutlet weak var readyBtn:UIButton!
    @IBOutlet weak var doneLabel:UILabel!
    lazy var viewModel:SetupDoneViewModel = SetupDoneViewModel(delegate:self)
    
    override func viewDidLoad() {
        self.color1 = UIColor(red: 215/255, green: 168/255, blue: 51/255, alpha: 1).cgColor
        self.color2 = UIColor(red: 252/255, green: 169/255, blue: 6/255, alpha: 1).cgColor
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startSegue(_ sender:AnyObject){
        self.performSegue(withIdentifier: "ToMainStoryboard", sender: nil)
    }

}
extension SetupDoneViewController:SetupDoneVMDelegate{
    func updateTitle(to text: String) {
        DispatchQueue.main.async {
            [unowned self] in
            self.doneLabel.text = text
        }
    }
    
    func buttonEnabled(_ bool: Bool) {
        DispatchQueue.main.async {
            [unowned self] in
            self.readyBtn.isEnabled = bool
        }
    }
    
    
}
