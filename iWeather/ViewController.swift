//
//  ViewController.swift
//  iWeather
//
//  Created by admin on 10/14/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblQuotes: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var lblFahrenheit: UILabel!
    
    var isTemp: Bool = false

    var city = ["Ha Noi","Ho Chi Minh","Da Nang","Nam Dinh"]
    
    var quotes = ["Cham chi va ky luat se dua ban den moi thanh cong","Moi nguoi khong quyet dinh tuong lai cua ho. Ho quyet dinh nhung thoi quen va thoi quen quyet dinh tuong lai cua ho.","Hoc, Hoc nua, Hoc mai"]
    
    var backgroundImage = ["Blood","Moon","Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionRefresh(_ sender: UIButton) {
        getTemp()
        let bgIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        bgImage.image = UIImage.init(named: backgroundImage[bgIndex])
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lblCity.text = city[cityIndex]
        
        let quotesIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lblQuotes.text = quotes[quotesIndex]
    }
    
    func setRandomTemp() -> Double {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
    
    func getTemp() -> Void {
        let randomNumber = String(format: "%2.1f", setRandomTemp())
        print(randomNumber)
        print(isTemp)
        
        if isTemp == false {
            lblTemp.text = String(format: "%2.1f", Double(randomNumber)!)
        } else {
            lblTemp.text = String(format: "%2.1f", convertTemp(isTemp: false, temp: Double(randomNumber)!))
        }
    }
    
    @IBAction func actionChange(_ sender: UIButton) {
        if isTemp == false {
            lblFahrenheit.text = "F"
            lblTemp.text = String(format: "%2.1f", convertTemp(isTemp: isTemp, temp: Double(lblTemp.text!)!))
            isTemp = true
        } else {
            lblFahrenheit.text = "C"
            lblTemp.text = String(format: "%2.1f", convertTemp(isTemp: isTemp, temp: Double(lblTemp.text!)!))
            isTemp = false
        }
        
    }
    
    func convertTemp(isTemp: Bool, temp: Double) -> Double {
        var t: Double = 0.0
        if isTemp == false {
            t = temp * 1.8 + 32
        } else {
            t = (temp - 32) / 1.8
        }
        return t
    }
    
}

