//
//  MainViewController.swift
//

import UIKit
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displayUpdate(_ viewModel: Main.InitForm.ViewModel)
    func displayAppend(_ viewModel: Main.InitForm.ViewModel)
}

final class MainViewController: UIViewController, MainDisplayLogic {

    private var collectionView: UICollectionView!
    
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    private var dataSource: Main.InitForm.ViewModel = .init(sections: [:])
    
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
        setupCollection()
        register()
        interactor.setup()
        view.backgroundColor = .red
        collectionView.reloadData()
    }

    func displayUpdate(_ viewModel: Main.InitForm.ViewModel) {
        dataSource = viewModel
        collectionView.reloadData()
    }

    func displayAppend(_ viewModel: Main.InitForm.ViewModel) {
        dataSource = viewModel
    }

    // MARK: - Private
    
    private func register() {
        collectionView?.register(MainVerticalCollectionViewCell.self, forCellWithReuseIdentifier: MainVerticalCollectionViewCell.identifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView.prefetchDataSource = self
    }
    
    private func setupCollection() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionLayoutFabric.createCompositionalLayout())
        view.addSubview(collectionView)
        collectionView?.backgroundColor = .lightGray

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return dataSource.sections[.new]?.count ?? 0
        case 1: return dataSource.sections[.top]?.count ?? 0
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVerticalCollectionViewCell.identifier, for: indexPath) as! MainVerticalCollectionViewCell
        let type: Main.SortType = indexPath.section == 0 ? .new : .top
        guard let data = dataSource.sections[type]?[indexPath.row] else { return cell }
        cell.setup(name: data.title, imageUrl: data.poster, genre: data.genre)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (dataSource.sections[.top]?.count ?? 0) - 2 && indexPath.section == 1 {
            interactor.update()
        }
    }
}

extension MainViewController: UICollectionViewDataSourcePrefetching {

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {

        collectionView.reloadItems(at: indexPaths)
    }


}
