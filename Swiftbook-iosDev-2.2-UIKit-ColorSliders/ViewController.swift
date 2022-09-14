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
        
        redSlider.value = 1
        redSlider.minimumValue = 1
        redSlider.maximumValue = 255
        greenSlider.value = 1
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 255
        blueSlider.value = 1
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 255
        alphaSlider.value = 1
        // Do any additional setup after loading the view.
    }

    @IBAction func redSlider(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        colorLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: CGFloat(alphaSlider.value))
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        colorLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: CGFloat(alphaSlider.value))
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        colorLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: CGFloat(alphaSlider.value))
    }
    @IBAction func alphaSlider(_ sender: UISlider) {
        alphaValueLabel.text = String(format: "%.2f", alphaSlider.value)
        colorLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: CGFloat(alphaSlider.value))
    }
    
}

