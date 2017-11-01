//
//  KamigamoViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class KamigamoViewController:  MakingBusLabels {
    
    @IBOutlet private weak var kamigamoNextTime: UILabel!
    @IBOutlet private weak var kamigamoCountTime: UILabel!
    @IBOutlet private weak var kamigamoAfterTheNextTimeLabel: UILabel!
    @IBOutlet private weak var kamigamoAfterTheNextTime: UILabel!
    
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
    
    func weekAndWedCalclation(notInServiceHour: Int = 21, lastBusHour: Int = 20, lastBusCountTime: Int = 59, lastBusTime: String = "21:00", _ hour: Int, _ mixLabel: BusLabels, _ minute: Int, _ printsec: Int, busType: Int) -> BusLabels{
        
        var mixLabel = mixLabel
        if notInServiceHour <= hour || 7 >= hour {
            return mixLabel
        } else {
            let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
            let arrayTime = busTimeCategories.times
            let arrayNextTime = busTimeCategories.nextTimes
            let count = busTimeCategories.count
            
            if arrayTime.count == count {
                
                if hour == lastBusHour {
                    mixLabel = super.lastBus((lastBusCountTime - minute), lastBusTime, printsec)
                } else {
                    mixLabel = super.makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
            } else if (arrayTime.count == count + 1) {
                mixLabel = super.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], 59 - arrayTime[count], printsec)
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
            case Wed = 4
            case Sat = 7
        }
        
        switch weekday {
        case Week.Sun.rawValue:
            break
            
        case Week.Wed.rawValue:
            if hour == 8 {
                mixLabel = super.circulation(time: "08:00~09:05", min: "2~5")
            } else {
                mixLabel = weekAndWedCalclation(hour, mixLabel, minute, printsec, busType: 1)
            }

        case Week.Sat.rawValue:
            mixLabel = weekAndWedCalclation(notInServiceHour: 14, lastBusHour: 12, lastBusCountTime: 64, lastBusTime: "13:05", hour, mixLabel, minute, printsec, busType: 2)
            
        default:
            if hour == 8 {
                mixLabel = super.circulation(time: "08:00~09:05", min: "2~5")
            } else {
                mixLabel = weekAndWedCalclation(hour, mixLabel, minute, printsec, busType: 0)
            }
        }
        print("上賀茂")
        print(mixLabel.nextTimeText)
        print(mixLabel.countTimeText)
        print(mixLabel.AfterTheNextTimeLabelText)
        print(mixLabel.AfterTheNextTimeText)
    }
}
