//
//  CountDownTimer.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 1.10.22.
//

import Foundation

/// Provides a 1sec countdown timer
final class CountDownTimer {
    
    // MARK: - Public Properties
    let timeInterval = TimeInterval(1)
    var startDate = Date(timeIntervalSinceReferenceDate: -7200)
    var finishDate = Date()
    var isFinished = false
    var timer = Timer()
    
    // MARK: - Objc Properties
    @objc func updateCountDownValue() {
        NotificationCenter.default.post(Notification(name: Notification.Name("timerDateChanged")))
        if startDate == finishDate {
            stopTimer()
        }
        startDate -= timeInterval
    }

    // MARK: - Private Properties
    
    func startTimer(_ withTimeInterval: TimeInterval) {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCountDownValue),
                                     userInfo: nil, repeats: true)
        finishDate = startDate
        startDate += withTimeInterval
        timer.fire()
    }
    
    func stopTimer() {
        timer.invalidate()
    }
}
