//
//  BasketView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import Then


class BasketView: UIViewController{
    
    
    let addBasketButton = UIButton().then{
        $0.backgroundColor = .blue
        $0.setTitle("+", for: .normal)
        $0.layer.cornerRadius = 25
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


//MARK: - AutoLayout
extension BasketView{
    private func layout(){

    }
}
