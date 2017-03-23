//
//  ViewController.swift
//  iWeather
//
//  Created by Quang Bach on 3/23/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLb: UILabel!
    @IBOutlet weak var refreshBtn: UIButton!
    @IBOutlet weak var tempBtn: UIButton!
    @IBOutlet weak var quoteLB: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    
    var CF = false //theo doi nguoi dung chon do C hay do F
    
    
    var temp: Double? // luu gia tri random de chuyen doi
    
    var quote = ["Don’t wait for the perfect moment, take the moment and make it perfect.","Nothing in life is to be feared, it’s to be understood. Now is the time to understand more, so that we may fear less – Marie Curie.","What we think determines what happens to us, so if we want to change our lives, we need to stretch our minds  – Wayne Dyer."]
    
    var city = ["Ha Noi","Sai Gon","London"]
    
    var background = ["Blood","Moon","Sun"]
    
    
    @IBAction func randomButon(){
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        cityLb.text = "\(city[cityIndex])"
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))
        quoteLB.text = "\(quote[quoteIndex])"
        
        let imgIndex = Int(arc4random_uniform(UInt32(background.count)))
        bgImg.image = UIImage(named: background[imgIndex])
        
        temp = tempRandom()
        a()
        
    }
    
    @IBAction func setTempCF(){
        //neu click button CF tu false chuyen sang true va ham a so sanh, va nguoc lai
        if CF == false {
            CF = true
            a()
        } else {
            CF = false
            a()
        }
    }
    //update du lieu khi nguoi dung chon
    func a() {
        if CF == true {
            let fahrenheit = tempCF(temp: temp!)
            tempBtn.setTitle("\(Int(fahrenheit))⁰F", for: .normal)
        } else {
            tempBtn.setTitle("\(Int(temp!))⁰C", for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomButon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tempRandom() -> Double {
        return Double(Double(arc4random_uniform(18) + 14) + Double(arc4random())/Double(INT32_MAX))
    }
    //ham chuyen do C sang do F
    func tempCF(temp: Double) -> Double {
        return Double((temp * 9/5) + 32)
    }
    

}

