//
//  ReserveViewController.swift
//  YourWorkoutTimer
//
//  Created by  Mr.Ki on 26.10.2021.
//

import UIKit

class ReserveViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    let shapeLayerRest = CAShapeLayer()
    
    var timerWork: Timer?
    var timerRest: Timer?
    
    var timerWorkDuration: UInt = 10
    var timerRestDuration: UInt = 5
    var timerRepeatDuration: UInt = 5
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        // create track layer
        let trackLayer = CAShapeLayer()
        
        timerLabel.text = String(timerWorkDuration)
        
       
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100,
                                        startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = #colorLiteral(red: 0.2437945306, green: 0.3365195096, blue: 0.3791738749, alpha: 0.8470588235)
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
       
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.6520697474, green: 0.7128807902, blue: 0.7406589985, alpha: 0.8470588235)
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
    
        
        shapeLayerRest.path = circularPath.cgPath
        shapeLayerRest.strokeColor = #colorLiteral(red: 0.5759513827, green: 0.869291321, blue: 0.7406589985, alpha: 0.8482360495)
        shapeLayerRest.lineWidth = 20
        shapeLayerRest.strokeEnd = 0
        shapeLayerRest.fillColor = UIColor.clear.cgColor
        shapeLayerRest.lineCap = .round
        view.layer.addSublayer(shapeLayerRest)
        
        
        view.addSubview(timerLabel)
        timerLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        timerLabel.center = view.center
        
        
        timerWork = Timer()
        
        timerLogic()
        
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        timerWork?.invalidate()
        timerRest?.invalidate()
        
    }
    
 
    func timerLogic() {
        print("Repeat",timerRepeatDuration)
        
        while timerRepeatDuration != 0 {
            timerWork = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            basicAnimation.toValue = 1
            basicAnimation.duration = CFTimeInterval(timerWorkDuration)
            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            basicAnimation.isRemovedOnCompletion = false
            shapeLayer.add(basicAnimation, forKey: "urSoBasic")
            
            timerRepeatDuration -= 1
            print("Repeat",timerRepeatDuration)

//            if <#condition#> {
//                <#statements#>
//            } else {
//                <#statements#>
//            }
            
        }
//        } else {
//            dismiss(animated: true)
//        }
        
       
        
        
        
//        while timerRepeatDuration > 0 {
//            timerWork = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//            basicAnimation.toValue = 1
//            basicAnimation.duration = CFTimeInterval(timerWorkDuration)
//            basicAnimation.fillMode = CAMediaTimingFillMode.forwards
//            basicAnimation.isRemovedOnCompletion = false
//            shapeLayer.add(basicAnimation, forKey: "urSoBasic")
//
//
//
//
//
//            timerRepeatDuration -= 1
//        }
            
           
        
    }
    
    

    
//    @objc private func handleTap() {
//        print("Hello")
//
//
//    }
        @objc func timerAction() {
            
            timerWorkDuration -= 1
            timerLabel.text = "\(timerWorkDuration)"
            print(timerWorkDuration)
            
            if timerWorkDuration == 0 {
                timerWork?.invalidate()
               // timerLabel.text = "􀷝"
                timerWork = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerActionRest), userInfo: nil, repeats: true)
                
                let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
              //  basicAnimation.fromValue = timerWorkDuration
                basicAnimation.toValue = 1
                basicAnimation.duration = CFTimeInterval(timerRestDuration)
                basicAnimation.fillMode = CAMediaTimingFillMode.forwards
                basicAnimation.isRemovedOnCompletion = false
                shapeLayerRest.add(basicAnimation, forKey: "urSoBasic")
                if timerRestDuration == 0 {
                    shapeLayerRest.isHidden = true
                    //timerLogic()
                }
                
                
            }
            
        }
    
    @objc func timerActionRest() {
        
        timerRestDuration -= 1
        timerLabel.text = "\(timerRestDuration)"
        print(timerRestDuration)
        
        if timerRestDuration == 0 {
            timerRest?.invalidate()
            timerLabel.text = "Done!"
            timerWork?.invalidate()
            dismiss(animated: true)
            
        }
        
    }
  
}
