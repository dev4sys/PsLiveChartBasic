####################################
# LOAD VIEW XAML
####################################

$XamlChildWindow = LoadXaml($viewFolder+"\barChart.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$BarChartXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

$BarChartView  = $Form.FindName("BarChartView") 
$BarChartView.Children.Add($BarChartXaml)    | Out-Null  

####################################
# INITIALIZE CONTROL
####################################

$barChart  = $BarChartXaml.FindName("barChart")

####################################
# DATAS
####################################

$Processes2 = Get-Process | Sort-Object -Property WS | Select-Object Name,WS -Last 5 

# These values and label will be bound to the bar charts
$seriesCollection2 = [LiveCharts.SeriesCollection]::new()

# Create value that  the graph can interpret
$barValues = [LiveCharts.ChartValues[double]]::new()
$barValues.AddRange([double[]]$Processes2.WS)

# Get the label (As string)
$barLabels = [string[]]$Processes2.Name
