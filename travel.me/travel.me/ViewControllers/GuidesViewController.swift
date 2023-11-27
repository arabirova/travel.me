//
//  GuidesViewController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit

class GuidesViewController: UIViewController {
    
    var guides: [GuideModel] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(GuideCell.self, forCellReuseIdentifier: GuideCell.id)
        return table
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeTitle()
        makeUI()
        makeConstraints()
        readList()
    }
    
    private func makeTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "#Гайды"
        titleLabel.textColor = .systemGreen
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func makeUI() {
        self.view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func parseData(_ dict: [String: Any]) {
        guides.removeAll()
        for (_, value) in dict {
            guard let answer = value as? [String: Any] else { continue }
            guard let new = try? GuideModel(
                dict: answer
            ) else { return }
            self.guides.append(new)
        }
        
        self.tableView.reloadData()
    }
    
    private func readList() {
        Environment.ref.child("guides").observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let guideDict = (snapshot.value as? [String: Any]) else { return }
            self?.parseData(guideDict)
        })
    }
}

extension GuidesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guides.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: GuideCell.id, for: indexPath)
       guard let routeCell = cell as? GuideCell else { return .init() }
        routeCell.set(guide: guides[indexPath.row])
       return routeCell
   }
}

extension GuidesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       let detailVC = GuideDetailsViewController(guide: guides[indexPath.row])
       navigationController?.pushViewController(detailVC, animated: true)
    }
}
