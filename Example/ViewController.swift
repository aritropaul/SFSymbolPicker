//
//  ViewController.swift
//  SFSymbolPicker
//
//  Created by Aritro Paul on 24/06/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var iconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showPicker(_ sender: Any) {
        let symbolPicker = SymbolPickerController()
        symbolPicker.symbolDelegate = self
        self.present(symbolPicker, animated: true, completion: nil)
    }
    
}

extension ViewController : SymbolPickerDelegate {
    func didSelectSymbol(name: String) {
        iconView.image = UIImage(systemName: name)
    }
    
}

