Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()   


####MISSING FEATURES####
#       Drop down list with current nodes to select from
#       Drop down list with current tags to select from
#       Ability to create new node & new tag if necessary instead of selecting current ones
# fix menu strip
# notation -- code is a mess, leave me alone


###ADDITIONS
# 5/26/21 - Ability to add/remove to CSV & Refresh GUI w/ additions/removals
#         - Use "Add Item" option from menu bar "Tools" to open 2nd Window & add new item to the CSV. Closing Window refreshes pokedex w/ new additions.
# 5/28/21 - json to config BackColor, ForeColor, Text & default paths on items
#



# assign Current User value
$currentUser = $env:UserName

# set Pokedex Directory path
$pokedexPath = "C:\users\$currentUser\Appdata\local\Pokedex"

if(test-path $pokedexPath){
    $pokedexJSON = "$pokedexPath\config.json"
}
else{
    Write-Host "Holy guacamole $pokedexPath either doesn't exist or you don't have the correct permissions for the directory.
Make sure the directory exists & houses the config.json file as well as pokedex_items.csv (unless you've changed the default path in the config file)!"
    Pause
    Exit
}


if(test-path $pokedexJSON){
    $config = get-content $pokedexJSON | ConvertFrom-Json
}
else{
    Write-Host "Well you gosh darn dun lost your config file. `nPlease visit the nearest PokeCenter to restore your config.json back to life!"
    Pause
    Exit
}


if($config.Pokedex.Path -eq "Default"){
    $pokedexCSV = "$pokedexPath\pokedex_items.csv"
}
else{
    $customPath = $config.Pokedex.Path
    $pokedexCSV = "$customPath\pokedex_items.csv"
}

if(test-path $pokedexCSV){
}
else{
    Write-Host "We were so close. `nLooks like your pokedex_items.csv has gone fishin'. `n`nIf the Path is set to Default in the config file, make sure the csv is located in :
    $pokedexPath.`n`nIf the Path has been set to a custom location in the config file, make sure to use double-back slashes :
    Example: C:\\users\\Joe\\Documents"
    Pause
    Exit
}

<#
$testFile = $false
$passCount = 0
while($testFile -eq $false){
    $passCount++
    if($passCount -gt 5){
        Write-Host "Please ensure you have read/write access to $pokedexPath"
        Pause
        Exit
    }

    if(!(test-path $pokedexCSV)){
        
        $testDirectory = $false
        while($testDirectory -eq $false){
            if(!(test-path $pokedexPath)){
                New-Item -Path $pokedexPath -ItemType Directory
            }
            if(test-path $pokedexPath){
                $testDirectory = $true
            }
        } #end while loop for directory creation


        New-Item -Path $pokedexCSV -ItemType File

        if(test-path $pokedexCSV){
            $testFile = $true

            #confirmed CSV exists
            #add sample data

            $sampleData = @()
            
            $sampleData +=[PSCustomObject]@{
                Node = "IT Tools"
                Tag = "AD User Scripts"
                Name = "AD User Info"
                Path = "ENTER PATH TO SCRIPT"
                Info = "ENTER INFO"
            }
            $sampleData +=[PSCustomObject]@{
                Node = "IT Tools"
                Tag = "AD User Scripts"
                Name = "AD User Dept"
                Path = "ENTER PATH TO SCRIPT"
                Info = "ENTER INFO"
            }
            $sampleData +=[PSCustomObject]@{
                Node = "IT Tools"
                Tag = "General Tools"
                Name = "Command Prompt"
                Path = "CMD.exe"
                Info = "Opens a command prompt"
            }
            $sampleData +=[PSCustomObject]@{
                Node = "IT Tools"
                Tag = "General Tools"
                Name = "Powershell"
                Path = "powershell.exe"
                Info = "Opens a command prompt"
            }
            $sampleData +=[PSCustomObject]@{
                Node = "Security Tools"
                Tag = "OSINT"
                Name = "URLSCAN.io"
                Path = "https://urlscan.io"
                Info = "Opens URLSCAN.io"
            }
            $sampleData +=[PSCustomObject]@{
                Node = "Security Tools"
                Tag = "OSINT"
                Name = "VirusTotal"
                Path = "https://virustotal.com"
                Info = "Opens VirusTotal"
            }
            $sampleData +=[PSCustomObject]@{
                Node = "Documentation"
                Tag = "Networking"
                Name = ""
                Path = ""
                Info = ""
            }
            $sampleData +=[PSCustomObject]@{
                Node = "Documentation"
                Tag = "Endpoints"
                Name = ""
                Path = ""
                Info = ""
            }
            $sampleData +=[PSCustomObject]@{
                Node = "Programs"
                Tag = "Office"
                Name = "Word"
                Path = "WINWORD.exe"
                Info = ""
            }
            $sampleData +=[PSCustomObject]@{
                Node = "Programs"
                Tag = "Office"
                Name = "Excel"
                Path = "EXCEL.exe"
                Info = ""
            }

            $sampleData | export-csv -Path $pokedexCSV -NoTypeInformation

        }
    }
    else{
        $testFile = $true
    }
} #end while loop for file creation
#>

function Fresh{
    $script:ITTools = import-csv -Path $pokedexCSV

    #import the CSV
    #CSV contains Node, Tag, Name, Path, Info
    #Node being the root, tag sub, name for listed items, path for item, info about item
    #the idea is that using 
    $script:nodeArray= @()
    $script:tagArray=@()

    
    foreach($line in $script:ITTools){
        $nodeLine = $line.Node
        $tagLine = $line.Tag
        $script:nodeArray += $nodeLine
        $script:tagArray += $tagLine
    }
    $script:nodeArray = $script:nodeArray | select -Unique
    $script:tagArray = $script:tagArray | select -Unique
}

#foreach($line in $script:nodeArray){
#    Write-Host $line
#}

#foreach($line in $script:tagArray){
#    Write-host $line
#}

function launch_falcon9{

        if($V1 -like "\*.exe"){
                    ii "$falcon9"
        }
        elseif($falcon9 -like "*.ps1"){
            powershell.exe -command "& '$falcon9'"
        }
        elseif($falcon9 -like "http*"){
            Start-Process $falcon9
        }
        elseif($falcon9 -like "\*.docx"){
            ii "$falcon9"
        }
        elseif($falcon9 -like "\*.rtf"){
            ii "$falcon9"
        }
        elseif($falcon9 -like "\*.xlsx"){
            Explorer.exe "$falcon9"
        }
        elseif($falcon9 -like "\*.cmd"){
            ii "$falcon9"
        }
        elseif($falcon9 -like "*.exe"){
            Start-Process $falcon9
        }
        else{
            Explorer.exe "$falcon9"
        }
        $listBox.ClearSelected()

}


function listbox($listbox){

    $listbox.Location = New-Object System.Drawing.Point(5,17)
    $listbox.BringToFront()
    $listbox.size = '190,370'
    $listbox.anchor = 'top, left, right'
    $listbox.borderstyle = 'none'
    $listbox.backcolor = $config.Pokedex.ListBox.BackColor
    $listbox.forecolor = $config.Pokedex.ListBox.ForeColor
    $listbox.font = $listfont
    $listBox.ScrollAlwaysVisible = $False
    $listbox.HorizontalScrollbar = $True

}


function populateListBox($nodeSelect){
    $listbox.Items.Clear()
    $listbox.refresh()
    foreach($line in $script:ITTools){
        if($line.Tag -eq $nodeSelect){
            [void] $listbox.Items.Add($line.Name)
        }  
    }
	
  
    foreach($node in $script:nodeArray){
        if($nodeSelect -eq "parent_$node"){
            foreach($line in $script:ITTools){
                if($line.Node -eq $node){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }

}


function treeviewPopulate($treeview){
    foreach($node in $script:nodeArray){
        $currentNode = New-Object System.Windows.Forms.TreeNode
        $currentNode.Text = $node
        $currentNode.Tag = "parent_$node"
        $treeview.Nodes.Add($currentNode)
            foreach($line in $script:ITTools){
                $lineNode = $line.Node
                $currentNodeText = $currentNode.Text

                if($lineNode -eq $currentNodeText){
                    $newNode = New-Object System.Windows.Forms.TreeNode
                    $text = $line.Tag
                    $newNode.Text = $text

                    if($currentNode.Nodes.Tag -contains $text){
                        $HostNode = $currentNode.Nodes | ?{$_.Tag -eq $text}
                    }
                    else{
                        $newHostNode = New-Object System.Windows.Forms.TreeNode
                        $newHostNode.Text = $text
                        $newHostNode.Tag = $text
            
                        $null = $currentNode.Nodes.Add($newHostNode)
                        $HostNode = $currentNode.Nodes | ?{$_.Tag -eq $text}
                    }
                }
            }
        }
}


function treeview($treeview){

    $treeview.location = New-Object System.Drawing.Point(1,17)
    $treeview.BringtoFront()
    $treeview.size = '30,410'
    $treeview.backcolor = $config.Pokedex.TreeView.BackColor
    $treeview.forecolor = $config.Pokedex.TreeView.ForeColor
    $treeview.anchor  = 'top,left'
    $treeview.BorderStyle = 'none'
    $treeview.font = $treefont

    treeviewPopulate($treeview)

}




##################UNTOUCHED ####################
function GenPokedex{
    
    #** CREATE Various form objects
    $pokedex = New-Object System.Windows.Forms.Form
    $listbox = New-Object System.Windows.Forms.ListBox
    $treeview = New-Object System.Windows.Forms.TreeView
    $textBox = New-Object System.Windows.Forms.TextBox
    $infoLabel = New-Object System.Windows.Forms.label
    $searchBox = New-Object System.Windows.Forms.TextBox

    $searchBtn = New-Object System.Windows.Forms.Button
    $clearBtn = New-Object System.Windows.Forms.Button
    $closeBtn = New-Object System.Windows.Forms.Button
    $expandAll = New-Object System.Windows.Forms.Button
    $collapseAll = New-Object System.Windows.Forms.Button

    #** Create SplitContainers
    $splitcontainer1 = new-object System.Windows.Forms.SplitContainer
    $splitcontainer2 = new-object System.Windows.Forms.SplitContainer
    $splitcontainer3 = new-object System.Windows.Forms.SplitContainer
    $splitContainer1.Panel1.SuspendLayout()
    $splitContainer1.Panel2.SuspendLayout()
    $splitContainer1.SuspendLayout()
    $splitContainer2.Panel1.SuspendLayout()
    $splitContainer2.Panel2.SuspendLayout()
    $splitContainer2.SuspendLayout()
    $splitContainer3.Panel1.SuspendLayout()
    $splitContainer3.Panel2.SuspendLayout()
    $splitContainer3.SuspendLayout()

    #** CREATE Group Boxes
    $searchGroup = New-Object System.Windows.Forms.GroupBox
    $groupBox = New-Object System.Windows.Forms.GroupBox
    $groupText = New-Object System.Windows.Forms.GroupBox
    $infoGroup = New-Object System.Windows.Forms.GroupBox
    
    #** CREATE Menu Strip & Menu Items
    $menu = New-Object System.Windows.Forms.MenuStrip
    $fileMenu = New-Object System.Windows.Forms.ToolStripMenuItem('File')
	$editMenu = New-Object System.Windows.Forms.ToolStripMenuItem('Edit')
    $tools = New-Object System.Windows.Forms.ToolStripMenuItem('Tools')
    $help = New-Object System.Windows.Forms.ToolStripMenuItem('Help')
    $quit = New-Object System.Windows.Forms.ToolStripMenuItem('Quit')
    $Refresh = New-Object System.Windows.Forms.ToolStripMenuItem('Refresh')
    $csvAddTool = New-Object System.Windows.Forms.ToolStripMenuItem('Add Item')
	$edit_csv = New-Object System.Windows.Forms.ToolStripMenuItem('Data CSV')
	$edit_config = New-Object System.Windows.Forms.ToolStripMenuItem('Config')
	$open_AppData = New-Object System.Windows.Forms.ToolStripMenuItem('Pokedex Files')

    #** DEFINE Font
    $font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5,[System.Drawing.FontStyle]::Bold)
    $font2 = New-Object System.Drawing.Font("Microsoft Sans Serif", 9.0)
    $font3 = New-Object System.Drawing.Font("Microsoft Sans Serif", 10.5)
    $treebold = $config.Pokedex.TreeView.TypeBold
    $treefont = New-Object System.Drawing.Font("Microsoft Sans Serif", $config.Pokedex.TreeView.FontSize,[System.Drawing.FontStyle]::$treebold)
    $listbold = $config.Pokedex.ListBox.TypeBold
    $listfont = New-Object System.Drawing.Font("Microsoft Sans Serif", $config.Pokedex.ListBox.FontSize,[System.Drawing.FontStyle]::$listbold)
    $infobold = $config.Pokedex.InfoView.TypeBold
    $infofont = New-Object System.Drawing.Font("Microsoft Sans Serif", $config.Pokedex.InfoView.FontSize,[System.Drawing.FontStyle]::$infobold)


    $InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'



    #Create listbox w/ call to listbox function
    listbox($listbox)

    #Create treeview w/ call to treeview function
    treeview($treeview)

    $pokedex_Load = {}

    <#
    START Click Actions / Selection Actions START
    #>
    
    $launch_click = {

        foreach($thing in $script:ITTools){
            $thingName = $thing.Name

            if($thingName -eq $listbox.SelectedItem){
                $falcon9 = $thing.Path
                $textBox.text = $null
                $textBox.Refresh()
                launch_falcon9
            }                
        }
    }
    
    function info_click{
        foreach($thing in $script:ITTools){
            $thingName = $thing.Name

            if($thingName -eq $listbox.SelectedItem){
                if($thing.Info -eq ""){
                    $infoString = $thing.Path
                }
                else{
                    $infoString = $thing.Info
                }
                $textBox.text = $infoString
                $textBox.Refresh()
            }
        }
    }

    $info_click = {
        info_click
    }

    $search_click = {
        $textBox.Text = ""
	    $listbox.Items.Clear()
	    $userInput = $searchBox.Text
	    $userSearch = "*$userInput*"
	
	    if($userInput -eq ""){
		    $listbox.Items.Clear()
	    }
	    else{
		    foreach($bit in $script:ITTools){
			    if($bit.Name -like $userSearch){
				    [void] $listbox.Items.Add($bit.Name)
			    }
		    }

            if($listbox.Items.Count -gt 0){
                $listBox.SetSelected(0, $TRUE)
                $listBox.Focus()
                info_click
            }
            else{
                [System.Windows.Forms.MessageBox]::Show("B33p Bo0p BOp.. // ...
                  .-''-.
	  / [0] __\
	_|__ o LI |_
             / | ====  | \
             |_| ====  |_|
	||'    ||   ||
	||LI    o ||
	|| '-----' ||
              /__|      |__\
                Search returned 0 results.")
            }
	    }
    }

    $clear_click = {
        $searchBox.text = ''
        $listbox.items.clear()
        $textBox.Clear()
        $searchBox.Focus()
    }

    $close_click = {
        $pokedex.close()
    }

    $Refresh_Click = {
        $searchBox.text = ''
        $listbox.items.clear()
        $textBox.Clear()
        $searchBox.Focus()
        $treeview.Nodes.clear()
        Fresh
        
        treeviewPopulate($treeview)
        
    }

	$open_AppData_click = {
		ii $pokedexPath
	}
	
	$edit_click = {
		ii $pokedexCSV
	}
	
	$edit_config_click = {
		ii $pokedexJSON
	}

    $AddBtn_Click = {
        GenCSVInput
        
        $treeview.Nodes.clear()
        Fresh
        treeviewPopulate($treeview)
        
    }

    $expand_click = {
        $treeview.ExpandAll()
    }

    $collapse_click = {
        $treeview.CollapseAll()
    }

    $treeview.add_AfterSelect({
        $nodeSelect = $this.SelectedNode.Tag
        $textBox.text = $null
        $textBox.Refresh()
        populateListBox($nodeSelect)
    })

    $treeview.Add_KeyDown({if($_.KeyCode -eq "Enter")
        {
            if($treeview.SelectedNode.IsExpanded){
                $treeview.SelectedNode.Collapse()
            }
            else{
                $treeview.SelectedNode.Expand()
            }
        }
    })

    <#
    END Click Actions / Selection Actions END
    #>


    #** listbox ADD click/selection actions
    $listbox.add_DoubleClick($launch_click)
    $listbox.add_Click($info_click)
    $listBox.Add_KeyDown({if ($_.KeyCode -eq "Enter")
        {
            foreach($thing in $script:ITTools){
                $thingName = $thing.Name

                if($thingName -eq $listbox.SelectedItem){
                    $falcon9 = $thing.Path
                    $textBox.text = $null
                    $textBox.Refresh()
                    launch_falcon9
                }                
            }
        }
    })

    $listBox.Add_KeyUp({if ($_.KeyCode -eq "Down")
        {
            foreach($thing in $script:ITTools){
                $thingName = $thing.Name

                if($thingName -eq $listbox.SelectedItem){
                    if($thing.Info -eq ""){
                        $infoString = $thing.Path
                    }
                    else{
                        $infoString = $thing.Info
                    }
                    $textBox.text = $infoString
                    $textBox.Refresh()
                }
            }
        }        
    })

    $listBox.Add_KeyUp({if ($_.KeyCode -eq "Up")
        {
            foreach($thing in $script:ITTools){
                $thingName = $thing.Name

                if($thingName -eq $listbox.SelectedItem){
                    if($thing.Info -eq ""){
                        $infoString = $thing.Path
                    }
                    else{
                        $infoString = $thing.Info
                    }
                    $textBox.text = $infoString
                    $textBox.Refresh()
                }
            }
        }        
    })

    $Form_StateCorrection_Load = {
        $pokedex.WindowState = $InitialFormWindowState
    }

    $pokedex.SuspendLayout()

    #DEFINE pokedex form
    $pokedex.ClientSize = '450,500'
    $pokedex.AutoScaleDimensions = '6,13'
    $pokedex.AutoScaleMode = 'Font'
    $pokedex.BackColor = $config.Pokedex.BackColor#[System.Drawing.Color]::FromArgb(255,255,50,50)
    $pokedex.MaximizeBox = $True
    $pokedex.MinimizeBox = $True
    $pokedex.Name = 'Pokedex Form'
    $pokedex.StartPosition = 'CenterScreen'
    $pokedex.MinimumSize = '300,250'
    $pokedex.KeyPreview = $True
    $pokedex.AutoScroll = $True
    $pokedex.VerticalScroll.Enabled = $true
    $pokedex.VerticalScroll.Visible = $True
    $pokedex.ForeColor = $config.Pokedex.BackColor
    $pokedex.text = $config.Pokedex.Name

    #pokedex Controls.Add
    $pokedex.Controls.Add($menu)
    $pokedex.Controls.Add($splitcontainer1)
    $pokedex.add_Load($pokedex_Load)


    <#
    Define other stuff
    #>
    $menu.items.Add($fileMenu)
	$menu.items.Add($editMenu)
    $menu.Items.Add($tools)
    $menu.Items.Add($help)
    $menu.BackColor = $config.Pokedex.MenuBar.BackColor
    $menu.ForeColor = $config.Pokedex.MenuBar.ForeColor

    $menu.Location = '0,0'
    $menu.size = '450,24'
    $menu.text = "Main Menu"
    
    $Refresh.Add_Click($Refresh_Click)
    $quit.Add_Click($close_click)
    $csvAddTool.Add_Click($AddBtn_Click)
	$edit_CSV.Add_Click($edit_click)
	$edit_config.Add_Click($edit_config_click)
	$open_AppData.Add_Click($open_AppData_click)
    $edit_config.Add_Click($edit_config_click)
	
    $fileMenu.DropDown.BackColor = $config.Pokedex.MenuBar.FileMenuDrop.BackColor
    $fileMenu.DropDown.ForeColor = $config.Pokedex.MenuBar.FileMenuDrop.ForeColor
	$fileMenu.DropDownItems.Add($open_AppData)
    $fileMenu.DropDownItems.Add($Refresh)
    $fileMenu.DropDownItems.Add($quit)
	
    $editMenu.DropDownItems.Add($edit_CSV)
	$editMenu.DropDownItems.Add($edit_config)
    $editMenu.DropDown.BackColor = $config.Pokedex.MenuBar.EditMenuDrop.BackColor
    $editMenu.DropDown.ForeColor = $config.Pokedex.MenuBar.EditMenuDrop.ForeColor
    
    $tools.DropDownItems.Add($csvAddTool)
    $tools.DropDown.BackColor = $config.Pokedex.MenuBar.ToolsMenuDrop.BackColor
    $tools.DropDown.ForeColor = $config.Pokedex.MenuBar.ToolsMenuDrop.ForeColor
   

    #**
    #** SPLITCONTAINER 1
    $splitContainer1.Dock = [System.Windows.Forms.DockStyle]::Fill
    $splitContainer1.Location = new-object System.Drawing.Point(0, 24)
    $splitContainer1.Name = "splitContainer1"

    $splitContainer1.Panel1.Controls.Add($splitContainer2)
    $splitContainer1.Panel2.Controls.Add($splitContainer3)

    $splitContainer1.Size = new-object System.Drawing.Size(550, 545)
    $splitContainer1.SplitterDistance = 240
    #$splitContainer1.IsSplitterFixed = $True
    $splitContainer1.TabStop = $false

    #**
    #** SPLITCONTAINER 2
    $splitContainer2.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
    $splitContainer2.Dock = [System.Windows.Forms.DockStyle]::Fill
    $splitContainer2.Location = new-object System.Drawing.Point(0, 0)
    $splitContainer2.Name = "splitContainer2"
    $splitContainer2.Orientation = [System.Windows.Forms.Orientation]::Horizontal

    $splitContainer2.Panel1.Controls.Add($GroupBox)
    $splitContainer2.Panel2.Controls.Add($searchGroup)

    $splitContainer2.Size = new-object System.Drawing.Size(50, 545)
    $splitContainer2.SplitterDistance = 445
    #$splitContainer2.IsSplitterFixed = $True
    #$splitContainer2.TabIndex = 0
    $splitContainer2.TabStop = $false

    #**
    #** SPLITCONTAINER 3
    $splitContainer3.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
    $splitContainer3.Dock = [System.Windows.Forms.DockStyle]::Fill
    $splitContainer3.Location = new-object System.Drawing.Point(0, 0)
    $splitContainer3.Name = "splitContainer3"
    $splitContainer3.Orientation = [System.Windows.Forms.Orientation]::Horizontal

    $splitContainer3.Panel1.Controls.Add($groupText)
    $splitContainer3.Panel2.Controls.Add($infoGroup)

    $splitContainer3.Size = new-object System.Drawing.Size(285, 545)
    $splitContainer3.SplitterDistance = 400
    #$splitContainer3.IsSplitterFixed = $True
    $splitContainer3.TabStop = $false


    #** TREEVIEW GROUP BOX
    $groupBox.Anchor="bottom, top, left, right"
    $groupBox.Controls.Add($treeview)
    $groupBox.Location = '5,5'
    $groupBox.Size = '35,432'
    $groupBox.text = 'TreeView'
    $groupbox.BackColor = $config.Pokedex.TreeView.BackColor
    $groupBox.ForeColor = $config.Pokedex.TreeView.ForeColor
    

    #** LISTBOX GROUP BOX
    $groupText.Anchor="top,left,right,bottom"
    $groupText.Controls.Add($listBox)
    $groupText.Location = '5,5'
    $groupText.Size = '270,386'
    $groupText.text = 'List Items'
    $groupText.BackColor = $config.Pokedex.ListBox.BackColor
    $grouptext.ForeColor = $config.Pokedex.ListBox.ForeColor


    #** INFO GROUP BOX
    $infoGroup.Size = '270,125'
    $infoGroup.Location = '5,5'
    $infoGroup.Text = 'Info'
    $infoGroup.Controls.Add($textBox)
    $infoGroup.Anchor = 'bottom, left, right, top'
    $infoGroup.BackColor = $config.Pokedex.InfoView.BackColor
    $infoGroup.ForeColor = $config.Pokedex.InfoView.ForeColor

    #** INFO TEXT BOX
    $textBox.Size = '260,100'
    $textBox.Multiline = $True
    $textBox.location = '5,15'
    $textBox.ReadOnly = $True
    $textbox.BorderStyle = 'none'
    $textBox.backcolor = $config.Pokedex.InfoView.BackColor
    $textBox.ForeColor = $config.Pokedex.InfoView.ForeColor
    $textBox.ScrollBars = 'Vertical'
    #$textBox.ScrollAlwaysVisible = $False
    $textBox.font = $infofont
    $textBox.HideSelection = $True
    $textBox.BringToFront()

    #** SEARCH GROUP BOX
    $searchGroup.Size = '35,82'
    $searchGroup.Location = '5,5'
    $searchGroup.Text = 'Search'
    $searchGroup.Controls.Add($searchBox)
    $searchGroup.Controls.Add($searchBtn)
    $searchGroup.Controls.Add($clearBtn)
    $searchGroup.Controls.Add($closeBtn)
    $searchGroup.Controls.Add($expandAll)
    $searchGroup.Controls.Add($collapseAll)
    $searchGroup.BackColor = $config.Pokedex.SearchBox.BackColor
    $searchGroup.ForeColor = $config.Pokedex.SearchBox.ForeColor
    $searchGroup.Anchor = "Bottom, top, left, right"


    #** SEARCH TEXT BOX
    $searchBox.Size = '105,45'
    $searchBox.TabIndex = 0
    $searchBox.location = '5,15'
    $searchBox.Text = "Search"
    $searchBox.Add_KeyDown({if ($_.KeyCode -eq "Enter")
        {
            $searchBtn.PerformClick()
        }
    })

    #** SEARCH BUTTON
    $searchBtn.size = '105,19' #'105,19'
    $searchBtn.text = 'Search'
    $searchBtn.location = '115,15'
    $searchBtn.TabIndex = 1
    $searchBtn.UseVisualStyleBackColor = $True
    $searchBtn.BackColor = $config.Pokedex.SearchBox.Buttons.Search.BackColor
    $searchBtn.Font = $font
    $searchBtn.BringtoFront()
    $searchBtn.ForeColor = $config.Pokedex.SearchBox.Buttons.Search.ForeColor
    $searchBtn.add_click($search_click)


    $expandAll.size = '105,19'
    $expandAll.text = 'Expand All'
    $expandAll.location = '115,39'
    $expandAll.TabIndex = 1
    $expandAll.UseVisualStyleBackColor = $True
    $expandAll.BackColor = $config.Pokedex.SearchBox.Buttons.Expand.BackColor
    $expandAll.Font = $font
    $expandAll.BringtoFront()
    $expandAll.ForeColor = $config.Pokedex.SearchBox.Buttons.Expand.ForeColor
    $expandAll.add_click($expand_click)

    $collapseAll.size = '105,19'
    $collapseAll.text = 'Collapse All'
    $collapseAll.location = '115,62'
    $collapseAll.TabIndex = 1
    $collapseAll.UseVisualStyleBackColor = $True
    $collapseAll.BackColor = $config.Pokedex.SearchBox.Buttons.Collapse.BackColor
    $collapseAll.Font = $font
    $collapseAll.BringtoFront()
    $collapseAll.ForeColor = $config.Pokedex.SearchBox.Buttons.Collapse.ForeColor
    $collapseAll.add_click($collapse_click)

    $clearBtn.size = '105,19'
    $clearBtn.text = 'Clear'
    $clearBtn.location = '5,39'
    $clearBtn.UseVisualStyleBackColor = $True
    $clearBtn.BackColor = $config.Pokedex.SearchBox.Buttons.Clear.BackColor
    $clearBtn.Font = $font
    $clearBtn.BringtoFront()
    $clearBtn.ForeColor = $config.Pokedex.SearchBox.Buttons.Clear.ForeColor
    $clearBtn.add_click($clear_click)

    $closeBtn.size = '105,19'
    $closeBtn.text = 'Close'
    $closeBtn.location = '5,62'
    $closeBtn.UseVisualStyleBackColor = $True
    $closeBtn.BackColor = $config.Pokedex.SearchBox.Buttons.Close.BackColor
    $closeBtn.Font = $font
    $closeBtn.BringtoFront()
    $closeBtn.ForeColor = $config.Pokedex.SearchBox.Buttons.Close.ForeColor
    $closeBtn.add_click($close_click)
        
    #bring several objects to the front of the form
    $splitContainer1.BringToFront()
    $splitContainer2.BringToFront()
    $splitContainer3.BringToFront()
    $searchGroup.BringtoFront()
    $groupBox.BringToFront()
    $searchGroup.BringToFront()
    $menu.BringToFront()
    $textBox.BringToFront()
    $searchBox.BringToFront()

    $treeview.ShowLines = $True
    $treeview.Showplusminus = $True
    $treeview.LineColor = $config.Pokedex.TreeView.LineColor
    #$treeview.ShowRootLines = $False
    $treeview.Sorted = $True
    $treeview.TabStop = $False
    $treeview.anchor = "Bottom, top, left, right"

    $listbox.anchor = "top, bottom, left, right"
    $textbox.Anchor = 'bottom, left, right, top'
    $searchBox.Anchor = "Bottom, top, left"
    $searchBtn.Anchor = "left,top"
    $clearBtn.Anchor = "top, left"
    $closeBtn.Anchor = "top, left"
    $expandAll.Anchor = "top, left"
    $collapseAll.Anchor = "top, left"


    #region frmMain


    # 
    $pokedex.AutoScaleDimensions = new-object System.Drawing.SizeF(6, 13)
    $pokedex.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font
    $pokedex.ClientSize = new-object System.Drawing.Size(551, 591)
    $pokedex.Controls.Add($splitContainer1)
    $pokedex.Controls.Add($Menu)
    $pokedex.MainMenuStrip = $Menu
    $pokedex.Name = "Pokedex"
    $pokedex.Text = $config.Pokedex.Name
    $Menu.ResumeLayout($false)
    $Menu.PerformLayout()
    $Menu.ResumeLayout($false)
    $Menu.PerformLayout()
    $splitContainer1.Panel1.ResumeLayout($false)
    $splitContainer1.Panel2.ResumeLayout($false)
    $splitContainer1.ResumeLayout($false)
    $splitContainer2.Panel1.ResumeLayout($false)
    $splitContainer2.Panel2.ResumeLayout($false)
    $splitContainer2.ResumeLayout($false)
    $groupBox.ResumeLayout($false)
    $groupBox.PerformLayout()
    $searchGroup.ResumeLayout($false)
    $searchGroup.PerformLayout()
    $searchBtn.ResumeLayout($false)
    $searchBtn.PerformLayout()
    $closeBtn.ResumeLayout($false)
    $closeBtn.PerformLayout()
    $clearBtn.ResumeLayout($false)
    $clearBtn.PerformLayout()
    $splitContainer3.Panel1.ResumeLayout($false)
    $splitContainer3.Panel2.ResumeLayout($false)
    $splitContainer3.ResumeLayout($false)
    $groupText.ResumeLayout($false)
    $groupText.PerformLayout()
    $infoGroup.ResumeLayout($false)
    #$infoGroup.ResumeLayout($false)
    #$tabPage1.ResumeLayout($false)
    #$tabInstances.ResumeLayout($false)
    $pokedex.ResumeLayout($false)
    $pokedex.PerformLayout()

    #endregion frmMain
    #endregion

    $pokedex.Add_Shown({$pokedex.Activate()}) 

    & {
        [void]$pokedex.showdialog() 
    }

}



## ADD TO CSV FORM
function GenCSVInput{

    $csvInput = New-Object System.Windows.Forms.Form
    
    $inputGroup = New-Object System.Windows.Forms.GroupBox
    
    $itemNode = New-Object System.Windows.Forms.TextBox
    $nodeLabel = New-Object System.Windows.Forms.label
    $itemTag = New-Object System.Windows.Forms.TextBox
    $tagLabel= New-Object System.Windows.Forms.label
    $itemName = New-Object System.Windows.Forms.TextBox
    $nameLabel = New-Object System.Windows.Forms.label
    $itemPath = New-Object System.Windows.Forms.TextBox
    $pathLabel = New-Object System.Windows.Forms.label
    $itemInfo = New-Object System.Windows.Forms.TextBox
    $infoLabel = New-Object System.Windows.Forms.label



    $addBtn = New-Object System.Windows.Forms.Button
    $finishBtn = New-Object System.Windows.Forms.Button

    #** DEFINE Font
    $font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5,[System.Drawing.FontStyle]::Bold)
    $font2 = New-Object System.Drawing.Font("Microsoft Sans Serif", 9.0)
    $font3 = New-Object System.Drawing.Font("Microsoft Sans Serif", 10.5)


    $InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'


    $csvInput_Load = {}


    #### Clicks
    $add_click = {
        $addNode = $itemNode.Text 
        $addTag = $itemTag.Text
        $addName = $itemName.Text
        $addPath = $itemPath.Text
        $addInfo = $itemInfo.Text

        $dataAdd = @()

        $dataAdd +=[PSCustomObject]@{
            Node = $addNode
            Tag = $addTag
            Name = $addName
            Path = $addPath
            Info = $addPath
        }

        $dataAdd | export-csv -Path $pokedexCSV -NoTypeInformation -Append

        $itemNode.Text = ''
        $itemTag.Text = ''
        $itemName.Text = ''
        $itemPath.Text = ''
        $itemInfo.Text = ''
        $itemNode.Focus()
    }

    $finish_click = {
        $csvInput.close()
    }

    #### END CLICKS



    $Form_StateCorrection_Load = {
        $csvInput.WindowState = $InitialFormWindowState
    }

    $csvInput.SuspendLayout()

    #DEFINE csvInput form
    $csvInput.ClientSize = '250,300'
    $csvInput.AutoScaleDimensions = '6,13'
    $csvInput.AutoScaleMode = 'Font'
    $csvInput.BackColor = $config.DataInputForm.BackColor #[System.Drawing.Color]::FromArgb(255,255,50,50)
    $csvInput.MaximizeBox = $True
    $csvInput.MinimizeBox = $True
    $csvInput.Name = 'CSV Input Form'
    $csvInput.StartPosition = 'CenterScreen'
    $csvInput.MinimumSize = '250,300'
    $csvInput.KeyPreview = $True
    $csvInput.AutoScroll = $True
    $csvInput.VerticalScroll.Enabled = $true
    $csvInput.VerticalScroll.Visible = $True
    $csvInput.ForeColor = $config.DataInputForm.ForeColor
    $csvInput.text = 'CSV Input'

    #csvInput Controls.Add
    $csvInput.Controls.Add($inputGroup)
    $csvInput.add_Load($csvInput_Load)




    #input group box
    $inputGroup.Size = '240,295'
    $inputGroup.Location = '5,0'
    $inputGroup.Text = 'Add Item'
    $inputGroup.Controls.Add($itemNode)
    $inputGroup.Controls.Add($nodeLabel)
    $inputGroup.Controls.Add($itemTag)
    $inputGroup.Controls.Add($tagLabel)
    $inputGroup.Controls.Add($itemName)
    $inputGroup.Controls.Add($nameLabel)
    $inputGroup.Controls.Add($itemPath)
    $inputGroup.Controls.Add($pathLabel)
    $inputGroup.Controls.Add($itemInfo)
    $inputGroup.Controls.Add($infoLabel)
    $inputGroup.Controls.Add($addBtn)
    $inputGroup.Controls.Add($finishBtn)
    $inputGroup.BackColor = $config.DataInputForm.GroupBox.BackColor
    $inputGroup.ForeColor = $config.DataInputForm.GroupBox.ForeColor
    $inputGroup.Anchor = "Bottom, top, left, right"


    #text boxes & labels

    #NODE
    $itemNode.Size = '150,50'
    $itemNode.Location = '75,20'
    $itemNode.Text = 'Node'
    $itemNode.TabIndex = 0

    $nodeLabel.Text = "Node:"
    $nodeLabel.Location = '5,20'
    $nodeLabel.Size = '65,20'
    $nodeLabel.Name = "Node Label"
    $nodeLabel.BringtoFront()
    $nodeLabel.TextAlign = "MiddleRight"

    #TAG
    $itemTag.Size = '150,50'
    $itemTag.Location = '75,50'
    $itemTag.Text = 'Tag'
    $itemTag.TabIndex = 1

    $tagLabel.Text = "Tag:"
    $tagLabel.Location = '5,50'
    $tagLabel.Size = '65,20'
    $tagLabel.Name = "Tag Label"
    $tagLabel.BringtoFront()
    $tagLabel.TextAlign = "MiddleRight"


    #NAME
    $itemName.Size = '150,50'
    $itemName.Location = '75,80'
    $itemName.Text = 'Name'
    $itemName.TabIndex = 2

    $nameLabel.Text = "Name:"
    $nameLabel.Location = '5,80'
    $nameLabel.Size = '65,20'
    $nameLabel.Name = "Name Label"
    $nameLabel.BringtoFront()
    $nameLabel.TextAlign = "MiddleRight"


    #PATH
    $itemPath.Size = '150,50'
    $itemPath.Location = '75,110'
    $itemPath.Text = 'powershell.exe'
    $itemPath.TabIndex = 3

    $pathLabel.Text = "Run | Open:"
    $pathLabel.Location = '5,110'
    $pathLabel.Size = '65,20'
    $pathLabel.Name = "Path Label"
    $pathLabel.BringtoFront()
    $pathLabel.TextAlign = "MiddleRight"

    #INFO
    $itemInfo.Size = '150,100'
    $itemInfo.Multiline = $true
    $itemInfo.ScrollBars = "Vertical"
    $itemInfo.Location = '75,140'
    $itemInfo.Text = 'Info'
    $itemInfo.TabIndex = 4

    $infoLabel.Text = "Info:"
    $infoLabel.Location = '5,140'
    $infoLabel.Size = '65,20'
    $infoLabel.Name = "Info Label"
    $infoLabel.BringtoFront()
    $infoLabel.TextAlign = "MiddleRight"



    #buttons

    $addBtn.size = '100,20'
    $addBtn.text = "Add"
    $addBtn.location = '15,255'
    $addBtn.TabIndex = 5
    $addBtn.UseVisualStyleBackColor = $True
    $addBtn.BackColor = $config.DataInputForm.AddBtn.BackColor
    $addBtn.Font = $font
    $addBtn.BringToFront()
    $addBtn.ForeColor = $config.DataInputForm.AddBtn.ForeColor
    $addBtn.add_click($add_click)



    
    $finishBtn.size = '100,20'
    $finishBtn.text = "Close"
    $finishBtn.location = '125,255'
    $finishBtn.TabIndex = 6
    $finishBtn.UseVisualStyleBackColor = $True
    $finishBtn.BackColor = $config.DataInputForm.CloseBtn.BackColor
    $finishBtn.Font = $font
    $finishBtn.BringToFront()
    $finishBtn.ForeColor = $config.DataInputForm.CloseBtn.ForeColor
    $finishBtn.add_click($finish_click)




    #items to front of form
    $inputGroup.BringToFront()



    $inputGroup.ResumeLayout($false)
    $inputGroup.PerformLayout()

    $csvInput.ResumeLayout($false)
    $csvInput.PerformLayout()

    $csvInput.Add_Shown({$csvInput.Activate()}) 

    & {
        [void]$csvInput.showdialog() 
    }

}



#**************************************************************************
#**************************************************************************
#**********************SHOW/HIDE PS CONSOLE WINDOW************************
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function Show-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()

    # Hide = 0,
    # ShowNormal = 1,
    # ShowMinimized = 2,
    # ShowMaximized = 3,
    # Maximize = 3,
    # ShowNormalNoActivate = 4,
    # Show = 5,
    # Minimize = 6,
    # ShowMinNoActivate = 7,
    # ShowNoActivate = 8,
    # Restore = 9,
    # ShowDefault = 10,
    # ForceMinimized = 11

    [Console.Window]::ShowWindow($consolePtr, 4)
}

function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    #0 hide
    [Console.Window]::ShowWindow($consolePtr, 0)
}
#**************************************************************************
#**************************************************************************

Hide-Console

#**************************************************************************
#**************************************************************************
Fresh
GenPokedex
