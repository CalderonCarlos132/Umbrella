//
//  ViewController.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class FirstTimeViewController: UIPageViewController {
    
    lazy var viewModel:FirstTimeViewModel = FirstTimeViewModel(delegate:self)

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        self.setViewControllers([viewModel.getFirstViewController()], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let scrollView = view.subviews.filter({ $0 is UIScrollView }).first,
            let pageControl = view.subviews.filter({ $0 is UIPageControl }).first {
            scrollView.frame = view.bounds
            view.bringSubview(toFront:pageControl)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

fileprivate typealias PageViewDataSource = FirstTimeViewController
extension PageViewDataSource: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? SetupViewController else {return nil}
        guard let type = viewController.type else {return nil}
        return viewModel.getViewController(after: type)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? SetupViewController else {return nil}
        guard let type = viewController.type else {return nil}
        return viewModel.getViewController(before: type)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewModel.orderedViewControllers.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let viewController = viewControllers?.first as? SetupViewController else {return 0}
        guard let type = viewController.type else {return 0}
        guard let firstViewControllerIndex = viewModel.orderedViewControllers.index(of: type) else {return 0}
        return firstViewControllerIndex
    }
}
extension FirstTimeViewController:FirstTimeVMDelegate{
    func reloadPageView(){
        self.setViewControllers([viewModel.getFirstViewController()], direction: .forward, animated: true, completion: nil)
    }
}


