    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()

    $ITTools = Import-Csv -Path "\\<NETWORK PATH>\Pokedex\listbox_all.csv" -Header Tag,Name,Path,Info

    $pathText = @("Software", "General IT", "Backup Logs", "Reports")
    $toolText = @("General Tools", "Computer Scripts", "AD User Scripts", "User Info Scripts", "Device Info Scripts", "GAM Scripts")
    $ciscoText = @("URLs - Servers", "Phone Documentation", "General")
    $InstructsText = @("User Documentation", "General Documentation", "Power 8 Documentation", "Monthly Tasks Documentation")
    $URLsText = @("Servers" ,"Social Media", "Misc.", "LOS/POS", "Google", "Vendors")
    $assetText = @("AM Folders", "AM PCs", "AM Printers Scanners", "AM Misc")

function launch_falcon9{

        if($V1 -like "\*.exe"){
                    ii "$falcon9"
        }
        elseif($falcon9 -like "*.ps1"){
            Start-Process powershell.exe -WorkingDirectory C:\temp -ArgumentList "-noprofile -command &{powershell.exe -noexit $falcon9}"
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
            Start-Process $falcon9 -workingdirectory C:\temp
        }
        else{
            Explorer.exe "$falcon9"
        }
        $listBox.ClearSelected()

}

function listbox($listbox){

    $listbox.Location = New-Object System.Drawing.Point(1,17)
    $listbox.BringToFront()
    $listbox.size = '194,370'
    $listbox.BackColor = 'White'
    $listbox.anchor = 'top, left, right'
    $listbox.borderstyle = 'none'
    $listbox.backcolor = 'black'
    $listbox.forecolor = 'white'
    $listbox.font = $font2
    $listBox.ScrollAlwaysVisible = $False
    $listbox.HorizontalScrollbar = $True

}


function populateListBox($nodeSelect){
    $listbox.Items.Clear()
    $listbox.refresh()
    foreach($line in $ITTools){
        if($line.Tag -eq $nodeSelect){
            [void] $listbox.Items.Add($line.Name)
        }  
    }

    #** Asset Management Root
    if($nodeSelect -eq "Asset Management"){
        foreach($it in $assetText){
            foreach($line in $ITTools){
                if($it -eq $line.Tag){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }

        #** Cisco Root
    if($nodeSelect -eq "Cisco"){
        foreach($it in $ciscoText){
            foreach($line in $ITTools){
                if($it -eq $line.Tag){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }

        #** IT Doc Root
    if($nodeSelect -eq "IT Documentation"){
        foreach($it in $instructsText){
            foreach($line in $ITTools){
                if($it -eq $line.Tag){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }

        #** IT Paths Root
    if($nodeSelect -eq "IT Paths"){
        foreach($it in $pathText){
            foreach($line in $ITTools){
                if($it -eq $line.Tag){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }

        #** IT Tools Root
    if($nodeSelect -eq "IT Tools"){
        foreach($it in $toolText){
            foreach($line in $ITTools){
                if($it -eq $line.Tag){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }

        #** URLs Root
    if($nodeSelect -eq "URLs"){
        foreach($it in $URLsText){
            foreach($line in $ITTools){
                if($it -eq $line.Tag){
                    [void] $listbox.Items.Add($line.Name)
                }
            }
        }
    }
}


function treeview($treeview){

    $treeview.location = New-Object System.Drawing.Point(1,17)
    $treeview.BringtoFront()
    $treeview.size = '30,415'
    $treeview.backcolor = 'black'
    $treeview.forecolor = 'white'
    $treeview.anchor  = 'top,left'
    $treeview.BorderStyle = 'none'
    $treeview.font = $font2

    $pathNode = New-Object System.Windows.Forms.TreeNode
    $toolNode = New-Object System.Windows.Forms.TreeNode
    $ciscoNode = New-Object System.Windows.Forms.TreeNode
    $instructsNode = New-Object System.Windows.Forms.TreeNode
    $URLsNode = New-Object System.Windows.Forms.TreeNode
    $assetNode = New-Object System.Windows.Forms.TreeNode
    

    $pathNode.Text = 'IT Paths'
    $pathNode.Tag = 'IT Paths'
    $treeview.Nodes.Add($pathNode)
    $pathNode.Expand()

    $toolNode.Text = 'IT Tools'
    $toolNode.Tag = 'IT Tools'
    $treeview.Nodes.Add($toolNode)
    $toolNode.Expand()

    $ciscoNode.Text = 'Cisco'
    $ciscoNode.Tag = 'Cisco'
    $treeview.Nodes.Add($ciscoNode)

    $instructsNode.Text = 'IT Documentation'
    $instructsNode.Tag = 'IT Documentation'
    $treeview.Nodes.Add($instructsNode)
    $instructsNode.Expand()

    $URLsNode.Text = 'URLs'
    $URLsNode.Tag = 'URLs'
    $treeview.Nodes.Add($URLsNode)

    $assetNode.Text = "Asset Management"
    $assetNode.Tag = "Asset Management"
    $treeview.Nodes.Add($assetNode)

    #** Path Nodes **
    foreach($path in $pathText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $path

        if($pathNode.Nodes.Tag -contains $path){
            $HostNode = $pathNode.Nodes | ?{$_.Tag -eq $path}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $path
            $newHostNode.Tag = $path
            
            $null = $pathNode.Nodes.Add($newHostNode)
            $HostNode = $pathNode.Nodes | ?{$_.Tag -eq $path}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

    #** Tool Nodes **
    foreach($tool in $toolText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $tool

        if($toolNode.Nodes.Tag -contains $tool){
            $HostNode = $toolNode.Nodes | ?{$_.Tag -eq $tool}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $tool
            $newHostNode.Tag = $tool
            
            $null = $toolNode.Nodes.Add($newHostNode)
            $HostNode = $toolNode.Nodes | ?{$_.Tag -eq $tool}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }


    #** Cisco Nodes **
    foreach($cisco in $ciscoText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $cisco

        if($ciscoNode.Nodes.Tag -contains $cisco){
            $HostNode = $ciscoNode.Nodes | ?{$_.Tag -eq $cisco}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $cisco
            $newHostNode.Tag = $cisco
            
            $null = $ciscoNode.Nodes.Add($newHostNode)
            $HostNode = $ciscoNode.Nodes | ?{$_.Tag -eq $cisco}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

        #** Instruct Nodes **
    foreach($inst in $instructsText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $inst

        if($instructsNode.Nodes.Tag -contains $inst){
            $HostNode = $instructsNode.Nodes | ?{$_.Tag -eq $inst}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $inst
            $newHostNode.Tag = $inst
            
            $null = $instructsNode.Nodes.Add($newHostNode)
            $HostNode = $instructsNode.Nodes | ?{$_.Tag -eq $inst}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

        #** URLs Nodes **
    foreach($url in $URLsText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $url

        if($URLsNode.Nodes.Tag -contains $url){
            $HostNode = $URLsNode.Nodes | ?{$_.Tag -eq $url}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $url
            $newHostNode.Tag = $url
            
            $null = $URLsNode.Nodes.Add($newHostNode)
            $HostNode = $URLsNode.Nodes | ?{$_.Tag -eq $url}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

        #** Asset Management Nodes **
    foreach($asset in $assetText){
        $newNode = New-Object System.Windows.Forms.TreeNode
        $newNode.Text = $asset

        if($assetNode.Nodes.Tag -contains $asset){
            $HostNode = $assetNode.Nodes | ?{$_.Tag -eq $asset}
        }
        else{
            $newHostNode = New-Object System.Windows.Forms.TreeNode
            $newHostNode.Text = $asset
            $newHostNode.Tag = $asset
            
            $null = $assetNode.Nodes.Add($newHostNode)
            $HostNode = $assetNode.Nodes | ?{$_.Tag -eq $asset}
        }

        #$null = $HostNode.Nodes.Add($newNode)
    }

    #$treeview.ExpandAll()

}


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
    $tools = New-Object System.Windows.Forms.ToolStripMenuItem('Tools')
    $help = New-Object System.Windows.Forms.ToolStripMenuItem('Help')
    $quit = New-Object System.Windows.Forms.ToolStripMenuItem('Quit')
    $logs = New-Object System.Windows.Forms.ToolStripMenuItem('Logs')
    $ADUC = New-Object System.Windows.Forms.ToolStripMenuItem('ADUC')

    #** DEFINE Font
    $font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5,[System.Drawing.FontStyle]::Bold)
    $font2 = New-Object System.Drawing.Font("Microsoft Sans Serif", 9.0)
    $font3 = New-Object System.Drawing.Font("Microsoft Sans Serif", 10.5)



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

        foreach($thing in $ITTools){
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
        foreach($thing in $ITTools){
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
       <# foreach($thing in $ITTools){
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
        }#>
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
		    foreach($bit in $ITTools){
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
            foreach($thing in $ITTools){
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
            foreach($thing in $ITTools){
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
            foreach($thing in $ITTools){
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
    $pokedex.BackColor = 'black'#[System.Drawing.Color]::FromArgb(255,255,50,50)
    $pokedex.MaximizeBox = $True
    $pokedex.MinimizeBox = $True
    $pokedex.Name = 'Pokedex Form'
    $pokedex.StartPosition = 'CenterScreen'
    $pokedex.MinimumSize = '300,250'
    $pokedex.KeyPreview = $True
    $pokedex.AutoScroll = $True
    $pokedex.VerticalScroll.Enabled = $true
    $pokedex.VerticalScroll.Visible = $True
    $pokedex.ForeColor = 'White'
    $pokedex.text = 'Pokedex'

    #pokedex Controls.Add
    $pokedex.Controls.Add($menu)
    $pokedex.Controls.Add($splitcontainer1)
    $pokedex.add_Load($pokedex_Load)


    <#
    Define other stuff
    #>
    $menu.items.Add($fileMenu)
    $menu.Items.Add($tools)
    $menu.Items.Add($help)
    $menu.BackColor = 'Black'
    $menu.ForeColor = 'white'

    $menu.Location = '0,0'
    $menu.size = '450,24'
    $menu.text = "Main Menu"
    
    $Logs.Add_Click($logBtn_Click)
    $quit.Add_Click($closeBtn_Click)
    $ADUC.Add_Click($ADBtn_Click)

    $fileMenu.DropDownItems.Add($Logs)
    $fileMenu.DropDownItems.Add($quit)
    $tools.DropDownItems.Add($ADUC)
   

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
    $groupBox.Location = '5,0'
    $groupBox.Size = '35,437'
    $groupBox.text = 'TreeView'
    $groupbox.BackColor = 'black'
    $groupBox.ForeColor = 'white'
    

    #** LISTBOX GROUP BOX
    $groupText.Anchor="top,left,right,bottom"
    $groupText.Controls.Add($listBox)
    $groupText.Location = '5,0'
    $groupText.Size = '270,392'
    $groupText.text = 'List Items'
    $groupText.BackColor = 'black'
    $grouptext.ForeColor = 'white'


    #** INFO GROUP BOX
    $infoGroup.Size = '270,130'
    $infoGroup.Location = '5,0'
    $infoGroup.Text = 'Info'
    $infoGroup.Controls.Add($textBox)
    $infoGroup.Anchor = 'bottom, left, right, top'
    $infoGroup.BackColor = 'black'
    $infoGroup.ForeColor = 'white'

    #** INFO TEXT BOX
    $textBox.Size = '260,105'
    $textBox.Multiline = $True
    $textBox.location = '5,15'
    $textBox.ReadOnly = $True
    $textbox.BorderStyle = 'none'
    $textBox.backcolor = 'black'
    $textBox.ForeColor = 'White'
    $textBox.ScrollBars = 'Vertical'
    $textBox.font = $font3
    $textBox.HideSelection = $True
    $textBox.BringToFront()

    #** SEARCH GROUP BOX
    $searchGroup.Size = '35,87'
    $searchGroup.Location = '5,0'
    $searchGroup.Text = 'Search'
    $searchGroup.Controls.Add($searchBox)
    $searchGroup.Controls.Add($searchBtn)
    $searchGroup.Controls.Add($clearBtn)
    $searchGroup.Controls.Add($closeBtn)
    $searchGroup.Controls.Add($expandAll)
    $searchGroup.Controls.Add($collapseAll)
    $searchGroup.BackColor = 'black'
    $searchGroup.ForeColor = 'White'
    $searchGroup.Anchor = "Bottom, top, left, right"

    #** SEARCH TEXT BOX
    $searchBox.Size = '105,50'
    $searchBox.TabIndex = 0
    $searchBox.location = '5,15'
    $searchBox.Text = "Search"
    $searchBox.Add_KeyDown({if ($_.KeyCode -eq "Enter")
        {
            $searchBtn.PerformClick()
        }
    })

    #** SEARCH BUTTON
    $searchBtn.size = '105,20'
    $searchBtn.text = 'Search'
    $searchBtn.location = '115,15'
    $searchBtn.TabIndex = 1
    $searchBtn.UseVisualStyleBackColor = $True
    $searchBtn.BackColor = "lightGray"
    $searchBtn.Font = $font
    $searchBtn.BringtoFront()
    $searchBtn.ForeColor = 'black'
    $searchBtn.add_click($search_click)

    $expandAll.size = '105,20'
    $expandAll.text = 'Expand All'
    $expandAll.location = '115,40'
    $expandAll.TabIndex = 1
    $expandAll.UseVisualStyleBackColor = $True
    $expandAll.BackColor = "lightGray"
    $expandAll.Font = $font
    $expandAll.BringtoFront()
    $expandAll.ForeColor = 'black'
    $expandAll.add_click($expand_click)

    $collapseAll.size = '105,20'
    $collapseAll.text = 'Collapse All'
    $collapseAll.location = '115,65'
    $collapseAll.TabIndex = 1
    $collapseAll.UseVisualStyleBackColor = $True
    $collapseAll.BackColor = "lightGray"
    $collapseAll.Font = $font
    $collapseAll.BringtoFront()
    $collapseAll.ForeColor = 'black'
    $collapseAll.add_click($collapse_click)

    $clearBtn.size = '105,20'
    $clearBtn.text = 'Clear'
    $clearBtn.location = '5,40'
    $clearBtn.UseVisualStyleBackColor = $True
    $clearBtn.BackColor = "lightgray"
    $clearBtn.Font = $font
    $clearBtn.BringtoFront()
    $clearBtn.ForeColor = 'black'
    $clearBtn.add_click($clear_click)

    $closeBtn.size = '105,20'
    $closeBtn.text = 'Close'
    $closeBtn.location = '5,65'
    $closeBtn.UseVisualStyleBackColor = $True
    $closeBtn.BackColor = "lightgray"
    $closeBtn.Font = $font
    $closeBtn.BringtoFront()
    $closeBtn.ForeColor = 'black'
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
    $treeview.LineColor = 'Green'
    #$treeview.ShowRootLines = $False
    $treeview.Sorted = $True
    $treeview.TabStop = $False
    $treeview.anchor = "Bottom, top, left, right"

    $listbox.anchor = "top, bottom, left, right"
    $textbox.Anchor = 'bottom, left, right, top'
    $searchBox.Anchor = "Bottom, top, left"
    $searchBtn.Anchor = "top, left"
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
    $pokedex.Text = "Pokedex"
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

GenPokedex