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

class MakingBusLabels: UIViewController {
    var nextTime: String = ""
    var countTime: String = ""
    var AfterTheNextTimeLabel: String = ""
    var AfterTheNextTime: String = ""
    
    func circulation(time: String, min: String) -> BusLabels {
        let nextTime = "\(time)は\n約\(min)分おきに\n運行しています"
        let countTime = ""
        let AfterTheNextTimeLabel = ""
        let AfterTheNextTime = ""
        let busLabels = BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
        return busLabels
    }
    
    func labelCountdown(_ countmin: Int, _ printsec: Int) -> String {
        if printsec < 10 {
            if countmin < 10 {
                nextTime = "0\(countmin)分0\(printsec)秒後"
            } else {
                nextTime = "\(countmin)分0\(printsec)秒後"
            }
        } else {
            if countmin < 10 {
                nextTime = "0\(countmin)分\(printsec)秒後"
            } else {
                nextTime = "\(countmin)分\(printsec)秒後"
            }
        }
        return nextTime
    }
    
    func makeLabel(_ printhour: Int, _ print2ndhour: Int, _ printNextMin:Int, _ print2ndMin: Int, _ countmin: Int, _ printsec: Int) -> BusLabels{
        let nextTime = labelCountdown(countmin, printsec)
        
        if printhour < 10 {
            if printNextMin < 10 {
                AfterTheNextTimeLabel = "次は\(printhour):0\(printNextMin)発"
            } else {
                AfterTheNextTimeLabel = "次は\(printhour):\(printNextMin)発"
            }
        } else {
            if printNextMin < 10 {
                AfterTheNextTimeLabel = "次は\(printhour):0\(printNextMin)発"
            } else {
                AfterTheNextTimeLabel = "次は\(printhour):\(printNextMin)発"
            }
        }
        let AfterTheNextTime = "その次のバスは"
        
        if print2ndMin < 10 {
            countTime = "\(print2ndhour)時0\(print2ndMin)分"
        } else{
            countTime = "\(print2ndhour)時\(print2ndMin)分"
        }
        let busLabels = BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
        return busLabels
    }
    
    func lastBus(_ countmin: Int, _ time: String, _ printsec: Int) -> BusLabels{
        nextTime = labelCountdown(countmin, printsec)
        AfterTheNextTimeLabel = "最終バス\n\(time)発まで"
        countTime = " "
        AfterTheNextTime = " "
        
        let busLabels = BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
        return busLabels
    }
}
