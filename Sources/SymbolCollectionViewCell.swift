//
//  SymbolCollectionViewCell.swift
//  SFSymbolPicker
//
//  Created by Aritro Paul on 24/06/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

class SymbolCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
