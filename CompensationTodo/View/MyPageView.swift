//
//  MyPageView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import SnapKit
import Then
import RxSwift

class MyPageView: UIViewController{
    
    let bag = DisposeBag()
    
    let tableView = UITableView().then{
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(MyPageViewModel())
        layout()
    }
}

extension MyPageView{
    
    func bind(_ VM: MyPageViewModel){
        
        let input = MyPageViewModel.Input()
        
        let output = VM.inOut(input: input)
        
        output.cellData
            .drive(tableView.rx.items(cellIdentifier: "Cell",cellType: UITableViewCell.self)){row,data,cell in
                cell.textLabel?.text = data.title
            }
            .disposed(by: bag)
    }
    
    private func layout(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
