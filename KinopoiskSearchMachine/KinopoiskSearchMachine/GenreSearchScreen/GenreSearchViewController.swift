//
//  GenreSearchViewController.swift
//

import UIKit

final class GenreSearchViewController: UIViewController, GenreSearchDisplayLogic {
    private let interactor: GenreSearchBusinessLogic
    private let router: GenreSearchRoutingLogic

    init(interactor: GenreSearchBusinessLogic, router: GenreSearchRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        view.backgroundColor = .green
    }

    // MARK: - GenreSearchDisplayLogic

    func displayInitForm(_ viewModel: GenreSearch.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(GenreSearch.InitForm.Request())
    }
}
