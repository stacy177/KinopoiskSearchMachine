//
//  MainVerticalCollectionViewCell.swift
//

import UIKit
import SnapKit
import Kingfisher

final class MainVerticalCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        String(describing: self)
    }
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let genreLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        genreLabel.text = nil
        imageView.image = nil
    }
    
    func setup(name: String?, image: String?, genre: String?) {
        self.isSkeletonable = true
        self.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .black, secondaryColor: .darkGray), animation: nil, transition: .crossDissolve(1))
        
        self.stopSkeletonAnimation()
        self.hideSkeleton(reloadDataAfter: false, transition: .crossDissolve(1))
        titleLabel.text = name
        genreLabel.text = genre
        imageView.kf.setImage(with: URL(string: image ?? ""))
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        
        imageView.backgroundColor = .yellow
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        titleLabel.textColor = .black
        genreLabel.font = UIFont.systemFont(ofSize: 10)
        genreLabel.textColor = .gray
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).inset(-5)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.9)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(imageView.snp.bottom)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(titleLabel.snp.bottom).inset(-5)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
        }
    }
}
