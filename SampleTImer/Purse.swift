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
    
    static func getJson(_ hour: Int, busType: Int) -> [Int] {
        
        guard let path = Bundle.main.path(forResource: "TimeTable", ofType: "json") else { return [] }
        var arrayTable = [Int]()
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let timeTable = try! JSONDecoder().decode(BusGroup.self, from: data)
        
        enum BusType: Int{
            case kamigamoWeek = 0
            case kamigamoWed = 1
            case kamigamoSat = 2
            case nikenWeek = 3
            case nikenWed = 4
            case nikenSat = 5
            case kitaWeek = 6
            case kitaHoliday = 7
            case kokusaiA = 8
            case kokusaiB = 9
            case kokusaiC = 10
            case kokusaiD = 11
        }
        
        switch busType {
            
        case BusType.kamigamoWeek.rawValue:
            if hour == 9 {
                arrayTable = timeTable.kamigamoWeek.nine
            } else if hour == 10 {
                arrayTable = timeTable.kamigamoWeek.ten
            } else if hour == 11 {
                arrayTable = timeTable.kamigamoWeek.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kamigamoWeek.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kamigamoWeek.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kamigamoWeek.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kamigamoWeek.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kamigamoWeek.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kamigamoWeek.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kamigamoWeek.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kamigamoWeek.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kamigamoWeek.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kamigamoWeek.twentyOne
            }
        case BusType.kamigamoWed.rawValue:
            if hour == 9 {
                arrayTable = timeTable.kamigamoWed.nine
            } else if hour == 10 {
                arrayTable = timeTable.kamigamoWed.ten
            } else if hour == 11 {
                arrayTable = timeTable.kamigamoWed.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kamigamoWed.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kamigamoWed.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kamigamoWed.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kamigamoWed.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kamigamoWed.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kamigamoWed.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kamigamoWed.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kamigamoWed.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kamigamoWed.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kamigamoWed.twentyOne
            }
        
        case BusType.kamigamoSat.rawValue:
            if hour == 9 {
                arrayTable = timeTable.kamigamoSat.nine
            } else if hour == 10 {
                arrayTable = timeTable.kamigamoSat.ten
            } else if hour == 11 {
                arrayTable = timeTable.kamigamoSat.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kamigamoSat.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kamigamoSat.thirteen
            }
            
        case BusType.nikenWeek.rawValue:
            if hour == 8 {
                arrayTable = timeTable.nikenWeek.eight
            }else if hour == 9 {
                arrayTable = timeTable.nikenWeek.nine
            } else if hour == 10 {
                arrayTable = timeTable.nikenWeek.ten
            } else if hour == 11 {
                arrayTable = timeTable.nikenWeek.eleven
            } else if hour == 12 {
                arrayTable = timeTable.nikenWeek.twelve
            } else if hour == 13 {
                arrayTable = timeTable.nikenWeek.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.nikenWeek.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.nikenWeek.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.nikenWeek.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.nikenWeek.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.nikenWeek.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.nikenWeek.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.nikenWeek.twenty
            }
            
        case BusType.nikenWed.rawValue:
            if hour == 8 {
                arrayTable = timeTable.nikenWed.eight
            }else if hour == 9 {
                arrayTable = timeTable.nikenWed.nine
            } else if hour == 10 {
                arrayTable = timeTable.nikenWed.ten
            } else if hour == 11 {
                arrayTable = timeTable.nikenWed.eleven
            } else if hour == 12 {
                arrayTable = timeTable.nikenWed.twelve
            } else if hour == 13 {
                arrayTable = timeTable.nikenWed.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.nikenWed.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.nikenWed.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.nikenWed.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.nikenWed.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.nikenWed.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.nikenWed.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.nikenWed.twenty
            }
            
        case BusType.nikenSat.rawValue:
            if hour == 9 {
                arrayTable = timeTable.kamigamoSat.nine
            } else if hour == 10 {
                arrayTable = timeTable.kamigamoSat.ten
            } else if hour == 11 {
                arrayTable = timeTable.kamigamoSat.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kamigamoSat.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kamigamoSat.thirteen
            }
            
        case BusType.kitaWeek.rawValue:
            if hour == 6 {
                arrayTable = timeTable.kitaWeek.six
            } else if hour == 7 {
                arrayTable = timeTable.kitaWeek.seven
            } else if hour == 8 {
                arrayTable = timeTable.kitaWeek.eight
            } else if hour == 9 {
                arrayTable = timeTable.kitaWeek.nine
            } else if hour == 10 {
                arrayTable = timeTable.kitaWeek.ten
            } else if hour == 11 {
                arrayTable = timeTable.kitaWeek.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kitaWeek.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kitaWeek.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kitaWeek.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kitaWeek.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kitaWeek.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kitaWeek.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kitaWeek.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kitaWeek.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kitaWeek.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kitaWeek.twentyOne
            } else if hour == 22 {
                arrayTable = timeTable.kitaWeek.twentyTwo
            }
            
        case BusType.kitaHoliday.rawValue:
            if hour == 6 {
                arrayTable = timeTable.kitaHoliday.six
            } else if hour == 7 {
                arrayTable = timeTable.kitaHoliday.seven
            } else if hour == 8 {
                arrayTable = timeTable.kitaHoliday.eight
            } else if hour == 9 {
                arrayTable = timeTable.kitaHoliday.nine
            } else if hour == 10 {
                arrayTable = timeTable.kitaHoliday.ten
            } else if hour == 11 {
                arrayTable = timeTable.kitaHoliday.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kitaHoliday.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kitaHoliday.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kitaHoliday.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kitaHoliday.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kitaHoliday.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kitaHoliday.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kitaHoliday.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kitaHoliday.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kitaHoliday.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kitaHoliday.twentyOne
            } else if hour == 22 {
                arrayTable = timeTable.kitaHoliday.twentyTwo
            }
            
        case BusType.kokusaiA.rawValue:
            if hour == 7 {
                arrayTable = timeTable.kokusaiA.seven
            } else if hour == 8 {
                arrayTable = timeTable.kokusaiA.eight
            } else if hour == 9 {
                arrayTable = timeTable.kokusaiA.nine
            } else if hour == 10 {
                arrayTable = timeTable.kokusaiA.ten
            } else if hour == 11 {
                arrayTable = timeTable.kokusaiA.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kokusaiA.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kokusaiA.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kokusaiA.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kokusaiA.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kokusaiA.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kokusaiA.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kokusaiA.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kokusaiA.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kokusaiA.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kokusaiA.twentyOne
            } else if hour == 22 {
                arrayTable = timeTable.kokusaiA.twentyTwo
            } else if hour == 23 {
                arrayTable = timeTable.kokusaiA.twentyThree
            }
            
        case BusType.kokusaiB.rawValue:
            if hour == 7 {
                arrayTable = timeTable.kokusaiB.seven
            } else if hour == 8 {
                arrayTable = timeTable.kokusaiB.eight
            } else if hour == 9 {
                arrayTable = timeTable.kokusaiB.nine
            } else if hour == 10 {
                arrayTable = timeTable.kokusaiB.ten
            } else if hour == 11 {
                arrayTable = timeTable.kokusaiB.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kokusaiB.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kokusaiB.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kokusaiB.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kokusaiB.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kokusaiB.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kokusaiB.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kokusaiB.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kokusaiB.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kokusaiB.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kokusaiB.twentyOne
            } else if hour == 22 {
                arrayTable = timeTable.kokusaiB.twentyTwo
            } else if hour == 23 {
                arrayTable = timeTable.kokusaiB.twentyThree
            }
            
        case BusType.kokusaiC.rawValue:
            if hour == 7 {
                arrayTable = timeTable.kokusaiC.seven
            } else if hour == 8 {
                arrayTable = timeTable.kokusaiC.eight
            } else if hour == 9 {
                arrayTable = timeTable.kokusaiC.nine
            } else if hour == 10 {
                arrayTable = timeTable.kokusaiC.ten
            } else if hour == 11 {
                arrayTable = timeTable.kokusaiC.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kokusaiC.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kokusaiC.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kokusaiC.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kokusaiC.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kokusaiC.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kokusaiC.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kokusaiC.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kokusaiC.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kokusaiC.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kokusaiC.twentyOne
            } else if hour == 22 {
                arrayTable = timeTable.kokusaiC.twentyTwo
            } else if hour == 23 {
                arrayTable = timeTable.kokusaiC.twentyThree
            }
            
        case BusType.kokusaiD.rawValue:
            if hour == 7 {
                arrayTable = timeTable.kokusaiD.seven
            } else if hour == 8 {
                arrayTable = timeTable.kokusaiD.eight
            } else if hour == 9 {
                arrayTable = timeTable.kokusaiD.nine
            } else if hour == 10 {
                arrayTable = timeTable.kokusaiD.ten
            } else if hour == 11 {
                arrayTable = timeTable.kokusaiD.eleven
            } else if hour == 12 {
                arrayTable = timeTable.kokusaiD.twelve
            } else if hour == 13 {
                arrayTable = timeTable.kokusaiD.thirteen
            } else if hour == 14 {
                arrayTable = timeTable.kokusaiD.fourteen
            } else if hour == 15 {
                arrayTable = timeTable.kokusaiD.fifteen
            } else if hour == 16 {
                arrayTable = timeTable.kokusaiD.sixteen
            } else if hour == 17 {
                arrayTable = timeTable.kokusaiD.seventeen
            } else if hour == 18 {
                arrayTable = timeTable.kokusaiD.eighteen
            } else if hour == 19 {
                arrayTable = timeTable.kokusaiD.nineteen
            } else if hour == 20 {
                arrayTable = timeTable.kokusaiD.twenty
            } else if hour == 21 {
                arrayTable = timeTable.kokusaiD.twentyOne
            } else if hour == 22 {
                arrayTable = timeTable.kokusaiD.twentyTwo
            } else if hour == 23 {
                arrayTable = timeTable.kokusaiD.twentyThree
            }
            
        default:
            print("Default")
        }
        return arrayTable
    }
}
