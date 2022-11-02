//
//  HealthController.swift
//  Utinho
//
//  Created by lrsv on 28/10/22.
//

import Foundation
import SwiftUI


class StatisticBarController: ObservableObject {
    @AppStorage("healthStatistic") var healthStatistic: Double = 100
    @AppStorage("foodStatistic") var foodStatistic: Double = 100
    @AppStorage("funStatistic") var funStatistic: Double = 100
    @AppStorage("lastHour") private var lastHourString = ""
    private var lastHour = Date()
    private var timer: Timer = Timer()

    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        print("last hour string" + lastHourString)
        if lastHourString == "" { // If its first time user opens the app and has no last hour computed
            lastHour = Date.now
            updateLastHour(timeSpent: 5) // Last hour will be Date.now + 1 hour
        } else {
            lastHour = dateFormatter.date(from: lastHourString)!
        }
       runTimer()
    }
    
    func runTimer() {
        if (timer.isValid) {
            timer.invalidate();
        }
            checkTimeInterval()
        timer = Timer(fireAt: lastHour, interval: 0, target: self, selector: #selector(decreaseStatisticThroughTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
    
    // Checks how many time passed since the last computed hour
    private func checkTimeInterval() {
        let timeIntervalSinceLastComputedHour = Date.now.timeIntervalSince(lastHour)
        let timeIntervalInHours = floor(timeIntervalSinceLastComputedHour/3600)
        let timeIntervalInSecs = timeIntervalInHours * 3600
        if (timeIntervalInSecs > 0) {
            decreaseStatistic(hoursSpent: timeIntervalInHours)
            updateLastHour(timeSpent: timeIntervalInSecs)
        }
    }
    
    // Updates the next hour the timer will fire at
    private func updateLastHour(timeSpent: Double) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        lastHour = lastHour.addingTimeInterval(timeSpent)
        lastHourString = dateFormatter.string(from: lastHour)
    }
    
    // In case the user spent a long time with app closed and spent many hours
    private func decreaseStatistic(hoursSpent: Double) {
        healthStatistic = healthStatistic - (4 * hoursSpent)
        foodStatistic = foodStatistic - (4 * hoursSpent)
        funStatistic = funStatistic - (4 * hoursSpent)
    }
    
    // Timer will always fire every hour, so it will always decreas 4
    @objc private func decreaseStatisticThroughTimer() {
        healthStatistic = healthStatistic - 4
        foodStatistic = foodStatistic - 4
        funStatistic = funStatistic - 4
    }

}
