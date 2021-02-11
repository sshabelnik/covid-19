
import UIKit
import Charts

class WorldStatsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var confirmedCovidLabel: UILabel!
    @IBOutlet weak var newlyConfirmedCases: UILabel!
    @IBOutlet weak var sickCovidLabel: UILabel!
    @IBOutlet weak var recoveredCovidLabel: UILabel!
    @IBOutlet weak var deathsCovidLabel: UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    var sickDataEntry = PieChartDataEntry(value: 0)
    var recoveredDataEntry = PieChartDataEntry(value: 0)
    var deathsDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    func setupCell(world: WorldDataModelObject){
        self.confirmedCovidLabel.text = String(world.totalConfirmedCases.formattedWithSeparator)
        self.newlyConfirmedCases.text = "+" + String(world.newlyConfirmedCases.formattedWithSeparator)
        self.sickCovidLabel.text = String((world.totalSickCases).formattedWithSeparator)
        self.recoveredCovidLabel.text = String(world.totalRecoveredCases.formattedWithSeparator)
        self.deathsCovidLabel.text = String(world.totalDeaths.formattedWithSeparator)
        setupPieChartView(world: world)
    }
    
    func setupPieChartView(world: WorldDataModelObject){
        sickDataEntry.value = Double(world.totalSickCases)
        recoveredDataEntry.value = Double(world.totalRecoveredCases)
        deathsDataEntry.value = Double(world.totalDeaths)
        
        numberOfDownloadsDataEntries = [sickDataEntry, recoveredDataEntry, deathsDataEntry]
        pieChartView.legend.enabled = false
        pieChartView.chartDescription?.enabled = false
        pieChartView.transparentCircleRadiusPercent = 0
        pieChartView.holeRadiusPercent = 0.8
        
        updateChartData()
    }
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        chartDataSet.selectionShift = 0
        chartDataSet.drawValuesEnabled = false
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "orange"), UIColor(named: "green"), UIColor(named: "red")]
        chartDataSet.colors = colors as! [NSUIColor]

        pieChartView.data = chartData
    }
}
