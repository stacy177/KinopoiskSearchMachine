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
        title.textColor = .black
        genre.text = "фэнтези"
        genre.textColor = .gray
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(contentView)
            make.height.equalTo(200)
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView)
        }
        
        title.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(imageView.snp.bottom).inset(-5)
            make.width.equalTo(100)
        }
        
        genre.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(title.snp.bottom).inset(-5)
            make.width.equalTo(100)
        }
    }
}
