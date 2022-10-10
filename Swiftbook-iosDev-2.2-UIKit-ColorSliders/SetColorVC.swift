//
//  ViewController.swift
//  Swiftbook-iosDev-2.2-UIKit-ColorSliders
//
//  Created by Айдар Абдуллин on 14.09.2022.
//

import UIKit

protocol SetColorVCDelegate: AnyObject {
    func safeUIColor(color: UIColor)
}

class SetColorVC: UIViewController {
    
    //MARK: IB Outlets
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var alphaTextField: UITextField!
    
    //MARK: Properties
    weak var delegate: SetColorVCDelegate?
    var backgroundColor: UIColor?
    
    var backgroundColorComponent: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let r = (backgroundColor?.cgColor.components?[0] ?? 1)
        let g = (backgroundColor?.cgColor.components?[1] ?? 1)
        let b = (backgroundColor?.cgColor.components?[2] ?? 1)
        let a = (backgroundColor?.cgColor.components?[3] ?? 1)
        return (r: r, g: g, b: b, a: a)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.layer.cornerRadius = 5
        colorLabel.layer.masksToBounds = true
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setParameters(for: redSlider, greenSlider, blueSlider, alphaSlider, min: 0, max: 255)
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redTextField, greenTextField, blueTextField, alphaTextField)
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

//    redTextField.addTarget(self, action: #selector(SetColorVC.textFieldDidChange(), for: .editingChanged)
    
    
    //MARK: IB Actions
    @IBAction func rgbaSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0:
            setValue(for: redValueLabel)
            setValue(for: redTextField)
        case 1:
            setValue(for: greenValueLabel)
            setValue(for: greenTextField)
        case 2:
            setValue(for: blueValueLabel)
            setValue(for: blueTextField)
        case 3:
            setValue(for: alphaValueLabel)
            setValue(for: alphaTextField)
        default: break
        }
    }
    
    @IBAction func textField(_ sender: UITextField) {
        guard let text = sender.text else { return }
        guard var number = Float(text) else {
            alert(title: "Error", message: "Input a number from 0 to 255", style: .alert)
            return
        }
        if number > 255 {
            number = 255
            sender.text = String(255)
        }
        switch sender.tag {
        case 0:
            redSlider.setValue(number, animated: true)
            setValue(for: redValueLabel)
        case 1:
            greenSlider.setValue(number, animated: true)
            setValue(for: greenValueLabel)
        case 2:
            blueSlider.setValue(number, animated: true)
            setValue(for: blueValueLabel)
        case 3:
            alphaSlider.setValue(number, animated: true)
            setValue(for: alphaValueLabel)
        default: break
        }
    }
    
    @IBAction func doneButton() {
        delegate?.safeUIColor(color: colorLabel.backgroundColor!)
        dismiss(animated: true)
    }
    
    @IBAction func unwindToSet(segue: UIStoryboardSegue) {
    }
    
    //MARK: Private func
    private func setColor() {
        colorLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255,
                                             green: CGFloat(greenSlider.value) / 255,
                                             blue: CGFloat(blueSlider.value) / 255,
                                             alpha: CGFloat(alphaSlider.value))
    }
    
    private func setParameters(for sliders: UISlider..., min: Float, max: Float) {
        sliders.forEach { slider in
            switch slider.tag {
            case 0: redSlider.setValue(Float(backgroundColorComponent.r) * 255, animated: true)
            case 1: greenSlider.setValue(Float(backgroundColorComponent.g) * 255, animated: true)
            case 2: blueSlider.setValue(Float(backgroundColorComponent.b) * 255, animated: true)
            case 3: alphaSlider.setValue(Float(backgroundColorComponent.a), animated: true)
            default: break
            }
        }
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redValueLabel.text = toString(from: redSlider)
            case 1: greenValueLabel.text = toString(from: greenSlider)
            case 2: blueValueLabel.text = toString(from: blueSlider)
            case 3: alphaValueLabel.text = toString(from: alphaSlider)
            default: break
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redTextField.text = Int(redSlider.value).description
            case 1: greenTextField.text = Int(greenSlider.value).description
            case 2: blueTextField.text = Int(blueSlider.value).description
            case 3: alphaTextField.text = toString(from: alphaSlider)
            default: break
            }
        }
    }
    
    private func toString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(actionOK)
        self.present(alertController, animated: true)
    }
                           
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        guard let text = textField.text else { return }
//
//        if let currentValue = Float(text) , 0...255 ~= currentValue {
//            switch textField.tag {
//            case 0:
//                redSlider.setValue(currentValue, animated: true)
//
//            case 1:
//            case 2:
//            case 3:
//            default: break
//            }
//        }
//    }
}
