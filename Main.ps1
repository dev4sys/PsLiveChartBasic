#########################################################################
# Author:  Kevin RAHETILAHY                                             #   
# Blog: dev4sys.blogspot.fr                                             #
#########################################################################

#########################################################################
#                        Add shared_assemblies                          #
#########################################################################


[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\System.Windows.Interactivity.dll') | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')      | out-null  
[System.Reflection.Assembly]::LoadFrom('assembly\LiveCharts.dll')        | out-null  	
[System.Reflection.Assembly]::LoadFrom('assembly\LiveCharts.Wpf.dll') 	 | out-null  	


#########################################################################
#                        Load Main Panel                                #
#########################################################################

$Global:pathPanel= split-path -parent $MyInvocation.MyCommand.Definition


function LoadXaml ($filename){
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}


$XamlMainWindow=LoadXaml($pathPanel+"\Main.xaml")
$reader = (New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form = [Windows.Markup.XamlReader]::Load($reader)


#########################################################################
#                        Load Views Panel                               #
#########################################################################

$viewFolder = $pathPanel +"\views"

$XamlChildWindow = LoadXaml($viewFolder+"\lineChart.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$LineChartXaml     = [Windows.Markup.XamlReader]::Load($Childreader)


$XamlChildWindow = LoadXaml($viewFolder+"\doughnut.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$DoughnutXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

$XamlChildWindow = LoadXaml($viewFolder+"\pieChart.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$PieChartXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

$XamlChildWindow = LoadXaml($viewFolder+"\barChart.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$BarChartXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

#******************* Target View  *****************

$HamburgerMenuControl = $Form.FindName("HamburgerMenuControl")

$LineChartView = $Form.FindName("LineChartView")
$DoughnutView  = $Form.FindName("DoughnutView")
$PieChartView  = $Form.FindName("PieChartView") 
$BarChartView  = $Form.FindName("BarChartView") 


$LineChartView.Children.Add($LineChartXaml)  | Out-Null    
$DoughnutView.Children.Add($DoughnutXaml)    | Out-Null   
$PieChartView.Children.Add($PieChartXaml)    | Out-Null  
$BarChartView.Children.Add($BarChartXaml)    | Out-Null  

##############################################################
#                CONTROL INITIALIZATION                      #
##############################################################



# Initialize with the first value of Item Section 
$HamburgerMenuControl.SelectedItem = $HamburgerMenuControl.ItemsSource[1]

$lineChart = $LineChartXaml.FindName("lineChart")
$Doughnut  = $DoughnutXaml.FindName("Doughnut")
$pieChart  = $PieChartXaml.FindName("pieChart")
$barChart  = $BarChartXaml.FindName("barChart")



##############################################################
#                Line chart                                  #
##############################################################

# Data of line chart 
."$pathPanel\scripts\lineChart.ps1"  
 $lineChart.Series = $seriesCollection



##############################################################
#                PieChart                                    #
##############################################################


##############################################################
#                BarChart                                    #
##############################################################
# Data of bar chart 
."$pathPanel\scripts\barChart.ps1"  
 $barChart.Series = $barValues


##############################################################
#                Doughnut                                    #
##############################################################
# Data of doughnut chart 
."$pathPanel\scripts\doughnut.ps1"  
$Doughnut.Series = $DoughnutCollection



#########################################################################
#                        HAMBURGER EVENTS                               #
#########################################################################

$HamburgerMenuControl.add_ItemClick({
    
   $HamburgerMenuControl.Content = $HamburgerMenuControl.SelectedItem
   $HamburgerMenuControl.IsPaneOpen = $false

})



##############################################################
#                SHOW WINDOW                                 #
##############################################################

$Form.ShowDialog() | Out-Null

