//
//  AddCouponImageCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import SnapKit
import Then

class AddCouponImageCell: UITableViewCell{
    
    private let scrollView = UIScrollView()
    private let containerStackView = UIStackView().then{
        $0.axis = .horizontal
        
    }
    private let imageName = ["pill","pill","pill","pill"]
    
    private var image : [UIImageView]?{
        get{
            return imageName.map{
                UIImageView(image: UIImage(systemName: $0))
            }
        }
    }
       

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            $0.snp.makeConstraints{value in
                value.height.width.equalTo(20)
                
            }
        }
        

        containerStackView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
}
