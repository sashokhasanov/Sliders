//
//  ViewController.swift
//  Sliders
//
//  Created by Сашок on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    override func viewWillLayoutSubviews() {
        updateColorLabel(.red)
        updateColorLabel(.green)
        updateColorLabel(.blue)
        updateColorView()
    }

    @IBAction func redSliderMoved() {
        updateColorLabel(.red)
        updateColorView()
    }
    
    @IBAction func greenSliderMoved() {
        updateColorLabel(.green)
        updateColorView()
    }
    
    @IBAction func blueSliderMoved() {
        updateColorLabel(.blue)
        updateColorView()
    }
    
    private func updateColorLabel(_ color: Color) {
        switch color {
        case .red:
            redValueLabel.text = String(round(redSlider.value * 100) / 100)
        case .green:
            greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
        case .blue:
            blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
        }
    }
    
    private func updateColorView() {
        colorView.backgroundColor =
            UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(1.0))
    }
}

extension ViewController {
    enum Color {
        case red, green, blue
    }
}

