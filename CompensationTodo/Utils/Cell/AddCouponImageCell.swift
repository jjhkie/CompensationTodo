//
//  AddCouponImageCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import SnapKit

class AddCouponImageCell: UITableViewCell{
    
    private let scrollView = UIScrollView()
    private let containerStackView = UIStackView()
    private let imageName = ["pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill","pill"]
    private var image : [UIImageView]?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        containerStackView.axis = .horizontal
        image = imageName.map{
            UIImageView(image: UIImage(systemName: $0))
        }
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCouponImageCell{
    private func layout(){
        contentView.addSubview(scrollView)
        scrollView.addSubview(containerStackView)
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        image?.forEach{
            containerStackView.addArrangedSubview($0)
        }

        containerStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
