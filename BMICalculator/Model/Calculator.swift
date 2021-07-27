//
//  Calculator.swift
//  BMICalculator
//
//  Created by Nacho Pacelli on 27/7/21.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    
    
    func getBMIValue() -> String {
        let bmiTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1Decimal
        
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        
        let bmiValue = (weight / pow(height, 2))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            print("Underweight")
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
            print("Normal Weight")
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
            print("Overweight")
        }
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "That is weird"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
     
}

