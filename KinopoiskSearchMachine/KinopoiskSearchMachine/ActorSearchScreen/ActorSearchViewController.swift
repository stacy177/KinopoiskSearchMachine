//
//  ActorSearchViewController.swift
//

import UIKit

final class ActorSearchViewController: ViewController, ActorSearchDisplayLogic {
    private let interactor: ActorSearchBusinessLogic
    private let router: ActorSearchRoutingLogic

    init(interactor: ActorSearchBusinessLogic, router: ActorSearchRoutingLogic) {
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
        view.backgroundColor = .blue
    }

    // MARK: - ActorSearchDisplayLogic

    func displayInitForm(_ viewModel: ActorSearch.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(ActorSearch.InitForm.Request())
    }
}
