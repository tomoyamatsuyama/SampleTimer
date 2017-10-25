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
    
    func getTime(_ hour: Int, _ minute: Int) -> ([Int], [Int], Int) {
        let arrayTime = Purse.getJson(hour)
        let arrayNextTime = Purse.getJson(hour + 1)
        let count = arrayTime.filter{ $0 <= minute }.count
        
        return (arrayTime, arrayNextTime, count)
    }
}

