//
//  SetupView.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

protocol GradientView:class {
    var view:UIView!{get}
    var color1:CGColor {set get}
    var color2:CGColor {set get}
    var gradientLayer:CAGradientLayer{get}
   
}
extension GradientView {
    func setGradient(){
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1,color2]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.view.layer.insertSublayer(gradientLayer, below: self.view.layer.sublayers?[0])
        self.view.backgroundColor = .clear
    }
}


class SetupViewController:UIViewController,GradientView{
    @IBOutlet weak var descriptionLabel:UILabel!
    var type:SetupViewGenerator?
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    var color1: CGColor = UIColor.white.cgColor
    var color2: CGColor = UIColor.white.cgColor
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradient()
    }
}
