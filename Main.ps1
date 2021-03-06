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


##############################################################
#                        Views Panel                         #
##############################################################

$viewFolder = $pathPanel +"\views"



##############################################################
#                CONTROL INITIALIZATION                      #
##############################################################

# Initialize with the first value of Item Section 
$HamburgerMenuControl = $Form.FindName("HamburgerMenuControl")
$HamburgerMenuControl.SelectedItem = $HamburgerMenuControl.ItemsSource[1]


##############################################################
#                Line chart                                  #
##############################################################

."$pathPanel\scripts\lineChart.ps1"  
 $lineChart.Series = $seriesCollection



##############################################################
#                PieChart                                    #
##############################################################

."$pathPanel\scripts\pieChart.ps1"  

##############################################################
#                BarChart                                    #
##############################################################

."$pathPanel\scripts\barChart.ps1"  
 $barChart.Series = $barValues


##############################################################
#                Doughnut                                    #
##############################################################

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

