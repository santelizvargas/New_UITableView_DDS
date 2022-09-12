//
//  ViewController.swift
//  NewTableView
//
//  Created by User-G04 on 9/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let newTableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    var myDataSource: UITableViewDiffableDataSource<Int, Device>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newTableView.delegate = self
        setupNewTableView()
        setupMyDataSource()
        snapshotSave()
    }
    
    func setupNewTableView() {
        view.addSubview(newTableView)
        newTableView.frame = view.bounds
//        newTableView.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            newTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupMyDataSource() {
        myDataSource = UITableViewDiffableDataSource(tableView: newTableView, cellProvider: { tableView, indexPath, model in
            let cell = self.newTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.title
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            cell.contentConfiguration = listContentConfiguration

            return cell

        })
    }
    
    func snapshotSave() {
        var snapshot = myDataSource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(device, toSection: 0)
        snapshot.appendItems(device2, toSection: 1)
        myDataSource.apply(snapshot)
    }


}

