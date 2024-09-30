# ColorPicker

A Swift package for selecting colors using a color wheel and a draggable picker.

## Features

- Beautiful color wheel with hue and saturation selection.
- Draggable picker to choose specific colors.
- Delegate support for easy integration.

## Installation

You can use this package by adding it as a dependency in your Swift project.

### Using Swift Package Manager

1. In Xcode, go to your project settings.
2. Select the `Package Dependencies` tab.
3. Click the `+` button to add a package.
4. Enter the GitHub URL: `https://github.com/nouraiztee/NTColorPickerWheel`
5. Choose the version and add it to your project.

## Usage

```swift
import ColorPicker

class ViewController: UIViewController, ColorPickerDelegate {
    let colorPicker = ColorPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorPicker()
    }

    private func setupColorPicker() {
        colorPicker.delegate = self
        colorPicker.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        view.addSubview(colorPicker)
    }

    func colorPicked(_ color: UIColor) {
        print("Picked color: \(color)")
        view.backgroundColor = color
    }
}
