//
//  ProgressBar+.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import Foundation
import UIKit


class CircleProgressBar: UIProgressView{
    
    var lineWidth: CGFloat = 10
    var value: Double?{
        didSet{
            guard let _ = value else { return}
            setProgress(self.bounds)
        }
    }
    override func draw(_ rect: CGRect) {
        let bezierPath = UIBezierPath()

        bezierPath.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - ((lineWidth - 1) / 2), startAngle: 0, endAngle: .pi * 2, clockwise: true)

        bezierPath.lineWidth = 1
        UIColor.systemGray4.set()
        bezierPath.stroke()
    }
    
    func setProgress(_ rect: CGRect) {
        guard let value = self.value else {
            return
        }

        // TableView나 CollectionView에서 재생성 될때 계속 추가되는 것을 막기 위해 제거
        self.subviews.forEach { $0.removeFromSuperview() }
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let bezierPath = UIBezierPath()

        bezierPath.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - ((lineWidth - 1) / 2), startAngle: -.pi / 2, endAngle: ((.pi * 2) * value) - (.pi / 2), clockwise: true)

        let shapeLayer = CAShapeLayer()

        shapeLayer.path = bezierPath.cgPath
        shapeLayer.lineCap = .round    // 프로그래스 바의 끝을 둥글게 설정

        let color: UIColor = .systemBlue

        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth

        self.layer.addSublayer(shapeLayer)

        // 프로그래스바 중심에 수치 입력을 위해 UILabel 추가
        let label = UILabel()
        label.text = String(Int(value * 100))
        label.textColor = .label
        label.font = .systemFont(ofSize: 8, weight: .light)

        self.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
