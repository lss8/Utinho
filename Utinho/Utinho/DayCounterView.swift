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
    
    var body: some View {
        VStack {
            CicloMenstrualView(dia: $dia)
            //Text("\(timeString(date: date))")
                //.onAppear(perform: {let _ = self.updateTimer})
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
                                 changeDay()
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
    
}




