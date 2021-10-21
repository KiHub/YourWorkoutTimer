//
//  ViewController.swift
//  YourWorkoutTimer
//
//  Created by  Mr.Ki on 21.10.2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    var timeArray = ["10s", "20s", "30s", "40s", "50s" , "1m", "2m", "3m", "4m", "5m"]
    var repeatTimes = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    var selectedElement: String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      // var one = timeArray
       return 1
   }
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
       if pickerView.tag == 3 {
        return repeatTimes.count
       } else {
        return timeArray.count
       }
       
//        switch pickerView.tag {
//        case 1:
//            return timeArray.
//        case 2:
//            return timeArray.count
//        case 3:
//            return repeatTimes.count
//        default:
//            return 1
//        }
   }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
       if pickerView.tag == 3 {
           return repeatTimes[row]
       } else {
           return timeArray[row]
       }
   }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       //
   }
    
    
    
    @IBOutlet weak var workTextField: UITextField!
    
    @IBOutlet weak var restTextField: UITextField!
    
    @IBOutlet weak var repeatTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColors()
    
       
        choiseWorkTime()
        choiseRestTime()
        choiseRepeatTime()
        
        
        
        
        
        
    }
    
    func choiseWorkTime()  {
        let workPicker = UIPickerView()
        workPicker.delegate = self
        workTextField.inputView = workPicker
        workPicker.tag = 1
        workPicker.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
        
        
    }
    func choiseRestTime()  {
        let restPicker = UIPickerView()
        restPicker.delegate = self
        restTextField.inputView = restPicker
        restPicker.tag = 2
        
    }
    
    func choiseRepeatTime()  {
        let repeatPicker = UIPickerView()
        repeatPicker.delegate = self
        repeatTextField.inputView = repeatPicker
        repeatPicker.tag = 3
    }

    func changeColors() {
        let colorGrey = hexStringToUIColor(hex: "#B9C6D0")
        workTextField.attributedPlaceholder = NSAttributedString(string: "Work",
                                     attributes: [NSAttributedString.Key.foregroundColor: colorGrey])
        restTextField.attributedPlaceholder = NSAttributedString(string: "Rest",
                                     attributes: [NSAttributedString.Key.foregroundColor: colorGrey])
        repeatTextField.attributedPlaceholder = NSAttributedString(string: "Repeat",
                                     attributes: [NSAttributedString.Key.foregroundColor: colorGrey])
    }

    @IBAction func startButton(_ sender: UIButton) {
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

  //  extension UIViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
//     func numberOfComponents(in pickerView: UIPickerView) -> Int {
//       // var one = timeArray
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//        if pickerView.tag == 3 {
//            return repeatTimes
//        } else {
//            return timeArray
//        }
//
////        switch pickerView.tag {
////        case 1:
////            return timeArray.
////        case 2:
////            return timeArray.count
////        case 3:
////            return repeatTimes.count
////        default:
////            return 1
////        }
//    }
//
//     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        if pickerView.tag == 3 {
//            return repeatTimes[row]
//        } else {
//            return timeArray[row]
//        }
//    }
//
//     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        //
//    }

}

