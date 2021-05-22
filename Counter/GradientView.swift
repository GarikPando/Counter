//
//  GradientView.swift
//  Counter
//
//  Created by Игорь Яковлев on 22.05.21.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.08845763654, green: 0.8676834702, blue: 0.7098478675, alpha: 1)
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.3346976042, green: 0.1808277369, blue: 0.6392555833, alpha: 1)
    
    var beginPointX: CGFloat = 0
    var beginPintY: CGFloat = 0
    var endPointX: CGFloat = 1
    var endPointY: CGFloat = 1
    var gradient : CAGradientLayer?
    
    override func layoutSubviews() {
        configGradient()
    }
    
    func configGradient() {
        //формируем новый градиент
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor, topColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: beginPointX, y: beginPintY)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        //заменим хранимый
        if let gr = gradient {
            self.layer.replaceSublayer(gr, with: gradientLayer)
        }
        else { // градиента нет
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        gradient = gradientLayer
    }
}
 
