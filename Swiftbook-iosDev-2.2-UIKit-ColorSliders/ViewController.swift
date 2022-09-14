//
//  ViewController.swift
//  Swiftbook-iosDev-2.2-UIKit-ColorSliders
//
//  Created by Айдар Абдуллин on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.layer.cornerRadius = 5
        colorLabel.layer.masksToBounds = true
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        alphaSlider.minimumTrackTintColor = .white
        
        setParameters(for: redSlider, greenSlider, blueSlider, alphaSlider, value: 1, min: 0, max: 255)
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        // Do any additional setup after loading the view.
    }

    @IBAction func rgbaSlider(_ sender: UISlider) {
        setColor()
        
        switch sender.tag {
        case 0: redValueLabel.text = toString(from: sender)
        case 1: greenValueLabel.text = toString(from: sender)
        case 2: blueValueLabel.text = toString(from: sender)
        case 3: alphaValueLabel.text = toString(from: sender)
        default: break
        }
    }
    
    private func setColor() {
        colorLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255,
                                             green: CGFloat(greenSlider.value) / 255,
                                             blue: CGFloat(blueSlider.value) / 255,
                                             alpha: CGFloat(alphaSlider.value))
    }
    
    private func setParameters(for sliders: UISlider..., value: Float, min: Float, max: Float) {
        sliders.forEach { slider in
            switch slider.tag {
            case 0: redSlider.set(value: value, min: min, max: max)
            case 1: greenSlider.set(value: value, min: min, max: max)
            case 2: blueSlider.set(value: value, min: min, max: max)
            case 3: alphaSlider.value = value
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
    
    private func toString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

