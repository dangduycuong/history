//
//  PersonViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

struct PersonModel {
    var avatar: UIImage?
    var name: String
    var rtfFile: String
}

class PersonViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listPerson: [PersonModel] = [
        PersonModel(name: "An Dương Vương ", rtfFile: "an_duong_vuong")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCell(PersonTableViewCell.self)
    }

}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: PersonTableViewCell.self, forIndexPath: indexPath)
        cell.fillData(person: listPerson[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = R.storyboard.person.personDetailViewController() {
            vc.person = listPerson[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
