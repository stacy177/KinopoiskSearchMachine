//
//  MainViewController.swift
//

import UIKit
import SnapKit

final class MainViewController: ViewController, MainDisplayLogic {
    
    private let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    init(interactor: MainBusinessLogic, router: MainRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        setupUI()
        view.backgroundColor = .red
//        collection.register(MainHorizontallyCollectionViewCell.self, forCellWithReuseIdentifier: MainHorizontallyCollectionViewCell.reusedId)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collection.dataSource = self
        collection.delegate = self
        collection.reloadData()
    }

    // MARK: - MainDisplayLogic

    func displayInitForm(_ viewModel: Main.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Main.InitForm.Request())
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainHorizontallyCollectionViewCell.reusedId, for: indexPath) as! MainHorizontallyCollectionViewCell
        let cell = UICollectionViewCell()
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 100, height: 100)
       }
}

extension MainViewController {
    private func setupUI() {
        collection.backgroundColor = .lightGray
        collection.isScrollEnabled = true
        view.addSubview(collection)
        collection.frame = view.bounds
//        collection.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(50)
//            make.left.equalToSuperview().inset(0)
//            make.right.equalToSuperview().inset(0)
//            make.bottom.equalToSuperview().inset(0)
//        }
    }
}
