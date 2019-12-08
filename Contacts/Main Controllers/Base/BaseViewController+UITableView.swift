//
//  BaseViewController+UITableView.swift
//  Contacts
//
//  Created by Tuhin on 08/12/19.
//  Copyright © 2019 Swift Contacts. All rights reserved.
//

import UIKit

extension BaseViewController {
    private func createCellForTable(withTableView tableView: UITableView, withIndex index: IndexPath) -> UITableViewCell {
        guard let presenter = presenterOutput,
            !presenter.tableData.isEmpty else {
                return UITableViewCell()
        }
        switch presenter.tableData[index.row].cellType {
        case .loader:
            guard let cellObject = tableView
                    .dequeueReusableCell(withIdentifier: "LoaderTableViewCell") as? LoaderTableViewCell else {
                        return UITableViewCell()
            }
            cellObject.selectionStyle = .none
            return cellObject
        default:
            guard let dataC = presenter.tableData[index.section].data as? BaseTableCellDataModel,
                let cellObject = tableView
                    .dequeueReusableCell(withIdentifier: "BaseTableViewCell") as? BaseTableViewCell else {
                        return UITableViewCell()
            }
            cellObject.selectionStyle = .none
            cellObject.setup(with: dataC)
            return cellObject
        }
    }
}
extension BaseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = presenterOutput, !presenter.tableData.isEmpty else { return 50 }
        switch presenter.tableData[indexPath.row].cellType {
        case .loader: return tableView.frame.size.height
        default: return 100
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let presenter = presenterOutput, !presenter.tableData.isEmpty else { return 0 }
        switch presenter.tableData[section].cellType {
        case .loader: return 0.1
        default: return 20
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let presenter = presenterOutput, let first = presenter.tableCardData.first,
//            first.cellType != .loader else {
//                return
//        }
//        presenter.isLastCellLoad = false
//        if !presenter.isInitialCellLoad {
//            if let visibleRows = tableView.indexPathsForVisibleRows,
//                let lastIndex = visibleRows.last,
//                lastIndex.section == indexPath.section {
//                presenter.isLastCellLoad = true
//            }
//            presenter.isInitialCellLoad = presenter.isLastCellLoad ? true : false
//            cell.transform = CGAffineTransform(translationX: 0, y: 100)
//            cell.alpha = 0
//            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.section), options: [.curveEaseInOut], animations: {
//                cell.transform = CGAffineTransform(translationX: 0, y: 0)
//                cell.alpha = 1
//            }, completion: nil)
//        }
//    }
}
extension BaseViewController: UITableViewDataSource {
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["A", "B", "C", "D"]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let presenter = presenterOutput,
            !presenter.tableData.isEmpty else { return 1 }
        return presenter.tableData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCellForTable(withTableView: tableView, withIndex: indexPath)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
