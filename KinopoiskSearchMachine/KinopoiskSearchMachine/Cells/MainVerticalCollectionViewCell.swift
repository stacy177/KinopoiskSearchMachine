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
            make.width.equalTo(80)
            make.height.equalTo(120)
            make.top.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(5)
        }
        
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView).inset(5)
            make.width.equalTo(60)
        }
        
        genre.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(title).inset(5)
            make.width.equalTo(60)
        }
    }
}
