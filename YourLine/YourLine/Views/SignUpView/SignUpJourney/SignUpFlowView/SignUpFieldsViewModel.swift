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
import Networking

class SignUpFieldsViewModel {
        
    var numberOfRows: Int {
        guard
            let fields = fields else {
            return 0
        }
        
        return fields.fields.count
    }
    private lazy var webservice: MockWebservice = { return MockWebservice() }()
    private let viewType: SignUpView
    private weak var view: SignUpFieldsViewController?
    private var fields: SignUpFields?
    
    init(viewType: SignUpView, view: SignUpFieldsViewController?) {
        self.viewType = viewType
        self.view = view
    }
    
    func viewDidLoad() {
        
        switch viewType {
        case .userType:
            break
        case .theUser:
            getSignUpPersonView()

        case .theBusiness:
            getSignUpBusinessView()
        case .emailVerification:
            break
        case .finish:
            break
        }
    }
    
    fileprivate func loadFields(_ jsonFile: String, with completion: ((Any?, Error?)->())?) {
        JSONHandler.parseJSON(with: jsonFile, bundle: .main, for: SignUpFields.self) { json, error in
            completion?(json, error)
        }
    }
    
    private func getSignUpPersonView() {
        webservice.getSignUpPersonView(completion: { [weak self]  fields, error in
            if let error = error {
                print(error)
            }
            
            if let fields = fields as? SignUpFields {
                self?.fields = fields
                self?.view?.updateView()
            }
        })
    }
    
    private func getSignUpBusinessView() {
        webservice.getSignUpBusinessView(completion: { [weak self]  fields, error in
            if let error = error {
                print(error)
            }
            
            if let fields = fields as? SignUpFields {
                self?.fields = fields
                self?.view?.updateView()
            }
        })
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
