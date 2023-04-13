//
//  AddCouponCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import SnapKit

class AddCouponNameCell: UITableViewCell{
    
    private let nameTextView = UITextView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameTextView.text = "PlaceHolder Setting "
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCouponNameCell{
    
    private func layout(){
        contentView.addSubview(nameTextView)

        nameTextView.snp.makeConstraints{
            $0.edges.equalToSuperview()
 
        }
    }
}
