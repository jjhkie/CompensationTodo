//
//  MyPageViewModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import RxSwift
import RxCocoa

class MyPageViewModel{
    
    
    let testData = [MyPageModel(title: "Coupon"),
                    MyPageModel(title: "Coupon"),
                    MyPageModel(title: "Coupon"),
                    MyPageModel(title: "Coupon"),
                    MyPageModel(title: "Coupon"),
                    ]
    
    struct Input{
        
    }
    
    struct Output{
        let cellData: Driver<[MyPageModel]>
    }
    
    //MARK:  Data
    let mainData = BehaviorRelay<[MyPageModel]>(value: [])
    

}

//MARK: - Functions
extension MyPageViewModel{
    
    func inOut(input: Input) -> Output{
        
        mainData.accept(testData)
        
        return Output(cellData:mainData.asDriver(onErrorJustReturn: []))
    }
    
}
