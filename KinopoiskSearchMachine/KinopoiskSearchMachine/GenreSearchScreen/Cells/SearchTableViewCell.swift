//
//  MainHorizontallyCollectionViewCell.swift
//

import UIKit
import SnapKit

final class SearchTableViewCell: UITableViewCell {
    
    static let reusedId =  "MainHorizontallyCollectionViewCell"
    
    private let image = UIImage()
    private let title = UILabel()
    private let year = UILabel()
    private let genre = UILabel()
    private let detailButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(title)
        contentView.addSubview(year)
        contentView.addSubview(genre)
        contentView.addSubview(detailButton)
        
        self.imageView?.backgroundColor = .yellow
        title.text = "Зеленая миля"
        year.text = "The Green Mile, 1999"
        genre.text = "США * драма, фэнтези"
        detailButton.setTitle("Подробнее", for: .normal)
        detailButton.setTitleColor(.orange, for: .normal)
    }
}
