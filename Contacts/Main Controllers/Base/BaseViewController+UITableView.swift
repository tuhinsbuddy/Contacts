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
        switch presenter.tableData[index.section].cellType {
        case .loader:
            guard let cellObject = tableView
                    .dequeueReusableCell(withIdentifier: "LoaderTableViewCell") as? LoaderTableViewCell else {
                        return UITableViewCell()
            }
            cellObject.selectionStyle = .none
            return cellObject
        default:
            guard let dataC = presenter.tableData[index.section].data as? BaseCellDataModel,
                let cellObject = tableView
                    .dequeueReusableCell(withIdentifier: "BaseTableViewCell") as? BaseTableViewCell else {
                        return UITableViewCell()
            }
            cellObject.selectionStyle = .none
            cellObject.setup(with: dataC.sectionRow[index.row])
            return cellObject
        }
    }
}
extension BaseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenterOutput, !presenter.tableData.isEmpty else { return }
        presenter.selectData(for: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = presenterOutput, !presenter.tableData.isEmpty else { return 50 }
        switch presenter.tableData[indexPath.section].cellType {
        case .loader: return tableView.frame.size.height
        default: return 80
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let presenter = presenterOutput, !presenter.tableData.isEmpty else { return 0 }
        switch presenter.tableData[section].cellType {
        case .loader: return 0.1
        default: return 30
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.font = .systemFont(ofSize: 16)
            header.textLabel!.textColor = .titleTextColor
        }
    }
}
extension BaseViewController: UITableViewDataSource {
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let presenter = presenterOutput,
            !presenter.sectionHeaders.isEmpty else { return nil }
        return presenter.sectionHeaders
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let presenter = presenterOutput,
            !presenter.sectionHeaders.isEmpty else { return 1 }
        return presenter.sectionHeaders.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let presenter = presenterOutput,
            !presenter.sectionHeaders.isEmpty else { return nil }
        return presenter.sectionHeaders[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenterOutput,
            !presenter.tableData.isEmpty,
            let dataC = presenter.tableData[section].data as? BaseCellDataModel,
            !dataC.sectionRow.isEmpty else { return 1 }
        return dataC.sectionRow.count
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
