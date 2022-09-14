//
//  Extensions.swift
//  Swiftbook-iosDev-2.2-UIKit-ColorSliders
//
//  Created by Айдар Абдуллин on 14.09.2022.
//

import UIKit

extension UISlider {
    func set(value: Float, min: Float, max: Float) {
        self.value = value
        self.minimumValue = min
        self.maximumValue = max
    }
}
