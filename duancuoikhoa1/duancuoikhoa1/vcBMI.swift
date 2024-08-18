//
//  vcBMI.swift
//  duancuoikhoa1
//
//  Created by huy bin on 16/8/24.
//

import UIKit

class vcBMI: UIViewController {
    @IBOutlet var heightText: UITextField!
    @IBOutlet var weightText: UITextField!
    @IBOutlet var bmiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateBMIBtn(_ sender: UIButton) {
        guard let heightText = heightText.text,
              let weightText = weightText.text,
              let height = Double(heightText), height > 0,
              let weight = Double(weightText), weight > 0 else {
            bmiLabel.text = "Vui lòng nhập đúng chiều cao và cân nặng hợp lệ"
            return
        }
        
        let bmiResult = weight / (height * height)
        var bmiCategory = ""
        
        switch bmiResult {
        case ..<18.5:
            bmiCategory = "Thiếu cân"
        case 18.5..<24.9:
            bmiCategory = "Bình thường"
        case 25.0..<29.9:
            bmiCategory = "Thừa cân"
        case 30.0..<34.9:
            bmiCategory = "Béo phì cấp độ 1"
        case 35.0..<39.9:
            bmiCategory = "Béo phì cấp độ 2"
        default:
            bmiCategory = "Béo phì cấp độ 3"
        }
        
        bmiLabel.text = String(format: "Chỉ số BMI của bạn là %.2f (%@)", bmiResult, bmiCategory)
    }

}
