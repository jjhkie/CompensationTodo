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
import RxDataSources


class CouponPageView: UIViewController{
    
    let bag = DisposeBag()
    
    private let floatingButton = UIButton()
    
    let tableView = UITableView().then{
        $0.backgroundColor = UIColor(hex: Common.backgroundColor)
        $0.register(CouponCell.self, forCellReuseIdentifier: "Cell")
        
        $0.estimatedRowHeight = 250
        $0.rowHeight = UITableView.automaticDimension
        
        $0.separatorStyle = .none
        //$0.register(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    private var dataSource: RxTableViewSectionedReloadDataSource<CouponModel> {
        return RxTableViewSectionedReloadDataSource<CouponModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CouponCell else {return UITableViewCell()}
                //cell.bottomDescriptionLabel.text = item.title
                
                cell.bottomDescriptionLabel.isHidden = !item.expanded
                ///cell.textLabel?.text = item
                return cell
            },
            titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].header
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: Common.backgroundColor)
        bind(CouponPageViewModel())
        attribute()
        layout()
    }
}



extension CouponPageView{
    
    func bind(_ VM: CouponPageViewModel){
        

        
        let input = CouponPageViewModel.Input(cellItemClick: tableView.rx.itemSelected.asObservable())
        
        let output = VM.inOut(input: input)
        
        output.cellData
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        floatingButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(CouponAddView(), animated: true)
            })
            .disposed(by: bag)
    }
    
    private func attribute(){
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .blue
        config.image = UIImage(systemName: "plus")
        floatingButton.configuration = config
    }
    
    
    
    private func layout(){
        view.addSubview(tableView)
        view.addSubview(floatingButton)

        tableView.snp.makeConstraints{
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        floatingButton.snp.makeConstraints{
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.width.height.equalTo(50)
        }
        
    }
}
