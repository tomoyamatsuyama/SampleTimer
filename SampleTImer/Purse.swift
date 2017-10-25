//
//  Purse.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/24.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

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


class Purse{
    
    static func getJson(_ hour: Int) -> [Int] {
        var arrayTable: [Int] = []
        
        if let path = Bundle.main.path(forResource: "TimeTable", ofType: "json") {
            
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let timeTable = try! JSONDecoder().decode(BusGroup.self, from: data)
            
            if hour == 9 {
                arrayTable = timeTable.kamigamoWeek.nine
            }else if hour == 10 {
                arrayTable = timeTable.kamigamoWeek.ten
            }else if hour == 11 {
                arrayTable = timeTable.kamigamoWeek.eleven
            }else if hour == 12 {
                arrayTable = timeTable.kamigamoWeek.twelve
            }else if hour == 13 {
                arrayTable = timeTable.kamigamoWeek.thirteen
            }else if hour == 14 {
                arrayTable = timeTable.kamigamoWeek.fourteen
            }else if hour == 15 {
                arrayTable = timeTable.kamigamoWeek.fifteen
            }else if hour == 16 {
                arrayTable = timeTable.kamigamoWeek.sixteen
            }else if hour == 17 {
                arrayTable = timeTable.kamigamoWeek.seventeen
            }else if hour == 18 {
                arrayTable = timeTable.kamigamoWeek.eighteen
            }else if hour == 19 {
                arrayTable = timeTable.kamigamoWeek.nineteen
            }else if hour == 20 {
                arrayTable = timeTable.kamigamoWeek.twenty
            }else if hour == 21 {
                arrayTable = timeTable.kamigamoWeek.twentyOne
            }else {
                print("バス終了")
            }
            
        }
        return arrayTable
    }
}
