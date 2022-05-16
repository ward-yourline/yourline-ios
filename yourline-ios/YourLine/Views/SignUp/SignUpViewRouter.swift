//
//  SignUpViewRouter.swift
//  YourLine
//
//  Created by Warrd Adlani on 16/05/2022.
//

import Foundation
import Domain
import UIKit
import Presentation
import Utility
import Services

class SignUpViewRouter: Routing {
    
    private weak var window: UIWindow?
    private var application: Application? {
        didSet {
            loadUI()
            screens = application?.screens
        }
    }
    private var screens: [Screen]?
    private var context: UIViewController?
        
    required init(window: UIWindow?) {
        
        self.window = window
    }
    
    func start() {
        
        context = UINavigationController()
        
        window?.rootViewController = context
        window?.makeKeyAndVisible()
    
        /* Use this to swap between static data, and injected data driven content examples */
        
        let testingInjection = true
        var injectableSections: [Rows]? = nil
        
        var fileName = "example"
        
        if testingInjection {
            
            fileName = "example_injected_configuration"
            injectableSections = Self.mockedAPI()
        }
                
        JSONUIParser.parseJSON(with: fileName, injectableSections: injectableSections) { [weak self] result, error in
            
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                self?.application = result
            }
        }
    }
    
    private func loadUI() {
        
        var currentScreen: Screen?
        
        guard let screens = application?.screens else { return }
        
        for screen in screens {
            
            if screen.id == "checkout" {
                
                currentScreen = screen
            }
        }
        
        guard currentScreen != nil else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let view = storyboard.instantiateViewController(identifier: "TableViewController") as? TableViewing else { fatalError() }
        
        let presenter = TableViewPresenter(screen: currentScreen, view: view, router: self, dataCallbackBlock: { data in
            
            print(data)
        })
        
        view.presenter = presenter
        
        guard let viewController = view as? TableViewController else { fatalError() }
        
        pushViewController(viewController)
    }
    
    func openSuccesfulPaymentScreen() {
        
        let viewController = UIViewController()
        
        pushViewController(viewController)
    }
    
    private func pushViewController(_ viewController: UIViewController) {
        
        guard let context = context as? UINavigationController else { fatalError() }
        
        context.pushViewController(viewController, animated: false)
    }
    
    func returnedData(_ data: Any?) {
        
        if let data = data {
            print(data)
        }
    }
    
    func nextScreen() {
        
    }
    
    /* Example of injecting cells
     * --------------------------
     *
     * There will no doubt come a time when data driven requirements are needed.
     * When that happens, the following code shows an example of how to make groups of related data
     * that allows content to be dynamically built.
     *
     * Each row has a factory method to simplify building basic UI.
     * However, it is possible to simply use the Row(...) and set any custom configurations through the original
     * initializer while setting nil for what's not needed.
     *
     * This example shows how to make a section with dynamic data. It is emperative to have a groupKey as this is
     * will be used by the parser to inject the new Rows anywhere the groupKey is within the JSON
     *
     * ==========================
     * Swift code usage:
     * ==========================
     *      var injectableSection = Rows()
     *      var rows = [Row]()
     *
     *      firstSection.groupKey = "unique_injection_group_key"
     *
     *      let headerRow = RowFactory.headerRowInit(content: ... <arguments omitted> ...)
     *
     *      rows.append(headerRow)
     *
     * ==========================
     * JSON file example:
     * ==========================
     *      {
     *            "rows": [
     *                {
     *                    "type": "padding_cell",
     *                    "height": "large"
     *                } ... <Rows omitted for brevity>
     *      },
     *      {
     *         "group_key": "unique_injection_group_key",
     *         "is_injected": true
     *      }
     * ============================
     */
    static func mockedAPI() -> [Rows] {
        
        var sections = [Rows]()
        var firstSection = Rows()
        var rows = [Row]()
        
        firstSection.groupKey = "first_injection"
        
        let firstRow = Row.headerRowInit(content: "Injected Header", alignment: .left, isBordered: false, headerType: .largeHeader)
        let secondRow = Row.paddingInit(height: .pt_16)
        let thirdRow = Row.bodyTextInit(content: "Injected body text", alignment: .left, isBordered: false)
        let fourthRow = Row.paddingInit(height: .pt_64)
        let fifthRow = Row.headerRowInit(content: "Injected subheader", alignment: .left, isBordered: true, headerType: .subHeader)
        let sixthRow = Row.bodyTextInit(content: "Injected body text beneath subheader", alignment: .center, isBordered: true)
        let seventhRow = Row.paddingInit(height: .pt_64)
        
        rows.append(firstRow)
        rows.append(secondRow)
        rows.append(thirdRow)
        rows.append(fourthRow)
        rows.append(fifthRow)
        rows.append(sixthRow)
        rows.append(seventhRow)
        
        firstSection.rows = rows
        
        sections.append(firstSection)
        
        return sections
    }
}
