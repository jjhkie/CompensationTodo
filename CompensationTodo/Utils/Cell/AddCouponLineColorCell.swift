//
//  AddCouponLineColorCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import SnapKit
import Then



class AddCouponLineColorCell: UITableViewCell{
    
    private var color = UIColorWell()
    
    private let containerStackView = UIStackView().then{
        $0.distribution = .equalCentering
    }
    
    private let colors = [UIColor.black,UIColor.red, UIColor.blue, UIColor.green]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCouponLineColorCell{
    
    
    
    private func layout(){
        var config = UIButton.Configuration.filled()
        
        for color in colors{
            config.baseBackgroundColor = color
            let button = UIButton()
            button.layer.cornerRadius = button.layer.frame.width / 2
            button.configuration = config
            containerStackView.addArrangedSubview(button)
        }
        contentView.addSubview(containerStackView)
        
        containerStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
    }
}
