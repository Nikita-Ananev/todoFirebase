//
//  TaskViewController.swift
//  toDoFirebase
//
//  Created by Никита Ананьев on 15.02.2021.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var addButtonBackgroundView: UIView!
    @IBOutlet weak var taskTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addButtonBackgroundView.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 0, height: 1), opacity: 0.5, radius: 1)
        // Do any additional setup after loading the view.
    }

    @IBAction func deleteButtonPressed(_ sender: Any) {
    }
    @IBAction func logoutButtonPressed(_ sender: Any) {
    }
    @IBAction func addTaskButtonPressed(_ sender: Any) {
    }
}


extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        
        cell.buttonBackgroundView.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: -1, height: -1), opacity: 0.3, radius: 1)
        cell.taskNameBackgroundView.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 0, height: 1), opacity: 0.4, radius: 1)

        
        return cell
        
    }
    
    
    
    
}
