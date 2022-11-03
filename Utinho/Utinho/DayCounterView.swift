//
//  DayCounterView.swift
//  Utinho
//
//  Created by lss8 on 27/10/22.
//

import SwiftUI

struct DayCounterView: View {
    @State var date = Date()
    @State var dia: Int = 1
    
    @ObservedObject var fase: FaseDoCiclo
    
    @ObservedObject var saudeProgress: BarProgressSaude
    @ObservedObject var nutriProgress: BarProgressSaude
    @ObservedObject var lazerProgress: BarProgressSaude
    
    var body: some View {
        VStack {
            CicloMenstrualView(dia: $dia, fase: fase)
            //Text("\(timeString(date: date))")
                .onAppear(perform: {let _ = self.updateTimer})
        }
    }

    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }

    func timeString(date: Date) -> String {
         let time = timeFormat.string(from: date)
         return time
    }

    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                 self.date = Date()
                                 //changeDay()
             if dia < 28 {
                 dia += 1
             }
             else {
                 dia = 1
             }
             defineFase(FASE: changeFase(dia: dia))
                                 
                               })
    }

    func changeDay() {
        let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 00, of: date)!
        let midNight01 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 01, of: date)!
        
        if date >= midNight0 && date <= midNight01 {
            dia += 1
        }
        if dia > 28 {
            dia = 1
        }
    }
    
    public func defineFase(FASE: String) {
        fase.fase = FASE
        saudeProgress.value -= 1.0
        nutriProgress.value -= 1.0
        lazerProgress.value -= 1.0
    }
    
    func changeFase(dia: Int) -> String {
        var faseMenstrual: String
        
        if dia >= 1 && dia <= 5 {
            faseMenstrual = "Menstruação"
        }
        else if dia >= 6 && dia <= 11 {
            faseMenstrual = "Folicular"
        }
        else if dia >= 12 && dia <= 16 {
            faseMenstrual = "Ovulatória"
        }
        else if dia >= 17 && dia <= 23 {
            faseMenstrual = "Lútea"
        }
        else {
            faseMenstrual = "TPM"
        }
        return faseMenstrual
    }
    
}




