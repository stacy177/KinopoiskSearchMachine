//
//  MainViewController.swift
//

import UIKit
import SnapKit

protocol MainDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Main.InitForm.ViewModel)
}

final class MainViewController: UIViewController, MainDisplayLogic {

    private var collection: UICollectionView!
    
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
        setupUI()
        initForm()
        setupCollection()
        view.backgroundColor = .red
    }

    // MARK: - MainDisplayLogic

    func displayInitForm(_ viewModel: Main.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Main.InitForm.Request(image: "", title: "", year: 0, genre: ""))
    }
    
    private func setupCollection() {
        collection?.register(MainVerticalCollectionViewCell.self, forCellWithReuseIdentifier: MainVerticalCollectionViewCell.identifier)
        collection?.dataSource = self
        collection?.delegate = self
        collection?.reloadData()
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

         switch sectionNumber {

         case 0: return self.firstLayoutSection()
         case 1: return self.secondLayoutSection()
         default: return self.thirdLayoutSection()
         }
       }
    }
    
    private func firstLayoutSection() -> NSCollectionLayoutSection {

       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
    .fractionalHeight(1))

       let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension:
    .fractionalWidth(0.5))

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)

       let section = NSCollectionLayoutSection(group: group)

       section.orthogonalScrollingBehavior = .groupPaging

       return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {

       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .fractionalHeight(0.3))//.absolute(100))

       let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(top: 0, leading: 0, bottom: 15, trailing: 15)

       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(0.5))//.estimated(500))

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

       let section = NSCollectionLayoutSection(group: group)
     section.contentInsets.leading = 15

       section.boundarySupplementaryItems = [
    NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension:
    .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: "Популярное", alignment:
    .topLeading)
    ]

     return section
    }
    
    private func thirdLayoutSection() -> NSCollectionLayoutSection {

       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
    .fractionalHeight(1))

       let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets.bottom = 15

       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
    heightDimension: .fractionalWidth(0.35))

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)

       let section = NSCollectionLayoutSection(group: group)

       section.orthogonalScrollingBehavior = .continuous

       return section
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
        collection = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        view.addSubview(collection)
        collection?.backgroundColor = .lightGray
        collection.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
