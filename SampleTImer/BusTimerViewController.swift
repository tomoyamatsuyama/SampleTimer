//
//  LabelMake.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    static func colorWithHexString (_ hex: String) -> UIColor {
        let cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if ((cString as String).count != 6) {
            return UIColor.gray
        }
        let rString = (cString as NSString).substring(with: NSRange(location: 0, length: 2))
        let gString = (cString as NSString).substring(with: NSRange(location: 2, length: 2))
        let bString = (cString as NSString).substring(with: NSRange(location: 4, length: 2))
        var r: CUnsignedInt = 0
        var g: CUnsignedInt = 0
        var b: CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(
            red: CGFloat(Float(r) / 255.0),
            green: CGFloat(Float(g) / 255.0),
            blue: CGFloat(Float(b) / 255.0),
            alpha: CGFloat(Float(1.0))
        )
    }
}

struct BusLabels {
    var nextTimeText: String = ""
    var countTimeText: String = "ただいまの時間は\n運行しておりません"
    var AfterTheNextTimeLabelText: String = ""
    var AfterTheNextTimeText: String = ""
}

class BusTimerViewController: UIViewController {
    var nextTime: String = ""
    var countTime: String = ""
    var AfterTheNextTimeLabel: String = ""
    var AfterTheNextTime: String = ""
    
    func circulation(time: String, min: String) -> BusLabels {
        nextTime = " "
        countTime = "\(time)は\n約\(min)分おきに\n運行しています"
        AfterTheNextTimeLabel = " "
        AfterTheNextTime = " "
        print(BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime))
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
                nextTime = "\(printhour):0\(printNextMin)発まで"
            } else {
                nextTime = "\(printhour):\(printNextMin)発まで"
            }
        } else {
            if printNextMin < 10 {
                nextTime = "\(printhour):0\(printNextMin)発まで"
            } else {
                nextTime = "\(printhour):\(printNextMin)発まで"
            }
        }
        AfterTheNextTimeLabel = "その次のバスは"
        
        if print2ndMin < 10 {
            AfterTheNextTime = "\(print2ndhour)時0\(print2ndMin)分発"
        } else{
            AfterTheNextTime = "\(print2ndhour)時\(print2ndMin)分発"
        }
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
    }
    
    func lastBus(_ countmin: Int, _ time: String, _ printsec: Int) -> BusLabels{
        countTime = labelCountdown(countmin, printsec)
        nextTime = "最終\n\(time)発まで"
        AfterTheNextTimeLabel = " "
        AfterTheNextTime = " "
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)
    }
    
    func nikenCirculation(_ countmin: Int, time: String, _ printsec: Int, nextTimeTable: String) -> BusLabels {
        countTime = labelCountdown(countmin, printsec)
        nextTime = "\(time)発まで"
        AfterTheNextTimeLabel = "次\(nextTimeTable)は"
        AfterTheNextTime = "約5~10分おきに\n運行します"
        
        return BusLabels(nextTimeText: nextTime, countTimeText: countTime, AfterTheNextTimeLabelText: AfterTheNextTimeLabel, AfterTheNextTimeText: AfterTheNextTime)

    }
    
    func labelFontSet(_ countTimeLabel: UILabel) -> UILabel {
        guard let labelText: String = countTimeLabel.text else { return countTimeLabel }
        if labelText == "ただいまの時間は\n運行しておりません" || labelText.contains("分おきに\n運行しています"){
            countTimeLabel.numberOfLines = 0
            return countTimeLabel
        } else {
            let attrLabel = NSMutableAttributedString(string: labelText)
            attrLabel.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 65), range: NSMakeRange(0, 2))
            attrLabel.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 65), range: NSMakeRange(3, 2))
            countTimeLabel.attributedText = attrLabel
            return countTimeLabel
        }
    }
}
