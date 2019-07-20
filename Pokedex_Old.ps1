#*************************************************************************************************#
#*************************************************************************************************#
#*************************************************************************************************# 
#** Carter Cornelius 4/18/18 - Pokedex3.2                                                    **#
#**                  10/24/2018 - 4.0 -- Added Search Functionality                             **#
#**                  10/26/2018 - 4.1 -- Added Search Clear -- empty box + "Enter"              **#
#**                                   -- Display button functions on Search listbox             **#
#**                                             selected item                                   **#
#**                                   -- PSEdit button functions on Search listbox              **#
#**                                             selected item                                   **#
#**                                   -- Search execution focuses on Search listbox &           **#
#**                                             auto selects first item - can use arrows        **#
#**                                             to scroll, tab goes back to search box          **#
#** Pete Kriegel     10/31/2018 - 4.2   --  YOU CAN'T TOUCH THIS                                **#
#**                                                                                             **#
#**                                                                                             **#       	
#**               _____                                                                         **#
#**              /     \                                                                        **#
#**             | () () |                                                                       **#
#**              \  ^  /                                                                        **#
#**               |||||                                                                         **#
#**               |||||                                                                         **#
#**                                                                                             **#
#**                                                                                             **#
#*************************************************************************************************# 
#*************************************************************************************************#
#**                                                                                             **# 
#** PS Form that hosts various applications, documents, links, URLs, paths, scripts etc         **#
#**      that are used on a daily basis by IT.                                              **#
#** All ListBoxes are populated by CSVs at "\\<NETWORK PATH>\Pokedex_CSVs"                     **#
#**                                                                                             **#
#** There is a document located in IT\Operations that instructs how to add items to the Pokedex **#
#**      "\\<NETWORK PATH>\Adding_to_Pokedex.docx"                                              **#       
#**                                                                                             **#
#*************************************************************************************************#
#*************************************************************************************************#
#*************************************************************************************************#

function GenerateForm{

    $tbpg1_listbox1 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg1_listbox1.csv" -Header c1, c2
    $tbpg1_listbox5 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg1_listbox5.csv" -Header c1, c2
    $tbpg1_listboxx = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg1_listboxx.csv" -Header c1, c2
    $tbpg2_listbox2 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg2_listbox2.csv" -Header c1, c2
    $tbpg2_listbox4 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg2_listbox4.csv" -Header c1, c2
    $tbpg2_listbox3 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg2_listbox3.csv" -Header c1, c2
    $tbpg6_listbox6 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg6_listbox6.csv" -Header c1, c2
    $tbpg7_listbox7 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg7_listbox7.csv" -Header c1, c2
    $tbpg7_listbox8 = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\tbpg7_listbox8.csv" -Header c1, c2
    $listbox_all = Import-Csv -Path "\\<NETWORK PATH>\Pokedex_CSVs\listbox_all.csv" -Header c1, c2
    $names = Import-CSV -Path "\\<NETWORK PATH>\Pokedex_CSVs\PokedexNames.csv" -Header c1

    Add-Type -AssemblyName System.Windows.Forms

    [System.Windows.Forms.Application]::EnableVisualStyles()
    $form1 = New-Object 'System.Windows.Forms.Form'
    $tabControl1 = New-Object 'System.Windows.Forms.TabControl'
    $textB = New-Object 'System.Windows.Forms.RichTextBox'
    $btn = New-Object 'System.Windows.Forms.Button'
    $btnF = New-Object 'System.Windows.Forms.PictureBox'
    $btnLaunch = New-Object 'System.Windows.Forms.Button'
    $btnLaunchELV = New-Object 'System.Windows.Forms.Button'
    $btnlaunchPS = New-Object 'System.Windows.Forms.Button'
    $btnClose = New-Object 'System.Windows.Forms.Button'
    $btnInfo = New-Object 'System.Windows.Forms.Button'
    $btnRefresh = New-Object 'System.Windows.Forms.Button'
    $btnSave = New-Object 'System.Windows.Forms.Button'
    $btnUndo = New-Object 'System.Windows.Forms.Button'
    $btnFont = New-Object 'System.Windows.Forms.Button'
    $tabpage1 = New-Object 'System.Windows.Forms.TabPage'
    $tabpage2 = New-Object 'System.Windows.Forms.TabPage'
    $tabpage6 = New-Object 'System.Windows.Forms.TabPage'
    $tabpage7 = New-Object 'System.Windows.Forms.TabPage'
    $checkBox = New-Object 'System.Windows.Forms.CheckBox'
    $pictureBox = New-Object 'System.Windows.Forms.PictureBox'

    #** Search Box Items Creation **
    $searchBox = New-Object 'System.Windows.Forms.TextBox'
    $searchBtn = New-Object 'System.Windows.Forms.Button'
    $listBoxAll = New-Object 'System.Windows.Forms.ListBox'

    #** Help button Items Creation **
    $helpBtn = New-Object 'System.Windows.Forms.Button'

    #** Tab Page 1 Items Creation **
    $label1a = New-Object 'System.Windows.Forms.Label'
    $label1b = New-Object 'System.Windows.Forms.Label'
    $label1c = New-Object 'System.Windows.Forms.Label'
    $label1d = New-Object 'System.Windows.Forms.Label'
    $listBox1 = New-Object 'System.Windows.Forms.ListBox'
    $listBox5 = New-Object 'System.Windows.Forms.ListBox'
    $listBoxX = New-Object 'System.Windows.Forms.ListBox'

    #** Tab Page 2 Items Creation **
    $label2a = New-Object 'System.Windows.Forms.Label'
    $label2b = New-Object 'System.Windows.Forms.Label'
    $label2c = New-Object 'System.Windows.Forms.Label'
    $label2d = New-Object 'System.Windows.Forms.Label'
    $listBox2 = New-Object 'System.Windows.Forms.ListBox'
    $listBox4 = New-Object 'System.Windows.Forms.ListBox'
    $listBox3 = New-Object 'System.Windows.Forms.ListBox'

    #** Tab Page 6 Items Creation **
    $label6a = New-Object 'System.Windows.Forms.Label'
    $label6b = New-Object 'System.Windows.Forms.Label'
    $listBox6 = New-Object 'System.Windows.Forms.ListBox'

    #** Tab Page 7 Items Creation **
    $label7a = New-Object 'System.Windows.Forms.Label'
    $label7b = New-Object 'System.Windows.Forms.Label'
    $label7c = New-Object 'System.Windows.Forms.Label'
    $listBox7 = New-Object 'System.Windows.Forms.ListBox'
    $listBox8 = New-Object 'System.Windows.Forms.ListBox'


    $label = New-Object 'System.Windows.Forms.Label'
    $font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5,[System.Drawing.FontStyle]::Bold)
    $font2 = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.5)

    $InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'


    $form1_Load = {

    }

    Function btnLaunch{
        if($V1 -like "\*.exe"){
                    ii "$V1"
        }
        elseif($V1 -like "*.ps1"){
            $checkBox.Refresh()
            if($checkBox.CheckState -eq $true){
                $userWhole = Get-Credential
                $pp=new-object -typename System.Management.Automation.PSCredential -argumentlist $userWhole
                Start-Process powershell.exe -Credential $pp -WorkingDirectory C:\temp -ArgumentList "-noprofile -command &{powershell.exe -noexit $V1 -verb runas}"
            }
            else{
                Start-Process powershell.exe -WorkingDirectory C:\temp -ArgumentList "-noprofile -command &{powershell.exe -noexit $V1}"
            }
        }
        elseif($V1 -like "http*"){
            Start-Process $V1
        }
        elseif($V1 -like "\*.docx"){
            ii "$V1"
        }
        elseif($V1 -like "\*.rtf"){
            ii "$V1"
        }
        elseif($V1 -like "\*.xlsx"){
            Explorer.exe "$V1"
        }
        elseif($V1 -like "\*.cmd"){
            ii "$V1"
        }
        elseif($V1 -like "*.exe"){
            Start-Process $V1 -workingdirectory C:\temp
        }
        else{
            Explorer.exe "$V1"
        }
        $listBox1.ClearSelected()
        $listBox5.ClearSelected()
        $listBoxX.ClearSelected()
        $listBox2.ClearSelected()
        $listBox3.ClearSelected()
        $listBox4.ClearSelected()
        $listBox6.ClearSelected()
        $listBox7.ClearSelected()
        $listBox8.ClearSelected()
        $listBoxAll.ClearSelected()
        $listBoxAll.Hide()
    }     #** Launches selected item **#

    Function btnInfo{
        $content1 = $null
        if($V2.c2 -like "\*.exe"){
            $content1 = "$V2"
            $textB.text = $content1
        }
        elseif($V2 -like "*.ps1"){
            $content1 = Get-Content -Path "$V2" -Raw
            $textB.text = $content1
            $btnLaunchPS.Show()
        }
        elseif($newnewI -like "http"){
            $content1 = "$V2"
            $textB.text = $content1
        }
        elseif($newnewI -like "\*.docx"){
            $content1 = "$newnewI"
            $textB.text = $content1
        }
        elseif($V2 -like "\*.xlsx"){
            $content1 = "$V2"
            $textB.text = $content1
        }
        elseif($V2 -like "*.cmd"){
            $content1 = Get-Content -Path "$V2" -Raw
            $textB.text = $content1
        }
        elseif($V2 -like "\*.rtf"){
            $textB.LoadFile("$V2")
            #$textB.Refresh()
        }
        else{
            $content1 = "$V2"
            $textB.text = $content1
            $textB.Refresh()                                       
        }
        $listBox1.ClearSelected()
        $listBox5.ClearSelected()
        $listBoxX.ClearSelected()
        $listBox2.ClearSelected()
        $listBox4.ClearSelected()
        $listBox3.ClearSelected()
        $listBox6.ClearSelected()
        $listBox7.ClearSelected()
        $listBox8.ClearSelected()
        $listBoxAll.ClearSelected()
    }       #** Displays path, text, info about selected item **#

    Function btnLaunchE{
        if($V1E -like "\*.exe"){
            $userWhole = Get-Credential
            $pp=new-object -typename System.Management.Automation.PSCredential -argumentlist $userWhole
            Start-Process powershell.exe -Credential $pp -WorkingDirectory C:\temp -ArgumentList "-noprofile -command &{ii $V1E -verb runas}"
        }
        elseif($V1E -like "*.ps1"){
            $userWhole = Get-Credential
            $pp=new-object -typename System.Management.Automation.PSCredential -argumentlist $userWhole
            Start-Process powershell.exe -Credential $pp -WorkingDirectory c:\temp -ArgumentList "-noprofile -command &{powershell.exe -noexit $V1E -verb runas}"
        }
        elseif($V1E -like "\*.cmd"){
            $userWhole = Get-Credential
            $pp=new-object -typename System.Management.Automation.PSCredential -argumentlist $userWhole
            Start-Process powershell.exe -Credential $pp -WorkingDirectory C:\temp -ArgumentList "-noprofile -command &{ii -noexit $V1E -verb runas}"
        }
        elseif($V1E -like "*.exe"){
            $userWhole = Get-Credential
            $pp=new-object -typename System.Management.Automation.PSCredential -argumentlist $userWhole
            Start-Process powershell.exe -Credential $pp -WorkingDirectory C:\temp -ArgumentList "-noprofile -command &{Start-Process $V1E -verb runas}"
        }
        #elseif($V1E -like "*\Active Directory Users and Computers.lnk"){
        #    $userWhole = Get-Credential
        #    $pp=new-object -typename System.Management.Automation.PSCredential -argumentlist $userWhole
        #    Start-Process Explorer.exe -Credential $pp -ArgumentList "-noprofile -command &{Start-Process $V1E -verb runas}"
        #}
        else{
            Write-Host "Invalid Entry -- .exe, .ps1 & .cmd files are supported by this button"
            $wshell = New-Object -ComObject Wscript.Shell

            $wshell.Popup('Invalid Entry 
            
Currently the only File Extensions supported by the "Run as Different User" button are "*.exe", "*.ps1" & "*.cmd".',0,'ERROR',0x1)
            #Explorer.exe "$V1E"
        }
        $listBox1.ClearSelected()
        $listBox5.ClearSelected()
        $listBoxX.ClearSelected()
        $listBox2.ClearSelected()
        $listBox3.ClearSelected()
        $listBox4.ClearSelected()
        $listBox6.ClearSelected()
        $listBox7.ClearSelected()
        $listBox8.ClearSelected()
    }    #** Launches elevation option **#

    function helpForm{
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $helpForm = New-Object 'System.Windows.Forms.Form'
    $helpText = New-Object 'System.Windows.Forms.TextBox'
    $helpLabel = New-Object 'System.Windows.Forms.Label'

    $InitialFormWindowStateHelp = New-Object 'System.Windows.Forms.FormWindowState'


    $helpForm_Load = {

    }

    $helpForm_StateCorrection_Load = {
        $helpForm.WindowState = $InitialFormWindowStateHelp  #"Maximized" #$InitialFormWindowState 
    }
    
    $helpForm.SuspendLayout()

    #*********************************************************************************************

    #$helpForm.Controls.Add($helpText)
    $helpForm.Controls.Add($helpLabel)

    #*********************************************************************************************
    #*********************************************************************************************
    #Defining $helpForm visuals/size
    $helpForm.ClientSize = '300, 300'
    $helpForm.AutoScaleDimensions = '6, 13'
	$helpForm.AutoScaleMode = 'Font'
    $helpForm.FormBorderStyle = 'Sizable'
    $helpForm.BackColor = "Gray" #[System.Drawing.Color]::FromArgb(255,185,209,234)
    $helpForm.MaximizeBox = $True
    $helpForm.MinimizeBox = $True
    $helpForm.Name = 'form1'
    $helpForm.StartPosition = 'CenterScreen'
    $helpForm.Text = "Pokedex"
    $helpForm.KeyPreview = $True
    $helpForm.BackColor = "LightGray" #[System.Drawing.Color]::FromArgb(255,185,209,234)
    $helpForm.AutoScroll = $True
    $helpForm.VerticalScroll.Enabled = $True
    $helpForm.VerticalScroll.Visible = $True
    $helpForm.add_Load($helpForm_Load)

    #*********************************
    #*********************************

    $helpText.BackColor = 'LightGray'
    $helpText.Text = "What's New

    #******* 10/24/2018 - 4.0 *******#

        -- Added Search Functionality


    #******* 10/26/2018 - 4.1 *******#

        -- Added Search Clear -- empty box + 'Enter'

        -- Display button functions on Search listbox
        selected item                 

        -- PSEdit button functions on Search listbox
        selected item

        -- Search execution focuses on Search listbox &
        auto selects first item - can use arrows
        to scroll, tab goes back to search box
"


    $helpText.Name = "What's New"
    $helpText.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 300
    $System_Drawing_Size.Height = 300
    $helpText.Size = $System_Drawing_Size
    $helpText.MaximumSize = '350,300'
    $helpText.TabIndex = 8
    $helpText.Anchor = 15
    $helpText.Multiline = $True
    $helpText.TextAlign = 'Left'
    $helpText.ReadOnly = $True
   
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 0
    $System_Drawing_Point.Y = 0
    $helpText.Location = $System_Drawing_Point
    $helpText.BringToFront()

    #****************************************************************

    #*************
    #*************
    $helpLabel.Name = "test"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 300
    $system_drawing_size.Height = 300
    $helpLabel.Size = $System_Drawing_Size
    $helpLabel.MaximumSize = '550,500'
    $helpLabel.Anchor = 15
    $helpLabel.TextAlign = 'MiddleCenter'
    $helpLabel.Text = "What's New

#******* 10/26/2018 - 4.1 *******#

    -- Added Search Clear -- empty box + 'Enter'

    -- Display button functions on Search listbox
    selected item                 

    -- PSEdit button functions on Search listbox
    selected item

    -- Search execution focuses on Search listbox &
    auto selects first item - can use arrows
    to scroll, tab goes back to search box
    
#******* 10/24/2018 - 4.0 *******#

    -- Added Search Functionality

"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 0
    $System_Drawing_Point.Y = 0
    $helpLabel.Location = $System_Drawing_Point
    $helpLabel.BringToFront()

    #*************


    $helpForm.ResumeLayout()

    $InitialFormWindowState = $helpForm.WindowState
    $helpForm.add_Load($helpForm_StateCorrection_Load)
    $helpForm.ShowDialog()
}



#****\******/***********************\******/**********************************************
#*****\****/****** CLICK ACTIONS ****\****/***********************************************
#******\**/***************************\**/************************************************
#*******\/*****************************\/*************************************************

    #******* LAUNCH BUTTONS *************
    $btnLaunch_Click1 = {

        for($i=0; $i -lt $size1; $i++){
            $newL = $array1[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox1.SelectedItem){
                btnLaunch
            }                   
        }

        for($i=0; $i -lt $size5; $i++){
            $newL = $array5[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox5.SelectedItem){
                btnLaunch
            }                  
        }

        for($i=0; $i -lt $sizex; $i++){
            $newL = $arrayx[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBoxx.SelectedItem){
                btnLaunch
            }                  
        }

        for($i=0; $i -lt $size2; $i++){
            $newL = $array2[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox2.SelectedItem){
                btnLaunch
            }                  
        }

        for($i=0; $i -lt $size3; $i++){
            $newL = $array3[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox3.SelectedItem){
                btnLaunch
            }                 
        }

        for($i=0; $i -lt $size4; $i++){
            $newL = $array4[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox4.SelectedItem){
                btnLaunch
            }                  
        }

        for($i=0; $i -lt $size6; $i++){
            $newL = $array6[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox6.SelectedItem){
                btnLaunch
            }                   
        }

        for($i=0; $i -lt $size7; $i++){
            $newL = $array7[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox7.SelectedItem){
                btnLaunch
            }                  
        }

        for($i=0; $i -lt $size8; $i++){
            $newL = $array8[$i]
            $newnewL = $newL.c1
            $V1 = $newL.c2

            if($newnewL -eq $listBox8.SelectedItem){
                btnLaunch
            }                  
        }
    }


    #******* SearchBox & listboxAll Related Click Actions ******#
    $btnLaunch_search = {
        for($i=0; $i -lt $sizeAll; $i++){
        $newL = $arrayAll[$i]
        $newnewL = $newL.c1
        $V1 = $newL.c2

            if($newnewL -eq $listBoxAll.SelectedItem){
                btnLaunch
            }                   
        }
    }

    $searchBtn_Click = {
        $listboxAll.Items.Clear()
        $userInput = $searchBox.Text
        $userText = "*$userInput*"

        if($userInput -eq ""){
            $listboxAll.Items.Clear()
            $listboxAll.Hide()
        }
        else{

            for($i=0; $i -lt $sizeAll; $i++){
            $newAll = $arrayAll[$i]
            $newnewAll = $newAll.c1

                if($newnewAll -like $userText){
                    [void] $listBoxAll.Items.Add("$newnewAll")
                }
            }
            if($listboxAll.Items.Count -gt 0){
                $listBoxAll.Show()
                $listBoxAll.MaximumSize = '300,645'
                $listBoxAll.BringToFront()
                $listBoxAll.SetSelected(0, $TRUE)
                $listBoxAll.Focus()
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

    $searchBtn_Info = {
        for($i=0; $i -lt $sizeAll; $i++){
            $newI = $arrayAll[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBoxAll.SelectedItem){
                btnInfo
                $listBoxAll.Hide()
            }                  
        }
    }


    #****** INFO BUTTONS ***************
    $btnInfo_Click1 = {
        $btnSave.Hide()
        $btnUndo.Hide()
        $btnFont.Hide()
        $btnLaunchPS.Hide()
        $label6b.Text = 'Information'

        for($i=0; $i -lt $size1; $i++){
            $newI = $array1[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox1.SelectedItem){
                btnInfo
            }                  
        }
    
        for($i=0; $i -lt $size5; $i++){
            $newI = $array5[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox5.SelectedItem){
                btnInfo
            }          
        }
 
        for($i=0; $i -lt $sizex; $i++){
            $newI = $arrayx[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBoxx.SelectedItem){
                btnInfo
            }           
        }

        for($i=0; $i -lt $size2; $i++){
            $newI = $array2[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox2.SelectedItem){
                btnInfo
            }          
        }

        for($i=0; $i -lt $size4; $i++){
            $newI = $array4[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox4.SelectedItem){
                btnInfo
            }          
        }

        for($i=0; $i -lt $size3; $i++){
            $newI = $array3[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox3.SelectedItem){
                btnInfo
            }          
        }

        for($i=0; $i -lt $size6; $i++){
            $newI = $array6[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox6.SelectedItem){
                btnInfo
                $btnSave.Show()
                $btnUndo.Show()
                $btnFont.Show()
                $label6b.Text = "$newnewI"
            }             
        }

        for($i=0; $i -lt $size7; $i++){
            $newI = $array7[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox7.SelectedItem){
                btnInfo
            }               
        }

        for($i=0; $i -lt $size8; $i++){
            $newI = $array8[$i]
            $newnewI = $newI.c1
            $V2 = $newI.c2

            if($newnewI -eq $listBox8.SelectedItem){
                btnInfo
            }               
        }
    }

    #**** CLEAR BUTTON ****
    $btnRefresh_Click = {
        $textB.Clear()
        $V2 = $null
        $VS = $null
        $textB.Refresh()
        $listBox1.ClearSelected()
        $listBox5.ClearSelected()
        $listBoxX.ClearSelected()
        $listBox2.ClearSelected()
        $listBox3.ClearSelected()
        $listBox4.ClearSelected()
        $listBox6.ClearSelected()
        $listBox7.ClearSelected()
        $listBox8.ClearSelected()
        $btnLaunchPS.Hide()
        $btnSave.Hide()
        $btnUndo.Hide()
        $btnFont.Hide()
        $listBoxAll.Hide()
        $listBoxAll.Items.Clear()
        $searchBox.Clear()
        $label6b.Text = 'Information'
    }

    #**** SAVE BUTTON ****
    $btnSave_Click = {
        if($listBox6.SelectedItem -eq $null){
            [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
            [System.Windows.Forms.MessageBox]::Show("No file selected. Please Highlight the file from the list you wish to overwrite with changes." , "Pokedex")
        }
        else{
            for($i=0; $i -lt $size6; $i++){
                $newS = $array6[$i]
                $newnewS = $newS.c1
                $VS = $newS.c2

                if($newnewS -eq $listBox6.SelectedItem){
                    if($VS -like "\*.rtf"){
                        [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
                        $result = [System.Windows.Forms.MessageBox]::Show("You are about to overwrite the existing file at $VS.

Are you sure you want to save your changes to : 
$VS ?" , "ATTENTION - SEE BELOW" , 3)
                        if ($result -eq 'Yes') {
                            $textB.SaveFile($VS)
                        }
                        else{
                            [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
                            [System.Windows.Forms.MessageBox]::Show("Changes were not saved" , "Pokedex")
                        }
                    }
                    else{
                        [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
                        [System.Windows.Forms.MessageBox]::Show("Invalid file $VS" , "Pokedex")
                    }
                }               
            }
        }
    }

    #**** UNDO BUTTON ****
    $btnUndo_Click = {
        
    }

    #**** PSEDIT BUTTON ****		
	$btnLaunchPS_Click = {
        if(($listBox1.SelectedItem -eq $null) -and ($listBox5.SelectedItem -eq $null) -and ($listBoxX.SelectedItem -eq $null) -and ($listBox2.SelectedItem -eq $null) -and ($listBox3.SelectedItem -eq $null) -and	($listBox4.SelectedItem -eq $null) -and ($listBox6.SelectedItem -eq $null) -and ($listBox7.SelectedItem -eq $null) -and ($listBox8.SelectedItem -eq $null) -and ($listBoxAll.SelectedItem -eq $null)){
            [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
            [System.Windows.Forms.MessageBox]::Show("No file selected. Please Highlight the file from the list you wish to edit with Powershell_ISE." , "Pokedex")
        }
        else{
		    for($i=0; $i -lt $size1; $i++){
                $newPS = $array1[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox1.SelectedItem){
                    powershell_ise.exe "$VP"
                }                   
            }
		
		    for($i=0; $i -lt $size5; $i++){
                $newPS = $array5[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox5.SelectedItem){
                    powershell_ise.exe "$VP"
                }                   
            }
		
		    for($i=0; $i -lt $sizex; $i++){
                $newPS = $arrayx[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBoxx.SelectedItem){
                    powershell_ise.exe "$VP"
                }                  
            }
		
		    for($i=0; $i -lt $size2; $i++){
                $newPS = $array2[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox2.SelectedItem){
                    powershell_ise.exe "$VP"
                }                  
            }
		
		    for($i=0; $i -lt $size3; $i++){
                $newPS = $array3[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox3.SelectedItem){
                    powershell_ise.exe "$VP"
                }                  
            }
		
		    for($i=0; $i -lt $size4; $i++){
                $newPS = $array4[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox4.SelectedItem){
                    powershell_ise.exe "$VP"
                }                   
            }
		
		    for($i=0; $i -lt $size6; $i++){
                $newPS = $array6[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox6.SelectedItem){
                    powershell_ise.exe "$VP"
                }                   
            }
		
		    for($i=0; $i -lt $size7; $i++){
                $newPS = $array7[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox7.SelectedItem){
                    powershell_ise.exe "$VP"
                }                  
            }
		
		    for($i=0; $i -lt $size8; $i++){
                $newPS = $array8[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBox8.SelectedItem){
                    powershell_ise.exe "$VP"
                }     
            }
            for($i=0; $i -lt $sizeAll; $i++){
                $newPS = $arrayAll[$i]
                $newnewPS = $newPS.c1
                $VP = $newPS.c2

                if($newnewPS -eq $listBoxAll.SelectedItem){
                    powershell_ise.exe "$VP"
                }
            }     
            $btnLaunchPS.Hide()
        }
        $listBox1.ClearSelected()
        $listBox5.ClearSelected()
        $listBoxX.ClearSelected()
        $listBox2.ClearSelected()
        $listBox4.ClearSelected()
        $listBox3.ClearSelected()
        $listBox6.ClearSelected()
        $listBox7.ClearSelected()
        $listBox8.ClearSelected()
        $listBoxAll.ClearSelected()
	}

    #**** CLOSE BUTTON ****
    $btnClose_Click = {
        $form1.Close()
    }


    #******* ELEVATED LAUNCH BUTTONS *************
    $btnLaunchE_Click1 = {

        for($i=0; $i -lt $size1; $i++){
            $newE = $array1[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox1.SelectedItem){
                btnLaunchE
            }                    
        }

        for($i=0; $i -lt $size5; $i++){
            $newE = $array5[$i]
            $newnewE = $newE.c1
            $VE = $newE.c2

            if($newnewE -eq $listBox5.SelectedItem){
                btnLaunchE
            }                   
        }

        for($i=0; $i -lt $sizex; $i++){
            $newE = $arrayx[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBoxx.SelectedItem){
                btnLaunchE
            }                   
        }

        for($i=0; $i -lt $size2; $i++){
            $newE = $array2[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox2.SelectedItem){
                btnLaunchE
            }                   
        }

        for($i=0; $i -lt $size3; $i++){
            $newE = $array3[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox3.SelectedItem){
                btnLaunchE
            }                   
        }

        for($i=0; $i -lt $size4; $i++){
            $newE = $array4[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox4.SelectedItem){
                btnLaunchE
            }                   
        }

        for($i=0; $i -lt $size6; $i++){
            $newE = $array6[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox6.SelectedItem){
                btnLaunchE
            }                   
        }

        for($i=0; $i -lt $size7; $i++){
            $newE = $array7[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox7.SelectedItem){
                btnLaunchE
            }                  
        }

        for($i=0; $i -lt $size8; $i++){
            $newE = $array8[$i]
            $newnewE = $newE.c1
            $V1E = $newE.c2

            if($newnewE -eq $listBox8.SelectedItem){
                btnLaunchE
            }                   
        }
    }

    #****** HELP BUTTON CLICK ********
    $helpBtn_Click = {
        helpForm
    }

#*******/\******************************/\************************************************
#******/**\******* END CLICK ACTIONS **/**\***********************************************
#*****/****\**************************/****\**********************************************
#****/******\************************/******\*********************************************


    $textBox1_CurrentCellDirtyStateChanged = {

    }
    $Form_StateCorrection_Load = {
        $form1.WindowState = $InitialFormWindowState  #"Maximized" #$InitialFormWindowState 
    }
    
    $form1.SuspendLayout()

    #form1
    $form1.Controls.Add($tabcontrol1)
    $form1.Controls.Add($textB)
    $form1.Controls.Add($btnLaunch)
    $form1.Controls.Add($btnRefresh)
    $form1.Controls.Add($btnInfo)
    $form1.Controls.Add($btnClose)
    $form1.Controls.Add($btn)
    $form1.Controls.Add($btnF)
    #$form1.Controls.Add($btnSave)
    $form1.Controls.Add($btnlaunchELV)
    $form1.Controls.Add($btnlaunchPS)
    $form1.Controls.Add($helpBtn)
    $form1.Controls.Add($searchBox)
    $form1.Controls.Add($searchBtn)
    $form1.Controls.Add($listBoxAll)
    $btnlaunchPS.Hide()

    $pictureBox.BringToFront()
    $btnrefresh.BringToFront()
    $btnLaunch.BringToFront()
    $btnInfo.BringToFront()
    $btnClose.BringToFront()
    $checkBox.BringToFront()
    $btnlaunchELV.BringToFront()
    $btnlaunchPS.BringToFront()
    $searchBox.BringToFront()
    $searchBtn.BringToFront()
    #$btnSave.BringToFront()
    #$btnF.SendToBack()
    $btn.SendToBack()
    $helpBtn.BringToFront()

#*********************************************************************************************
#*********************************************************************************************
    $tabControl1.Controls.Add($tabpage1)
    $tabcontrol1.Controls.Add($tabpage2)
    $tabcontrol1.Controls.Add($tabpage6)
	$tabcontrol1.Controls.Add($tabpage7)

#*********************************************************************************************
#*********************************************************************************************
    #Defining $form1 visuals/size
    $form1.ClientSize = '850, 800'
    $form1.AutoScaleDimensions = '6, 13'
	$form1.AutoScaleMode = 'Font'
    $form1.FormBorderStyle = 'Sizable'
    $form1.BackColor = "Gray" #[System.Drawing.Color]::FromArgb(255,185,209,234)
    $form1.MaximizeBox = $True
    $form1.MinimizeBox = $True
    $form1.Name = 'form1'
    $form1.StartPosition = 'CenterScreen'

    #**** Form Text Generation from CSV ****
    $num = (Get-Random -Minimum 0 -Maximum 1) + 1
    $new = $names.c1 | Get-Random -Count $num
    $form1.Text = $new
    #**** End Form Text Generation ****

    $form1.MinimumSize = '300, 400'
    $form1.KeyPreview = $True
    $form1.BackColor = "darkblue" #[System.Drawing.Color]::FromArgb(255,185,209,234)
    $form1.AutoScroll = $True
    $form1.VerticalScroll.Enabled = $True
    $form1.VerticalScroll.Visible = $True
    $icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
    $form1.icon = $icon
    $form1.add_Load($form1_Load)

    #***************************************************************************************
    #defining picture seen in bottom right hand
    $file = (Get-Item "\\<NETWORK PATH>\picture.jpg")
    $Image = [system.drawing.image]::FromFile($file)
    $pictureBox.Image = $Image
    $pictureBox.Width = $Image.size.width
    $pictureBox.Height = 57
    $pictureBox.Location = '706, 715'
    $pictureBox.BringToFront()
    $form1.Controls.Add($pictureBox)
    $pictureBox.Anchor = 'Bottom, Right'
    $pictureBox.BringToFront()
    $btnRefresh.BringToFront()
    $btnClose.BringToFront()

    #***************************************************************************************
    #defining search box
    $searchBox.Text = "KeePass"
    $searchBox.Name = 'Query'
    $searchBox.TabIndex = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 125
    $System_Drawing_Size.Height = 20
    $searchBox.Size = $System_Drawing_Size
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 265
    $System_Drawing_Point.Y = 46
    $searchBox.Location = $System_Drawing_Point
    $searchBox.BringToFront()
    $searchBox.Add_KeyDown({if ($_.KeyCode -eq "Enter")
            {
             $searchBtn.PerformClick()
            }
         })

    #****** SEARCH BUTTON ***************************
    $searchBtn.Location = '395,46'
    $searchBtn.Name = 'buttonOK'
    $searchBtn.Size = '70,20'
    $searchBtn.Text = 'Search'
    $searchBtn.UseVisualStyleBackColor = $True
    $searchBtn.BackColor = "White"
    $searchBtn.Font = $font
    $searchBtn.add_Click($searchBtn_Click)
    $searchBtn.BringToFront()

    #****** SEARCH LIST BOX **************************
    $listBoxAll.Location = New-Object System.Drawing.Point(265,65)
    $listBoxAll.AutoSize = $True
    #$listBoxAll.Size = New-Object System.Drawing.Size(175,20)
    #$listBoxAll.Height = 500
    $listBoxAll.ScrollAlwaysVisible = $False
    $listboxAll.HorizontalScrollbar = $True
    $listBoxAll.Sorted = 'AlphaNumeric'
    $listBoxAll.BringToFront()
    $listBoxAll.ScrollAlwaysVisible = $False
    $listboxAll.HorizontalScrollbar = $True
    $listBoxAll.Hide()
    $listBoxAll.BackColor = 'white'
    $listBoxAll.Font = $font2
    $listBoxAll.BorderStyle = 'Fixed3D'

        $arrayAll = @()

        foreach($itemAll in $listbox_all){
                $aAll = $itemAll
                $arrayAll += $aAll
        }

        $sizeAll = $arrayAll.Length

        #for($i=0; $i -lt $sizeAll; $i++){
        #$newAll = $arrayAll[$i]
        #$newnewAll = $newAll.c1
        #        [void] $listBoxAll.Items.Add("$newnewAll")
        #}

        $result = $listBoxAll.SelectedItem
        $listBoxAll.add_DoubleClick($btnLaunch_search)

        $listBoxAll.Add_KeyDown({if ($_.KeyCode -eq "Enter")
            {
             $btnLaunch.PerformClick()
            }
         })

    #******************************************************************************************
    #defining text box size/visuals
    $textB.Name = 'Preview'
    $textB.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 555
    $System_Drawing_Size.Height = 630
    $textB.Size = $System_Drawing_Size
    $textB.MaximumSize = '2000,629'
    $textB.TabIndex = 8
    $textB.Anchor = 15
    $textB.Multiline = $True
   
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 265
    $System_Drawing_Point.Y = 75
    $textB.Location = $System_Drawing_Point
    $textB.BringToFront()

    #******************************************************************************************
    #defining checkBox size/visuals
    $checkBox.Name = "checkbox"
    $checkBox.Text = "Elevate PS"
    $checkBox.Checked = $False
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 85
    $System_Drawing_Size.Height = 20
    $checkBox.size = $System_Drawing_Size
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 40
    $System_Drawing_Point.Y = 705
    $checkBox.Location = $System_Drawing_Point
    $checkBox.BackColor = 'lightgray'
    $checkBox.BringToFront()

    #******************************************************************************************
    #defining tabcontrol size/visuals
    $tabControl1.Name = 'tabControl1'
    $tabControl1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 825
    $System_Drawing_Size.Height = 775
    $tabControl1.Size = $System_Drawing_Size
    $tabControl1.TabIndex = 8
    $tabControl1.Anchor = 15
    $tabControl1.Multiline = $True
   
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 12
    $tabControl1.Location = $System_Drawing_Point
    $tabControl1.add_DoubleClick($btnLaunch_Click)

#**\******/****************************************\******/**********************************
#***\****/******** TAB DEFINITIONS AND ITEMS *******\****/***********************************
#****\**/********************************************\**/************************************
#*****\/**********************************************\/*************************************

    #********* TAB PAGE 1 *******************************************************************
    $tabpage1.Location = '42, 4'
	$tabpage1.Name = 'tabpage1'
	$tabpage1.Padding = '3, 3, 3, 3'
	$tabpage1.Size = '683, 442'
    $tabpage1.AutoSize = $True
	$tabpage1.TabIndex = 0
	$tabpage1.Text = '        IT Ops - EOM, On Call, Asset, Paths        '
	$tabpage1.UseVisualStyleBackColor = $True
    $tabpage1.BackColor = "lightgray" #[System.Drawing.Color]::FromArgb(255,185,209,234)
        
    #******** TAB PAGE 1 LABELS *************************************************
        $label1a.Location = New-Object System.Drawing.Point(10,20)
        $label1a.Size = New-Object System.Drawing.Size(100,15)
        $label1a.Text = 'General IT Paths'
        $label1a.Font = $font
        $tabpage1.Controls.Add($label1a)

        $label1b.Location = New-Object System.Drawing.Point(475,15)
        $label1b.Size = New-Object System.Drawing.Size(280,20)
        $label1b.Text = 'Preview / Information / Path'
        $label1b.Font = $font
        $tabpage1.Controls.Add($label1b)

        $label1c.Location = New-Object System.Drawing.Point(10,285)
        $label1c.Size = New-Object System.Drawing.Size(125,15)
        $label1c.Text = 'Asset Management'
        $label1c.Font = $font
        $tabpage1.Controls.Add($label1c)

        $label1d.Location = New-Object System.Drawing.Point(10,480)
        $label1d.Size = New-Object System.Drawing.Size(125,15)
        $label1d.Text = 'IT Tools'
        $label1d.Font = $font
        $tabpage1.Controls.Add($label1d)

    #******** LIST BOX 1 *************************************************
        $listBox1.Location = New-Object System.Drawing.Point(10,40)
        $listBox1.Size = New-Object System.Drawing.Size(230,20)
        $listBox1.Height = 250
        #$listBox1.ForeColor = 'WHite'
        #$listBox1.BackColor = 'Black'
        $listBox1.ScrollAlwaysVisible = $False
        $listbox1.HorizontalScrollbar = $True
        $listBox1.Sorted = 'AlphaNumeric'
        #$listBox1.Anchor = 15

                #****** Creating ListBox Items from Imported CSV *********
                $array1 = @()

                foreach($item1 in $tbpg1_listbox1){
                        $a1 = $item1
                        $array1 += $a1
                    }

                $size1 = $array1.Length

                for($i=0; $i -lt $size1; $i++){
                    $new1 = $array1[$i]
                    $newnew1 = $new1.c1
                    [void] $listBox1.Items.Add("$newnew1")

                }
                #****** End Creating ListBox Items *********

                $tabpage1.Controls.Add($listBox1)
                $result = $listBox1.SelectedItem


                $listBox1.add_DoubleClick($btnLaunch_Click1)
                $listBox1.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })

    #******** LIST BOX 5 *************************************************
        $listBox5.Location = New-Object System.Drawing.Point(10,300)
        $listBox5.Size = New-Object System.Drawing.Size(230,20)
        $listBox5.Height = 175
        $listBox5.ScrollAlwaysVisible = $False
        $listbox5.HorizontalScrollbar = $True
        $listBox5.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array5 = @()

                foreach($item5 in $tbpg1_listbox5){
                        $a5 = $item5
                        $array5 += $a5
                    }

                $size5 = $array5.Length

                for($i=0; $i -lt $size5; $i++){
                    $new5 = $array5[$i]
                    $newnew5 = $new5.c1
                    [void] $listBox5.Items.Add("$newnew5")

                }
                #****** END Creating ListBox Items *********

                $tabpage1.Controls.Add($listBox5)
                $result5 = $listBox5.SelectedItem

                $listBox5.add_DoubleClick($btnLaunch_click1)
                $listBox5.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })

    #******** LIST BOX X *************************************************
        $listBoxx.Location = New-Object System.Drawing.Point(10,495)
        $listBoxx.Size = New-Object System.Drawing.Size(230,20)
        $listBoxx.Height = 175
        $listBoxx.ScrollAlwaysVisible = $False
        $listboxx.HorizontalScrollbar = $True
        $listBoxx.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $arrayx = @()

                foreach($itemx in $tbpg1_listboxx){
                        $ax = $itemx
                        $arrayx += $ax
                    }

                $sizex = $arrayx.Length

                for($i=0; $i -lt $sizex; $i++){
                    $newx = $arrayx[$i]
                    $newnewx = $newx.c1
                    [void] $listBoxx.Items.Add("$newnewx")

                }
                #****** End Creating ListBox Items *********

                $tabpage1.Controls.Add($listBoxx)
                $result5 = $listBoxx.SelectedItem

                $listBoxx.add_DoubleClick($btnLaunch_Click1)
                $listBoxx.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })


    
    #********* TAB PAGE 2 *********************************************************************
    $tabpage2.Location = '23, 4'
	$tabpage2.Name = 'tabpage2'
	$tabpage2.Padding = '3, 3, 3, 3'
	$tabpage2.Size = '702, 442'
	$tabpage2.TabIndex = 1
	$tabpage2.Text = '      Computer, Software, AD User, System Scripts      '
	$tabpage2.UseVisualStyleBackColor = $True
    $tabpage2.BackColor = "LightGray" #[System.Drawing.Color]::FromArgb(255,185,209,234)

    #******** TAB PAGE 2 LABELS *************************************************
        $label2a.Location = New-Object System.Drawing.Point(10,20)
        $label2a.Size = New-Object System.Drawing.Size(100,15)
        $label2a.Text = 'Fix and Kill Scripts'
        $label2a.Font = $font
        $tabpage2.Controls.Add($label2a)

        $label2b.Location = New-Object System.Drawing.Point(475,15)
        $label2b.Size = New-Object System.Drawing.Size(280,20)
        $label2b.Text = 'Script Preview'
        $label2b.Font = $font
        $tabpage2.Controls.Add($label2b)

        $label2c.Location = New-Object System.Drawing.Point(10,225)
        $label2c.Size = New-Object System.Drawing.Size(125,15)
        $label2c.Text = 'Computer Info Scripts'
        $label2c.Font = $font
        $tabpage2.Controls.Add($label2c)

        $label2d.Location = New-Object System.Drawing.Point(10,415)
        $label2d.Size = New-Object System.Drawing.Size(125,15)
        $label2d.Text = 'User and AD Scripts'
        $label2d.Font = $font
        $tabpage2.Controls.Add($label2d)

    #******** LIST BOX 2 *************************************************
        $listBox2.Location = New-Object System.Drawing.Point(10,40)
        $listBox2.Size = New-Object System.Drawing.Size(230,20)
        $listBox2.Height = 185
        $listBox2.ScrollAlwaysVisible = $False
        $listbox2.HorizontalScrollbar = $True
        $listBox2.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array2 = @()

                foreach($item2 in $tbpg2_listbox2){
                        $a2 = $item2
                        $array2 += $a2
                    }

                $size2 = $array2.Length


                for($i=0; $i -lt $size2; $i++){
                    $new2 = $array2[$i]
                    $newnew2 = $new2.c1
                    [void] $listBox2.Items.Add("$newnew2")

                }
                #****** End Creating ListBox Items ***********************

                $tabpage2.Controls.Add($listBox2)
                $result2 = $listBox2.SelectedItem

                $listBox2.add_DoubleClick($btnLaunch_click1)
                $listBox2.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })


    #******** LIST BOX 4 *************************************************
        $listBox4 = New-Object System.Windows.Forms.ListBox
        $listBox4.Location = New-Object System.Drawing.Point(10,240)
        $listBox4.Size = New-Object System.Drawing.Size(230,20)
        $listBox4.Height = 170
        $listBox4.ScrollAlwaysVisible = $False
        $listbox4.HorizontalScrollbar = $True
        $listBox4.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array4 = @()

                foreach($item4 in $tbpg2_listbox4){
                        $a4 = $item4
                        $array4 += $a4
                    }

                $size4 = $array4.Length

                for($i=0; $i -lt $size4; $i++){
                    $new4 = $array4[$i]
                    $newnew4 = $new4.c1
                    [void] $listBox4.Items.Add("$newnew4")

                }
                #****** End Creating ListBox Items *********

                $tabpage2.Controls.Add($listBox4)
                $result2 = $listBox4.SelectedItem

                $listBox4.add_DoubleClick($btnLaunch_Click1)
                $listBox4.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })


    #******** LIST BOX 3 *************************************************
        $listBox3.Location = New-Object System.Drawing.Point(10,430)
        $listBox3.Size = New-Object System.Drawing.Size(230,20)
        $listBox3.Height = 240
        $listBox3.ScrollAlwaysVisible = $False
        $listbox3.HorizontalScrollbar = $True
        $listBox3.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array3 = @()

                foreach($item3 in $tbpg2_listbox3){
                        $a3 = $item3
                        $array3 += $a3
                    }

                $size3 = $array3.Length

                for($i=0; $i -lt $size3; $i++){
                    $new3 = $array3[$i]
                    $newnew3 = $new3.c1
                    [void] $listBox3.Items.Add("$newnew3")

                }
                #****** END Creating ListBox Items *********

                $tabpage2.Controls.Add($listBox3)
                $result3 = $listBox3.SelectedItem

                $listBox3.add_DoubleClick($btnLaunch_Click1)
                $listBox3.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })




    #********* TAB PAGE 6 *******************************************************************
    $tabpage6.Location = '23, 4'
	$tabpage6.Name = 'tabpage6'
	$tabpage6.Padding = '3, 3, 3, 3'
	$tabpage6.Size = '702, 442'
	$tabpage6.TabIndex = 5
	$tabpage6.Text = '      Operations / Instructions      '
	$tabpage6.UseVisualStyleBackColor = $True
    $tabpage6.BackColor = "LightGray" #[System.Drawing.Color]::FromArgb(255,185,209,234)
    $tabpage6.Controls.Add($btnSave)
    $tabpage6.Controls.Add($btnUndo)
    $tabpage6.Controls.Add($btnFont)
    $btnSave.BringToFront()
    $btnUndo.BringToFront()
    $btnFont.BringToFront()

    #******** TAB PAGE 6 LABELS *************************************************
        $label6a.Location = New-Object System.Drawing.Point(10,20)
        $label6a.Size = New-Object System.Drawing.Size(100,15)
        $label6a.Text = 'Select Script'
        $label6a.Font = $font
        $tabpage6.Controls.Add($label6a)

        $label6b.Location = New-Object System.Drawing.Point(475,15)
        $label6b.Size = New-Object System.Drawing.Size(380,20)
        $label6b.Text = 'Information'
        $label6b.Font = $font
        $tabpage6.Controls.Add($label6b)

    #******** LIST BOX 6 *************************************************
        $listBox6.Location = New-Object System.Drawing.Point(10,40)
        $listBox6.Size = New-Object System.Drawing.Size(230,20)
        $listBox6.Height = 640
        $listBox6.ScrollAlwaysVisible = $False
        $listbox6.HorizontalScrollbar = $True
        $listBox6.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array6 = @()

                foreach($item6 in $tbpg6_listbox6){
                        $a6 = $item6
                        $array6 += $a6
                    }

                $size6 = $array6.Length

                for($i=0; $i -lt $size6; $i++){
                    $new6 = $array6[$i]
                    $newnew6 = $new6.c1
                    [void] $listBox6.Items.Add("$newnew6")

                }
                #****** End Creating ListBox Items *********
                
                $tabpage6.Controls.Add($listBox6)
                $result6 = $listBox6.SelectedItem

                $listBox6.add_DoubleClick($btnLaunch_Click1)
                $listBox6.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })


    #********* TAB PAGE 7 *******************************************************************
    $tabpage7.Location = '23, 4'
	$tabpage7.Name = 'tabpage7'
	$tabpage7.Padding = '3, 3, 3, 3'
	$tabpage7.Size = '702, 442'
	$tabpage7.TabIndex = 6
	$tabpage7.Text = '       URLs & Phone System        '
	$tabpage7.UseVisualStyleBackColor = $True
    $tabpage7.BackColor = "LightGray" #[System.Drawing.Color]::FromArgb(255,185,209,234)

    #******** TAB PAGE 7 LABELS *************************************************
        $label7a.Location = New-Object System.Drawing.Point(10,20)
        $label7a.Size = New-Object System.Drawing.Size(100,15)
        $label7a.Text = 'Select URL'
        $label7a.Font = $font
        $tabpage7.Controls.Add($label7a) 

        $label7b.Location = New-Object System.Drawing.Point(475,15)
        $label7b.Size = New-Object System.Drawing.Size(280,20)
        $label7b.Text = 'Preview / Description / URL / Path'
        $label7b.Font = $font
        $tabpage7.Controls.Add($label7b)


        $label7c.Location = New-Object System.Drawing.Point(10,455)
        $label7c.Size = New-Object System.Drawing.Size(100,15)
        $label7c.Text = 'Select URL / Path'
        $label7c.Font = $font
        $tabpage7.Controls.Add($label7c)

    #******** LIST BOX 7 *************************************************
        $listBox7.Location = New-Object System.Drawing.Point(10,40)
        $listBox7.Size = New-Object System.Drawing.Size(230,20)
        $listBox7.Height = 415
        $listBox7.ScrollAlwaysVisible = $False
        $listbox7.HorizontalScrollbar = $True
        $listBox7.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array7 = @()

                foreach($item7 in $tbpg7_listbox7){
                        $a7 = $item7
                        $array7 += $a7
                    }

                $size7 = $array7.Length

                for($i=0; $i -lt $size7; $i++){
                    $new7 = $array7[$i]
                    $newnew7 = $new7.c1
                    [void] $listBox7.Items.Add("$newnew7")

                }
                #****** End Creating ListBox Items *********

                $tabpage7.Controls.Add($listBox7)
                $result7 = $listBox7.SelectedItem

                $listBox7.add_DoubleClick($btnLaunch_Click1)
                $listBox7.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })

    #******** LIST BOX 8 *************************************************
        $listBox8.Location = New-Object System.Drawing.Point(10,470)
        $listBox8.Size = New-Object System.Drawing.Size(230,20)
        $listBox8.Height = 200
        $listBox8.ScrollAlwaysVisible = $False
        $listbox8.HorizontalScrollbar = $True
        $listBox8.Sorted = 'AlphaNumeric'

                #****** Creating ListBox Items from Imported CSV *********
                $array8 = @()

                foreach($item8 in $tbpg7_listbox8){
                        $a8 = $item8
                        $array8 += $a8
                    }

                $size8 = $array8.Length

                for($i=0; $i -lt $size8; $i++){
                    $new8 = $array8[$i]
                    $newnew8 = $new8.c1
                    [void] $listBox8.Items.Add("$newnew8")

                }
                #****** End Creating ListBox Items *********

                $tabpage7.Controls.Add($listBox8)
                $result7 = $listBox8.SelectedItem

                $listBox8.add_DoubleClick($btnLaunch_Click1)
                $listBox8.Add_KeyDown({if ($_.KeyCode -eq "Enter")
                        {
                            $btnLaunch.PerformClick()
                        }
                    })



#*****/\**********************************************/\*************************************
#****/**\********* END TAB DEFINITIONS AND ITEMS ****/**\************************************
#***/****\******************************************/****\***********************************
#**/******\****************************************/******\**********************************


    #**********************************************
    #******** BUTTON DEFINITONS *******************
    #**********************************************

    #****** INVISIBLE BUTTON **********************
    #$btn.Anchor = 'left'
    $btn.Dock = 'bottom'
    $btn.Location = '200,725'
    $btn.Name = 'Launch'
    $btn.Size = '100, 15' #75
    $btn.Text = 'Clear'
    $btn.UseVisualStyleBackColor = $True
    $btn.BackColor = 'DarkBlue'
    #$btn.Visible = $False
    $btn.FlatAppearance.BorderSize = 0
    
    #****** INVISIBLE BUTTON **********************
    #$btn.Anchor = 'left'
    $btnF.Dock = 'fill'
    $btnF.Location = '320,725'
    $btnF.MinimumSize = '1000,1000'
    $btnF.Name = 'Launch'
    $btnF.Size = '100, 33' #75
    $btnF.Text = 'Clear'
    $btnF.BackColor = 'DarkBlue'
    #$btn.Visible = $False
    
    #$btnF.SendToBack()
    $btn.SendToBack()

    #****** REFRESH BUTTON ************************
    #$btnrefresh.Anchor = 'bottom, left'
    #$btnrefresh.Dock = 'Bottom'
    $btnrefresh.Location = '132,745' #'320,725'
    $btnrefresh.Name = 'Launch'
    $btnrefresh.Size = '100, 33' #75
    $btnrefresh.MaximumSize = '100, 33'
    $btnrefresh.Text = 'Clear'
    $btnrefresh.UseVisualStyleBackColor = $True
    $btnrefresh.BackColor = "White"
    $btnrefresh.Font = $font
    $btnrefresh.add_Click($btnRefresh_Click)
    
    #****** SAVE BUTTON ***************************
    $btnSave.Location = '248,24'
    $btnSave.Name = 'buttonOK'
    $btnSave.Size = '50,20'
    $btnSave.Text = 'Save'
    $btnSave.UseVisualStyleBackColor = $True
    $btnSave.BackColor = "White"
    $btnSave.Font = $font
    $btnSave.add_Click($btnSave_Click)
    $btnSave.BringToFront()
    $btnSave.Hide()
    #****** UNDO BUTTON ***************************
    $btnUndo.Location = '295,24'
    $btnUndo.Name = 'buttonOK'
    $btnUndo.Size = '50,20'
    $btnUndo.Text = 'Undo'
    $btnUndo.UseVisualStyleBackColor = $True
    $btnUndo.BackColor = "White"
    $btnUndo.Font = $font
    $btnUndo.add_Click($btnUndo_Click)
    $btnUndo.BringToFront()
    $btnUndo.Hide()
    #****** FONT BUTTON ***************************
    $btnFont.Location = '343,24'
    $btnFont.Name = 'buttonOK'
    $btnFont.Size = '50,20'
    $btnFont.Text = 'TBD'
    $btnFont.UseVisualStyleBackColor = $True
    $btnFont.BackColor = "White"
    $btnFont.Font = $font
    $btnFont.add_Click($btnFont_Click)
    $btnFont.BringToFront()
    $btnFont.Hide()

    #****** CLOSE BUTTON **************************
    #$btnclose.Anchor = 'bottom, left'
    $btnclose.Location = '450,730' #'465,725'
    $btnclose.Name = 'Launch'
    $btnclose.Size = '100, 33' #75
    $btnclose.Text = 'Close'
    $btnclose.UseVisualStyleBackColor = $True
    $btnclose.BackColor = "White"
    $btnclose.Font = $font
    $btnclose.add_Click($btnClose_Click)
    
    #****** LAUNCH BUTTON *************************
    #$btnlaunch.Anchor = 'bottom, left'
    $btnlaunch.Location = '26,707' #'30,725'
    $btnlaunch.Name = 'buttonOK'
    $btnlaunch.Size = '100,33'
    $btnlaunch.Text = 'Launch'
    $btnlaunch.UseVisualStyleBackColor = $True
    $btnLaunch.BackColor = "White"
    $btnlaunch.Font = $font
    $btnlaunch.add_Click($btnLaunch_Click1)
    $btnlaunch.add_Click($btnLaunch_Click5)
    $btnlaunch.add_Click($btnLaunch_Clickx)
    $btnlaunch.add_Click($btnLaunch_Click2)
    $btnlaunch.add_Click($btnLaunch_Click4)
    $btnlaunch.add_Click($btnLaunch_Click3)
    $btnlaunch.add_Click($btnLaunch_Click6)
    $btnlaunch.add_Click($btnLaunch_Click7)
    $btnlaunch.add_Click($btnLaunch_Click8)
    $btnlaunch.add_Click($btnLaunch_search)

    #****** ELEVATED LAUNCH BUTTON ****************
    #$btnlaunch.Anchor = 'bottom, left'
    $btnlaunchELV.Location = '26,745' #'610,725'
    $btnlaunchELV.Name = 'buttonOK'
    $btnlaunchELV.Size = '100,33'
    $btnlaunchELV.Text = 'Run as 
Different User'
    $btnlaunchELV.UseVisualStyleBackColor = $True
    $btnLaunchELV.BackColor = "White"
    $btnlaunchELV.Font = $font
    $btnlaunchELV.add_Click($btnLaunchE_Click1)
    $btnlaunchELV.add_Click($btnLaunchE_Click5)
    $btnlaunchELV.add_Click($btnLaunchE_Clickx)
    $btnlaunchELV.add_Click($btnLaunchE_Click2)
    $btnlaunchELV.add_Click($btnLaunchE_Click4)
    $btnlaunchELV.add_Click($btnLaunchE_Click3)
    $btnlaunchELV.add_Click($btnLaunchE_Click6)
    $btnlaunchELV.add_Click($btnLaunchE_Click7)
    $btnlaunchELV.add_Click($btnLaunchE_Click8)

    #****** PSEDIT LAUNCH BUTTON ******************
    #$btnlaunch.Anchor = 'bottom, left'
    $btnlaunchPS.Location = '238,707' #'610,725'
    $btnlaunchPS.Name = 'buttonOK'
    $btnlaunchPS.Size = '100,33'
    $btnlaunchPS.Text = 'Edit with Powershell ISE'
    $btnlaunchPS.UseVisualStyleBackColor = $True
    $btnLaunchPS.BackColor = "White"
    $btnlaunchPS.Font = $font
    $btnlaunchPS.add_Click($btnLaunchPS_Click)

    #****** INFO BUTTON ***************************
    #$btninfo.Anchor = 'bottom, Left'
    $btninfo.Location = '132,707' #'175,725'
    $btninfo.Name = 'buttonOK'
    $btninfo.Size = '100,33'
    $btninfo.Text = 'Display'
    $btninfo.UseVisualStyleBackColor = $True
    $btnInfo.BackColor = "White"
    $btninfo.Font = $font
    $btninfo.add_Click($btnInfo_Click1)
    $btninfo.add_Click($btnInfo_Click5)
    $btninfo.add_Click($btnInfo_Clickx)
    $btninfo.add_Click($btnInfo_Click2)
    $btninfo.add_Click($btnInfo_Click4)
    $btninfo.add_Click($btnInfo_Click3)
    $btninfo.add_Click($btnInfo_Click6)
    $btninfo.add_Click($btnInfo_Click7)
    $btninfo.add_Click($btnInfo_Click8)
    $btninfo.add_Click($searchBtn_Info)

    #****** HELP BUTTON ***************************
    $helpBtn.Location = '800,46'
    $helpBtn.Name = 'buttonOK'
    $helpBtn.Size = '20,20'
    $helpBtn.Text = '?'
    $helpBtn.UseVisualStyleBackColor = $True
    $helpBtn.BackColor = "White"
    $helpBtn.Font = $font
    $helpBtn.add_Click($helpBtn_Click)
    $helpBtn.Anchor = 'top, right'
    $helpBtn.BringToFront()

    #**********************************************
    #******** END BUTTON DEFINITONS ***************
    #**********************************************



    $form1.ResumeLayout()

    $InitialFormWindowState = $form1.WindowState
    $form1.add_Load($Form_StateCorrection_Load)
    $form1.ShowDialog()

}

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

Hide-Console
#**************************************************************************
#**************************************************************************

#**************************************************************************

GenerateForm
