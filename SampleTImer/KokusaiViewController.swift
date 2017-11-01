//
//  KokusaiViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/30.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit

class KokusaiViewController: MakingBusLabels {
    
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
    func busTimeCalclation(_ hour: Int, _ minute: Int, _ printsec: Int, _ mixLabel: BusLabels, busType: Int) -> BusLabels{
        var mixLabel = mixLabel
        
        if ((23 == hour && minute >= 02) || (6 >= hour) || (24 <= hour )) {
            return mixLabel
        } else {
            let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
            let arrayTime = busTimeCategories.times
            let arrayNextTime = busTimeCategories.nextTimes
            let count = busTimeCategories.count
        
            if arrayTime.count == count {
                
                if hour == 22 && minute >= 20 {
                    mixLabel = super.lastBus((60 - (minute + 1) + 2), "23:02", printsec)
                } else {
                    mixLabel = super.makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
            } else if arrayTime.count == count + 1 {
                
                if hour == 23 {
                    mixLabel = super.lastBus(02 - (minute + 1), "23:02", printsec)
                } else {
                    mixLabel = super.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], 59 - arrayTime[count], printsec)
                }
            } else {
                mixLabel = super.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], 59 - arrayTime[count], printsec)
            }
        }
        return mixLabel
    }
    
    func initialize(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let weekday = calendar.component(.weekday, from: date)
        let printsec = 59 - second
        var mixLabel: BusLabels = BusLabels()
        
        enum Week: Int{
            case Sun = 1
            case Sat = 7
        }
        
        switch weekday {
            
        case Week.Sun.rawValue:
            mixLabel = busTimeCalclation(hour, minute, printsec, mixLabel, busType: 11)
            
        case Week.Sat.rawValue:
            mixLabel = busTimeCalclation(hour, minute, printsec, mixLabel, busType: 10)
            
        default:
            mixLabel = busTimeCalclation(hour, minute, printsec, mixLabel, busType: 8)
        }
        
        print("国際会館")
        print(mixLabel.nextTimeText)
        print(mixLabel.countTimeText)
        print(mixLabel.AfterTheNextTimeLabelText)
        print(mixLabel.AfterTheNextTimeText)
    }
}
