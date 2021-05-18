//
//  ViewController.swift
//  RequestUrlSession
//
//  Created by admin on 11/18/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var arrayString: [String] = ["mot  df dsd", "haid dgdfdgdf","dgd das fsdfds","dfgd dfg fgdfg","fg ds dfbdfdgd","dfgd  hkuifb","cgfg aeree","dfgdfh dfbd","df etr bdd"]
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataSevice.shared.requestDataTask(completion: { data in })
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            print("vjhvshvdshvj")
            return UITableViewCell()
        }
        cell.textLabel?.text = self.arrayString[indexPath.row]
        
        
        
        // add border and color
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.red
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
        } else {
            cell.backgroundColor = UIColor.blue
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.yellow
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView;
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayString.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            print("shvdhvhs svshdsv  ")
        }
        
    }
    
}

