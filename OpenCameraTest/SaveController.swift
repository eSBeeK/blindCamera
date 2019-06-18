//
//  SaveController.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 17/06/2019.
//  Copyright © 2019 none. All rights reserved.
//
import UIKit
import AVFoundation

class SaveController: UIViewController {
    
    var myCamera:Camera!
    

    
    @IBAction func ChangeSwip(_ sender: Any) {
        if(myCamera.backCamera){
            myCamera.stop()
            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string : "현재, 전면카메라입니다.")
            
            utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
            synthesizer.speak(utterance)
        }else{
            myCamera.start()
            let synthesizer = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string : "현재, 후면카메라입니다.")
            
            utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
            synthesizer.speak(utterance)
        }
    }
        //frontCamera = FrontCamera(controller: self, andImageView: SaveImgView)
  
    
//    @IBAction func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
//        if (gestureRecognizer.state == .ended) {
//
//        }
//    }

    @IBOutlet var SaveImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myCamera = Camera(controller: self, andImageView: SaveImgView)
        
        // Do any additional setup after loading the view.
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string : "현재, 후면카메라입니다. 메인화면으로 가시려면  오른쪽으로 스와이프를, 전/후면 카메라 변경은 왼쪽으로 스와이프 해주십시오.")
        
        utterance.voice = AVSpeechSynthesisVoice (language: "ko_KR")
        synthesizer.speak(utterance)
    }
    

    override func viewDidAppear(_ animated: Bool) {
        myCamera.start()
    }
    
    // Stop it when it disappears
    override func viewWillDisappear(_ animated: Bool) {
        myCamera.stop()
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
