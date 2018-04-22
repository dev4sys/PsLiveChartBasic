####################################
# LOAD VIEW XAML
####################################

$XamlChildWindow = LoadXaml($viewFolder+"\pieChart.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$PieChartXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

$PieChartView  = $Form.FindName("PieChartView") 
$PieChartView.Children.Add($PieChartXaml)    | Out-Null  

####################################
# INITIALIZE CONTROL
####################################

$pieChart = $PieChartXaml.FindName("pieChart")

####################################
# DATAS
####################################







