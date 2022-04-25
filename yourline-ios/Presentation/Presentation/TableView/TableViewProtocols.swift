//
//  TableViewProtocols.swift
//  CheckOut
//
//  Created by Warrd Adlani on 23/04/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import UIKit

public protocol TableViewing: AnyObject {
    
    var presenter: TableViewPresenting! { get set }
    
    func viewReady()
    func scrollToIndexPath(_ indexPath: IndexPath)
    func update(with indexPath: IndexPath?)
}

public protocol TableViewPresenting: AnyObject {
    
    var title: String? { get set }
    var topContentInset: CGFloat { get }
    var bottomContentInset: CGFloat { get }
    var numberOfSections: Int { get }
    var hasSeparators: Bool { get }
    
    func viewDidLoad()
    func updateView()
    func setupCell(_ cell: CellPresentable, row: Row?, indexPath: IndexPath?)
    func item(at indexPath: IndexPath) -> Row?
    func submit()
    func numberOfRows(with section: Int) -> Int
    func actionAtIndexPath(_ indexPath: IndexPath)
    
    init(screen: Screen?, view: TableViewing?, coordinator: Coordinator?, dataCallbackBlock: DataCallbackBlock?)
}
