//
//  CouponAddModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import RxDataSources


struct CouponAddModel{
    var header : String
    var items : [Item]
}

struct AddItemInfo{
    var couponImage : UIImage
    var couponName : String
    var couponDicount :Double
    var couponTerms: [CouponTermsItem]?
}

struct CouponTermsItem{
    var conditionName : String
    var conditionCheck : Bool
}


extension CouponAddModel:SectionModelType{

    typealias Item = AddItemInfo
    init(original: CouponAddModel, items: [Item]) {
        self = original
        self.items = items
    }
}
