//
//  SymbolPickerController.swift
//  SFSymbolPicker
//
//  Created by Aritro Paul on 24/06/20.
//  Copyright © 2020 Aritro Paul. All rights reserved.
//

import UIKit

private let reuseIdentifier = "symbolCell"

protocol SymbolDelegate : class {
    func didPassSymbol(name: String)
}

class SymbolCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchControllerDelegate {
    
    let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    let searchController = UISearchController()
    var filteredSymbols = [SFSymbol]()
    var isSearching: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    weak var delegate : SymbolDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "Select an icon"
        self.collectionView!.register(SymbolCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search icon"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filteredSymbols.count
        }
        return SFSymbol.allCases.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SymbolCollectionViewCell
        
        if isSearching {
            cell.imageView.image = UIImage(systemName: filteredSymbols[indexPath.item].rawValue)
        }
        else{
            cell.imageView.image = UIImage(systemName: SFSymbol.allCases[indexPath.item].rawValue)
        }
        cell.imageView.contentMode = .center
        cell.imageView.tintColor = .systemBlue
        cell.imageView.image?.applyingSymbolConfiguration(.init(pointSize: 20, weight: .semibold, scale: .unspecified))
        cell.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 30
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 20, bottom: 5, right: 20); //top,left,bottom,right
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isSearching {
            delegate?.didPassSymbol(name: filteredSymbols[indexPath.item].rawValue)
            self.dismiss(animated: true, completion: nil)
        }
        else {
            delegate?.didPassSymbol(name: SFSymbol.allCases[indexPath.item].rawValue)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension SymbolCollectionViewController : UISearchResultsUpdating {
    
    func filterContentForSearchText(_ searchText: String) {
        filteredSymbols = SFSymbol.allCases.filter { (symbol) -> Bool in
            return symbol.rawValue.lowercased().contains(searchText.lowercased())
        }
      
        self.collectionView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filterContentForSearchText(searchText)
    }
    
    
}
