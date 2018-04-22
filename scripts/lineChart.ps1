####################################
# LOAD VIEW XAML
####################################

$XamlChildWindow = LoadXaml($viewFolder+"\lineChart.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$LineChartXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

$LineChartView = $Form.FindName("LineChartView")
$LineChartView.Children.Add($LineChartXaml)  | Out-Null   

####################################
# INITIALIZE CONTROL
####################################

$lineChart = $LineChartXaml.FindName("lineChart")

####################################
# DATAS
####################################

# not a good example ^_^
$Processes2 = Get-Process | Sort-Object -Property WS | Select-Object Name,WS -Last 5 
$seriesCollection = [LiveCharts.SeriesCollection]::new()

foreach ($proc in $Processes2){

	$lineserie = [LiveCharts.Wpf.LineSeries]::new()
	$lineserie.Title = $proc.Name.ToString()
	$lineserie.Values  = [LiveCharts.ChartValues[double]]::new([double[]]$proc.WS)

	$seriesCollection.Add($lineserie)
}





