//
//  Constants.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit

struct Common{
    static let backgroundColor = "#EEF1FF"
    static let screenWidth = UIScreen.main.bounds.width
    static let cellInset = 20.0
}

struct ReCell{
    static let commonCell = UICollectionViewCell()
    static let addCouponName = AddCouponNameCell()
    static let addCouponImage = AddCouponImageCell()
    static let addCouponDiscount = AddCouponDiscountCell()
    
}
