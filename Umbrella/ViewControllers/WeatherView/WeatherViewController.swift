//
//  WeatherViewController.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class WeatherViewController:UIViewController,GradientView{
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var tempLabel:UILabel!
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var descriptionLabel:UILabel!
    
    lazy var viewModel:WeatherViewModel = WeatherViewModel(delegate: self)
    var color1: CGColor = UIColor(red: 70/255, green: 167/255, blue: 228/255, alpha: 1).cgColor
    var color2: CGColor = UIColor(red: 107/255, green: 167/255, blue: 184/255, alpha: 1).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getWeather()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopTimer()
    }
    
    @IBAction func reloadForecast(_ sender:AnyObject){
        self.viewModel.getWeather()
    }
    
    
    
    
}

typealias TableViewFunctions = WeatherViewController
extension TableViewFunctions:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {fatalError("No Cell Found")}
        let tupple = viewModel.getInfoFor(indexPath: indexPath)
        cell.textLabel?.text = tupple.title
        cell.detailTextLabel?.text = tupple.detail
        cell.backgroundView?.backgroundColor = .clear
        cell.backgroundColor = .clear
        return cell
    }
}

extension WeatherViewController:WeatherVMDelegate{
    func updateDescription(to text: String?) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = text
        }
    }
    
    
    func updateTemp(to text: String?) {
        DispatchQueue.main.async {
            self.tempLabel.text = text
        }
    }
    
    func updateLocation(to text: String?) {
        DispatchQueue.main.async {
            self.locationLabel.text = text
        }
    }
    
    func updateBackgroundColor(to colors:(color1:CGColor,color2:CGColor)) {
        DispatchQueue.main.async {
            self.color1 = colors.color1
            self.color2 = colors.color2
            self.setGradient()
        }
    }
    
    func presentAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
