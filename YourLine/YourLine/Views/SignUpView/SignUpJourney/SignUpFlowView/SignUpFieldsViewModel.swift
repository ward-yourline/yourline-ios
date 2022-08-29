//
//  SignUpFieldsViewModel.swift
//  YourLine
//
//  Created by Warrd Adlani on 29/08/2022.
//

import Foundation
import UIKit
import Domain
import Utility

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
        getSignUpPersonView()
    }
    
    private func getSignUpPersonView() {
        let jsonFile = "sign_up_person"
        JSONHandler.parseJSON(with: jsonFile, bundle: .main, for: SignUpFields.self) { [weak self] json, error in
            if let error = error {
                print(error)
            }
            
            if let fields = json as? SignUpFields {
                self?.fields = fields
                self?.view?.updateView()
            }
        }
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
        
        cell.setupCell(with: field.copy)
    }
}
