//
//  MainViewController.swift
//

import UIKit
import SnapKit
import Kingfisher

protocol MainDisplayLogic: AnyObject {
    func displayInit(_ viewModelDict: [Main.SortType: [Main.InitForm.ViewModel]])
    func displayAppend(_ viewModel: [Main.InitForm.ViewModel], indexPaths: [IndexPath])
}

final class MainViewController: UIViewController, MainDisplayLogic {

    private var collectionView: UICollectionView!
    
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic
    private var imadeLoader = ImageDownloader()

    private var dataSource: [Main.SortType: [Main.InitForm.ViewModel]] = [:]
    
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
    }

    func displayInit(_ viewModelDict: [Main.SortType: [Main.InitForm.ViewModel]]) {
        dataSource = viewModelDict
        collectionView.reloadData()
    }

    func displayAppend(_ viewModel: [Main.InitForm.ViewModel], indexPaths: [IndexPath]) {
        dataSource[.top]?.append(contentsOf: viewModel)
        collectionView.reloadItems(at: indexPaths)
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
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = Main.SortType(rawValue: section) else {
            return 0

        }
        return dataSource[sectionType]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVerticalCollectionViewCell.identifier, for: indexPath) as! MainVerticalCollectionViewCell
        let type: Main.SortType = indexPath.section == 0 ? .new : .top
        guard let data = dataSource[type]?[indexPath.row] else { return cell }
        cell.setup(name: data.title, image: data.poster, genre: data.genre)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (dataSource[.top]?.count ?? 0) - 10 && indexPath.section == 1 {
            interactor.update(indexPaths: [indexPath])
        }
    }
}

extension MainViewController: UICollectionViewDataSourcePrefetching {

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        //
    }
}
