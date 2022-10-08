//
//  StopwatchViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 5.10.22.
//

import UIKit

/// Stopwatch
final class StopwatchViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var stopwatchTimerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    // MARK: - Private Properties
    var stopwatch = CountTimer()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStopWatchTimerLabel()
    }
    
    // MARK: - IBAction
    
    @IBAction func startAction(_ sender: Any) {
        if stopwatch.isRunning {
            stopwatch.stopTimer()
            startButton.setTitle("Start", for: .normal)
        } else {
            stopwatch.startTimer(withTimeInterval: 0.01)
            startButton.setTitle("Stop", for: .normal)
            setupStopWatchTimerLabel()
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        stopwatch.cancelTimer()
        stopwatchTimerLabel.text = "00:00.00"
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name("currentTimeChanged"),
                                                  object: nil)
    }
    
    // MARK: - Private Methods
    private func setupStopWatchTimerLabel() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStopWatchTimerLabel),
                                               name: Notification.Name("currentTimeChanged"),
                                               object: nil)
    }
    
    @objc private func updateStopWatchTimerLabel() {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss.SS"
        stopwatchTimerLabel.text = formatter.string(from: stopwatch.currentTime)
    }
}
