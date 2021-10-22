//
//  TimerViewController.swift
//  YourWorkoutTimer
//
//  Created by  Mr.Ki on 22.10.2021.
//

import UIKit

class TimerViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    
    //var pulsatingLayer: CAShapeLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        // create track layer
        let trackLayer = CAShapeLayer()
        
        let pulsatingLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100,
                                        startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 0.2437945306, green: 0.3365195096, blue: 0.3791738749, alpha: 0.8470588235)
        trackLayer.lineWidth = 10
       // trackLayer.strokeEnd = 0
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
        trackLayer.position = view.center
        
       // pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.fillColor = UIColor.yellow.cgColor
        pulsatingLayer.lineCap = .round
        pulsatingLayer.position = view.center
        view.layer.addSublayer(pulsatingLayer)
        
//        let circularPath = UIBezierPath(arcCenter: center, radius: 100,
//                                        startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.6520697474, green: 0.7128807902, blue: 0.7406589985, alpha: 0.8470588235)
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
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
