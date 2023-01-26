//
//  MainViewController.swift
//

import UIKit
import SnapKit

final class MainViewController: ViewController, MainDisplayLogic {

    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
        layout.itemSize = CGSize(width: (width - 60) , height: width)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 50

        return layout
    }

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
        initForm()
        setupUI()
        view.backgroundColor = .red
//        collection.register(MainHorizontallyCollectionViewCell.self, forCellWithReuseIdentifier: MainHorizontallyCollectionViewCell.reusedId)
        collection.register(MainVerticalCollectionViewCell.self, forCellWithReuseIdentifier: MainVerticalCollectionViewCell.identifier)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVerticalCollectionViewCell.identifier, for: indexPath) as! MainVerticalCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 100, height: 100)
       }
}

extension MainViewController {
    private func setupUI() {
        collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collection)
        collection.backgroundColor = .lightGray
        collection.isScrollEnabled = true
        collection.frame = view.bounds
//        collection.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(50)
//            make.left.equalToSuperview().inset(0)
//            make.right.equalToSuperview().inset(0)
//            make.bottom.equalToSuperview().inset(0)
//        }
    }
}
