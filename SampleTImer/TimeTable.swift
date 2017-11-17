//
//  TimeTable.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/23.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//
//

import UIKit
import Foundation

class TimeTable{
    
    struct BusTimeCategories {
        var times: [Int]
        var nextTimes: [Int]
        var count : Int
    }
    
    static func getTime(hour: Int, minute: Int, busType: Int) -> BusTimeCategories {
        let arrayTime = Purse.getJson(hour, busType: busType)
        let arrayNextTime = Purse.getJson(hour + 1, busType: busType)
        let count = arrayTime.filter{ $0 <= minute }.count
        let busTimeCategories = BusTimeCategories(times: arrayTime, nextTimes: arrayNextTime, count: count)
        return busTimeCategories
    }
}

