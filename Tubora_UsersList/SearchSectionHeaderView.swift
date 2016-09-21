//
//  SearchSectionHeaderView.swift
//  Tubora_UsersList
//
//  Created by Developer on 21/09/16.
//  Copyright © 2016 tubora. All rights reserved.
//

import UIKit

protocol SearchSectionHeaderViewProtocol {
    func seactionHeaderDidTap(atSection section : Int)
}

class SearchSectionHeaderView: UIView {
    @IBOutlet weak var searchCategoryName: UILabel!
    var section : Int!
    var delegate : SearchSectionHeaderViewProtocol? = nil
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func detailExclosureButtonTapped(sender: AnyObject) {
        self.viewTapped()
    }
    
    func viewTapped() {
        self.delegate?.seactionHeaderDidTap(atSection: self.section)
    }
    
    func configureView(forSection section : Int,withCategory category: SearchFilterEnum) {
        self.section = section
        self.searchCategoryName.text = category.stringValueOfEnumKeys()
    }
}
