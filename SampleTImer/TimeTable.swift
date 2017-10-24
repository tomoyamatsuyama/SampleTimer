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



struct BusGroup: Codable {
    
    struct BusTimeKamigamo: Codable {
        var nine: [Int]
        var ten: [Int]
        var eleven: [Int]
        var twelve: [Int]
        var thirteen: [Int]
        var fourteen: [Int]
        var fifteen: [Int]
        var sixteen: [Int]
        var seventeen: [Int]
        var eighteen: [Int]
        var nineteen: [Int]
        var twenty: [Int]
        var twentyOne: [Int]
        
    }
    struct BusTimeSat: Codable{
        var eight: [Int]
        var nine: [Int]
        var ten: [Int]
        var eleven: [Int]
        var twelve: [Int]
        var thirteen: [Int]
        
    }
    struct BusTimeNiken: Codable {
        var eight: [Int]
        var nine: [Int]
        var ten: [Int]
        var eleven: [Int]
        var twelve: [Int]
        var thirteen: [Int]
        var fourteen: [Int]
        var fifteen: [Int]
        var sixteen: [Int]
        var seventeen: [Int]
        var eighteen: [Int]
        var nineteen: [Int]
        var twenty: [Int]
    }
    struct BusTimeKita: Codable {
        var six: [Int]
        var seven: [Int]
        var eight: [Int]
        var nine: [Int]
        var ten: [Int]
        var eleven: [Int]
        var twelve: [Int]
        var thirteen: [Int]
        var fourteen: [Int]
        var fifteen: [Int]
        var sixteen: [Int]
        var seventeen: [Int]
        var eighteen: [Int]
        var nineteen: [Int]
        var twenty: [Int]
        var twentyOne: [Int]
        var twentyTwo: [Int]
        
    }
    struct BusTimeKokusai: Codable {
        var seven: [Int]
        var eight: [Int]
        var nine: [Int]
        var ten: [Int]
        var eleven: [Int]
        var twelve: [Int]
        var thirteen: [Int]
        var fourteen: [Int]
        var fifteen: [Int]
        var sixteen: [Int]
        var seventeen: [Int]
        var eighteen: [Int]
        var nineteen: [Int]
        var twenty: [Int]
        var twentyOne: [Int]
        var twentyTwo: [Int]
        var twentyThree: [Int]
    }
    
    var kamigamoWeek: BusTimeKamigamo
    var kamigamoWed: BusTimeKamigamo
    var kamigamoSat: BusTimeSat
    var nikenWeek: BusTimeNiken
    var nikenWed: BusTimeNiken
    var nikenSat: BusTimeSat
    var kitaWeek: BusTimeKita
    var kitaHoliday: BusTimeKita
    var kokusaiA: BusTimeKokusai
    var kokusaiB: BusTimeKokusai
    var kokusaiC: BusTimeKokusai
    var kokusaiD: BusTimeKokusai
    
}



class GetTimeTable{
    
    static func Counter(array: [Int], minute: Int) -> Int {
        var count = 0
        for i in 0..<array.count {
            if array[i] <= minute {
                count += 1
                
            }
        }
        return array[count]
    }
    
    static func get_time(hour: Int, minute:Int) -> Int {
        var departureTime = 0
        var arrayTime :[Int]
        
        if let path = Bundle.main.path(forResource: "TimeTable", ofType: "json") {
            
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let timeTable = try! JSONDecoder().decode(BusGroup.self, from: data)
            
            if hour == 21 {
                arrayTime = timeTable.kokusaiA.twentyOne
                departureTime = Counter(array: arrayTime, minute: minute)
            }else if hour == 22{
                arrayTime = timeTable.kokusaiA.twentyTwo
                departureTime = Counter(array: arrayTime, minute: minute)
            }
        }
        return departureTime
    }
}

