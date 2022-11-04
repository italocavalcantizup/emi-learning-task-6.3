//
//  ViewController.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 14/04/2022.
//

import UIKit

class SessionsViewController: UITableViewController {
    
    var sessions: [Sessions]? {
        didSet {
            guard isViewLoaded, let _ = sessions else { return }
        }
    }
    
    var selectedMovie: Movie! {
        didSet {
            guard isViewLoaded, let selectedMovie = selectedMovie else { return }
            tableView.tableHeaderView = TableHeaderView.build(from: selectedMovie)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedMovie = selectedMovie {
            tableView.tableHeaderView = TableHeaderView.build(from: selectedMovie)
        }
        configurarHeaderSection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions?[section].commingSessions.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as? SessionsViewCell else {
            fatalError("Não foi possível obter célula para a lista de sessões")
        }
        let session = sessions![indexPath.section].commingSessions[indexPath.row]
        cell.setup(session)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sessions?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível obter célula para a lista de sessões")
        }
        let cinema = sessions![section].by
        header.setup(cinema)
        return header
    }
    
    func configurarHeaderSection() {
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.heightConstante
    }
  
}
