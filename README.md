# ColorPicker

A Swift package for selecting colors using a color wheel and a draggable picker.

## Features

- Beautiful color wheel with hue and saturation.
- Draggable picker to choose specific colors.
- Delegate support for easy integration.

## Installation

You can use this package by adding it as a dependency in your Swift project.

### Using Swift Package Manager

1. In Xcode, go to Files.
2. Select the `Add Package Dependencies` option from the list.
3. Enter the GitHub URL: `https://github.com/nouraiztee/NTColorPickerWheel`
4. Choose the version and add it to your project.

## Usage

```swift
import UIKit
import NTColorPickerWheel // Import the ColorPicker module

class ViewController: UIViewController, ColorPickerDelegate {

    let colorPicker = ColorPickerView() // Create an instance of ColorPickerView

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorPicker() // Call the setup method
    }

    private func setupColorPicker() {
        colorPicker.delegate = self // Set the delegate to handle color selection
        colorPicker.frame = CGRect(x: 50, y: 50, width: 300, height: 300) // Set the frame of the color picker
        view.addSubview(colorPicker) // Add the color picker to the view
    }

    // Implement the ColorPickerDelegate method
    func colorPicked(_ color: UIColor) {
        print("Picked color: \(color)") 
    }
}
