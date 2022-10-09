//
//  ColoredViewController.swift
//  Swiftbook-iosDev-2.2-UIKit-ColorSliders
//
//  Created by Айдар Абдуллин on 05.10.2022.
//

import UIKit

class ColoredVC: UIViewController {
    
    private var backgroundColor: UIColor = .systemGray
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SetColorVC {
            vc.delegate = self
            vc.backgroundColor = backgroundColor
        }
    }
    
    @IBAction func editingButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "setColorSegue", sender: nil)
    }
}

extension ColoredVC: SetColorVCDelegate {
    func safeUIColor(color: UIColor) {
        view.backgroundColor = color
        backgroundColor = color
    }
}
