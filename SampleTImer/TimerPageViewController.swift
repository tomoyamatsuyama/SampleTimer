//
//  TimerPageViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/11/03.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class TimerPageViewController: UIPageViewController {
    var viewControllersList: [UIViewController] = []
    
    enum BusName: Int {
        case kamigamo
        case niken
        case kita
        case kokusai
        
        var index: Int {
            switch self {
            case .kamigamo:
                return 0
            case .niken:
                return 1
            case .kita:
                return 2
            case .kokusai:
                return 3
            }
        }
    }
    
    func navigationSet(index: Int){
        switch index {
        case BusName.kamigamo.index:
            self.navigationItem.title = "上賀茂神社行き"
        case BusName.niken.index:
            self.navigationItem.title = "二軒茶屋行き"
        case BusName.kita.index:
            self.navigationItem.title = "北大路BT行き"
        case BusName.kokusai.index:
            self.navigationItem.title = "国際会館行き"
        default:
            self.navigationItem.title = "上賀茂神社行き"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let kamigamo: KamigamoViewController = storyboard!.instantiateViewController(withIdentifier: "Kamigamo") as! KamigamoViewController
        let niken: NikenViewController = storyboard!.instantiateViewController(withIdentifier: "Niken") as! NikenViewController
        let kita: KitaViewController = storyboard!.instantiateViewController(withIdentifier: "Kita") as! KitaViewController
        let kokusai: KokusaiViewController = storyboard!.instantiateViewController(withIdentifier: "Kokusai") as! KokusaiViewController
        viewControllersList = [kamigamo, niken, kita, kokusai]
        
        self.setViewControllers([viewControllersList[0]], direction: .forward, animated: true, completion:nil)
        dataSource = self
    }
}

extension TimerPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = viewControllersList.index(of: viewController){
            if index > 0 {
                navigationSet(index: index)
                return viewControllersList[index - 1]
            }
            navigationSet(index: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = viewControllersList.index(of: viewController){
            if index < viewControllersList.count - 1 {
                navigationSet(index: index)
                return viewControllersList[index + 1]
            }
            navigationSet(index: index)
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return viewControllersList.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
