//
//  TimerPageViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/11/03.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit

class TimerPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    let kamigamo = KamigamoViewController()
    let niken = NikenViewController()
    let kita = KitaViewController()
    let kokusai = KokusaiViewController()
    
    let idList = ["Kamigamo","Niken", "Kita", "Kokusai"]
    var pageCount: Int = 0
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = idList.index(of: viewController.restorationIdentifier!)!
        if index > 0 {
            print(pageCount)
            return storyboard!.instantiateViewController(withIdentifier: idList[index - 1])
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = idList.index(of: viewController.restorationIdentifier!)!
        if index < idList.count - 1 {
            return storyboard!.instantiateViewController(withIdentifier: idList[index + 1])
        }
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return idList.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    @objc func selectBus(timer: Timer){
        kamigamo.kamigamo()
        niken.niken()
        kita.kita()
        kokusai.kokusai()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = storyboard!.instantiateViewController(withIdentifier: idList.first!)
        self.setViewControllers([controller], direction: .forward, animated: true, completion:nil)
        self.dataSource = self
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(TimerPageViewController.selectBus(timer:)), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
