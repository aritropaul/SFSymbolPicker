//
//  SymbolPickerController.swift
//  SFSymbolPicker
//
//  Created by Aritro Paul on 24/06/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

protocol SymbolPickerDelegate : class {
    func didSelectSymbol(name: String)
}

class SymbolPickerController: UINavigationController, SymbolDelegate {

    weak var symbolDelegate : SymbolPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picker = SymbolCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        picker.delegate = self
        self.pushViewController(picker, animated: true)
    }
 
    func didPassSymbol(name: String) {
        symbolDelegate?.didSelectSymbol(name: name)
    }
    
}
