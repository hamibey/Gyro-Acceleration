//
//  ViewController.swift
//  gyro
//
//  Created by Hami on 20.10.2023.
//

import CoreMotion
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gyrox: UILabel!
    @IBOutlet var gyroy: UILabel!
    @IBOutlet var gyroz: UILabel!
    @IBOutlet var accel: UILabel!
    
    var motion = CMMotionManager()
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGyro()
        myAccel()
        
        }
    
    func myGyro(){
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let trueData = data{
                self.gyrox.text = "\(trueData.rotationRate.x)"
                self.gyroy.text = "\(trueData.rotationRate.y)"
                self.gyroz.text = "\(trueData.rotationRate.z)"
            }
        }
    }
    
    func myAccel(){
        
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {(data, error) in
            
            if let myData = data{
                self.accel.text = "\(myData.acceleration.x)"
            }
        }
        
    }
        
        
           
    
}
