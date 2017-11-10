//
//  KokusaiViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/30.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

class KokusaiViewController: BusTimerViewController {
    @IBOutlet private weak var kokusaiNextTimeLabel: UILabel!
    @IBOutlet private weak var kokusaiCountTime: UILabel!
    @IBOutlet private weak var kokusaiAfterTheNextLabel: UILabel!
    @IBOutlet private weak var kokusaiAfterTheNextTime: UILabel!
    
    private func busTimeCalclation(_ hour: Int, _ minute: Int, _ printsec: Int, _ inputMixLabel: BusLabels, busType: Int) -> BusLabels {
        var mixLabel = inputMixLabel
        
        if ((23 == hour && minute >= 02) || (6 >= hour) || (24 <= hour )) {
            return mixLabel
        } else {
            let busTimeCategories = TimeTable.getTime(hour: hour, minute: minute, busType: busType)
            let arrayTime = busTimeCategories.times
            let arrayNextTime = busTimeCategories.nextTimes
        
            if arrayTime.count == busTimeCategories.count {
                
                if hour == 22 && minute >= 20 {
                    mixLabel = lastBus((60 - (minute + 1) + 2), "23:02", printsec)
                } else {
                    mixLabel = makeLabel(hour + 1, hour + 1, arrayNextTime[0], arrayNextTime[1], ((59 - minute) + arrayNextTime[0]), printsec)
                }
            } else if arrayTime.count == busTimeCategories.count + 1 {
                
                if hour == 23 {
                    mixLabel = lastBus(02 - (minute + 1), "23:02", printsec)
                } else {
                    mixLabel = makeLabel(hour, hour + 1, arrayTime[busTimeCategories.count], arrayNextTime[0], 59 - arrayTime[busTimeCategories.count], printsec)
                }
            } else {
                mixLabel = makeLabel(hour, hour, arrayTime[busTimeCategories.count], arrayTime[busTimeCategories.count + 1], arrayTime[busTimeCategories.count] - (minute + 1), printsec)
            }
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
        var mixLabel: BusLabels = BusLabels()
        
        enum BusSelect: Int{
            case Sun = 1
            case Sat = 7
        }
        
        switch weekday {
        case BusSelect.Sun.rawValue:
            mixLabel = busTimeCalclation(hour, minute, printsec, mixLabel, busType: 11)
            
        case BusSelect.Sat.rawValue:
            mixLabel = busTimeCalclation(hour, minute, printsec, mixLabel, busType: 10)
            
        default:
            mixLabel = busTimeCalclation(hour, minute, printsec, mixLabel, busType: 8)
        }
        
        self.kokusaiNextTimeLabel?.text = mixLabel.nextTimeText
        self.kokusaiNextTimeLabel?.numberOfLines = 0
        self.kokusaiCountTime?.text = mixLabel.countTimeText
        labelFontSet(self.kokusaiCountTime)
        self.kokusaiAfterTheNextLabel?.text = mixLabel.AfterTheNextTimeLabelText
        self.kokusaiAfterTheNextTime?.text = mixLabel.AfterTheNextTimeText
        self.kokusaiAfterTheNextTime?.numberOfLines = 0
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.colorWithHexString("53B176")
        Timer.scheduledTimer(withTimeInterval: 0.9, repeats: true) {_ in
            self.initialize()
        }
    }
}
