//
//  InstructionPageViewController.swift
//  MuseumMindMaze
//
//  Created by Richel Cuyler on 5/1/18.
//  Copyright © 2018 Richel Cuyler. All rights reserved.
//

import UIKit

class InstructionPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageControl = UIPageControl()
    
    var subViewControllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController1") as! WelcomeViewController1,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController2") as! WelcomeViewController2,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController3") as! WelcomeViewController3,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController4") as! WelcomeViewController4,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController5") as! WelcomeViewController5
        ]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        configurePageControl()
        
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    //Set transition style and add pagenation dots
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.lightGray
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    
    
    //Mark: UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentIndex <= 0) {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentIndex >= subViewControllers.count-1) {
            return nil
        }
        return subViewControllers[currentIndex+1]
    }
    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
    }
    
    
}
