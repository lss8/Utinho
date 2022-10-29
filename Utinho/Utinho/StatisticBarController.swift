//
//  HealthController.swift
//  Utinho
//
//  Created by lrsv on 28/10/22.
//

import Foundation

class StatisticBarController: ObservableObject {
    @Published var statistic: Double = 100
    var timer: Timer
    var lastHour = Date()
    
    init(statistic: Double = 100, timer: Timer, lastHour: Date = Date()) {
        self.statistic = statistic
        self.timer = timer
        self.lastHour = lastHour
    }
    
    func runTimer() {
        if (timer.isValid) {
            timer.invalidate();
        }
        checkIntervalSinceLastLaunch()
        timer = Timer(fireAt: lastHour, interval: 0, target: self, selector: #selector(decreaseStatistic), userInfo: nil, repeats: true)
    }
    
    private func checkIntervalSinceLastLaunch() {
        let timeIntervalSinceLastLaunch = lastHour.timeIntervalSinceNow;
        let hoursSinceLastLaunch = floor(timeIntervalSinceLastLaunch/3600)
        if (hoursSinceLastLaunch != 0) {
            decreaseStatistic(hoursSpent: hoursSinceLastLaunch)
            updateLastHour(hoursSpent: hoursSinceLastLaunch)
        }
    }
    
    private func updateLastHour(hoursSpent: Double) {
        lastHour = lastHour.addingTimeInterval(hoursSpent)
    } 
    
    @objc private func decreaseStatistic(hoursSpent: Double) {
        statistic = statistic - (4 * hoursSpent);
    }

}
