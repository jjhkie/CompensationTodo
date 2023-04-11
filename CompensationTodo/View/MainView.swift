//
//  MainView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class MainView:UIViewController{
    
    let bag = DisposeBag()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then{
        $0.register(MainCell.self, forCellWithReuseIdentifier: "Cell")
         $0.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupFlowLayout()
        bind(MainViewModel())
        layout()
    }
    
    private func setupFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout().then{
            let width = UIScreen.main.bounds.width / 3
            
            $0.itemSize = CGSize(width: width, height: width)
        }
        self.collectionView.collectionViewLayout = flowLayout
    }

    
}


extension MainView{
    
    func bind(_ VM: MainViewModel){
        let input = MainViewModel.Input()
        
        let output = VM.inOut(input: input)
        
        output.mainColVData
            .drive(collectionView.rx.items(cellIdentifier: "Cell",cellType: MainCell.self)){row,element,cell in

                
                cell.titleLabel.text = "\(element.name )"
                cell.timeLabel.text = "\(element.time)"
            }
            .disposed(by: bag)
    }
    private func layout(){
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
