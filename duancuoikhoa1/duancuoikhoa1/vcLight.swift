//
//  vcLight.swift
//  duancuoikhoa1
//
//  Created by huy bin on 17/8/24.
//

import UIKit

class vcLight: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var color: UIColorWell!
    @IBOutlet var `switch`: UISwitch!
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 1.0
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        color.addTarget(self, action: #selector(colorChanged(_:)), for: .valueChanged)
        updateUI()    }
    fileprivate func updateUI() {}
    @objc func colorChanged(_ sender: UIColorWell) {
            view.backgroundColor = sender.selectedColor
        }
    @objc func sliderValueChanged(_ sender: UISlider) {
            let brightnessValue = CGFloat(sender.value)
            view.alpha = brightnessValue
        }
    @IBAction func `switch`(_ sender: UISwitch) {
        lightOn.toggle()
        if lightOn {
            view.backgroundColor = .white    }
        else {
            view.backgroundColor = .black    }
        
    }
   

}
