//
//  ViewController.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 14/04/2022.
//

import UIKit

class SessionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedMovie: Movie!
    
    var API: MovieSessionsAPI?

    var sessions: [Sessions] = [] {
        didSet {
            tableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadAPI()
    }
    
    func setupViews() {
        tableView.tableHeaderView = TableHeaderView.build(from: selectedMovie)
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.heightConstante
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadAPI() {
        guard let API = API else { return }
        sessions = API.getSessionBy(selectedMovie)
    }
}

extension SessionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível obter célula para a lista de sessões")
        }
        let cinema = sessions[section].by
        header.setup(cinema)
        return header
    }
}

extension SessionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions[section].commingSessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as? SessionsViewCell else {
            fatalError("Não foi possível obter célula para a lista de sessões")
        }
        let session = sessions[indexPath.section].commingSessions[indexPath.row]
        cell.setup(session)
        return cell
    }
}
