//
//  ViewController.swift
//  YourWorkoutTimer
//
//  Created by  Mr.Ki on 21.10.2021.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    var timeArray = [5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    var timeArrayForWork = [5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    var repeatTimes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    

    
  
    
    
    var selectedWorkTime: Int?
    var selectedRestTime: Int?
    var selectedRepeatTime: Int?
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    
    
    @IBOutlet weak var workTextField: UITextField!
    
    @IBOutlet weak var restTextField: UITextField!
    
    @IBOutlet weak var repeatTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        startButtonOutlet.isEnabled = false
        
       
        changeColors()
    
       
        choiseWorkTime()
        choiseRestTime()
        choiseRepeatTime()
       
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
            view.addGestureRecognizer(tapGestureRecognizer)
       
        
//        if workTextField.text?.isEmpty != false  && restTextField.text?.isEmpty != false && repeatTextField.text?.isEmpty != false {
//            startButtonOutlet.isEnabled = false
//            print("yes")
//
//        } else {
//            startButtonOutlet.isEnabled = true
//            print("no")
//        }
       
        print(selectedWorkTime)
        print(selectedRestTime)
        print(selectedRepeatTime)
        
        
    }
    
//    func showStartButton() {
//        if workTextField.text != "" && restTextField.text != "" && repeatTextField.text != "" {
//            startButtonOutlet.isHidden = false
//
//        }
//    }
 
    @IBAction func startButton(_ sender: Any) {
    }
    
    func choiseWorkTime()  {
        let workPicker = UIPickerView()
        workPicker.delegate = self
        workTextField.inputView = workPicker
        workPicker.tag = 1
        workPicker.layer.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.2666666667, blue: 0.3058823529, alpha: 1)
       // workPicker.layer.cornerRadius = UIScreen.main.bounds.width / 10
        //workPicker.layer.
       // workPicker.layer.masksToBounds = false
        //workPicker.layer.shadowColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.workTextField.tintColor = .clear
        


        
    }
    
    
    func choiseRestTime()  {
        let restPicker = UIPickerView()
        restPicker.delegate = self
        restTextField.inputView = restPicker
        restPicker.tag = 2
        restPicker.layer.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.2666666667, blue: 0.3058823529, alpha: 1)
        self.restTextField.tintColor = .clear
        
        
    }
    
    func choiseRepeatTime()  {
        let repeatPicker = UIPickerView()
        repeatPicker.delegate = self
        repeatTextField.inputView = repeatPicker
        repeatPicker.tag = 3
        repeatPicker.layer.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.2666666667, blue: 0.3058823529, alpha: 1)
        self.repeatTextField.tintColor = .clear
        
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
//       if pickerView.tag == 3 {
//        return repeatTimes.count
//       } else if pickerView.tag == 2{
//        return timeArray.count
//       } else {
//        return timeArrayForWork.count
//       }
       
        switch pickerView.tag {
        case 1:
            return timeArrayForWork.count
        case 2:
            return timeArray.count
        case 3:
            return repeatTimes.count
        default:
            return 1
        }
   }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
//       if pickerView.tag == 3 {
//           return repeatTimes[row]
//       } else if pickerView.tag == 2{
//           return timeArray[row]
//       } else {
//        return timeArrayForWork[row]
//       }
        
        switch pickerView.tag {
        case 1:
            return String(timeArrayForWork[row]) + " seconds"
        case 2:
            return String(timeArray[row]) + " seconds"
        case 3:
            return String(repeatTimes[row])
        default:
            return "No data"
        }
        
        
        
   }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
                case 1:
                    selectedWorkTime = timeArrayForWork[row]
                    workTextField.text = String(selectedWorkTime!)
                    workTextField.resignFirstResponder()
                case 2:
                    selectedRestTime = timeArray[row]
                    restTextField.text = String(selectedRestTime!)
                    restTextField.resignFirstResponder()
                case 3:
                    selectedRepeatTime = repeatTimes[row]
                    repeatTextField.text = String(selectedRepeatTime!)
                    repeatTextField.resignFirstResponder()
                default:
                     return
                }
            
        if workTextField.text != ""  && restTextField.text != "" && repeatTextField.text != "" {
            startButtonOutlet.isEnabled = true
            print("yes")
            
        } else {
            startButtonOutlet.isEnabled = false
            print("no")
        }
        
        
//        if pickerView.tag == 3 {
//            selectedRepeatTime = repeatTimes[row]
//            repeatTextField.text = selectedRepeatTime
//        }  else if pickerView.tag == 2 {
//            selectedRestTime = timeArray[row]
//            restTextField.text = selectedRestTime
//        } else {
//            selectedWorkTime = timeArrayForWork[row]
//            workTextField.text = selectedRestTime
//        }
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
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tvc = segue.destination as? TimerViewController else {return}
        tvc.timerWorkDuration = selectedWorkTime!
        tvc.timerRestDuration = selectedRestTime!
        tvc.timerRepeatDuration = selectedRepeatTime!
        
        
    }
    
}

            


extension ViewController {
    func hideKeyboardWhenTappedAround() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

