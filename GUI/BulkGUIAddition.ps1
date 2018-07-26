[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")    #modules/libraries 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  #modules/libraries 

Import-module ActiveDirectory #Module/Library
$descisionForm = New-Object System.Windows.Forms.Form    
$descisionForm.Size = New-Object System.Drawing.Size(500,250)
$descisionForm.Text = "Choose Domain" ##Title of the pop-up-box 




        function 1Pressed 
         {
                start-process ".\Users1.txt" ##Opens the users document on startup so the user can edit it straight away

                $1Form = New-Object System.Windows.Forms.Form    # creates the form that asks the user if they have added users to the txt
                $1Form.Size = New-Object System.Drawing.Size(400,200) 


              function YesCLick # function for user pressing yes
              {
               write-host "YES ADDING "  
                   $Domain1     = "domain1name" ##setting domain varibale 
                   $Array1      = @('Group1', 'Group2', 'Group3','Group4')  #setting array variable, array holds groups 
                          $users = Get-Content ".\Users1.txt"  # add users to group from text file
                          ForEach($user in $users) #Breakdown users(txt doc) into individual Users
                                 { 
                                 Write-Host "Processing: $user" #Output each user name on the txt doc to the output box when being added to groups
                                 ForEach($group in $Array1)  #Defines the group for this loop as Array1
                                       {
                                       #write-host "`tAdd-ADGroupMember -Server $Domain1 -Identity $Group -Member $user" #This is used for testing to see what it would do. -whatif is an alternative to this 
                                      Add-ADGroupMember -Server $Domain1 -Identity $Group -Member $user -passthru #Adds the user to AD group, gets Domain, Gets the group, gets the user.
                                       } # end ForEach($group 
                                 } # end ForEach($user      
                 
                } #end YES

                function NoClick
                    { #Start no click the function for a user pressing no 
                        write-host "NOT ADDING"
                
                        $NoForm = New-Object System.Windows.Forms.Form    ##Creates a new form for the no option
                        $NoForm.Size = New-Object System.Drawing.Size(400,200)
                 
                        $AddUsers = New-Object System.Windows.Forms.Label
                        $AddUsers.Location = New-Object System.Drawing.Size(110,50) 
                        $AddUsers.Text = "Have you added the Users to the text document?."
                        $AddUsers.AutoSize = $True
                        $NoForm.Controls.Add($AddUsers)
                        $1Form.ShowDialog()

                         $NoForm.Add_Shown({$NoForm.Activate()})
                        [void] $NoForm.ShowDialog()  ##What makes the forms show up
                
                    } #end no click 

                #####Create form for 1Addition
                ##### Form create after functions as they need 2 be called first.
                
                $yesButton = New-Object System.Windows.Forms.Button 
                $yesButton.Location = New-Object System.Drawing.Size(75,75) 
                $yesButton.Size = New-Object System.Drawing.Size(100,50) 
                $yesButton.Text = "Yes" 
                $yesButton.Add_Click({YesCLick}) 
                $1Form.Controls.Add($yesButton) 

                $noButton = New-Object System.Windows.Forms.Button 
                $noButton.Location = New-Object System.Drawing.Size(225,75) 
                $noButton.Size = New-Object System.Drawing.Size(100,50) 
                $noButton.Text = "No" 
                $noButton.Add_Click({NoClick}) 
                $1Form.Controls.Add($noButton) 

                $YesOrNo = New-Object System.Windows.Forms.Label
                $YesOrNo.Location = New-Object System.Drawing.Size(110,50) 
                $YesOrNo.Text = "Have you added the Users to the text document?."
                $YesOrNo.AutoSize = $True
                $1Form.Controls.Add($YesOrNo)
                $1Form.ShowDialog()

                $1Form.Add_Shown({$1Form.Activate()})
                [void] $1Form.ShowDialog()
                   }# end 1Pressed    

        function 2Pressed 
         { #Start 2Pressed
                start-process ".\Users2.txt"

                $2Form = New-Object System.Windows.Forms.Form    
                $2Form.Size = New-Object System.Drawing.Size(400,200) 


              function YesCLick
              {
               write-host "YES ADDING "  
    $Domain2a     = "domina2a"
    $Domain2b     = "domain2b"
    $Array2a      = @('Group1', 'Group2', 'Group3')
    $Array2b      = @('Group1', 'Group2')
  
                         $users = Get-Content ".\Users2.txt"
                  ForEach($user in $users)
                         { 
                         Write-Host "Processing: $user"
                         ForEach($Group2a in $Array2a)
                               {
                               #write-host "`tAdd-ADGroupMember -Server $Domain2a -Identity $Group2a -Member $user"
                               Add-ADGroupMember -Server $Domain2a -Identity $Group2a -Member $user -passthru -whatif
                               } 
                         ForEach($Group2b in $Array2b)
                               {
                               #write-host "`tAdd-ADGroupMember -Server $Domain2b -Identity $Group2b -Member $user -passthru"
                               Add-ADGroupMember -Server $Domain2b -Identity $Group2b -Member $user -passthru -whatif 
                               }   
                 
                } #end YES

                function NoClick
                    { #Start no click
                        write-host "NOT ADDING"
                
                        $NoForm = New-Object System.Windows.Forms.Form    
                        $NoForm.Size = New-Object System.Drawing.Size(400,200)
                 
                        $AddUsers = New-Object System.Windows.Forms.Label
                        $AddUsers.Location = New-Object System.Drawing.Size(110,50) 
                        $AddUsers.Text = "Have you added the Users to the text document?."
                        $AddUsers.AutoSize = $True
                        $NoForm.Controls.Add($AddUsers)
                        $2Form.ShowDialog()

                         $NoForm.Add_Shown({$NoForm.Activate()})
                        [void] $NoForm.ShowDialog()
                
                    } #end no click

                }
                #####Create form for 2Addition
                ##### Form create after functons as they need 2 be called first.
                
                $yesButton = New-Object System.Windows.Forms.Button 
                $yesButton.Location = New-Object System.Drawing.Size(75,75) 
                $yesButton.Size = New-Object System.Drawing.Size(100,50) 
                $yesButton.Text = "Yes" 
                $yesButton.Add_Click({YesCLick}) 
                $2Form.Controls.Add($yesButton) 

                $noButton = New-Object System.Windows.Forms.Button 
                $noButton.Location = New-Object System.Drawing.Size(225,75) 
                $noButton.Size = New-Object System.Drawing.Size(100,50) 
                $noButton.Text = "No" 
                $noButton.Add_Click({NoClick}) 
                $2Form.Controls.Add($noButton) 

                $YesOrNo = New-Object System.Windows.Forms.Label
                $YesOrNo.Location = New-Object System.Drawing.Size(110,50) 
                $YesOrNo.Text = "Have you added the Users to the text document?."
                $YesOrNo.AutoSize = $True
                $2Form.Controls.Add($YesOrNo)
                $2Form.ShowDialog()

                $2Form.Add_Shown({$2Form.Activate()})
                [void] $2Form.ShowDialog()
                   }# end 2Pressed    

                function 3Pressed 
         { #Start 3Pressed
                start-process ".\Users3.txt"

                $3Form = New-Object System.Windows.Forms.Form    
                $3Form.Size = New-Object System.Drawing.Size(400,200) 


              function YesCLick
              {
               write-host "YES ADDING "  
    $Domain3     = "Dommain3name"
    $Array3      = @('Group1','Group2)
 
                    $users = Get-Content ".\Users3.txt"
                  ForEach($user in $users)
                         { 
                         Write-Host "Processing: $user"
                         ForEach($group in $Array3)
                               {
                               #write-host "`tAdd-ADGroupMember -Server $Domain3 -Identity $Group -Member $user"
                               Add-ADGroupMember -Server $Domain3 -Identity $Group -Member $user -passthru
                               } 
                 
                } #end YES

                function NoClick
                    { #Start no click
                        write-host "NOT ADDING"
                
                        $NoForm = New-Object System.Windows.Forms.Form    
                        $NoForm.Size = New-Object System.Drawing.Size(400,200)
                 
                        $AddUsers = New-Object System.Windows.Forms.Label
                        $AddUsers.Location = New-Object System.Drawing.Size(110,50) 
                        $AddUsers.Text = "Have you added the Users to the text document?."
                        $AddUsers.AutoSize = $True
                        $3Form.Controls.Add($AddUsers)
                        $3Form.ShowDialog()

                         $3Form.Add_Shown({$beForm.Activate()})
                        [void] $3Form.ShowDialog()
                
                    } #end no click

                }
                #####Create form for 3Addition
                ##### Form create after functons as they need 2 be called first.
                
                $yesButton = New-Object System.Windows.Forms.Button 
                $yesButton.Location = New-Object System.Drawing.Size(75,75) 
                $yesButton.Size = New-Object System.Drawing.Size(100,50) 
                $yesButton.Text = "Yes" 
                $yesButton.Add_Click({YesCLick}) 
                $3Form.Controls.Add($yesButton) 

                $noButton = New-Object System.Windows.Forms.Button 
                $noButton.Location = New-Object System.Drawing.Size(225,75) 
                $noButton.Size = New-Object System.Drawing.Size(100,50) 
                $noButton.Text = "No" 
                $noButton.Add_Click({NoClick}) 
                $3Form.Controls.Add($noButton) 

                $YesOrNo = New-Object System.Windows.Forms.Label
                $YesOrNo.Location = New-Object System.Drawing.Size(110,50) 
                $YesOrNo.Text = "Have you added the Users to the text document?."
                $YesOrNo.AutoSize = $True
                $3Form.Controls.Add($YesOrNo)
                $3Form.ShowDialog()

                $3Form.Add_Shown({$3Form.Activate()})
                [void] $3Form.ShowDialog()
                   }# end 3Pressed    

                        function 4Pressed 
         { #Start 4Pressed
                start-process ".\Users4.txt"

                $4Form = New-Object System.Windows.Forms.Form    
                $4Form.Size = New-Object System.Drawing.Size(400,200) 


              function YesCLick
              {
               write-host "YES ADDING "  
                 $Domain4     = "domian4name"
                   $Array4      = @('Group1','Group2', 'Group3', 'Group4', 'Group5' )
                          $users = Get-Content "Users4.txt"  # add users to group from text file
                  ForEach($user in $users)
                         { 
                         Write-Host "Processing: $user"
                         ForEach($group in $Array4)
                               {
                               #write-host "`tAdd-ADGroupMember -Server $Domain4 -Identity $Group -Member $user"
                               Add-ADGroupMember -Server $Domain4 -Identity $Group -Member $user -passthru
                               } 
                 
                } #end YES

                function NoClick
                    { #Start no click
                        write-host "NOT ADDING"
                
                        $NoForm = New-Object System.Windows.Forms.Form    
                        $NoForm.Size = New-Object System.Drawing.Size(400,200)
                 
                        $AddUsers = New-Object System.Windows.Forms.Label
                        $AddUsers.Location = New-Object System.Drawing.Size(110,50) 
                        $AddUsers.Text = "Have you added the Users to the text document?."
                        $AddUsers.AutoSize = $True
                        $4Form.Controls.Add($AddUsers)
                        $4Form.ShowDialog()

                         $4Form.Add_Shown({$4Form.Activate()})
                        [void] $4Form.ShowDialog()
                
                    } #end no click

                }
                #####Create form for 4Addition
                ##### Form create after functons as they need 2 be called first.
                
                $yesButton = New-Object System.Windows.Forms.Button 
                $yesButton.Location = New-Object System.Drawing.Size(75,75) 
                $yesButton.Size = New-Object System.Drawing.Size(100,50) 
                $yesButton.Text = "Yes" 
                $yesButton.Add_Click({YesCLick}) 
                $4Form.Controls.Add($yesButton) 

                $noButton = New-Object System.Windows.Forms.Button 
                $noButton.Location = New-Object System.Drawing.Size(225,75) 
                $noButton.Size = New-Object System.Drawing.Size(100,50) 
                $noButton.Text = "No" 
                $noButton.Add_Click({NoClick}) 
                $4Form.Controls.Add($noButton) 

                $YesOrNo = New-Object System.Windows.Forms.Label
                $YesOrNo.Location = New-Object System.Drawing.Size(110,50) 
                $YesOrNo.Text = "Have you added the Users to the text document?."
                $YesOrNo.AutoSize = $True
                $4Form.Controls.Add($YesOrNo)
                $4Form.ShowDialog()

                $4form.Add_Shown({$4Form.Activate()})
                [void] $4Form.ShowDialog()
                   }# end 4Pressed    



###############################################End Functions
############################################## Start buttons


    $1Button = New-Object System.Windows.Forms.Button 
    $1Button.Location = New-Object System.Drawing.Size(100,45) 
    $1Button.Size = New-Object System.Drawing.Size(100,50) 
    $1Button.Text = "Domain Name 1" 
    $1Button.Add_Click({1Pressed}) 
    $descisionForm.Controls.Add($1Button) 

    $3Pressed = New-Object System.Windows.Forms.Button 
    $3Pressed.Location = New-Object System.Drawing.Size(300,130) 
    $3Pressed.Size = New-Object System.Drawing.Size(100,50) 
    $3Pressed.Text = "Domain Name 3" 
    $3Pressed.Add_Click({3Pressed}) 
    $descisionForm.Controls.Add($3Pressed)

    $4Button = New-Object System.Windows.Forms.Button 
    $4Button.Location = New-Object System.Drawing.Size(100,130) 
    $4Button.Size = New-Object System.Drawing.Size(100,50) 
    $4Button.Text = "Domain Name 4" 
    $4Button.Add_Click({4Button}) 
    $descisionForm.Controls.Add($4Button)

    $2Button = New-Object System.Windows.Forms.Button 
    $2Button.Location = New-Object System.Drawing.Size(300,45) 
    $2Button.Size = New-Object System.Drawing.Size(100,50) 
    $2Button.Text = "Domain name 2" 
    $2Button.Add_Click({2Button}) 
    $descisionForm.Controls.Add($2Button) 


    $Font = New-Object System.Drawing.Font("Times New Roman",16,[System.Drawing.FontStyle]::Italic)
    # Font styles are: Regular, Bold, Italic, Underline, Strikeout
    $descisionForm.Font = $Font
    $DomainText = New-Object System.Windows.Forms.Label
    $DomainText.Location = New-Object System.Drawing.Size(150,10) 
    $DomainText.Text = "Choose your domain."
    $DomainText.AutoSize = $True
    $descisionForm.Controls.Add($DomainText)
    $descisionForm.ShowDialog()
                               
$descisionForm.Add_Shown({$descisionForm.Activate()})
[void] $descisionForm.ShowDialog()







