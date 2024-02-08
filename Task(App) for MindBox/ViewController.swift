//
//  ViewController.swift
//  Task(App) for MindBox
//
//  Created by Иван on 08.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var side1: UITextField!
    @IBOutlet var side2: UITextField!
    @IBOutlet var side3: UITextField!
    @IBOutlet var result: UILabel!
    @IBOutlet var resultOfCircle: UILabel!
    @IBOutlet var radiusTextF: UITextField!
    
    @IBAction func calculateResult(_ sender: UIButton) {
        guard let sideOne = Double(side1.text ?? ""),
              let sideTwo = Double(side2.text ?? ""),
              let sideThree = Double(side3.text ?? "") else {
            result.text = "Пожалуйста, введите числа во все поля"
            return
        }
        
        guard sideOne + sideTwo > sideThree && sideOne + sideThree > sideTwo && sideTwo + sideThree > sideOne else {
            result.text = "Error"
            return
        }
        
        let triangle = Triangle(side1: sideOne, side2: sideTwo, side3: sideThree)
        result.text = "Площадь треугольника = \(triangle.area())"
    }
    
    @IBAction func calculateCircle(_ sender: UIButton) {
        guard let radiusText = radiusTextF.text, let radius = Double(radiusText) else {
            resultOfCircle.text = "Пожалуйста, введите число в поле радиуса"
            return
        }
        let circle = Circle(radius: radius)
        resultOfCircle.text = "Площадь круга: \(circle.area())"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

protocol Shape {
    func area() -> Double
}

struct Triangle: Shape {
    var side1: Double
    var side2: Double
    var side3: Double
    
    func area() -> Double {
        let s = (side1 + side2 + side3) / 2
        return sqrt(s * (s - side1) * (s - side2) * (s - side3))
    }
}
struct Circle: Shape {
    var radius: Double
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
}
