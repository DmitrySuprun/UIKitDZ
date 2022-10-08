//
//  CountDownTimer.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 1.10.22.
//

import Foundation

/// Provides a 1sec countdown timer
final class CountTimer {
    
    // MARK: - Public Properties
    var timeInterval = TimeInterval()
    var finishTime = Date()
    var currentTime = Date(timeIntervalSinceReferenceDate: -7200)
    var isRunning = false
    var isCountDown = false
    var timer = Timer()
    
    // MARK: - Init
    init(isCountDown: Bool = false) {
        if isCountDown {
            self.isCountDown = isCountDown
        }
    }
    
    // MARK: - Objc Private Properties
    @objc private func updateCountTimeValue() {
        NotificationCenter.default.post(Notification(name: Notification.Name("currentTimeChanged")))
        if currentTime == finishTime {
            stopTimer()
        }
        currentTime = isCountDown ? currentTime - timeInterval : currentTime + timeInterval
    }

    // MARK: - Public Properties
    
    func startTimer(withTimeInterval: TimeInterval) {
        if isCountDown {
            timeInterval = 1
            finishTime = currentTime
            currentTime += withTimeInterval
        } else {
            timeInterval = withTimeInterval
        }
        timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                         target: self,
                                         selector: #selector(updateCountTimeValue),
                                         userInfo: nil, repeats: true)
        timer.fire()
        isRunning = true
    }
    
    func stopTimer() {
        timer.invalidate()
        isRunning = false
    }
    
    func cancelTimer() {
        timer.invalidate()
        isRunning = false
        currentTime = Date(timeIntervalSinceReferenceDate: -7200)
    }
}
