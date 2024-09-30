//
//  ColorPickerDelegate.swift
//  
//
//  Created by Nouraiz Taimour on 30/09/2024.
//

import UIKit

/// Protocol to notify about the selected color.
public protocol ColorPickerDelegate: AnyObject {
    func colorPicked(_ color: UIColor)
}

