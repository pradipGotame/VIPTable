//
//  TableDisplayView.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation
import UIKit

protocol TableDisplayViewDelegate {
    func tableView(clickedTitle: String)
}

class TableDisplayView: NSObject {
    
    private var tableView: UITableView?
    private var data: [JsonParsingResponse.Datum]?
    private var delegate: TableDisplayViewDelegate?
    
    init(tableView: UITableView, data: [JsonParsingResponse.Datum], delegate: TableDisplayViewDelegate) {
        super.init()
        
        self.tableView = tableView
        self.data = data
        self.delegate = delegate
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension TableDisplayView {
    func reloadTableView() {
        tableView?.reloadData()
    }
}

extension TableDisplayView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let attribute = data?[indexPath.row].attributes
        delegate?.tableView(clickedTitle: attribute?.title ?? "")
    }
}

extension TableDisplayView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = data?[indexPath.row].type
        return cell
    }
}
