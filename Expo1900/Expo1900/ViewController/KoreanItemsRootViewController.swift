//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/11.
//

import UIKit

final class KoreanItemsRootViewController: UIViewController {
    private let koreanItemRootViewTitle = "한국의 출품작"
    
    private let koreanItems: [KoreanItem] = {
        var items = [KoreanItem]()
        if let dataAsset = NSDataAsset(name: "items") {
            do {
                items =  try JSONDecoder().decode([KoreanItem].self, from: dataAsset.data)
            } catch {
                items = [KoreanItem]()
            }
        }
        return items
    }()
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(KoreanItemCell.self, forCellReuseIdentifier: KoreanItemCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = koreanItemRootViewTitle
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 150
        mainTableView.delegate = self
        mainTableView.dataSource = self
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        addMainTableViewConstraint()
    }
    
    private func addMainTableViewConstraint() {
        mainTableView.rowHeight = UITableView.automaticDimension
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension KoreanItemsRootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let koreanItemViewcontroller = KoreanItemViewController()
        koreanItemViewcontroller.koreanItem = koreanItems[indexPath.row]
        navigationController?.pushViewController(koreanItemViewcontroller, animated: true)
    }
}

extension KoreanItemsRootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreanItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreanItemCell.reuseIdentifier, for: indexPath) as? KoreanItemCell else {
            return UITableViewCell()
        }
        let koreanItemData = koreanItems[indexPath.row]
        cell.setKoreanItemCellContents(imageName: koreanItemData.imageName,
                                       title: koreanItemData.name,
                                       shortDescription: koreanItemData.shortDescription)
        return cell
    }
}