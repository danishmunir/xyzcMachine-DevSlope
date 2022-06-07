//
//  ViewController.swift
//  xyzMachineOrientation
//
//  Created by Danish Munir on 22/05/2022.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbL: UILabel!
    
    var motionManager: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLbls)
    }


    func updateLbls(data: CMAccelerometerData?, error: Error?)
    {
        guard let data = data else {
            return
        }
        print(data)
        
        //Formatter for better understanding
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: data.acceleration.x)!
        let y = formatter.string(for: data.acceleration.y)!
        let z = formatter.string(for: data.acceleration.z)!
        
        print(x, y, z)
        xLbl.text = "x: \(x)"
        yLbl.text = "y: \(y)"
        zLbL.text = "z: \(z)"
    }
}

