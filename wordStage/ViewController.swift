//
//  ViewController.swift
//  swiftExp1
//
//  Created by khalha1j on 11/6/17.
//  Copyright © 2017 inglare. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
  

    @IBAction func btnDuck(_ sender: UIButton) {
        playWordSound(word: "duck")

    }
    
    @IBAction func btnZebra(_ sender: UIButton) {
        playWordSound(word: "zebra")

    }
    @IBAction func btnCat(_ sender: UIButton) {
        playWordSound(word: "cat")

        
    }
    @IBAction func btnDolphin(_ sender: UIButton) {
        playWordSound(word: "dolphin")
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playWordSound(word: String) -> Void {
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: word, ofType:"mp3" )!))
            
        }catch{ print(error)}
        audioPlayer.play()
    }

   
}

