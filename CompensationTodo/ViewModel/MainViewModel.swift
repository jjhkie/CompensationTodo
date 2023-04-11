//
//  MainViewModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import RxSwift
import RxCocoa
import Foundation


class MainViewModel{
    
    let testData = [MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date()),
                    MainListModel(name: "abc",time: Date())]

    
    let bag = DisposeBag()
    
    struct Input{
        
    }
    
    struct Output{
        let mainColVData : Driver<[MainListModel]>
    }
    
    //let mainData = BehaviorRelay(value: [TodayModel]())
    let mainData = BehaviorRelay<[MainListModel]>(value: [])
    
    func inOut(input: Input) -> Output{
        
        loadData()
        
        return Output(mainColVData: mainData.asDriver(onErrorJustReturn: []))
    }

}


//MARK: - Functions
extension MainViewModel{
    
    func loadData(){
        mainData.accept(testData)
    }
    
}


