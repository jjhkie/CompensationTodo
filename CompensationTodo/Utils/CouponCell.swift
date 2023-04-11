//
//  CouponCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/11.
//

import UIKit
import SnapKit

class CouponCell:UITableViewCell{
    
    var expanded = false
    let moreView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        moreView.backgroundColor = .red
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CouponCell{
    
    private func layout(){
        contentView.addSubview(moreView)
                moreView.snp.makeConstraints{
                    $0.edges.equalToSuperview()
                    $0.height.equalTo(200)
                }

    }
}
