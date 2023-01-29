//
//  MainVerticalCollectionViewCell.swift
//

import UIKit
import SnapKit

final class MainVerticalCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
    private let imageView = UIImageView()
    private let title = UILabel()
    private let genre = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(title)
        contentView.addSubview(genre)
        
        imageView.backgroundColor = .yellow
        title.numberOfLines = 2
        title.text = "Хроники нарнии: Лев, колдунья и волшебный шкаф"
        title.font = UIFont.systemFont(ofSize: 10)
        title.textColor = .black
        genre.text = "фэнтези"
        genre.font = UIFont.systemFont(ofSize: 10)
        genre.textColor = .gray
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(title.snp.top).inset(5)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.9)
        }
        
        title.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(imageView.snp.bottom)
            make.width.equalTo(100)
        }
        
        genre.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(title.snp.bottom).inset(-5)
            make.width.equalTo(100)
        }
    }
}
