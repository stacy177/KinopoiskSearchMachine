//
//  MainViewController.swift
//

import UIKit
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Main.InitForm.ViewModel)
}

final class MainViewController: UIViewController, MainDisplayLogic {

    private var collectionView: UICollectionView!
    
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
        setupCollection()
        initialSetup()
        view.backgroundColor = .red
    }

    // MARK: - MainDisplayLogic

    func displayInitForm(_ viewModel: Main.InitForm.ViewModel) {}

    // MARK: - Private

    private func initialSetup() {
        interactor.requestInitForm(Main.InitForm.Request(title: "", year: 0, genre: ""))
    }
    
    private func setupCollection() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionLayoutFabric.createCompositionalLayout())
        view.addSubview(collectionView)
        collectionView?.backgroundColor = .lightGray

        collectionView?.register(MainVerticalCollectionViewCell.self, forCellWithReuseIdentifier: MainVerticalCollectionViewCell.identifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }

        collectionView?.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
                  case 0:
                      return 10
                  case 1:
                      return 9
                  default:
                      return 6
              }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVerticalCollectionViewCell.identifier, for: indexPath) as! MainVerticalCollectionViewCell
        cell.backgroundColor = .clear
        return cell
    }

}

extension MainViewController {
    private func setupUI() {


    }
}
