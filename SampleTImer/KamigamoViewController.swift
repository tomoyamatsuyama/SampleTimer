//
//  KamigamoViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit

class KamigamoViewController: UIViewController {
    
    @IBOutlet private weak var kamigamoNextTime: UILabel!
    @IBOutlet private weak var kamigamoCountTime: UILabel!
    @IBOutlet private weak var kamigamoAfterTheNextTimeLabel: UILabel!
    @IBOutlet private weak var kamigamoAfterTheNextTime: UILabel!
    
    var kamigamolabelMake = LabelMake()
    
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
        var mixLabel = kamigamolabelMake.notInService()
        
        enum Week: Int{
            case Sun = 1
            case Wed = 4
            case Sat = 7
        }
        
        
        switch weekday {
        case Week.Sun.rawValue:
            mixLabel = kamigamolabelMake.notInService()
            
        case Week.Wed.rawValue:
            if 21 <= hour || 7 >= hour {
                mixLabel = kamigamolabelMake.notInService()
            } else if hour == 8 {
                mixLabel = kamigamolabelMake.circulation(time: "08:00~09:05", min: "2~5")
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: 1)
                arrayTime = busTimeCategories.times
                arrayNextTime = busTimeCategories.nextTimes
                count = busTimeCategories.count
            }
            if arrayTime.count == count {
                if (hour == 20) {
                    mixLabel = kamigamolabelMake.lastBus((59 - minute), "21:00", printsec)
                } else {
                    mixLabel = kamigamolabelMake.makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
                
            } else if (arrayTime.count == count + 1) {
                mixLabel = kamigamolabelMake.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], (arrayTime[count] - (minute + 1)), printsec)
                
            } else {
                mixLabel = kamigamolabelMake.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], arrayTime[count] - (minute + 1), printsec)
            }
            
        case Week.Sat.rawValue:
            if 14 <= hour || 7 >= hour {
                mixLabel = kamigamolabelMake.notInService()
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: 2)
                arrayTime = busTimeCategories.times
                arrayNextTime = busTimeCategories.nextTimes
                count = busTimeCategories.count
                
                if arrayTime.count == count {
                    if (hour == 12) {
                        mixLabel = kamigamolabelMake.lastBus((5 + (59 - minute)), "13:05", printsec)
                    } else {
                        mixLabel = kamigamolabelMake.makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                    }
                    
                } else if (arrayTime.count == count + 1) {
                    mixLabel = kamigamolabelMake.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], (arrayTime[count] - (minute + 1)), printsec)
                    
                } else {
                    mixLabel = kamigamolabelMake.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], arrayTime[count] - (minute + 1), printsec)
                }
            }
            
        default: // 平日
            if 21 <= hour || 7 >= hour {
                mixLabel = kamigamolabelMake.notInService()
            } else if hour == 8 {
                mixLabel = kamigamolabelMake.circulation(time: "08:00~09:05", min: "2~5")
            } else {
                let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: 0)
                arrayTime = busTimeCategories.times
                arrayNextTime = busTimeCategories.nextTimes
                count = busTimeCategories.count
            }
            if arrayTime.count == count {
                if (hour == 20) {
                    mixLabel = kamigamolabelMake.lastBus((59 - minute), "21:00", printsec)
                } else {
                    mixLabel = kamigamolabelMake.makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
                
            } else if (arrayTime.count == count + 1) {
                mixLabel = kamigamolabelMake.makeLabel(hour, hour + 1, arrayTime[count], arrayNextTime[0], (arrayTime[count] - (minute + 1)), printsec)
                
            } else {
                mixLabel = kamigamolabelMake.makeLabel(hour, hour, arrayTime[count], arrayTime[count + 1], arrayTime[count] - (minute + 1), printsec)
            }
        }
        print("上賀茂")
        print(mixLabel.2)
        print(mixLabel.0)
        print(mixLabel.3)
        print(mixLabel.1)
    }
}
