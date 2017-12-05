//
//  ViewController.swift
//  SwiftExample
//
//  Created by Nick Lockwood on 30/07/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//
import UIKit

class Carousel_Main_ViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
    var items: [Int] = []
    @IBOutlet var carouselView: iCarousel!
    var selectedIndex : Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0 ... 99 {
            items.append(i)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.type = .coverFlow2
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    
        var label: UILabel
        var itemView: UIImageView
        
        //reuse view if available, otherwise create a new view
        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
            label = itemView.viewWithTag(1) as! UILabel
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            
            switch(index)
            {
            case 1:
                itemView.image = UIImage(named: "zebra.png")
            case 2:
                itemView.image = UIImage(named: "dock.png")
            case 3:
                itemView.image = UIImage(named: "dolphin.png")
            case 4:
                itemView.image = UIImage(named: "cat.png")
            default:
                itemView.image = UIImage(named: "page.png")

            }
            
            
            itemView.contentMode = .center
            
            label = UILabel(frame: itemView.bounds)
            label.backgroundColor = .clear
            label.textAlignment = .center
            
            label.font = label.font.withSize(50)
            label.tag = 1
            
            var tempImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            tempImg.image = UIImage(named: "zebra.png")

            itemView.addSubview(tempImg)
            itemView.addSubview(label)

            
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        if(carousel.currentItemIndex == 1){
           label.text = "\(items[index])"
        }
        //(view as! UIImageView!).image = self.pictures[index]

        return itemView
        
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        selectedIndex = index
        //self .performSegue(withIdentifier: "imageDisplaySegue", sender: nil)
        
        if index == 1 {//zebra
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "detailSeg", sender: nil)
            }
        }
        else if index == 2 {//duck
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "duckSeg", sender: nil)
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSeg"{
            if let nextViewController = segue.destination as? detail_write_it_VCViewController{
                //nextViewController.valueOfxyz = "XYZ" //Or pass any values
                //nextViewController.valueOf123 = 123
                
            }
        }
        else if segue.identifier == "duckSeg"{
            if let nextViewController = segue.destination as? detail_write_it_VCViewController{
                //nextViewController.valueOfxyz = "XYZ" //Or pass any values
                //nextViewController.valueOf123 = 123
                
            }
        }
    }

    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
}

