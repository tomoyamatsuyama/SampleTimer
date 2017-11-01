//
//  NikenViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/26.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class KitaViewController: MakingBusLabels{
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    func initialize(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let weekday = calendar.component(.weekday, from: date)
        let printsec = 59 - second
        var count: Int = 0
        var arrayTime: [Int] = []
        var arrayNextTime: [Int] = []
        var mixLabel: BusLabels = BusLabels()
        
        enum Week: Int{
            case Sun = 1
            case Sat = 7
        }
        func busTimeCalc(notInServiceHour: Int = 21, notInServiceMinute: Int = 25, lastBusMinute: Int = 5, lastBusTime: String = "22:05", _ hour: Int, _ minute: Int, _ mixLabel: BusLabels, _ printsec: Int, busType: Int) -> BusLabels{
            var mixLabel = mixLabel
            if ((22 == hour && minute >= 22) || (5 >= hour) || (notInServiceHour <= hour )) {
                return mixLabel
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
                let arrayTime = busTimeCategories.times
                let arrayNextTime = busTimeCategories.nextTimes
                let count = busTimeCategories.count
                
                if arrayTime.count == count {
                    
                    if hour == 21 && minute >= notInServiceMinute {
                        mixLabel = super.lastBus(lastBusMinute + (59 - minute) , lastBusTime, printsec)
                        
                    } else {
                        mixLabel = super.makeLabel(hour, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                    }
                } else if arrayTime.count == count + 1 {
                    
                    if hour == 22 {
                        mixLabel = super.lastBus(lastBusMinute - (minute + 1), lastBusTime, printsec)
                        
                    }else {
                        mixLabel = super.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], 59 - arrayTime[count], printsec)
                    }
                } else {
                    mixLabel = super.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], 59 - arrayTime[count], printsec)
                    
                }
            }
            return mixLabel
        }
        
        switch weekday {
        case Week.Sun.rawValue:
            mixLabel = busTimeCalc(hour, minute, mixLabel, printsec, busType: 7)
            
        case Week.Sat.rawValue:
            mixLabel = busTimeCalc(hour, minute, mixLabel, printsec, busType: 7)
            
        default:
            mixLabel = busTimeCalc(notInServiceHour: 23, notInServiceMinute: 42, lastBusMinute: 22, lastBusTime: "22:22", hour, minute, mixLabel, printsec, busType: 6)
        }
        print("北3")
        print(mixLabel.nextTimeText)
        print(mixLabel.countTimeText)
        print(mixLabel.AfterTheNextTimeLabelText)
        print(mixLabel.AfterTheNextTimeText)
    }
}
