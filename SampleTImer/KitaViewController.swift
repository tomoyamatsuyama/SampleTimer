//
//  NikenViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/26.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class KitaViewController: BusTimerViewController{
    
    @IBOutlet private weak var kitaNextTimeLabel: UILabel!
    @IBOutlet private weak var kitaCountTime: UILabel!
    @IBOutlet private weak var kitaAfterTheNextLabel: UILabel!
    @IBOutlet private weak var kitaAfterTheNextTime: UILabel!
    
    private func busTimeCalc(notInServiceHour: Int = 21, notInServiceMinute: Int = 25, lastBusMinute: Int = 5, lastBusTime: String = "22:05", _ hour: Int, _ minute: Int, _ inputMixLabel: BusLabels, _ printsec: Int, busType: Int) -> BusLabels{
        var mixLabel = inputMixLabel
        if ((22 == hour && minute >= 22) || (5 >= hour) || (notInServiceHour <= hour )) {
            return mixLabel
        } else {
            let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
            let arrayTime = busTimeCategories.times
            let arrayNextTime = busTimeCategories.nextTimes
            
            if arrayTime.count == busTimeCategories.count {
                
                if hour == 21 && minute >= notInServiceMinute {
                    mixLabel = lastBus(lastBusMinute + (59 - minute) , lastBusTime, printsec)
                    
                } else {
                    mixLabel = makeLabel(hour, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
            } else if arrayTime.count == busTimeCategories.count + 1 {
                
                if hour == 22 {
                    mixLabel = lastBus(lastBusMinute - (minute + 1), lastBusTime, printsec)
                    
                }else {
                    mixLabel = makeLabel(hour, hour + 1, arrayTime[busTimeCategories.count], arrayNextTime[0], 59 - arrayTime[busTimeCategories.count], printsec)
                }
            } else {
                mixLabel = makeLabel(hour, hour, arrayTime[busTimeCategories.count], arrayTime[busTimeCategories.count + 1], 59 - arrayTime[busTimeCategories.count], printsec)
                
            }
        }
        return mixLabel
    }
    
    func kita(){
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
            case Sat = 7
        }
        
        switch weekday {
        case BusSelect.Sun.rawValue:
            mixLabel = busTimeCalc(hour, minute, mixLabel, printsec, busType: 7)
            
        case BusSelect.Sat.rawValue:
            mixLabel = busTimeCalc(hour, minute, mixLabel, printsec, busType: 7)
            
        default:
            mixLabel = busTimeCalc(notInServiceHour: 23, notInServiceMinute: 42, lastBusMinute: 22, lastBusTime: "22:22", hour, minute, mixLabel, printsec, busType: 6)
        }
        
        self.kitaNextTimeLabel?.text = mixLabel.nextTimeText
        self.kitaCountTime?.text = mixLabel.countTimeText
        self.kitaAfterTheNextLabel?.text = mixLabel.AfterTheNextTimeLabelText
        self.kitaAfterTheNextTime?.text = mixLabel.AfterTheNextTimeText
    }
}
