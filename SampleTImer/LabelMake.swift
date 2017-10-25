//
//  LabelMake.swift
//  SampleTImer
//
//  Created by 松山友也 on 2017/10/25.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import Foundation

class LabelMake{
    
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
    
    func notInService() -> (String, String, String, String){
        text1 = "現在の時間は\n運行してません"
        text2 = ""
        text3 = ""
        text4 = ""
        
        return (text1, text2, text3, text4)
    }
    
    func circulation(time: String, min: String) -> (String, String, String, String){
        text1 = "\(time)は\n約\(min)分おきに\n運行しています"
        text2 = ""
        text3 = ""
        text4 = ""
        
        return (text1, text2, text3, text4)
    }
    
    func label_countdown(_ countmin: Int, _ printsec: Int) -> String {
        if printsec < 10 {
            if countmin < 10 {
                text1 = "0\(countmin)分0\(printsec)秒後"
            }else {
                text1 = "\(countmin)分0\(printsec)秒後"
            }
        } else {
            if countmin < 10 {
                text1 = "0\(countmin)分\(printsec)秒後"
            }else {
                text1 = "\(countmin)分\(printsec)秒後"
            }
        }
        return text1
    }
    
    func makeLabel(_ printhour: Int, _ print2ndhour: Int, _ printNextMin:Int, _ print2ndMin: Int, _ countmin: Int, _ printsec: Int) -> (String, String, String, String){
        text1 = label_countdown(countmin, printsec)
        if printhour < 10 {
            if printNextMin < 10 {
                text3 = "次は\(printhour):0\(printNextMin)発"
            }else {
                text3 = "次は\(printhour):\(printNextMin)発"
            }
            
        } else {
            if printNextMin < 10 {
                text3 = "次は\(printhour):0\(printNextMin)発"
            }else {
                text3 = "次は\(printhour):\(printNextMin)発"
            }
            
        }
        text4 = "その次のバスは"
        if print2ndMin < 10 {
            text2 = "\(print2ndhour)時0\(print2ndMin)分"
        }else{
            text2 = "\(print2ndhour)時\(print2ndMin)分"
        }
        
        return (text1, text2, text3, text4)
    }
    
    func lastBus(_ countmin: Int, _ time: String, _ printsec: Int) -> (String, String, String, String){
        text1 = label_countdown(countmin, printsec)
        text3 = "最終バス\n\(time)発まで"
        text2 = " "
        text2 = " "
        
        return (text1, text2, text3, text4)
    }

    
}
