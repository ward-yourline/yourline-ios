//
//  SignUpFieldsViewModel.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation
import UIKit
import Domain

class SignUpFieldsViewModel {
        
    var numberOfRows: Int {
        guard
            let fields = fields else {
            return 0
        }
        
        return fields.fields.count
    }
    private let viewType: SignUpView
    private weak var view: SignUpFieldsViewController?
    private var fields: SignUpFields?
    
    init(viewType: SignUpView, view: SignUpFieldsViewController?) {
        self.viewType = viewType
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    private func getSignUpPersonView() {
        
    }
    
    private func getSignUpBusinessView() {
        view?.updateView()
    }
    
    func setupCell(_ cell: SignUpInputFieldCell, at indexPath: IndexPath) {
        guard
            let field = fields?.fields[indexPath.row]
        else {
            return
        }
        
        cell.setupCell(with: field.name)
    }
}
