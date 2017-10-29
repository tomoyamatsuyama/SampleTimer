//
//  NikenViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/26.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit


class KitaViewController: UIViewController {
    
    var kitalabelMake = LabelMake()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initilize()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nil, bundle: nil)
        initilize()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    func initilize(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let weekday = calendar.component(.weekday, from: date) //火曜日は3
        let printsec = 59 - second
        var count: Int = 0
        var arrayTime: [Int] = []
        var arrayNextTime: [Int] = []
        var mixLabel = kitalabelMake.notInService()
        
        enum Week: Int{
            case Sun = 1
            case Sat = 7
        }
        
        
        switch weekday {
        case Week.Sun.rawValue:
            if ((22 == hour && minute >= 22) || (5 >= hour) || (21 <= hour )) {
                mixLabel = kitalabelMake.notInService()
                
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: 7)
                arrayTime = busTimeCategories.times
                arrayNextTime = busTimeCategories.nextTimes
                count = busTimeCategories.count
                
                if arrayTime.count == count {
                    if hour == 21 && minute >= 25 {
                        mixLabel = kitalabelMake.lastBus((60 - (minute + 1) + 5), "22:05", printsec)
                        
                    } else {
                        mixLabel = kitalabelMake.makeLabel(hour, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                    }
                    
                } else if arrayTime.count == count + 1 {
                    if (hour == 22){
                        mixLabel = kitalabelMake.lastBus((05 - (minute + 1)), "22:05", printsec)

                    }else {
                        mixLabel = kitalabelMake.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], arrayTime[count] - 59, printsec)
                        
                    }
                    
                } else {
                    mixLabel = kitalabelMake.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], arrayTime[count] - 59, printsec)
                    
                }
            }
            
        case Week.Sat.rawValue:
            if ((22 == hour && minute >= 22) || (5 >= hour) || (21 <= hour )) {
                mixLabel = kitalabelMake.notInService()
                
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: 7)
                arrayTime = busTimeCategories.times
                arrayNextTime = busTimeCategories.nextTimes
                count = busTimeCategories.count
                
                if arrayTime.count == count {
                    if hour == 21 && minute >= 25 {
                        mixLabel = kitalabelMake.lastBus((60 - (minute + 1) + 5), "22:05", printsec)
                        
                    } else {
                        mixLabel = kitalabelMake.makeLabel(hour, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                    }
                    
                } else if arrayTime.count == count + 1 {
                    if hour == 22 {
                        mixLabel = kitalabelMake.lastBus((05 - (minute + 1)), "22:05", printsec)
                        
                    }else {
                        mixLabel = kitalabelMake.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], arrayTime[count] - 59, printsec)
                        
                    }
                    
                } else {
                    mixLabel = kitalabelMake.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], arrayTime[count] - 59, printsec)
                    
                }
            }
            
        default: // 平日
            if ((22 == hour && (22 <= minute && minute < 60)) || ((5 >= hour) || (23 <= hour))) {
                mixLabel = kitalabelMake.notInService()
                
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: 6)
                arrayTime = busTimeCategories.times
                arrayNextTime = busTimeCategories.nextTimes
                count = busTimeCategories.count
                
                if arrayTime.count == count {
                    if hour == 21 && minute >= 42 {
                        mixLabel = kitalabelMake.lastBus((22 + (59 - minute)), "22:22", printsec)
                    } else {
                        mixLabel = kitalabelMake.makeLabel(hour, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                    }
                } else if arrayTime.count == count + 1 {
                    if (hour == 22){
                        mixLabel = kitalabelMake.lastBus((22 - (minute + 1)), "22:22", printsec)
                    }else {
                        mixLabel = kitalabelMake.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], arrayTime[count] - 59, printsec)
                    }
                } else {
                    mixLabel = kitalabelMake.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], arrayTime[count] - 59, printsec)
                    
                }
            }
            
            
        }
        print("北3")
        print(mixLabel.2)
        print(mixLabel.0)
        print(mixLabel.3)
        print(mixLabel.1)
    }
}
