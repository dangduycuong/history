//
//  PersonViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

struct FileModel: Codable {
    var title: String?
    var fileName: String?
}

class PersonViewController: BaseViewController {
    
    private lazy var personContentDetailView: PersonContentDetailView = {
        let personContentDetailView = PersonContentDetailView()
        personContentDetailView.layer.cornerRadius = 4
        return personContentDetailView
    }()
    
    private var viewModel = PersonViewModel()
    private var lastContentOffset: CGFloat = 0
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObserver()
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            // process files
            print("----", fileURLs.count, fileURLs)
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadData()
    }
    
    private func prepareForViewController() {
        addBackground()
        addTitle(title: "Nhân vật lịch sử")
        
        view.layout(searchTextField)
            .below(titleLabel, 16)
            .left(16)
            .right(16)
            .height(40)
        searchTextField.delegate = self
        
        view.layout(tableView)
            .below(searchTextField, 8)
            .left()
            .bottomSafe()
            .right()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(PersonTableViewCell.self)
        addAddDataButton()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        tableView.addGestureRecognizer(longPress)
        
        view.layout(personContentDetailView)
            .left()
            .bottomSafe()
            .right()
        personContentDetailView.backgroundColor = UIColor.white
        
        let height = NSLayoutConstraint(item: personContentDetailView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        personContentDetailView.addConstraints([height])
        personContentDetailView.translatesAutoresizingMaskIntoConstraints = false
        personContentDetailView.isHidden = true
    }
    
    private func addObserver() {
        viewModel.fetchedPersonDataSource.skip(1).observe(on: MainScheduler.instance).subscribe(onNext: { [weak self] list in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        personContentDetailView.saveOption = { [weak self] index, name, url in
            guard let `self` = self else { return }
            self.viewModel.updateData(index, name, url)
        }
    }
    
    // MARK: - Actions
    override func addDataButtonClicked(sender: UIButton) {
        let vc = AddPersonViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                // your code here, get the row for the indexPath or do whatever you want
                personContentDetailView.isHidden = false
                let item = viewModel.fetchedPersonDataSource.value[indexPath.row]
                personContentDetailView.fillData(name: item.name, url: item.url, index: indexPath.row)
            }
        }
    }
    
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            personContentDetailView.isHidden = true
        } else if self.lastContentOffset > scrollView.contentOffset.y {
            // did move down
        } else {
            // didn't move
        }
    }
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fetchedPersonDataSource.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: PersonTableViewCell.self, forIndexPath: indexPath)
        cell.fillData(title: viewModel.fetchedPersonDataSource.value[indexPath.row].name, searchText: viewModel.searchText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailDataViewController()
        let personModel = viewModel.fetchedPersonDataSource.value[indexPath.row]
        vc.titleText = personModel.name
        vc.url = personModel.url
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(indexPath.row)
        }
    }
}

extension PersonViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.searchText = searchTextField.text
    }
}

extension FileManager {
    func urls(for directory: FileManager.SearchPathDirectory, skipsHiddenFiles: Bool = true ) -> [URL]? {
        let documentsURL = urls(for: directory, in: .userDomainMask)[0]
        let fileURLs = try? contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: skipsHiddenFiles ? .skipsHiddenFiles : [] )
        return fileURLs
    }
}
