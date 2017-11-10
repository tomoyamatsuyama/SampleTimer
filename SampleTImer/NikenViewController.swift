//
//  NikenViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/11/02.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class NikenViewController: BusTimerViewController {
    
    @IBOutlet private weak var nikenNextTimeLabel: UILabel!
    @IBOutlet private weak var nikenCountTime: UILabel!
    @IBOutlet private weak var nikenAfterTheNextLabel: UILabel!
    @IBOutlet private weak var nikenAfterTheNextTime: UILabel!
    
    private func weekAndWedCalclation(lastBusHour: Int = 20, lastBusMinute: Int = 15, lastBusCountTime: Int = 29, lastBusTime: String = "20:30", _ hour: Int, _ inputMixLabel: BusLabels, _ minute: Int, _ printsec: Int, busType: Int) -> BusLabels {
        var mixLabel = inputMixLabel
        let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
        let arrayTime = busTimeCategories.times
        let arrayNextTime = busTimeCategories.nextTimes
        
        if arrayTime.count == busTimeCategories.count {
            mixLabel = makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
        } else if arrayTime.count == busTimeCategories.count + 1 {
            if hour == lastBusHour && minute >= lastBusMinute {
                mixLabel = lastBus(lastBusCountTime - minute, lastBusTime, printsec)
            } else {
                mixLabel = makeLabel(hour, hour + 1, arrayTime[busTimeCategories.count], arrayNextTime[0], arrayTime[busTimeCategories.count] - (minute + 1), printsec)
            }
        } else {
            mixLabel = makeLabel(hour, hour, arrayTime[busTimeCategories.count], arrayTime[busTimeCategories.count + 1], arrayTime[busTimeCategories.count] - (minute + 1), printsec)
        }
        return mixLabel
    }
    
    private func initialize(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let weekday = calendar.component(.weekday, from: date)
        let printsec = 59 - second
        var countmin: Int = 0
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
            if  ((20 == hour && minute >= 30) || (7 == hour && minute < 20) || (6 > hour) || (21 <= hour)) {
                break
            } else if ((hour == 7 && minute >= 20) || (hour == 8 && minute < 20)) {
                if hour == 7 {
                    countmin = (60 - (minute + 1)) + 20
                } else {
                    countmin = 20 - (minute + 1)
                }
                mixLabel = nikenCirculation(countmin, time: "8:20", printsec, nextTimeTable: "08:20~09:25")
            } else if ((hour == 8 && minute >= 20) || (hour == 9 && minute < 25)) {
                mixLabel = circulation(time: "08:00~09:25", min: "5~10")
            } else if ((hour == 9 && minute >= 55) || (hour == 10 && minute < 5)) {
                if minute < 05 {
                    countmin = 05 - (minute + 1)
                } else {
                    countmin = 05 + (59 - minute)
                }
                mixLabel = nikenCirculation(countmin, time: "10:05", printsec, nextTimeTable: "10:05~10:55")
            } else if (hour == 10 && (5 <= minute  && minute < 55)) {
                mixLabel = circulation(time: "10:05~10:55", min: "5~10")
            } else {
                mixLabel = weekAndWedCalclation(hour, mixLabel, minute, printsec, busType: 4)
            }
            
        case BusSelect.Sat.rawValue:
            if 13 <= hour || 7 >= hour {
                break
            } else {
                mixLabel = weekAndWedCalclation(lastBusHour: 12, lastBusMinute: 0, lastBusCountTime: 59, lastBusTime: "13:00", hour, mixLabel, minute, printsec, busType: 5)
            }
    
        default:
            if ((20 == hour && minute >= 30) || (7 == hour && minute < 20) || (6 > hour) || (20 < hour)) {
                break
            } else if ((hour == 7 && minute >= 20) || (hour == 8 && minute < 20)) {
                if hour == 7 {
                    countmin = (60 - (minute + 1)) + 20
                } else {
                    countmin = 20 - (minute + 1)
                }
                mixLabel = nikenCirculation(countmin, time: "8:20", printsec, nextTimeTable: "08:20~09:25")
            } else if ((hour == 8 && minute >= 20) || (hour == 9 && minute < 25)) {
                mixLabel = circulation(time: "08:00~09:25", min: "5~10")
            } else if ((hour == 9 && minute >= 55) || (hour == 10 && minute < 5)) {
                if minute < 05 {
                    countmin = 05 - (minute + 1)
                } else {
                    countmin = 05 + (59 - minute)
                }
                mixLabel = nikenCirculation(countmin, time: "10:05", printsec, nextTimeTable: "10:05~10:55")
            } else if (hour == 10 && (5 <= minute  && minute < 55)) {
                mixLabel = circulation(time: "10:05~10:55", min: "5~10")
            } else if (hour == 14 && (minute >= 40 && minute < 50)) {
                countmin = 50 - (minute + 1)
                mixLabel = nikenCirculation(countmin, time: "14:50", printsec, nextTimeTable: "14:50~15:10")
            } else if ((hour == 14 && minute >= 50) || (hour == 15 && minute < 20)){
                mixLabel = circulation(time: "14:50~15:10", min: "5~10")
            } else if (hour == 16 && (minute >= 20 && minute < 30)) {
                countmin = 30 - (minute + 1)
                mixLabel = nikenCirculation(countmin, time: "16:30", printsec, nextTimeTable: "16:30~17:10")
            } else if ((hour == 16 && minute >= 30) || (hour == 17 && minute < 10)) {
                mixLabel = circulation(time: "16:30~17:10", min: "5~10")
            } else {
                mixLabel = weekAndWedCalclation(hour, mixLabel, minute, printsec, busType: 3)
            }
        }
       
        self.nikenNextTimeLabel?.text = mixLabel.nextTimeText
        self.nikenNextTimeLabel?.numberOfLines = 0
        self.nikenCountTime?.text = mixLabel.countTimeText
        labelFontSet(self.nikenCountTime)
        self.nikenAfterTheNextLabel?.text = mixLabel.AfterTheNextTimeLabelText
        self.nikenAfterTheNextTime?.text = mixLabel.AfterTheNextTimeText
        self.nikenAfterTheNextTime?.numberOfLines = 0
        
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.colorWithHexString("53B176")
        Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true) {_ in
            self.initialize()
        }
    }
}
