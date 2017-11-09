//
//  TimerPageViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/11/03.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class TimerPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    let idList = ["Kamigamo", "Niken", "Kita", "Kokusai"]
    var viewControllerList: [UIViewController] = []
    
    enum BusName: Int{
        case kamigamo = 0
        case niken = 1
        case kita = 2
        case kokusai = 3
    }
    
    func navigationSet(index: Int){
        switch index {
        case BusName.kamigamo.rawValue:
            self.navigationItem.title = "上賀茂神社行き"
        case BusName.niken.rawValue:
            self.navigationItem.title = "二軒茶屋行き"
        case BusName.kita.rawValue:
            self.navigationItem.title = "北大路BT行き"
        case BusName.kokusai.rawValue:
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
        viewControllerList = [kamigamo, niken, kita, kokusai]
        
        self.setViewControllers([viewControllerList[0]], direction: .forward, animated: true, completion:nil)
        self.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerRestrationIdentifer = viewController.restorationIdentifier {
            if let index = idList.index(of: viewControllerRestrationIdentifer){
                if index > 0 {
                    navigationSet(index: index)
                    return viewControllerList[index - 1]
                }
                navigationSet(index: index)
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerRestrationIdentifer = viewController.restorationIdentifier {
            if let index = idList.index(of: viewControllerRestrationIdentifer){
                if index < idList.count - 1 {
                    navigationSet(index: index)
                    return viewControllerList[index + 1]
                }
                navigationSet(index: index)
            }
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return idList.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
