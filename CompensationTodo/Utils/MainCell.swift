//
//  MainCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import SnapKit

class MainCell: UICollectionViewCell{
    
    var starButton = UIImageView()
    var thumnail = UIImageView()
    var titleLabel = UILabel()
    var timeLabel = UILabel()
    
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension MainCell{
    private func attribute(){
        starButton.image = UIImage(systemName: "star")
    }
    
    private func layout(){
        [thumnail,titleLabel,timeLabel,starButton].forEach{
            contentView.addSubview($0)
        }
        
        thumnail.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
        
        starButton.snp.makeConstraints{
            $0.top.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(thumnail.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        timeLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
