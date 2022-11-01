//
//  HealthController.swift
//  Utinho
//
//  Created by lrsv on 28/10/22.
//

import Foundation
import SwiftUI


class StatisticBarController: ObservableObject {
    @Published var statistic: Double = 100
    @AppStorage("lastHour") private var lastHourString = ""
    private var lastHour = Date()
    private var timer: Timer = Timer()

    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        print("last hour string" + lastHourString)
        print(lastHour)
        if lastHourString == "" {
            lastHour = Date.now
            updateLastHour(timeSpent: 30)
        } else {
            lastHour = dateFormatter.date(from: lastHourString)!
        }
       runTimer()
    }
    
    func runTimer() {
        if (timer.isValid) {
            timer.invalidate();
        }
        //checkTimeInterval()
        timer = Timer(fireAt: lastHour, interval: 0, target: self, selector: #selector(decreaseStatisticThroughTimer), userInfo: nil, repeats: true)
    }
    
    private func checkTimeInterval() {
        let timeIntervalSinceLastComputedHour = Date.now.timeIntervalSince(lastHour)
        let timeIntervalInHours = floor(timeIntervalSinceLastComputedHour/3600)
        let timeIntervalInSecs = timeIntervalInHours * 3600
        if (timeIntervalInSecs > 0) {
            decreaseStatistic(hoursSpent: 1)
            updateLastHour(timeSpent: 5)
        }
    }
    
    private func updateLastHour(timeSpent: Double) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        lastHour = lastHour.addingTimeInterval(timeSpent)
        lastHourString = dateFormatter.string(from: lastHour)
    }
    
    private func decreaseStatistic(hoursSpent: Double) {
        statistic = statistic - (4 * hoursSpent);
        print(statistic)
    }
    
    @objc private func decreaseStatisticThroughTimer() {
        statistic = statistic - 4;
        print(statistic)
    }

}
