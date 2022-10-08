//
//  TimerViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 1.10.22.
//

import UIKit

/// Countdown TimerViewController
final class TimerViewController: UIViewController {
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var timerFaceButton: UIButton!
    @IBOutlet private weak var countDownPicker: UIPickerView!
    @IBOutlet private weak var hoursLabel: UILabel!
    @IBOutlet private weak var minLabel: UILabel!
    @IBOutlet private weak var secLabel: UILabel!
    
    // MARK: - Private Properties
    private let countDownTimer = CountTimer(isCountDown: true)
    private var timeInterval = 0.0
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private IBAction
    @IBAction private func startTimerAction(_ sender: Any) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateUIAction),
                                               name: Notification.Name("currentTimeChanged"),
                                               object: nil)
        if timerFaceButton.isHidden {
            viewsIsHiddenToggle()
        }
        if countDownTimer.isRunning {
            countDownTimer.stopTimer()
            timeInterval = countDownTimer.currentTime.timeIntervalSince(countDownTimer.finishTime)
            pauseAnimation()
        } else {
            countDownTimer.startTimer(withTimeInterval: timeInterval)
            animation(duration: timeInterval)
            resumeAnimation()
        }
        
    }
    
    @IBAction private func stopTimerAction(_ sender: Any) {
        countDownTimer.stopTimer()
        viewsIsHiddenToggle()
        NotificationCenter.default.removeObserver(self, name: Notification.Name("timerDateChanged"), object: nil)
    }
    
    // MARK: - Objc Private Methods
    @objc private func updateUIAction() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        timerFaceButton.setTitle(formatter.string(from: countDownTimer.currentTime), for: .normal)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        timerFaceButton.isHidden = true
        setupCountDownPicker()
    }
    
    private func setupCountDownPicker() {
        countDownPicker.delegate = self
        countDownPicker.dataSource = self
    }
    
    private func viewsIsHiddenToggle() {
        countDownPicker.isHidden.toggle()
        timerFaceButton.isHidden.toggle()
        hoursLabel.isHidden.toggle()
        minLabel.isHidden.toggle()
        secLabel.isHidden.toggle()
    }
    
    // MARK: - Stroke Animation
    private func animation(duration: TimeInterval) {
        let layer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 165, y: 165),
                                      radius: CGFloat(161),
                                      startAngle: CGFloat(-Double.pi / 2),
                                      endAngle: CGFloat(Double.pi * 3 / 2),
                                      clockwise: true)
        layer.path = circlePath.cgPath
        layer.lineWidth = 6
        layer.strokeColor = UIColor.systemOrange.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeStart = 0
        layer.strokeEnd = 1
        layer.lineCap = .round
        
        timerFaceButton.layer.addSublayer(layer)
        
        let strokeAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        strokeAnimation.duration = duration
        strokeAnimation.fromValue = 1
        strokeAnimation.toValue = 0
        layer.add(strokeAnimation, forKey: nil)
    }
    
    private func pauseAnimation() {
        timerFaceButton.layer.sublayers?.forEach({ layer in
            let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
            layer.speed = 0.0
            layer.timeOffset = pausedTime
        })
    }
    
    private func resumeAnimation() {
        timerFaceButton.layer.sublayers?.forEach({ layer in
            let pausedTime = layer.timeOffset
            layer.speed = 1.0
            layer.timeOffset = 0.0
            layer.beginTime = 0.0
            let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            layer.beginTime = timeSincePause
        })
    }
}

// MARK: - Extension UIPickerViewDelegate
extension TimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0: return 50
        case 1: return 100
        case 2: return 75
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hours = TimeInterval(countDownPicker.selectedRow(inComponent: 0))
        let min = TimeInterval(countDownPicker.selectedRow(inComponent: 1))
        let sec = TimeInterval(countDownPicker.selectedRow(inComponent: 2))
        timeInterval = (hours * 60 * 60) + (min * 60) + sec
    }
}

// MARK: - Extension UIPickerViewDataSource
extension TimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return 24
        default: return 60
        }
    }
}
