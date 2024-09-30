//
//  ColorPickerView.swift
//  
//
//  Created by Nouraiz Taimour on 30/09/2024.
//

import UIKit

/// A UIView subclass that manages the color wheel and draggable picker.
public class ColorPickerView: UIView {

    // MARK: - Properties
    public weak var delegate: ColorPickerDelegate? // Delegate for color selection
    private let colorWheelView = ColorWheelView() // Color wheel view
    private let pickerView = UIView() // Draggable picker view
    private let pickerRadius: CGFloat = 17.5 // Radius of the picker

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup
    private func setup() {
        addSubview(colorWheelView)
        colorWheelView.frame = bounds
        colorWheelView.backgroundColor = .clear

        // Configure the picker view
        pickerView.frame = CGRect(x: 0, y: 0, width: pickerRadius * 2, height: pickerRadius * 2)
        pickerView.layer.cornerRadius = pickerRadius
        pickerView.layer.borderWidth = 2.0
        pickerView.layer.borderColor = UIColor.white.cgColor
        pickerView.backgroundColor = .clear

        // Add shadow to the picker view
        pickerView.layer.shadowColor = UIColor.black.cgColor
        pickerView.layer.shadowOpacity = 0.5
        pickerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        pickerView.layer.shadowRadius = 5

        addSubview(pickerView)

        // Start the picker in the center of the color wheel
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        pickerView.center = center
    }

    // MARK: - Color Handling
    private func getColor(at point: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let dx = point.x - center.x
        let dy = point.y - center.y
        let distance = hypot(dx, dy)
        let radius = min(bounds.width, bounds.height) / 2

        // Ensure the point is within the color wheel's radius
        guard distance <= radius else {
            return UIColor.clear
        }

        var angle = atan2(dy, dx)
        if angle < 0 {
            angle += 2 * .pi
        }
        let hue = angle / (2 * .pi)
        let saturation = distance / radius

        return UIColor(hue: hue, saturation: saturation, brightness: 1.0, alpha: 1.0)
    }

    // Update the position of the picker view and notify the delegate
    private func updatePickerPosition(at point: CGPoint) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let dx = point.x - center.x
        let dy = point.y - center.y
        let distance = hypot(dx, dy)
        let radius = min(bounds.width, bounds.height) / 2

        // Ensure the picker stays within the color wheel
        let limitedDistance = min(distance, radius)

        let angle = atan2(dy, dx)
        let pickerX = center.x + cos(angle) * limitedDistance
        let pickerY = center.y + sin(angle) * limitedDistance
        pickerView.center = CGPoint(x: pickerX, y: pickerY)

        let color = getColor(at: pickerView.center)
        pickerView.backgroundColor = color // Update picker color
        delegate?.colorPicked(color) // Notify delegate
    }

    // Check if the touch point is inside the color wheel
    private func isPointInsideWheel(_ point: CGPoint) -> Bool {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let distance = hypot(point.x - center.x, point.y - center.y)
        let radius = min(bounds.width, bounds.height) / 2
        return distance <= radius
    }

    // MARK: - Touch Handling
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isPointInsideWheel(touch.location(in: self)) else { return }
        updatePickerPosition(at: touch.location(in: self))
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isPointInsideWheel(touch.location(in: self)) else { return }
        updatePickerPosition(at: touch.location(in: self))
    }
}

