//
//  CouponAddViewModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import RxCocoa


class CouponAddViewModel{
    
    var testData :[CouponAddModel] = [
        CouponAddModel(header: "Name", items: [AddItemInfo(couponImage: UIImage(systemName: "pill")!, couponName: "예시로 작성한 이름", couponDicount: 70.0, couponTerms: nil)]),
        CouponAddModel(header: "Image", items: [AddItemInfo(couponImage: UIImage(systemName: "pill")!, couponName: "예시로 작성한 이름", couponDicount: 70.0, couponTerms: nil)]),
        CouponAddModel(header: "Discount", items: [AddItemInfo(couponImage: UIImage(systemName: "pill")!, couponName: "예시로 작성한 이름", couponDicount: 70.0, couponTerms: nil)]),
        CouponAddModel(header: "Line Color", items: [AddItemInfo(couponImage: UIImage(systemName: "pill")!, couponName: "예시로 작성한 이름", couponDicount: 70.0, couponTerms: nil)]),
        CouponAddModel(header: "Condition", items: [AddItemInfo(couponImage: UIImage(systemName: "pill")!, couponName: "예시로 작성한 이름", couponDicount: 70.0, couponTerms: nil)])
    
    ]
    
    struct Input{
        
    }
    
    struct Output{
        let cellData: Driver<[CouponAddModel]>
    }
    
    let mainCellData = BehaviorRelay<[CouponAddModel]>(value:[])
    
    func inOut(input: Input) -> Output{
        mainCellData.accept(testData)
        return Output(cellData: mainCellData.asDriver(onErrorJustReturn: []))
    }
    
}
