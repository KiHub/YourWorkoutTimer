//
//  TimerViewController.swift
//  YourWorkoutTimer
//
//  Created by  Mr.Ki on 22.10.2021.
//

import UIKit

class TimerViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100,
                                        startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.6520697474, green: 0.7128807902, blue: 0.7406589985, alpha: 0.8470588235)
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = #colorLiteral(red: 0.1882352941, green: 0.2666666667, blue: 0.3058823529, alpha: 1)
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

        
    }
    
    @objc private func handleTap() {
        print("Hello")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
       
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
  
}
}
