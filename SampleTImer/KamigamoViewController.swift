//
//  KamigamoViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class KamigamoViewController: BusTimerViewController {
    
    @IBOutlet private weak var kamigamoNextTimeLabel: UILabel!
    @IBOutlet private weak var KamigamoCountTime: UILabel!
    @IBOutlet private weak var KamigamoAfterTheNextLabel: UILabel!
    @IBOutlet private weak var KamigamoAfterTheNextTime: UILabel!
    
    private func weekAndWedCalclation(notInServiceHour: Int = 21, lastBusHour: Int = 20, lastBusCountTime: Int = 59, lastBusTime: String = "21:00", _ hour: Int, _ inputMixLabel: BusLabels, _ minute: Int, _ printsec: Int, busType: Int) -> BusLabels {
        
        var mixLabel = inputMixLabel
        if notInServiceHour <= hour || 7 >= hour {
            return mixLabel
        } else {
            let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
            let arrayTime = busTimeCategories.times
            let arrayNextTime = busTimeCategories.nextTimes
            
            if arrayTime.count == busTimeCategories.count {
                
                if hour == lastBusHour {
                    mixLabel = lastBus((lastBusCountTime - minute), lastBusTime, printsec)
                } else {
                    mixLabel = makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
            } else if arrayTime.count == busTimeCategories.count + 1 {
                mixLabel = makeLabel(hour, hour + 1, arrayTime[busTimeCategories.count], arrayNextTime[0], 59 - arrayTime[busTimeCategories.count], printsec)
            } else {
                mixLabel = makeLabel(hour, hour, arrayTime[busTimeCategories.count], arrayTime[busTimeCategories.count + 1], 59 - arrayTime[busTimeCategories.count], printsec)
            }
        }
        return mixLabel
    }
    
    func kamigamo(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let weekday = calendar.component(.weekday, from: date)
        let printsec = 59 - second
        var mixLabel: BusLabels = BusLabels()
        
        enum BusSelect: Int{
            case Sun = 1
            case Wed = 4
            case Sat = 7
        }
        
        switch weekday {
        case BusSelect.Sun.rawValue:
            break
            
        case BusSelect.Wed.rawValue:
            if hour == 8 {
                mixLabel = circulation(time: "08:00~09:05", min: "2~5")
            } else {
                mixLabel = weekAndWedCalclation(hour, mixLabel, minute, printsec, busType: 1)
            }

        case BusSelect.Sat.rawValue:
            mixLabel = weekAndWedCalclation(notInServiceHour: 14, lastBusHour: 12, lastBusCountTime: 64, lastBusTime: "13:05", hour, mixLabel, minute, printsec, busType: 2)
            
        default:
            if hour == 8 {
                mixLabel = circulation(time: "08:00~09:05", min: "2~5")
            } else {
                mixLabel = weekAndWedCalclation(hour, mixLabel, minute, printsec, busType: 0)
            }
        }
        
        self.kamigamoNextTimeLabel?.text = mixLabel.nextTimeText
        self.KamigamoCountTime?.text = mixLabel.countTimeText
        self.KamigamoAfterTheNextLabel?.text = mixLabel.AfterTheNextTimeLabelText
        self.KamigamoAfterTheNextTime?.text = mixLabel.AfterTheNextTimeText
    }
}
