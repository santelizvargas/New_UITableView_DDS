//
//  ViewController.swift
//  NewTableView
//
//  Created by User-G04 on 9/9/22.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Make Table view
    
    private let newTableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private var myDataSource: UITableViewDiffableDataSource<Int, Device>!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewTableView()
        setupMyDataSource()
        snapshotSave()
    }
    
    // MARK: - Functions
    
    private func setupNewTableView() {
        
        view.addSubview(newTableView)
        newTableView.frame = view.bounds
        newTableView.delegate = self
        
        NSLayoutConstraint.activate([
            newTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupMyDataSource() {
        
        myDataSource = UITableViewDiffableDataSource(tableView: newTableView, cellProvider: { tableView, indexPath, model in
            
            let cell = self.newTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.title
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            
            cell.contentConfiguration = listContentConfiguration
            cell.selectionStyle = .none
            
            return cell

        })
    }
    
    private func snapshotSave() {
        var snapshot = myDataSource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(device, toSection: 0)
        snapshot.appendItems(device2, toSection: 1)
        myDataSource.apply(snapshot)
    }


}

