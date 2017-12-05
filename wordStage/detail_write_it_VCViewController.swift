//
//  detail_write_it_VCViewController.swift
//  swiftExp1
//
//  Created by khalha1j on 11/11/17.
//  Copyright © 2017 inglare. All rights reserved.
//

import UIKit
import AVFoundation

class detail_write_it_VCViewController: UIViewController {
    var audioPlayer:AVAudioPlayer?
    let duration = 16.0
    let cloud3_x = [320,30,210,140,50,180,300,40]
    var isMp3Playing = false
    @IBOutlet var cloud6: UIImageView!
    @IBOutlet var cloud5: UIImageView!
    @IBOutlet var cloud3: UIImageView!
    @IBOutlet var cloud2: UIImageView!
    @IBOutlet var cloud4: UIImageView!
    @IBOutlet var cloud1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.moveOut(finished: true)
    }
    
    func moveIn(finished: Bool) {
        UIView.animate(withDuration: self.duration, delay: 0, options: [.curveEaseInOut], animations: {   //self.cloud3.alpha = 1
            self.cloud6.center.x =  CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud5.center.x =  CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud4.center.x =  CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud3.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
//CGFloat(arc4random_uniform(40))
            self.cloud2.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud1.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            
            //self.cloud3.center.y = 70
            //self.cloud4.center.y = 50

            } , completion: self.moveOut)
    }
    
    func moveOut(finished: Bool) {
        UIView.animate(withDuration: self.duration, delay: 0, options: [.curveEaseInOut], animations: {   //self.cloud3.alpha = 0.8
            self.cloud6.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])

            self.cloud5.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud4.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud3.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud2.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])
            self.cloud1.center.x = CGFloat( self.cloud3_x[Int(arc4random_uniform(UInt32(self.cloud3_x.count)))])


           // self.cloud3.center.y = 60
           // self.cloud4.center.y = CGFloat(arc4random_uniform(40))

        } , completion: self.moveIn)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet var grass_draggable: UIImageView!
    
    @IBOutlet var grass_view: UIView!
    
    @IBOutlet var sun_img_view: UIImageView!
    
    @IBOutlet var grass_gesture_recognzer: UIPanGestureRecognizer!
    
    @IBOutlet var sun_gesture_recognizer: UIPanGestureRecognizer!
    @IBOutlet var lbl_drag_loc: UILabel!
    
    

    @IBOutlet var sun_view: UIView!
    
    
    @IBAction func sun_was_dragged(_ sender: UIPanGestureRecognizer) {
        let x_before_translation = sender.view!.center.x
        let y_before_translation = sender.view!.center.y

        let translation = sender.translation(in: sun_view)
        sender.view?.center = CGPoint(x: sender.view!.center.x + translation.x, y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)

        let x_after_translation = sender.view!.center.x
        let y_after_translation = sender.view!.center.y

        //self.lbl_drag_loc.text = " < 200"
        //print("***   200   ***")
        
        UIView.animate(withDuration: 1, delay:0, options: .curveEaseOut, animations:{
            self.cloud2.center.x = (sender.view?.center.x)!
            
        } )
        
        if y_before_translation < y_after_translation && y_after_translation >= 260 {
            UIView.animate(withDuration: 1, delay:0, options: .curveEaseOut, animations:{
                //if self.view.backgroundColor == UIColor.white{
                    self.view.backgroundColor = UIColor.black
                    sender.view?.alpha = 0.4
                //}
                
            } )
        }
        else if y_before_translation > y_after_translation && y_after_translation < 260{
            UIView.animate(withDuration: 1, delay:0, options: .curveEaseOut, animations:{
               // if self.view.backgroundColor == UIColor.black{
                    self.view.backgroundColor = UIColor.white
                    sender.view?.alpha = 1.0
               // }
                
            } )
        }
        
        
    }
    
    @IBOutlet var btnClearDraw: UIButton!
    
    @IBOutlet var drawView: DrawView!
    @IBAction func btnClearDrawTUI(_ sender: UIButton) {
        //drawView.draw(CGRect(x:0,y:0, width: 400, height: 200))
       let rect = CGRect(x: 10,y: 10,width: 20,height: 20)
        
        let image = UIImage(view: drawView)
        
        ///WORK HERE
        //drawView.lineArray[0]
        //drawView.lineArray[1]
        
        
        
        drawView.backgroundColor = UIColor.black
        
        drawView.eraseAll = !drawView.eraseAll
        drawView.setNeedsDisplay()
        drawView.draw(rect)
        //drawView.isOpaque = !drawView.isOpaque
        
    }
    @IBAction func grass_was_dragged(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: grass_view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)

            //self.lbl_drag_loc.text = " < 200"
            //print("***   200   ***")
            UIView.animate(withDuration: 1, delay:0, options: .curveEaseOut, animations:{
                self.cloud3.center.x = (sender.view?.center.x)!
                
            } )
        

        lbl_drag_loc.text = "x:\(Int(sender.view!.center.x)) , y:\(Int(sender.view!.center.y))"
      
        
        if ((sender.view?.center.x)! > CGFloat(170) &&  (sender.view?.center.x)! < CGFloat(245)) && ((sender.view?.center.y)! > CGFloat(270) &&  (sender.view?.center.y)! < CGFloat(305))
        {
            playWordSound(word: "zebra_eats_grass_stmt")
            UIView.animate(withDuration: 10, delay:0, options: .curveEaseOut, animations:{
                if self.grass_draggable.frame.size.width > 35
                {
                    self.grass_draggable.frame.size.width  = 30
                    self.grass_draggable.frame.size.height = 30
                }
            } )
            
        }else{
            StopPlaying()
            UIView.animate(withDuration: 10, delay:0, options: .curveEaseOut, animations:{
                if self.grass_draggable.frame.size.width < 110
                {
                    self.grass_draggable.frame.size.width  = 100
                    self.grass_draggable.frame.size.height = 100
                }
                
            } )
        }
    }
    @IBAction func zebra_write_it(_ sender: UIButton) {
        
        playWordSound(word: "zebraEdit1")
    }
    
    func playWordSound(word: String) -> Void {
        do{
            if self.audioPlayer == nil
            {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: word, ofType:"mp3" )!))
            }
            if !((audioPlayer?.url?.pathComponents[7].contains("eat"))!) || !word.contains("eat")
            {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: word, ofType:"mp3" )!))

            }
            
        }catch{ print(error)}
        audioPlayer?.play()
    }
    func StopPlaying() -> Void {

        audioPlayer?.stop()
        
    }
}

