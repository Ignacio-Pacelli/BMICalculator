//
//  CalculateViewController.swift
//  BMICalculator
//
//  Created by Nacho Pacelli on 27/7/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        heightSlider.value = 1.5
        weightSlider.value = 100
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        let height = (String(format:"%.2f", sender.value))
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = (Int(sender.value))
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
      
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
    
    
    
    
    
    
    
    
}


