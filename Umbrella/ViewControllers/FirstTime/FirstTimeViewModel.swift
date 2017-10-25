//
//  FirstTimeViewModel.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

protocol FirstTimeVMDelegate:class{
    func reloadPageView()
}

class FirstTimeViewModel {
    private(set) weak var viewController:FirstTimeVMDelegate!
    private(set) lazy var orderedViewControllers: [SetupViewGenerator] = {
        return [.welcome,.metrics,.zipCode,.done]
    }()
    
    init(delegate:FirstTimeVMDelegate){
        self.viewController = delegate
    }
    
    func getFirstViewController() -> UIViewController{
        return orderedViewControllers[0].generate()
    }
    
    func getViewController(before type:SetupViewGenerator)->SetupViewController?{
        guard let viewControllerIndex = orderedViewControllers.index(of:type) else {return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard orderedViewControllers.count > previousIndex else {return nil}
        return orderedViewControllers[previousIndex].generate()
        
    }
    
    func getViewController(after type:SetupViewGenerator)->SetupViewController?{
        guard let viewControllerIndex = orderedViewControllers.index(of:type) else {return nil}
        let nextIndex = viewControllerIndex + 1
        guard nextIndex != orderedViewControllers.count && orderedViewControllers.count > nextIndex else {return nil}
        return orderedViewControllers[nextIndex].generate()
        
    }
    
    
}
