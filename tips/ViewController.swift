//
//  ViewController.swift
//  tips
//
//  Created by Niveditha on 12/29/15.
//  Copyright © 2015Navneeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var TipSlider: UISlider!
    @IBOutlet weak var changingImageView: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        sliderLabel.text = "Tip Percentage: 15%"
        TipSlider.value = 15;
        changingImageView.animationImages = [UIImage(named: "Scrooge.jpg")!, UIImage(named: "decenct_tipper.jpg")!, UIImage(named: "generosity.jpeg")!, UIImage(named:"money-bags.jpg")!]
        changingImageView.image = changingImageView.animationImages![1];
        responseLabel.numberOfLines = 0;
        responseLabel.text = "Thanks for your consideration!"
        TipSlider.minimumValue = 0
        TipSlider.maximumValue = 50
        TipSlider.value = 25
        billField.adjustsFontSizeToFitWidth = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let preText: Double? = Double(billField.text!)
        let percent = Int(TipSlider.value)
        if let preTip = preText{
            let tipAmount = preTip * Double(percent)/100.0
            let totalAmount = tipAmount + preTip
            sliderLabel.text = String(format : "Tip Percentage: %d%%", percent)
            tipLabel.text = String(format: "$%.2f", tipAmount);
            totalLabel.text = String(format: "$%.2f", totalAmount);
        }else{
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }
    
    @IBAction func onMadeEdit(sender: AnyObject) {
        let responses = ["You call that a tip???", "Thanks for your consideration!", "How generous of you!", "Let me serve you next, please!"];
        let percent = Int(TipSlider.value)
        let cutoffs = [10, 25, 35, 50];
        var threshold: Int = 0;
        while (percent > cutoffs[threshold]){
            threshold += 1
        }
        changingImageView.image = changingImageView.animationImages![threshold]
        responseLabel.text = responses[threshold]

    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

}

