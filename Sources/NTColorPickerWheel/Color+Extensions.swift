//
//  Color+Extensions.swift
//  
//
//  Created by Nouraiz Taimour on 30/09/2024.
//

import UIKit

// MARK: - UIColor Extension for HSBA
extension UIColor {
    var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

        return (hue, saturation, brightness, alpha)
    }
}

