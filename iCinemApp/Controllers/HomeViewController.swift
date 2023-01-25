import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = [
        "Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top Rated"
    ]
    
    private let homeFeedTable: UITableView = {
       
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        configureNavbar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func configureNavbar() {
//        var image = UIImage(named: "netflixLogo")
//        image = image?.withRenderingMode(.alwaysOriginal)
        let searchImg = UIImage(systemName: "magnifyingglass")
        let airplayImg = UIImage(systemName: "airplayvideo")
        let profileImg = UIImage(systemName: "person.circle.fill")
//        let item = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
        let item = UIBarButtonItem(title: "Per ME", style: .done, target: self, action: nil)
        let searchItem = UIBarButtonItem(image: searchImg, style: .plain, target: self, action: nil)
        let airplayItem = UIBarButtonItem(image: airplayImg, style: .plain, target: self, action: nil)
        let profileItem = UIBarButtonItem(image: profileImg, style: .plain, target: self, action: nil)
//        item.tintColor = .red
        item.tintColor = .white
        item.title = item.title?.uppercased()
        airplayItem.tintColor = .white
        airplayItem.customView?.frame = CGRectMake(0, 0, 15, 15)
        searchItem.tintColor = .white
        searchItem.customView?.frame = CGRectMake(0, 0, 15, 15)
        profileItem.tintColor = .white
        profileItem.customView?.frame = CGRectMake(0, 0, 15, 15)
        
        navigationItem.setLeftBarButton(item, animated: false)
        navigationItem.setRightBarButtonItems([profileItem, searchItem, airplayItem], animated: false)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(
            x: header.bounds.origin.x + 20,
            y: header.bounds.origin.y,
            width: 100,
            height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.lowercased().capitalized
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
