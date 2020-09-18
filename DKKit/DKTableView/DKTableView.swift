//
//  DKTableView.swift
//  DKKit
//
//  Created by Dineshkumar Kandasamy on 17/03/20.
//  Copyright © 2020 Mobiversa Sdn. Bhd. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewHeaderFooterView {
    static var reuseIdentifier: String {

        let className = String(describing: self)

        return className
    }
}

extension UITableViewCell {

    static var reuseIdentifier: String! {

        let className = String(describing: self)

        return className
    }
}

extension UITableView {

    func setupBasicTableView() {

        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.separatorStyle = .none

    }
}
 

public func DKPlainTableView(_ delegate: UITableViewDelegate, _ datasource: UITableViewDataSource) -> UITableView {

    let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.setupBasicTableView()
    tableView.dataSource = datasource
    tableView.delegate = delegate
    return tableView

}

public func DKGroupTableView(_ delegate: UITableViewDelegate, _ datasource: UITableViewDataSource) -> UITableView {

    let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.setupBasicTableView()
    tableView.dataSource = datasource
    tableView.delegate = delegate
    return tableView
}
