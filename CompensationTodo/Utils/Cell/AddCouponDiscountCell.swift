//
//  AddCouponDiscountCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import SnapKit


class AddCouponDiscountCell:UITableViewCell{
    private let containerStackView = UIStackView()
    let progressView = CircleProgressBar()
    
    let buttonValue = ["10","25","50","75","100"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        progressView.value = 0.8
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCouponDiscountCell{
    private func layout(){
        var config = UIButton.Configuration.plain()
        
        containerStackView.addArrangedSubview(progressView)
        //버튼 추가
        for value in buttonValue{
            let button = UIButton()
            config.title = value
            button.configuration = config
            containerStackView.addArrangedSubview(button)
        }

        contentView.addSubview(containerStackView)
        
        containerStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
 
        }
    }
}
