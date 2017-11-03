//
//  LabelMake.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

struct BusLabels {
    var nextTimeText: String = "ただいまの時間は\n運行しておりません"
    var countTimeText: String = ""
    var AfterTheNextTimeLabelText: String = ""
    var AfterTheNextTimeText: String = ""
}

class BusTimerViewController: UIViewController {
    var nextTime: String = ""
    var countTime: String = ""
    var AfterTheNextTimeLabel: String = ""
    var AfterTheNextTime: String = ""
    
    func circulation(time: String, min: String) -> BusLabels {
        nextTime = "\(time)は\n約\(min)分おきに\n運行しています"
        countTime = ""
        AfterTheNextTimeLabel = ""
        AfterTheNextTime = ""
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
    }
    
    func labelCountdown(_ countmin: Int, _ printsec: Int) -> String {
        if printsec < 10 {
            if countmin < 10 {
                countTime = "0\(countmin)分0\(printsec)秒後"
            } else {
                countTime = "\(countmin)分0\(printsec)秒後"
            }
        } else {
            if countmin < 10 {
                countTime = "0\(countmin)分\(printsec)秒後"
            } else {
                countTime = "\(countmin)分\(printsec)秒後"
            }
        }
        return countTime
    }
    
    func makeLabel(_ printhour: Int, _ print2ndhour: Int, _ printNextMin:Int, _ print2ndMin: Int, _ countmin: Int, _ printsec: Int) -> BusLabels{
        
        countTime = labelCountdown(countmin, printsec)
        if printhour < 10 {
            if printNextMin < 10 {
                nextTime = "次は\(printhour):0\(printNextMin)発"
            } else {
                nextTime = "次は\(printhour):\(printNextMin)発"
            }
        } else {
            if printNextMin < 10 {
                nextTime = "次は\(printhour):0\(printNextMin)発"
            } else {
                nextTime = "次は\(printhour):\(printNextMin)発"
            }
        }
        AfterTheNextTimeLabel = "その次のバスは"
        
        if print2ndMin < 10 {
            AfterTheNextTime = "\(print2ndhour)時0\(print2ndMin)分"
        } else{
            AfterTheNextTime = "\(print2ndhour)時\(print2ndMin)分"
        }
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
    }
    
    func lastBus(_ countmin: Int, _ time: String, _ printsec: Int) -> BusLabels{
        countTime = labelCountdown(countmin, printsec)
        nextTime = "最終バス\n\(time)発まで"
        AfterTheNextTimeLabel = " "
        AfterTheNextTime = " "
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
    }
    
    func nikenCirculation(_ countmin: Int, time: String, _ printsec: Int, nextTimeTable: String) -> BusLabels {
        countTime = labelCountdown(countmin, printsec)
        nextTime = "次は\(time)発"
        AfterTheNextTimeLabel = "次\(nextTimeTable)は"
        AfterTheNextTime = "約5~10分おきに\n運行します"
        
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)

    }
}
