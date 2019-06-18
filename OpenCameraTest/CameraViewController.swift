//
//  CameraViewController.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    var myCamera : Camera!
    let Synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet var CameraImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCamera = Camera(controller: self, andImageView: CameraImg)
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        let utterance = AVSpeechUtterance(string : "얼굴 인식을 시작합니다.")
        Synthesizer.speak(utterance)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        myCamera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
        myCamera.stop()
        Synthesizer.stopSpeaking(at: .immediate)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
