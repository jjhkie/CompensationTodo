//
//  CouponCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/11.
//

import UIKit
import SnapKit

class CouponCell:UITableViewCell{
    
    var containserStackView = UIStackView()
    var topTitleLabel = UILabel()
    var bottomView = UIView()
    var bottomDescriptionLabel = UILabel(){
        didSet{
            
        }
    }
    var expanded = false

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .yellow
        containserStackView.axis = .vertical
        layout()
        topTitleLabel.text = "abcdefg"
        bottomDescriptionLabel.text = "1234567"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}

extension CouponCell{
    
    private func layout(){
        bottomView.addSubview(bottomDescriptionLabel)
        bottomDescriptionLabel.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        [topTitleLabel,bottomView].forEach{
            containserStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(containserStackView)
        containserStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
