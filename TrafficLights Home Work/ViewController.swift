//
//  ViewController.swift
//  TrafficLights Home Work
//
//  Created by Artem H on 22.09.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var controlLightDidStart: UIButton!
    
    private var currentState = 1
    
    private lazy var lights = [redLightView, yellowLightView, greenLightView].compactMap { $0 }
    
    let colors: [(active: UIColor, inactive: UIColor)] = [
        (.red, UIColor.red.withAlphaComponent(0.5)),
        (.yellow, UIColor.yellow.withAlphaComponent(0.5)),
        (.green, UIColor.green.withAlphaComponent(0.5))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeColorsDisable()
        
        controlLightDidStart.layer.cornerRadius = 8
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeCircle()
    }
    
    private func makeColorsDisable() {
        redLightView.backgroundColor = colors[0].inactive
        yellowLightView.backgroundColor = colors[1].inactive
        greenLightView.backgroundColor = colors[2].inactive
    }
    
    private func makeCircle() {
        lights.forEach { view in
            view.layer.cornerRadius = view.frame.height / 2
        }
    }

    @IBAction func controlLightDidStart(_ sender: UIButton) {
        controlLightDidStart.setTitle("NEXT", for: .normal)
        
        switch currentState {
        case 1,2,3:
            lights[currentState - 1].backgroundColor = colors[currentState - 1].active
            lights[currentState % 3].backgroundColor = colors[currentState % 3].inactive
            lights[(currentState + 1) % 3].backgroundColor = colors[(currentState + 1) % 3].inactive
            
            currentState = currentState % 3 + 1
        default:
            break
        }
    }
    
}

