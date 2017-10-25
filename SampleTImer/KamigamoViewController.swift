//
//  KamigamoViewController.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import UIKit

class KamigamoViewController: UIView {
    
    
    @IBOutlet weak var kamigamoLabel1: UILabel!
    @IBOutlet weak var kamigamoLabel2: UILabel!
    @IBOutlet weak var kamigamoLabel3: UILabel!
    @IBOutlet weak var kamigamoLabel4: UILabel!
    
    var kamigamolabelMake = LabelMake()
    var kamigamoTimeTable = TimeTable()

    func kamigamoFunc(){
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
        
        if weekday == 1 { //日曜日
            mixLabel = kamigamolabelMake.notInService()
        }else if weekday == 4 { //水曜
            
            if 21 <= hour || 7 >= hour {
                mixLabel = kamigamolabelMake.notInService()
            } else if hour == 8 {
                mixLabel = kamigamolabelMake.circulation(time: "08:00~09:05", min: "2~5")
            } else {
                let mixValue = kamigamoTimeTable.getTime(hour, minute)
                arrayTime = mixValue.0
                arrayNextTime = mixValue.1
                count = mixValue.2
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
        
        
//        kamigamoLabel1.text? = mixLabel.2
//        kamigamoLabel2.text? = mixLabel.0
//        kamigamoLabel3.text? = mixLabel.3
//        kamigamoLabel4.text? = mixLabel.1

        print(mixLabel.2)
        print(mixLabel.0)
        print(mixLabel.3)
        print(mixLabel.1)
    }
}
