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

class CouponPageView: UIViewController{
    
    let bag = DisposeBag()
    
    let tableView = UITableView().then{
        $0.register(CouponCell.self, forCellReuseIdentifier: "Cell")
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 100
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(CouponPageViewModel())
        layout()
    }
}

extension CouponPageView{
    
    func bind(_ VM: CouponPageViewModel){
        
        let input = CouponPageViewModel.Input(cellSelected: tableView.rx.itemSelected.asObservable())
        
        let output = VM.inOut(input: input)
        
        output.cellData
            .drive(tableView.rx.items(cellIdentifier: "Cell",cellType: CouponCell.self)){row,data,cell in
                cell.textLabel?.text = data.title
                cell.expanded = data.expanded
                
                
            }
            .disposed(by: bag)
        
        tableView.rx.itemSelected
            .bind(onNext: {indexPath in
                guard let cell = self.tableView.cellForRow(at: indexPath) as? CouponCell else {return}
                cell.expanded = true
                print("abc")
                print(cell.expanded)
                if cell.expanded{
                    UIView.animate(withDuration: 0.1, delay: 0,options: .curveEaseOut, animations: {
                        cell.moreView.snp.updateConstraints{
                            $0.height.equalTo(500)
                        }
                        cell.layoutIfNeeded()
                        //cell.containerView.superview?.layoutIfNeeded()
                    })
                }else{
                    cell.moreView.snp.updateConstraints{
      
                        $0.height.equalTo(200)
                    }
                    cell.layoutIfNeeded()
                }
//                self.tableView.beginUpdates()
//                self.tableView.cellForRow(at: indexPath)?.backgroundColor = .blue
//                self.tableView.endUpdates()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            })
            .disposed(by: bag)
        
        
    }
    
    
    
    private func layout(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
