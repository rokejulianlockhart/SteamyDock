VERSION 5.00
Begin VB.Form dock 
   BorderStyle     =   0  'None
   Caption         =   " "
   ClientHeight    =   9675
   ClientLeft      =   45
   ClientTop       =   570
   ClientWidth     =   5520
   Icon            =   "frmMain.frx":0000
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   645
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   368
   ShowInTaskbar   =   0   'False
   Begin VB.Timer explorerTimer 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   2895
      Tag             =   "this routine is used to identify an item in the dock as currently running even if not triggered by the dock"
      Top             =   1680
   End
   Begin VB.Timer initiatedExplorerTimer 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   2895
      Tag             =   "Provides regular checking of only explorer processes initiated by the dock itself"
      Top             =   1155
   End
   Begin VB.Timer iconGrowthTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   255
      Tag             =   "used to make the main icon grow"
      Top             =   3540
   End
   Begin VB.Timer clickBlankTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   255
      Tag             =   "used to make the main icon invisible for a very brief period of 100ms or less"
      Top             =   3075
   End
   Begin VB.Timer delayRunTimer 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   240
      Tag             =   "This is the timer that causes any secondary command to run three seconds after the main"
      Top             =   4620
   End
   Begin VB.Timer targetExistsTimer 
      Enabled         =   0   'False
      Interval        =   8000
      Left            =   225
      Tag             =   "this routine is used to identify if the main target is valid"
      Top             =   7290
   End
   Begin VB.Timer forceHideRevealTimer 
      Enabled         =   0   'False
      Interval        =   1500
      Left            =   2835
      Top             =   3960
   End
   Begin VB.Timer ScreenResolutionTimer 
      Interval        =   5000
      Left            =   255
      Top             =   2595
   End
   Begin VB.Timer bounceDownTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   255
      Tag             =   "controls the bounceDownward when the icon is clicked"
      Top             =   2100
   End
   Begin VB.Timer hourGlassTimer 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2835
      Tag             =   "load a small rotating hourglass image into the collection, used to signify running actions"
      Top             =   4470
   End
   Begin VB.Timer sleepTimer 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   225
      Tag             =   "stores and compares the last time to see if the PC has slept"
      Top             =   6765
   End
   Begin VB.Timer positionZTimer 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   255
      Tag             =   "Places the dock back in the defined z-order"
      Top             =   1110
   End
   Begin VB.Timer autoSlideInTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   2835
      Tag             =   "slide the dock in the Y axis"
      Top             =   6030
   End
   Begin VB.Timer nMinuteExposeTimer 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   2835
      Tag             =   "causes the dock to re-appear in its default state after N mins"
      Top             =   4995
   End
   Begin VB.Timer autoFadeInTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   240
      Tag             =   "this routine simply gradually sets the opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha"
      Top             =   6255
   End
   Begin VB.Timer autoSlideOutTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   2835
      Tag             =   "slide the dock in the Y axis"
      Top             =   5505
   End
   Begin VB.Timer initiatedProcessTimer 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   2895
      Tag             =   "Provides regular checking of only processes initiated by the dock itself"
      Top             =   660
   End
   Begin VB.Timer autoHideChecker 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   255
      Tag             =   "checks to see if the dock needs to be hidden, if so, initiates one of the hider timers"
      Top             =   5190
   End
   Begin VB.Timer autoFadeOutTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   240
      Tag             =   "this routine simply gradually sets the opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha"
      Top             =   5715
   End
   Begin VB.Timer processTimer 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   2895
      Tag             =   "this routine is used to identify an item in the dock as currently running even if not triggered by the dock"
      Top             =   150
   End
   Begin VB.Timer runTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   240
      Tag             =   "calls the subroutine that runs the actual command"
      Top             =   4155
   End
   Begin VB.Timer bounceUpTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   255
      Tag             =   "controls the bounceUpward when the icon is clicked"
      Top             =   1605
   End
   Begin VB.Timer responseTimer 
      Interval        =   200
      Left            =   255
      Tag             =   "Determines whetherto turn on the animate timer"
      Top             =   600
   End
   Begin VB.Timer animateTimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   270
      Tag             =   "this is the X millisecond timer that does the animation for the dock icons"
      Top             =   105
   End
   Begin VB.Label Label20 
      Caption         =   "explorerTimer"
      Height          =   255
      Left            =   3420
      TabIndex        =   26
      Tag             =   "this routine is used to identify an item in the dock as currently running even if not triggered by the dock"
      Top             =   1755
      Width           =   1215
   End
   Begin VB.Label Label19 
      Caption         =   "initiatedExplorerTimer"
      Height          =   255
      Left            =   3420
      TabIndex        =   25
      Tag             =   "Provides regular checking of only explorer processes initiated by the dock itself"
      Top             =   1230
      Width           =   1815
   End
   Begin VB.Label lblIconGrowthTimer 
      Caption         =   "iconGrowthTimer"
      Height          =   255
      Left            =   930
      TabIndex        =   24
      ToolTipText     =   "used to make the main icon invisible for a very brief period of 100ms or less"
      Top             =   3585
      Width           =   1680
   End
   Begin VB.Label lblClickBlankTimer 
      Caption         =   "ClickBlankTimer"
      Height          =   255
      Left            =   945
      TabIndex        =   23
      ToolTipText     =   "used to make the main icon invisible for a very brief period of 100ms or less"
      Top             =   3120
      Width           =   1680
   End
   Begin VB.Label Label6 
      Caption         =   "delayRunTimer"
      Height          =   255
      Index           =   1
      Left            =   960
      TabIndex        =   22
      ToolTipText     =   "This is the timer that causes any secondary command to run three seconds after the main"
      Top             =   4695
      Width           =   1425
   End
   Begin VB.Label Label18 
      Caption         =   "targetExistsTimer"
      Height          =   255
      Left            =   945
      TabIndex        =   21
      Tag             =   "this routine is used to identify if the main target is valid"
      Top             =   7365
      Width           =   1665
   End
   Begin VB.Label Label 
      Caption         =   "forceHideRevealTimer"
      Height          =   255
      Index           =   1
      Left            =   3360
      TabIndex        =   20
      Top             =   4080
      Width           =   1935
   End
   Begin VB.Label Label17 
      Caption         =   "ScreenResolutionTimer"
      Height          =   255
      Left            =   960
      TabIndex        =   19
      Top             =   2670
      Width           =   1680
   End
   Begin VB.Label Label5 
      Caption         =   "bounceDownTimer"
      Height          =   255
      Left            =   960
      TabIndex        =   18
      Tag             =   "controls the bounceDownward when the icon is clicked"
      Top             =   2175
      Width           =   1485
   End
   Begin VB.Label Label16 
      Caption         =   "hourglassTimer"
      Height          =   255
      Left            =   3360
      TabIndex        =   17
      ToolTipText     =   "causes the dock to re-appear in its default state after 10 mins"
      Top             =   4590
      Width           =   1785
   End
   Begin VB.Label Label15 
      Caption         =   "sleepTimer"
      Height          =   255
      Left            =   945
      TabIndex        =   16
      Tag             =   "stores and compares the last time to see if the PC has slept"
      Top             =   6810
      Width           =   1665
   End
   Begin VB.Label Label14 
      Caption         =   "positionZTimer"
      Height          =   255
      Left            =   960
      TabIndex        =   15
      ToolTipText     =   "Placing the dock back in the defined z-order"
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label13 
      Caption         =   "autoSlideInTimer"
      Height          =   255
      Left            =   3375
      TabIndex        =   14
      ToolTipText     =   "slides the dock in the Y axis"
      Top             =   6150
      Width           =   1410
   End
   Begin VB.Label Label12 
      Caption         =   "Note: there are other timers on the splashform"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   405
      TabIndex        =   13
      Top             =   9135
      Width           =   4380
   End
   Begin VB.Label Label9 
      Caption         =   "nMinuteExposeTimer"
      Height          =   255
      Left            =   3375
      TabIndex        =   12
      ToolTipText     =   "causes the dock to re-appear in its default state after 10 mins"
      Top             =   5085
      Width           =   1785
   End
   Begin VB.Label Label2 
      Caption         =   "autoFadeInTimer"
      Height          =   255
      Left            =   960
      TabIndex        =   11
      ToolTipText     =   "this routine simply gradually increases the opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha"
      Top             =   6360
      Width           =   1425
   End
   Begin VB.Label lblDockInfo2 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"frmMain.frx":058A
      ForeColor       =   &H80000008&
      Height          =   990
      Left            =   435
      TabIndex        =   10
      Top             =   7935
      Width           =   4380
   End
   Begin VB.Label lblDockInfo 
      Appearance      =   0  'Flat
      BackColor       =   &H80000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"frmMain.frx":068F
      ForeColor       =   &H80000008&
      Height          =   1380
      Left            =   2715
      TabIndex        =   9
      Top             =   2295
      Width           =   2370
   End
   Begin VB.Label Label11 
      Caption         =   "autoSlideOutTimer"
      Height          =   255
      Left            =   3360
      TabIndex        =   8
      ToolTipText     =   "slides the dock in the Y axis"
      Top             =   5610
      Width           =   1410
   End
   Begin VB.Label Label10 
      Caption         =   "initiatedProcessTimer"
      Height          =   255
      Left            =   3435
      TabIndex        =   7
      Tag             =   "Provides regular checking of only processes initiated by the dock"
      Top             =   735
      Width           =   1815
   End
   Begin VB.Label Label8 
      Caption         =   "autoHideChecker"
      Height          =   255
      Left            =   960
      TabIndex        =   6
      Tag             =   "checks to see if the dock needs to be hidden, if so, initiates one of the hider timers, slide or fade"
      ToolTipText     =   "this routine simpl"
      Top             =   5295
      Width           =   1410
   End
   Begin VB.Label Label7 
      Caption         =   "autoFadeOutTimer"
      Height          =   255
      Left            =   945
      TabIndex        =   5
      ToolTipText     =   "this routine simply gradually sets decreased opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha"
      Top             =   5835
      Width           =   1425
   End
   Begin VB.Label Label6 
      Caption         =   "runTimer"
      Height          =   255
      Index           =   0
      Left            =   975
      TabIndex        =   4
      ToolTipText     =   "This is the timer that causes any specified command to run"
      Top             =   4170
      Width           =   1425
   End
   Begin VB.Label Label4 
      Caption         =   "bounceUpTimer"
      Height          =   255
      Left            =   960
      TabIndex        =   3
      Tag             =   "controls the bounceUpward when the icon is clicked"
      Top             =   1665
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "processTimer"
      Height          =   255
      Left            =   3435
      TabIndex        =   2
      Tag             =   "this routine is used to identify an item in the dock as currently running even if not triggered by the dock"
      Top             =   225
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "responseTimer"
      Height          =   255
      Left            =   960
      TabIndex        =   1
      Tag             =   "Determines whetherto turn on the animate timer"
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label 
      Caption         =   "animateTimer"
      Height          =   255
      Index           =   0
      Left            =   960
      TabIndex        =   0
      Tag             =   "this is the X millisecond timer that does the animation for the dock icons"
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "dock"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



' =====================================
' Functional changes since last release
' =====================================
'
' Auto generation of dock items in iconSettings is progressing
' Automatic finding of the correct icon to use using an application compatibility list
' After a system sleep the raised dock is lowered. No, not quite yet
' Runs well on a system that has never had Rocketdock installed upon it
' If the docksettings is running it is brought to the fore rather than closed and re-opened as before.
' addition and deletion of icons is no longer a very slow operation
' The rotating hourglass timer displayed during a drag and drop operation to the dock
' Now possible to drag an icon from the dock to delete it permanently
' The dock icon bounce effect is now using an easeIN function
' A smaller icon image is displayed during a drag and delete operation from the dock
' Dragging and dropping from one part of the dock to another
' Added Quick Launch functionality to run an app more quickly half way through the bounce animation
' Added autohide dock after running an app
' Added automatic running of secondary app.
' Implement the old bounce as a separate bounce type called miserable
' Implemented an icon cache for older, slower machines
' Fixed window height issues on Win 10/11
' Added menu option to clone current item
' A misconfigured or non-existent target shows a red X over the icon
' Allows you to set a secondary app to run.
' Confirms when deleting multiple instances of a program.
' Deletion and addition of icons is now much faster.
' Add a sound option when initiating an icon mouseDown.
' Improved some drag/drop animations.
' No longer takes a long time for the dock to fully close.
' Fixed memory Leaks causing usage of memory to climb.

'========================================================================================================
' Change History
' ==============
' Changes: dates in UK DD/MM/YYYY format

' 22/10/2020 .01 DAEB frmMain.frm responsetimer fix the incorrect check of the timer state to determine the dock upper limit when entering and triggering the main animation
' 23/10/2020 .02 DAEB frmMain.frm move the dock position behind the icons 8 pixels to the left to position the icons correctly on the dock
' 26/10/2020 .03 DAEB frmMain.frm removed declarations required by IsRunning since the move of this function to common.bas
' 27/10/2020 .04 DAEB frmMain.frm alternative animations to zoom: Bubble enabled as options
'            .05 DAEB frmMain.frm null
' 17/11/2020 .06 DAEB frmMain.frm Fixed the sequentialBubbleAnimation

' 01/07/2020 add a favicon so that it appears in shortcuts &c     1hr problems with the 16x16 icon when run in 32 bit windows�must be 16x16 icon 256bit
' 01/07/2020 blankresizedImg128 allowing click through            removed the hard edges from the blank image
' 01/07/2020 memory usage doubles when a new icon is added            It has nothing to do with the collection being doubled or memory failing to be released there.��The problem exists within LoadAndSavePictureGDIPlus:��finding a workaround using three collections��
' 01/07/2020 subscript bug when adding a new icon         the icon position array was not being referenced correctly nor bein populated with the final icon position.
' 01/07/2020 the current icon was being overwritten when populating a dictionary
' 01/09/2020 animation by cursor both ends in the wrong place
' 01/09/2020 animation by cursor start position
' 01/09/2020 background theme size change causes the bg to appear in the wrong place, right-shifted
' 02/07/2020 bugs with the incorrect value of count and rdmaximumicon during adding and deleting icons, now fixed       now adds and deletes as designed
' 02/07/2020 change the scope of the large and small collections so that they are local, then perhaps they will free the memory         had no effect
' 02/08/2020 BAT file existence test added to run command
' 03/07/2020 adding task manager via dock causes two icons to appear and the naming to be screwed up on all subsequent icons
' 03/07/2020 all the add icon options need to have the image availability checked and error checking added
' 03/07/2020 check addition of icon survives a restart after adding through the dock itself. through each method
' 03/08/2020 added test for sworkingdirectory as it was not been used at all by binaries
' 03/08/2020 determine the correct screen size            When a full screen game is played, then the screen format /type/size changes. That causes the dock to be located in the incorrect place.�This is a bug in VB6 that returns screen.width incorrectly after a resolution change
' 03/08/2020 Newer method of checking processes that captures all processes CPU-Z was not bein captured on Dell E6410         ' processCheckArray(a) = isProcessInTaskList(sCommand) replaced by�        processCheckArray(a) = IsRunning(sCommand)
' 03/09/2020 Force window to top when an application is already running       16hrs
' 03/09/2020 new menu item to open an additional instance of running app
' 03/09/2020 open existing instance does not open windows that are minimised to the systray         these windows are not visible as normally minimised windows are
' 04/07/2020 if the 3rd config option does not exist then create a docksettings.ini file          it does this any way but I now have some default settings in the file, if rocketdock hasn' t been installed then it uses this by default
' 04/07/2020 menuAddSummat old items are being left behind when deleting          menuAddSummat�old items are being left behind when deleting
' 04/07/2020 the code to check that the icon settings utility does to test for a first run (and licence display) can be moved to the dock entirely.
' 04/08/2020 '  DebugPrint themeing of the pop-up panel
' 04/08/2020 change shell execute to createProcess API so that we can tell when the process dies and mark it as such    1 day   change shell execute to createProcess API so that we can tell when the process dies and mark it as such, this avoids the use of the timer to test for the existence of running processes��this has been handled in a different manner, keeping track of dock-initiated processes vian an array
' 04/08/2020 restart must not cause memory usage and must be quick            restart has been removed
' 04/08/2020 running tasks appearing in the dock    5-6 hrs
' 04/09/2020 add run another instance of this App to the menu   1hr
' 04/09/2020 when the user' s cursor enters the dock it jumps to the icon stored left position     8hrs actual 4hrs    when the dock moves itself to accommodate the larger icons it should do so from the current position
' 05/07/2020 fixed some typing errors and conversions
' 05/07/2020 menuAddSummat is writing incorrectly to the 3rd config file sometimes writes data to the rocketdock section
' 05/08/2020 Added modification to the rescaled image quality
' 07/07/2020 add debug to the dock
' 07/07/2020 Cbool error testing        '    Dim ab As String�'    Dim b As Boolean�'�'    ab = "true"�'    b = CBool(ab)�'�'    ab = "True"�'    b = CBool(ab)�'�'    ab = "True"�'    b = CBool(LCase(ab))��The final two options were used in the program and functioned as expected in Win 7.�It appeared that under Win10 this caused mismatch errors. ��BASIC Line numbers were used to identify which exact line was failing at runtime��The solution was to remove all use of the CBool function and use if then statements to assign a bool value on another variable or to test the string as as a string containing "True".
' 07/07/2020 now tests for running application as soon as an application is bounced, ie. run  Completed   Low     There was no running of the process timer when a command was run, now fixed.�Prior to this if the dock was high then it did not perform the process test, it now does as this check has been removed.
' 07/09/2020 Set an additional block on pointless activity by excluding movement in the y axis alone from triggering animation      0.5hrs
' 07/09/2020 When an application is already running suppress the bounce animation and open immediately      0.5
' 08/02/2021 implement themeing       10hrs estimated 25hrs   28 themes converted�90% complete
' 09/07/2020 implement the RocketDock theme settings files
' 09/07/2020 128 blank image made transparent          Created a 1% opaque image, then reopened it and did the same so that it is now .1% opaque and 99.9% trasansparent so invisible to the naked eye
' 14/08/2020 create 28 replacement rocketdock themes
' 14/08/2020 Medieval total war will not run from the dock
' 14/08/2020 Quake I will not run at all but will run from the map in rocket1.exe
' 14/08/2020 Quake II has trouble starting
' 14/08/2020 Quake III has trouble starting
' 16/08/2020 add the capability to resize the dock itself independently
' 16/08/2020 added code to read the dock size from the configuration
' 16/08/2020 dock is centred around the middle of the dock
' 16/08/2020 dock skin lifts itself at the right hand end of the dock animating upwards         ther calculation of the top is no longer dynamic for the skin theme
' 17/08/2020 add a sleep option to the menu
' 17/08/2020 Allow dock theme background sizing
' 17/08/2020 shutdown command is not executed
' 17/09/2020 Opacity for different elements, theme, icons and text        7hrs estimated - 5hrs so far    New config option for font opacity added, slider, save and read &c, implemented and tested
' 17/09/2020 Smoothing added to icon quality
' 18/06/2020 addImageToDictionary  made to accept any dictionary name via thisDictionary          this was LoadAndSaveGDIplusImage, now loadImageToDictionary
' 18/09/2020 remove unnecessary code the form initialise
' 18/09/2020 sort out the form initialise, tidying up a lot of mess into new routines x 7
' 19/08/2020 checkAndKill added current process PID check agains the killed process to prevent the process killing itself       to prevent the process killing itself
' 19/09/2020 Added Confirmation Dialog functionality
' 20/08/2020 moved checkAndKill to common.bas and removed other references to the new location
' 20/08/2020 moved is64bit to common.bas and removed other references to the new location         and did the same for ALL other common programs
' 21/07/2020 add a config item to allow the dock animation interval to be modified from 1ms to 20ms
' 21/07/2020 runcommand - add the process to a list of processes initiated by the dock          �    ' add the process to a list of processes initiated by the dock�    ' instead of checking all the dock executable names to the running processes�    ' we could test just those in the limited list�    ' it would make the regular checks less intensive of i/o
' 22/10/2020 .01 responsetimer fix the incorrect check of the timer state to determine the dock upper limit when entering and triggering the main animation
' 23/07/2020 ANIMATION BUG in the validation that failed to fix a corruption in rdanimatetimer
' 23/10/2020 .02 move the dock position behind the icons 8 pixels to the left to position the icons correctly on the dock
' 24/09/2020 move all setting of the the window characteristic from a function that is run unnecessarily during the animation         Moved to the initialisation phase and renamed accordignly
' 24/09/2020 move the funcBlend.constantalpha setting to where the dock opacity is altered            The var is a module wide var and only needs to be set rarely.
' 25/08/2020 if an executable is found in the running process list, then check its folder name also matches before adding the cog         when you are running two apps with the same name, this is a useful second check
' 25/08/2020 if an executable is found in the running process list, then check its folder name also matches before allowing it to be killed
' 25/08/2020 implement new getDrives code that uses Windows APIs to get the details           affects all programs
' 25/08/2020 Remove dependency on a IDE-built list box for storing drive types, now uses a multi-dimensional array            this means that the code can be shared and each program does not need a graphical IDE-time control built in
' 25/08/2020 remove old getDrives code that used error suppression            affects all programs
' 25/09/2020 Added a timer delay to the dock opacity decrease       The timer exits if the reveal timer is running or if the cursor is in the dock area
' 25/09/2020 256x256 icons? change the loading into memory of the 128 icon size�or change the background blank icon to 256�or allow the slider to state 256�o allow the validation to be 256 - possibly only when the user data settings.ini has been implemented as RD might not like the setting to be 256 - worth trying though�
' 26/10/2020 .03 DAEB removed declarations required by IsRunning since the move of this function to common.bas
' 27/07/2020 fixed the code to remove cogged processes from the dock without the mouse being tested for movement in the cog area
' 27/08/2020 dock skin right hand end is not placed correctly when animating by cursor position
' 27/08/2020 Dock skin start position is incorrect most of the time when the dock is static
' 27/08/2020 dock skin start position is not placed correctly when animating by cursor position
' 27/08/2020 Since the addition of the check running process'  folder, killing any unwanted process has failed         Added a boolean parameter to test for whether we need to check for folders before killing any process.
' 28/07/2020 Added menu option to delet the currently running application
' 28/07/2020 added support to display sample themes   Completed   Low
' 28/07/2020 changed the default animation interval to 10ms as this seems the optimal
' 28/09/2020 animate the dock background as well as the icons during a slide in/out
' 28/09/2020 draw a diagram of what occurs using libreoffice and add it to the documentation
' 28/09/2020 move the dock activation point when auto sliding/instant to the bottom of the screen
' 29/08/2020 fix issue where dock loses its skin after adding or deleting an icon  the dictionary is rebuilt after an add or delete and the images were not being re-added back to the dictionary
' 30/08/2020 change the sng vars to better names including Pxls and Twp &c      1hr

' Add a restart to the dock menu
' add a test to the getDirectory function to check for no path
' add an about window and menu link
' Add drag and drop         drag and drop for exe, images and other executable types
' add right click menu options as per other programs
' add shortcut handling - rocket1.exe will also need to the same code
' Add the ability to read the original RD settings file - SD could ONLY read the reistry...
' add validation to the input methods
' added $ symbol to sll string functions to speed them up
' Added open app folder
' added the functionality to open an EXE or DLL
' adding all the icon types as per the enhanced settings utility        take the code from the enhanced settings screen
' allows the autohide check timer to lower the dock after a short delay during startup
' bumpanimation bug trying to display an icon to the left of position zero and to the right of the last icon
' check all writes to the registry during adding new icons are also written to the settings/docksettings.ini
' check to see if each process is running and store the result
' configure debug print so that the config is always as desired
' create a rocket around a globe icon to replace the Rocketdock ones
' create icons based upon their type for dragging and dropping          audio done �video done�exe  done and done again�batch done�cpl done�msc done
' Created language type document-icon files. BAS &c         xml, kon, log, cfg, ini, txt and ost &c
' delete the second to last item in the dock, then move to the right over the last icon and it grows massively            the icon to the left goes negative in the y axis, the cemtre icon grows to normal full size but the final icon grows ridiculously�this occurs whenever an items is deleted from the dock in any position�possibly due to the maximum no of icons being used to calculate the size but not being updated dynamically
' deleting an icon          o take the code from the enhanced settings screen and add or enable the facilitiy to write the settings.ini files so the changes can be written��o requires a dock refresh
' drag and drop for folders
' drag and drop from one location in the dock to another      16hrs
' drag and drop If it is a shortcut we have some code to investigate the shortcut for the link details
' drag and drop if it is a URL then give it a HTML document icon        if it is a URL then give it a HTML document icon
' Ensure the descriptive text is centred upon the icon
' ensure the process search matches the full process path and not just the filename
' fixed bug where font outline opacity was set to 65512
' fixed logic bug in converting icon colours from decimal to string to long         The bug was in my brain. The decimal value used by RD is sufficient. It did not need to be converted to string then back again to decimal. The vb5 conversion from string to a number was just stupid and pointless. It did nothing useful.��decimal value needed to be expressed as a long integer, that' s it, no conversion required.
' fixed msc files run that do not have a folder path
' fixed run as administrator
' fixed the cog icon not appearing for small items in the dock when part of the dock is raised
' fixed the file selection dialog not opening when attached to the dock menu form       that form is hidden, moved it to a non-hidden form and it displayed correctly
' Fixed the text size and placement
' IImplement the new configuration file in the user data area     16hrs   much more work than expected
' improve the bounce animation      4 hrs estimated 4hrs so far We have the VB6 easing bounce code and an partial understanding of how it works.
' occasionally it sits there even when ordered to fade          perhaps another occasional timer check?
' place the icons GDI redrawing into a routine so it can be called when required    30mins
' position top - reinstate functionality    4hrs
' Question Mark icon
' restarting the dock after a local configuration change
' Rocketdock only reveals a hidden dock when the mouse position is in the very bottom of the screen         requires a change to the response timer
' run as administrator          an option to enhanced icon settings and perhaps on the dock right click?
' select and add a folder image for dragged folders
' small delay before auto-hide - perhaps the duration of the animation?         o do a delete of the dock refreshGDI�o then call the responseTimer
' speed up the whole dock.fInitilaise   8hrs
' synchronised adding folder by drag/drop and menu
' taskmgr does not appear  in the list of running processes
' test steamydock without Rocketdock installed at all       remove RD prog folder�remove registry entries�remove settings file �- and test!
' test the deletion of the bitmap       causes a crah each time
' the icon bounce when at the top of the screen bounces the whole dock      2-3hrs
' the icon bounce when the icon is not in focus     3hrs
' When autohiding on startup - have a delay so the dock can be seen for the usual delay period    Completed   Low
' when set to auto-hide, sometimes a massive icon is shown briefly    '

' Changes 2021
' ============

' .07 DAEB frmMain.frm 24/01/2021 modified to handle the new timer name
' .08 DAEB frmMain.frm 24/01/2021 removed the fade in functions from the fade out function
' .09 DAEB frmMain.frm 24/01/2021 created a separate fade in timer and function
' .10 DAEB frmMain.frm 25/01/2021 Added new parameter autoFadeInTimerCount for the new fade in timer
' .11 DAEB frmMain.frm 25/01/2021 changed the setting of the dock top to a better place
' .12 DAEB frmMain.frm 25/01/2021 Change to sdAppPath
' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support
' .14 DAEB frmMain.frm 27/01/2021 Add new subroutine to make the dock transparent and shutdown timers
' .15 DAEB frmMain.frm 27/01/2021 Add new subroutine to show the dock after it has been manually hidden by the user
' .16 DAEB frmMain.frm 27/01/2021 Added the user set parameter sDContinuousHide
' .17 DAEB frmMain.frm 27/01/2021 Moved disabling admin to a separate routine
' .18 DAEB frmMain.frm 31/01/2021 reinstated checks of fade out and slide timers to set a more frequent respnse timer to improve animation
' .19 DAEB frmMain.frm 02/02/2021 added sArguments field to the confirmation dialog
' .20 DAEB frmMain.frm 02/02/2021 added variable initialisation after declaration
' .21 DAEB frmMain.frm 07/02/2021 slight improvement to the the confirmation dialog
' .22 DAEB frmMain.frm 08/02/2021 changes to replace old method of enumerating all windows with enumerate improved Windows function STARTS
' .23 DAEB frmMain.frm 08/02/2021 Changed from an array to a single var
' .24 DAEB frmMain.frm 09/02/2021 handling any potential divide by zero
' .25 DAEB frmMain.frm 10/02/2021 added API and vars to test to see if a window is zoomed
' .26 DAEB frmMain.frm 10/02/2021 added test to check window state and alter it accordingly
' .27 DAEB frmMain.frm 11/02/2021 now operates like the standard Windows dock on a click, minimising then restoring
' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions
' .29 DAEB frmMain.frm 20/02/2021 Added new mdlSysTray module containing the code required to analyse the icons in the systray
' .30 DAEB 03/03/2021 frmMain.frm replaced the inIDE function that used a variant to one without
' .31 DAEB 03/03/2021 frmMain.frm Check return value from any GDI++ function
' .32 DAEB 03/03/2021 frmMain.frm Placing the dock back in the defined z-order
' .33 DAEB 03/03/2021 frmMain.frm New systray code from Dragokas
' .34 DAEB 08/02/2021 frmMain.frm - commented out the extra unwanted ShowWindow(hwnd, SW_RESTORE)
' .35 DAEB 03/03/2021 frmMain.frm check whether the prefix command required to access a Windows class ID is present
' .36 DAEB 03/03/2021 frmMain.frm check whether the prefix is present that indicates a Windows class ID is present
' .37 DAEB 03/03/2021 frmMain.frm removed the individual references to a Windows class ID
' .38 DAEB 18/03/2021 frmMain.frm utilised SetActiveWindow to give window focus without bringing it to fore
' .39 DAEB 18/03/2021 frmMain.frm utilised BringWindowToTop instead of SetWindowPos & HWND_TOP as that was used by a C program that worked perfectly.
' .40 DAEB 18/03/2021 frmMain.frm Added SWP_NOOWNERZORDER as an additional flag as that was used by a C program that worked perfectly, fixing the z-order position problems
' .41 DAEB 18/03/2021 frmMain.frm utilised ShowWindowAsync instead of ShowWindow as the C program utilised it and it seemed to make sense to do so too
' .42 DAEB 03/03/2021 frmMain.frm To support new receive focus menu option
' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
' .44 DAEB 01/04/2021 frmMain.frm put the control panel reference back
' .45 DAEB 01/04/2021 frmMain.frm Changed the logic to remove the code around a folder path existing...
' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
' .47 DAEB 01/04/2021 frmMain.frm autoSlideMode is now undefined at startup - this allowed the top position to operate as expected
' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
' .49 DAEB 01/04/2021 frmMain.frm added the vertical adjustment for sliding in and out STARTS
' .50 DAEB 01/04/2021 frmMain.frm Pruned all the redundant code for positioning according to the slideIn/Out state, not done here
' .51 DAEB 08/04/2021 frmMain.frm calls mnuIconSettings_Click_Event to start up the icon settings tools and display the properties of the new icon.
' .52 DAEB 09/04/2021 frmMain.frm add code to increase the timer to 120 minutes
' .53 DAEB 11/04/2021 frmMain.frm changed all occurrences of sCommand to thisCommand to attain more compatibility with rdIconConfigFrm menuRun_click
' .54 DAEB 19/04/2021 frmMain.frm Added new function to identify an icon to assign to the entry
' .55 DAEB 19/04/2021 frmMain.frm Added call to the older function to identify an icon using the shell object
' .56 DAEB 19/04/2021 frmMain.frm Added a faded red background to the current image when the drag and drop is in operation.
' .57 DAEB 19/04/2021 frmMain.frm modifedAmountToSlide renamed to xAxisModifier for clarity's sake
' .58 DAEB 21/04/2021 frmMain.frm added timer and vars to check to see if the system has just emerged from sleep
' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
' .60 DAEB 29/04/2021 frmMain.frm Improved the speed of the deletion of icons from the dictionary collections
' .61 DAEB 26/04/2021 frmMain.frm size modifier moved to the sequential bump animation
' .62 DAEB 29/04/2021 frmMain.frm Improved the speed of the addition of icons to the dictionary collections
' .63 DAEB 30/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
' .64 DAEB 30/04/2021 frmMain.frm Deleted the temporary collection, now unused.
' .65 DAEB 30/04/2021 frmMain.frm Added mouseDown event to capture the time of first press and code to simulate a drag and drop of an icon from the dock
' .66 DAEB 01/05/2021 frmMain.frm huge number of changes as I moved multiple declarations, subs and functions to mdlmain from frmMain.
' .67 DAEB 01/05/2021 frmMain.frm Added creation of Windows in the states as provided by sShowCmd value in RD.
' .68 DAEB 05/05/2021 frmMain.frm Cause the docksettings utility to reopen if it has already been initiated.
' .69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position.
' .70 DAEB 06/05/2021 frmMain.frm Removed all references to Clng() in all the occurrences of updateDisplayFromDictionary to speed up animation, no references in the code will be found
' .71 DAEB 06/05/2021 frmMain.frm Changed bounceIndex to selectedIconIndex throughput the code, no references in the code will be found
' .72 DAEB 06/05/2021 frmMain.frm Created two timers that controls the bouncing when the icon is clicked, replacing the old timers
' .73 DAEB 11/05/2021 frmMain.frm sngBottom renamed to screenHorizontalEdge
' .74 DAEB 12/05/2021 frmMain.frm Displays a smaller size icon at the cursor position when a drag from the dock is underway.
' .75 DAEB 12/05/2021 frmMain.frm Changed Form_MouseMove to act as the correct event to a drag and drop operating from the dock
' .76 DAEB 20/05/2021 frmMain.frm Moved from the runtimer as some of the data is required before the run begins
' .77 DAEB 20/05/2021 frmMain.frm Added new check box to allow a quick launch of the chosen app
' .78 DAEB 21/05/2021 frmMain.frm Added new field for second program to be run
' .79 DAEB 21/05/2021 frmMain.frm Disable any active bounce
' .80 DAEB 28/05/2021 frmMain.frm Keep the animateTimer and therefore the bounceTimers operating in order to run the chosen app.
' .81 DAEB 28/05/2021 frmMain.frm Refresh the running process with a cog when the process is running, this had been removed earlier
' .82 DAEB 12/07/2021 frmMain.frm Add the BounceZone as a configurable variable.
' .83 DAEB 14/07/2021 frmMain.frm Modified the BounceZone and bouncetimers to run 50% slower.

' Changes 2022
' ============

' .84 DAEB 20/07/2021 frmMain.frm Added prevention of the dock returning until the hiding application is no longer running.
' .85 DAEB 16/04/2022 frmMain.frm Added new timer to allow auto-reveal of the dock once the chosen app has closed within 1.5 secs
' .86 DAEB 08/12/2022 frmMain.frm Added new timer to inspect each target command in turn and highlight if missing.
' .87 DAEB 08/12/2022 frmMain.frm Target command validity flag places a red X on the icon
' .88 DAEB 08/12/2022 frmMain.frm Array for storing the state of the target command
' .89 DAEB 08/12/2022 frmMain.frm Fixed duplicate run of .msc files.
' .90 DAEB 08/12/2022 frmMain.frm Added routine to check for an array that has already been initialised
' .91 DAEB 08/12/2022 frmMain.frm SteamyDock responds to %systemroot% environment variables during runCommand
'   Add a sound ting option when initiating a dock click
'   The menu separators should call the utilities immediately below
'   remove all references to rocketdock
'   remove all references to the rdSettings file should no longer refer to these using only docksettings.ini
' In all functions/subroutines in the dock form module - all vars initialised - done
' In all functions/subroutines in the dock form module - all parameters to be determined as bval or byref - done
' deleting multiple instances of a program, if multiple instances exist then it should pop up a modal box that
'  requests confirmation of each process to kill.
' delay on triggering the second app - implemented
' add comment - selected index is 999 - indicating that we do not want to store the second app as a cogged item in this apps stored binary location...
' common module - all vars initialised - done
' common module - all parameters to be determined as bval or byref - done
' override on opening the running application for individual applications in runCommand.
' validation of tool components - missing folders and essential files
' common2 module - all vars to be initialised
' common3 module - all vars to be initialised
' common2 module - all parameters to be determined as bval or byref
' sequentialBubbleAnimation - rewritten to simplify and create shared code
' drawDockByCursorEntryPosition - rewritten to simplify and use shared code from the main animation routine
' drawSmallStaticIcons - rewritten to use shared code from the main animation routine
' if the icon is dragged within the dock or back to the dock then show the busytimer and the red background on the target icon.
' Quick launch of an app should mean instant. Not an incomplete partial bounce - DONE. Instant launch and subsequent bounce would require a state monitor - so NO.
' Fixed bug causing ghosting, after several minutes
' Added GDI ready and tidying within each animation to ensure no dropping of handles.
' Added logic to only call the three current animation types when the bubble animation is selected
' Prevented the general hang when SD was closed using the Quit command (unloading all forms in a loop).
' common3 module - byval/byref
' Fixed the slow update of the dock after deletion by creating an array and monitoring the icon to be shown.
' Fixed the slow update of the dock after adding an icon by creating an array and monitoring the icon to be shown.
' Fixed the slow update of the dock after re-ordering of the icons as it uses adding/deletion by default.
' Add the steamy dock project to Github.
' Fixed the ArrayUpperBound variables to prevent array errors.
' Fixed the dragIcon to correspond to the latest use of the dictionaryArray, extract the correct image to drag.
' sShowCmd coerced into an integer causing problem on new folder icon bypassing strong typing, added a val().
' When doing a process kill for an application that has been brought to the front, the msgbox is underneath, dock/msgbox now to the front.
' Created setWindowZorder subroutine and added it to each iconise type.

' Changes 2023
' ============

' Added sDisabled option in settings.ini for all icons
' Added right click code to test for opacity and set the menu options, caption and check state. runCommand modified to exit when disabled.
' Created new duplicate routines to checkAndKill processes whilst bringing windows to front/back specifically for SD, non-shared.
' Created a reboot icon and modified the code to use that as default image.
' Created a menu option and utility to kill and restart steamydock - required to operate under the SD menu.
' Added disable icon option.
' Added change of the opacity of the disabled icons on startup.
' Second application to read setting to determine running it beforehand or afterward.
' Application to automatically terminate, capability added.
' Test on E5400 - done, runs beautifully!
' changed logout add icon option to lock workstation
' created new logout add icon option with shutdown /l
' created new logout icons x 2
' added administrative sub menu options with associated icons, one new.
' fixed the missing last icon after an icon deletion.
' fixed the missing last icon after an icon addition.
' The dock notes if the screen resolution has changed and restarts.
' fixed the runCommand function, when split into subroutines, will no longer re-open apps currently running.
' added support for running cpl files
' the icon settings tool only starts after a new icon addition and not for an icon clone
' checks to see whether iconSettings is running already and starts it only when not running
' write the last icon changed to the settings file, this will allow the icon settings tool to refresh after reading the current icon
' making all the recent functions work at the top of the screen as well as the bottom, specifically, background theme, cog, slideout/in
' improved some of the variable names and changed some subroutines to functions as they return values.
' disable Icon - change opacity dynamically
' Reviewed use of "run as" - certain it isn't being over-used
' add menu options to run specific apps elevated using "run as"
' dock click - replaces the current icon with a blank icon for a discrete 100ms or so, via a timer that changes the file reference to blank.png
' If IsUserAnAdmin() = 0 then try to kill the detached process - does that work? Yes.
' do not restart the dock on resolution change when the dock has been deliberately hidden, preventing SD restarting during a game.
' runCommand now loops through executable file names (bat, cpl, msc, exe and lnk) for commands without suffixes in windows\system32 - eg. control
' fixed failure to clear all icon params when copying another icon, a new icon was picking up secondAppToRun from neighbour.
' run as admin menu option - only for binaries
' catch the click-throughs on transparent parts of the form, create a new blank square PNG and show that at 1% opacity, size it correctly as per the large icon.
' added new icons - reboot, logout, disc management
' The dock background on wide docks or high DPI screens, loading the scaled image to dictionary failed when the image needed to be stretched beyong 2000 pixels.
' The dock width was incorrect for the small icons as the calculation was only for the larger icons within a wider dock, fixed.
' When adding a new program to the dock using add DLL/exe, the name should be the exe name extracted from the path
' dock_OLEDragDrop to be updated to match the RDiconSettings code improvements.
' RDiconSettings test run should match the improvements now in SteamyDock, split exe,bat,cpl &c
' When you delete an icon, the transparency array is not currently updated so the wrong icon is left transparent after deletion - FIXED.
' When you add an icon, the transparency array is not currently updated so the wrong icon is left transparent after the addition - FIXED.
' made some fixes to SD to cater for retaining the other semi-opaque icons in the list when deleting and adding icons elsewhere.
' Messagebox msgBoxA module as per iconSettings - ship the code to FCW to replace the native msgboxes for deletion
' Replaced several of the modal msgbox pop ups with non-modal msgboxA types where applicable - and tested
' Replaced several of the non-modal messagebox API pop ups with non-modal msgboxA types where applicable - and tested
' msgboxA Added icon image reveals to each of the possible button types currently not showing anything.
' Adding a cog above a running folder window for explorer.exe. New timers for newly initiated explorers and regular checking.
' Tuned the checkExplorerRunning process to prevent it running for every icon entry. Now runs just once and compares the sCommandArray.
' test to see if we can use checkTargetCommandValidity to add targets that are folders to the known folder array, no need.
' Dock settings must NOT restart the dock as admin.
' Document the explorer cog stuff in the html, explain that the window cannot be enumerated until it displays on screen.
' Closing Explorer windows from the dock - https://www.vbforums.com/showthread.php?898235-VB6-twinBASIC-Code-snippet-Close-Explorer-window-by-path
' Menus altered to remove the send to front/back and the open new instance, not possible with Explorer Windows
' Menus altered to remove the run elevated option, not possible with Explorer Windows.
' run new instance of this app is suppressed

' Current Task:
' =============

' blinked-out icon when right clicking.

' Current Bugs and Regressions
' ============================

' SERIOUS: occasionally, when starting iconSettings, explorer dies taking all programs with it, incl systray apps. This occurred since we added the explorer cog testing code from Faf.
'   check it is not something to do with iconSettings needing admin rights - it shouldn't but it might.

' When animating, the boundary between the two main icons is jittery
'    is that because we set the limits of the left hand icon before we set the limits of the main icon causing overlap?
'    the two are sized one following on from the other but we have to ensure the boundary of the left hand icon is not overlapping the main icon
'     we can only do that if we only set the left hand icon's boundaries when we know the exact extent of the main icon's boundaries.
'     at the moment we are setting the leftmost position of each icon at the end of the animation with no checks.
'     The checks only need to be carried out for the main animated icons.
'     might be as simple as checking that the icon leftpos plus width does not extend beyond main icon left pos.
'     This will be fixed by using a new method of animating the dock.

' Main Tasks:  ' see the separate bug/task list provided by vBAdvance
' ============

'     1. icon temporarily grows too big when dock approached from the right
'     2. Graphics Next Technology Cairo/RC5 - WIP - testing in the Pz Earth widget
'     3. Add known identifers to the known apps list - WIP
'     4. dockSettings, regular process check reduce to 5 secs minimum.
'     5. adding the autoscaling feature on the two utilities as per generate utility
'     6. creating new icons WIP
'     8.
'     9. Animating more than just the three icons - WIP
'    10. Dock entering and leaving RIGHT/LEFT - see below.
'    11. DPIawareness in the manifest - research
'    12. WIP - Working on extracting icons using privateExtractIcon and writing them to a byte array using X3iconParser.
'    13. Running on a second monitor
'    14. Graphics Next Technology D2D

' Detail of General Status
' ========================

' pushing the Windows taskbar to the top programatically a registry change then a restart of explorer.

' Creation of a default DockSettings.ini for a new user of the dock where the application has never been run before.
'
'  How to create a desktop shortcut with a good quality icon.
'  icons - add icon references to the resource file and code to show on the forms themselves.
'   http://www.vbaccelerator.com/home/VB/Tips/Setting_the_App_Icon_Correctly/article.asp
'
' the docksettings tool should have some separate code that allows migration from RD to SD but the rest should use SdSettings
'
' reorganise windows menu option? send all windows to front/back
'
' finish the icons
    ' droptypes to deal with by having an associated document

    ' installation packages

    '.xpi done
    '.xar
    '.bz2
'    .bak
'    .bck
'    .pup
'    .bkp

'    .7z
'    .zl
'    .s7z
'    .sfx
'    .arc
'    .ace
'    .ufs

'    .xz
'    .gz
'    .lz

' parcel with a zip in it
'    .bzip2
'    .gzip
'    .zipx

'    .lzx
'    .lzm
'    .mint
'
' look at the custom icon tool and see which you need to recreate WIP
' modify the zipfile icons to the correct type above
' create a zipped icon

' Animating more than three icons
' ================================
' showing more than three icons in the current BUMP animation - it is possible.
' Currently the left and right icons are modified in proportion to the cursor position across a fixed length, ie. the main icon.
' from 0-100% over the small icon size.
' for two additional icons on the left/right we need extend the proportion over the two icons
' ie. 0-100% over the two icons rather than the one.
'
    
' SD will not support Zoom: Flat as it is a rubbish animation - documentation updated

' The current dock stores only the left hand position of each icon and as such advanced animation cannot take place due to
' that limitation. The icons to the left and right, their size is a proportion of how far the cursor is across the central icon.
'
' No advanced animation can be performed as the properties of each icon are not known so we cannot currently transform them.
' When we store the left hand position of the icon, we have also started to gather the icon's right hand location
' iconStoreRightPixels. So, we are already holding two x values, left and right, we now need only to store the Y values,
' top and bottom. Storage for those have been added but we still need to populate those values during the icon drawing
' routines:

    ' drawSmallStaticIcons - quick and simple routine using little cpu that keeps the dock on screen in small mode at a reduced interval
    ' drawDockByCursorEntryPosition - calculates and draws ONCE using the initial dock position from the cursor entry point
    ' sequentialBubbleAnimation - performs the regular animation of the central three icons.
'
'When you enter an icon in Rocketdock it is not full size, it does not grow to full size until the middle of the icon is reached.
'This is unlike SD that makes sure that the centre icon is full size so that when you traverse across it you have
'a fixed size icon to use to calculate the distance across the central icon.
'
'When you scroll further across the icon mid-point it then starts to decrease in size.
'
' This implies that RD is calculating from the icon's left hand size to the middle 0-100% to determine the icon sizes and not calculating across one icon's width as SD is currently doing.





' Running on a second monitor
' ============================

' obtain virtual size - we already have code to do this that can determine the 2nd monitor location

' You'll have to use Windows API to determine the virtual screen size for a multi-monitor setup:
'
    'Private Const SM_CXVIRTUALSCREEN = 78
    'Private Const SM_CYVIRTUALSCREEN = 79
    'Private Const SM_CMONITORS = 80
    'Private Const SM_SAMEDISPLAYFORMAT = 81
    '
    'Private Declare Function GetSystemMetrics Lib "user32" ( _
    '   ByVal nIndex As Long) As Long
    '
    'Public Property Get VirtualScreenWidth() As Long
    '   VirtualScreenWidth = GetSystemMetrics(SM_CXVIRTUALSCREEN)
    'End Property
    'Public Property Get VirtualScreenHeight() As Long
    '   VirtualScreenHeight = GetSystemMetrics(SM_CYVIRTUALSCREEN)
    'End Property
    'Public Property Get DisplayMonitorCount() As Long
    '   DisplayMonitorCount = GetSystemMetrics(SM_CMONITORS)
    'End Property
    'Public Property Get AllMonitorsSame() As Long
    '   AllMonitorsSame = GetSystemMetrics(SM_SAMEDISPLAYFORMAT)
    'End Property


    ' the form needs to fill the whole virtual screen area, currently it is only filling the default form...

    ' monitors have different twip per pixel ratios and that has to be taken into account, we have a tool for that
    ' screen.twipsperpixel X & Y have been modified
    ' the monitors run in a square virtual screen and you can position the monitors within that virtual space
    ' the current monitor is determined by where you are in that virtual space
    ' if the monitor number two is set then we use the left hand position of that monitor as the left start point for the dock
    ' we determine the bounds of monitor 0? x = -1024
    ' then see if the monitor is set to 1
    ' it may affect the other two tools in the way they deal with positioning certain elements - need to test that

    ' tested placing the dock using absolute positioning and it will not display on the second monitor so GDI+ is not using the virtual screen for multiple monitors
    ' some research shows C++ code that tells me to enumerate the monitos and get the device context for each and then supply that to GDI+ initialisation
    ' routine that sets the device context. I think I can do that.
    
    ' GDI+ is still not placing the output on the second monitor, send a forum post after contacting Olaf.
    ' the dock positioning occurs during setWindowCharacteristics the setWindowsPos call puts it at 0,0 as well as layering it
    ' when it was moved the dock is cut off at the edge of the window. We need to see the dock on the next monitor
    ' when a change is made then the mouse positioning needs to be moved by the same amount as it is specifying the wrong icon.
    ' consider extending GDI to cover the whole virtual screen.
    
    ' it might be useful to make the dock slightly visible so we can see where it is, the method is on the net.
    
    ' NOTE: Should simply use absolute co-ords, anything that deviates from the current monitor has a co-ord from - to +



' GDI
' ===

' encapsulate an icon as an object using classes
' create a class, for type icon
' assign it properties left, top, width, height, opacity


' Advanced animations
' ===================

' All the advanced animation improvements will require me to create icon objects

' Timers - In VB6 you cannot obtain a 1 millisecond timer. The clock resolution on Windows is not high enough.
' By default it increments 64 times per second. The smallest interval you can get is therefore 16 milliseconds.

' Look at the Russian's game to see how he achieves the animations, most likely he has a graphics library... he uses
' GDI+ for reading and saving PNGs, nothing more, all the rest is D3D.

' Look at Baka's GDI+ offerings
'


' TOP TIP: avoid strings in the animation routines - integers are quicker
' TOP TIP: avoid public routines in the animation routines - private are quicker

' Dock entering
' ==============
' entering the dock at the right hand side & leaving the dock from the left hand side
' cannot use existing animations because the resizing of the main object interferes with the core animation and it goes haywire.

' animating the entry of the cursor into the dock from the top
    ' the timer modifies a grow value by incrementing a value
    ' this value is subtracted from the maxbyte value in the bump animations
    ' until the value reaches the maximum maxbyte value when the timer is stopped
    ' this will cause the icon size of the current icon to grow and not just appear instantly
    ' the same growth value will be applied to the icons to two the left and right
    ' probably as a percentage of growth
    ' we should modify dynamicSizeModifierPxls for this to work using the current animateTimer
    ' the concept is that the animate timer is animating according to the horizontal diffference using dynamicSizeModifierPxls
    ' so it should be able to animate the vertical aspect too, all we need to do is to increase dynamicSizeModifierPxls
    ' rocketdock only grows the selected icon when when the small icons have been entered

' we can use a new animation that grows the center icons and when complete calls the main animation afterwards and lets that take over afterwards
' use a separate animation to pull the dock up, when it is done, hand over to the main routine.

' adding a blank icon to the existing dock works as a temporary workaround
' create a timer, when you leave the dock it animates the first dock downward, same with end.

' when bouncing should take into account the time in ms and not just the speed of the cpu to accomplish the bounce.
'
' dock icon bounce new animation height, tweak and the timer interval too

' An animation could be added to the addition of an icon.

' An animation could be added to the deletion of an icon.

' When icon clicked and bouncing the dock should not animate when moving the cursor left/right - option to lock? - WIP when the animation is
'   re-jigged and rewritten.

' the bounce animation is much slower in Rocketdock


' Drag and drop
' ==============
' Drag and drop needs prettying, a gap
' when the dragged item leaves the dock area it should leave an empty place in the dock from whence it came
' when the dragged item leaves the dock area the animation timer needs to continue but the dock itself should return to small state
' when an icon is dragged to the dock it should open up
' speeding up drag and drop - It could also be that the writing of the data has been moved to the quit command in RD. To speed up the drag and drop I could set a flag and then
' move the saving of the data to a timer driven by that flag. Check other timers are operating.

' when dragging from the dock the main icons should not animate when dragging - option to lock? - WIP when the animation is
' a separate animation?
'   re-jigged and rewritten.
'   use smallicon sub?


' Graphics Next Technology
' ========================
' Avant manager - test the animation routine for the dock, circledock might be worth looking

' A next step is to convert the dock to direct2D for GPU accceleration.

' Tutorial
' https://www.gamedev.net/tutorials/programming/graphics/directx-graphics-for-visual-basic-part-1-r1308/
' https://www.vbforums.com/showthread.php?891874-VB6-Directx8-Question-DirectX-gives-EXCLUSIVE-screen-access&highlight=

' Direct3D dock - we have the code already and a sample dock to use a crib. The dock however has a
' black background, supposedly that is perfectly normal as D3D is meant to run on a canvas and not
' meant to run in a transparent context. A workaround is to render the image onto a context then use updateLayeredWindow on a transparent form
' just as done with GDI+.

' Note: Attempting to make the background form transparent as we do with GDI+ does not work.

' Direct 2D Jacob Roman's training utilities to implement 2D graphics in place of GDI+
' Direct2D is GPU enabled

'    create layered window (link, link)
'    draw the scene to texture
'    copy this texture to window contents (via UpdateLayeredWindow function)

'Direct2D is an ActiveX object that can draw to an HWND or to an HDC. For this to work, the steps are:
'
'    Instantiate an ID2D1Factory by creating D2D1CreateFactory() from D2D1.DLL (I suggest you link to this dynamically using LoadLibrary/GetProcAddress so your code runs in any Windows version).
'    Call ID2D1Factory :: CreateHwndRenderTarget() to target an HWND, or call ID2D1Factory :: CreateDCRenderTarget() to target an HDC.
'    Use the returned ID2D1RenderTarget interface to draw:
'        Call ID2D1RenderTarget::BeginDraw()
'        Draw stuff
'        Call ID2D1RenderTarget::EndDraw()
'Then you should create a texture, lock it in the memory, copy the pixels data there and unlock texture (look the sources where i use textures).
'For rendering on a form, you need to create a quad that represents the rendering surface. Then you need specify the texture coordinates to the quad's vertex (look text rendering source).
'Cls - it just Clear method of IDirect3DDevice9 interface.

' https://copyprogramming.com/howto/how-do-you-use-direct2d-to-render-cleartype-text-on-a-transparent-background#transparent-window-using-direct2d
' https://www.unknowncheats.me/forum/programming-for-beginners/126003-transparent-overlay-direct2d.html

' We have an example of the D3D dock in DirectX8 which uses SetLayeredWindowAttributes to retrieve the opacity
' and transparency color key of a layered window.

' A layered window is created by specifying WS_EX_LAYERED when creating the window with the CreateWindowEx function or by setting WS_EX_LAYERED via SetWindowLong after the window has been created.
'
'
' public const int GWL_EXSTYLE = -20;
'    public const int WS_EX_LAYERED = 0x80000;
'    public const int LWA_ALPHA = 0x2;
'    public const int LWA_COLORKEY = 0x1;
'
'    //set the window style to alpha appearance
'    private void button4_Click(object sender, EventArgs e)
'    {
'        SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) ^ WS_EX_LAYERED);
'        SetLayeredWindowAttributes(Handle, 0, 128, LWA_ALPHA);
'    }
'
'Alternative Managed API:
'
'If you just want to change the transparency of a Form you own, then use the Opacity property.
'Sample PB Code:
'
'  // Tip submitted by Olivier Citeau (ociteau@yahoo.fr)
'  // Combined it with the numeric module from Simon Harris (simon@addease.com.au)
'  // As found on the PBDR.com website
'
'  //Open event of your window
'  Constant long LWA_COLORKEY = 1, LWA_ALPHA = 2
'  Constant long GWL_EXSTYLE = - 20
'  Constant long WS_EX_LAYERED = 524288 //2^19
'  Long ll_Ret, ll_handle
'
'  n_cst_numerical lnc_N
'
'  // Set the window style to 'Layered'
'  ll_handle = handle(this)
'  ll_Ret = GetWindowLong(ll_handle, GWL_EXSTYLE)
'
'  //ll_Ret = ll_Ret Or WS_EX_LAYERED
'  ll_Ret = lnc_N.of_bitwiseor(ll_Ret, WS_EX_LAYERED)
'
'  SetWindowLong (ll_handle, GWL_EXSTYLE, ll_Ret)
'
'  // Set the opacity of the layered window to 128
'  SetLayeredWindowAttributes (ll_handle, 0, char(128),LWA_ALPHA)
'
'  //Note that if you set opacity to 0, your window will be
'  //invisible. With 255, it will be a "normal" window.

' GDI+ 75% useful for SteamyDock Future
' =====
' It is quick and requires nothing more than an imagelist, some PNGs and an array of y locations. Requires significant enhancement for complex animations,
' that will require the code to be written. The main icons will need properties and encapsulisation - see RC5 as an example. Only the main icons
' require this.


' Cairo and RC5 - 75% useful for SteamyDock Future
' ==============
' Cairo will provide an open source replacement for vector graphics, Cairo is still cpu-bound and will require translation
' of the graphics created using Cairo to open GL in order to use the GPU. No GPU usage. Cairo is probably not a good solution for replacing GDI+ in this
' whole program as it is CPU bound and RC5 adds a lot more steps and therefore a lot more CPU usage.

' Each icon image would comprise a 'widget' that would display an image from an imagelist. The icons can have transparency and that allows
' click-through to the desktop but not click through to an other widget when overlapped (if that ever occurred). The overhead for each icon
' would be considerable if we did each and every one, so we would 'widgetise' only the main 3-5 animated icons. The imagelist we currently
' use might need to be supplemented by the RC5 imagelist. Possibly we might need to replace the scripting dictionary altogether with
' Olaf's RC imagelist. The RC5 icons would provide a click event to replace the current hit location compare and click, so that a new property
' might possibly have to be added to handle that. Some thinking there. The right click event will also need to be handled differently.

' The smaller icons are being handled very efficiently at the moment using just GDI+ and an array location to position each, so it makes zero
' sense to replace each of the smaller icons with a RC5 widget. However, RC6 Cairo will have complex animation available for the central animated widgets.
' so it seems like a good idea. Note that this combination does not bode well for portability, a mix of GDI+ and Cairo as GDI+ will never be multi platform.

' In addition, Olaf is supposedly working on implementing the same advances that are occurring within pyCairo where some of the work is handed over to D3D or OpenGL
 
 
 
' Extracting embedded icons from DLLs and EXEs
' ==============================================

' Status - Working on extracting icons using privateExtractIcon and writing them to a byte array using X3iconParser
'
' See the GDI+Icons note in Cintanotes


'
' Other
' ======
'
' test running with a blank tool settings file
'
' test running with a blank dock settings file

' code signing certificate

' multi threading using TwinBasic/RadBasic some of what RD achieves may be to do with multi-threading, being able to perform
' two tasks concurrently without any delay apparent to the user. In VB6 mode can we farm any task to another thread?
'
' Build the setup2go binary for SD and the sub-components

' We need to selectively add tops and tails to all recently created routines and take into account the potential effect on any animations
    
' rubberduck, tidy the API declarations and global vars, document each and every

' mdlSdMain - tidy declarations and initialisation, provide error trapping
    
    
'========================================================================================================
' SteamyDock
'
' A VB6 GDI+ dock for Reactos, XP, Win7, 8 and 10.
' SteamyDock is a functional reproduction of the dock we all know and love - Rocketdock for Windows from Punklabs.
'
' Built using: VB6, MZ-TOOLS 3.0, VBAdvance, CodeHelp Core IDE Extender Framework 2.2 & Rubberduck 2.4.1
'
'           MZ-TOOLS https://www.mztools.com/
'           CodeHelp http://www.planetsourcecode.com/vb/scripts/ShowCode.asp?txtCodeId=62468&lngWId=1
'           Rubberduck http://rubberduckvba.com/
'           Rocketdock https://punklabs.com/
'           Registry code ALLAPI.COM
'           La Volpe  http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=67466&lngWId=1
'           PrivateExtractIcons code http://www.activevb.de/rubriken/
'           Persistent debug code http://www.vbforums.com/member.php?234143-Elroy
'           Open File common dialog code without dependent OCX - http://forums.codeguru.com/member.php?92278-rxbagain
'           VBAdvance
'           Fafalone for the enumerate Explorer windows code
'
'   Tested on :
'           ReactOS 0.4.14 32bit on virtualBox
'           Windows 7 Professional 32bit on Intel
'           Windows 7 Ultimate 64bit on Intel
'           Windows 7 Professional 64bit on Intel
'           Windows XP SP3 32bit on Intel
'           Windows 10 Home 64bit on Intel
'           Windows 10 Home 64bit on AMD
'           Windows 11 64bit on Intel
'
' Dependencies:
'           GDI+
'           A windows-alike o/s such as Windows 7-11 or ReactOS
'           OLEEXP.TLB placed in sysWoW64 - required to obtain the explorer paths only during development.
'
'
' Project References:
'           VisualBasic for Applications
'           VisualBasic Runtime Objects and Procedures
'           VisualBasic Objects and Procedures
'           OLE Automation - drag and drop
'           Microsoft Shell Controls and Automation
'           Microsoft scripting runtime - for the scripting dictionary usage
'           OLEEXP Modern Shell Interfaces for VB6, v5.1
'
'
'========================================================================================================
'
' Credits
'
' I have really tried to maintain the credits as the project has progressed. If I have made a mistake and left someone out then
' do forgive me. I will make amends if anyone points out my mistake in leaving someone out.
'
' Peacemaker2000    Original idea for a GDI+ dock came from here:
' http://www.planetsourcecode.com/vb/scripts/ShowCode.asp?txtCodeId=55352&lngWId=1&fbclid=IwAR2FeR12CdaxyOoY-muw-b6_oDW-_19oLrt8syEL6BQSX4PMEfHyWpfqpzM
'
' Olaf Schmidt    - used some of Olaf's code as examples of how to implement the handling of images using GDI+
'                   and specifically used two routines, createScaledImg & ReadBytesFromFile.
'
'                   Also critically, the idea of using the scripting dictionary as a repository for a collection of
'                   image bitmaps.
'
'                   In addition, the easeing functions to do the bounce animation, I initially used a converted .js
'                   implementation but Olaf's was better.
'
' Spider Harper     Is64bit() function.
'
' Wayne Phillips    Used a heavily modified version of his code to bring an external application window to the foreground
' https://www.everythingaccess.com/tutorials.asp?ID=Bring-an-external-application-window-to-the-foreground
'
' www.thescarms.com Provided the code to enumerate through windows using a callback routine
'
' dee-u Candon City, Ilocos   Used a modified version of his code to obtain a window handle from a PID.
' https://www.vbforums.com/showthread.php?561413-getting-hwnd-from-process
'
' Shuja Ali @ codeguru for his settings.ini code.
'
' An unknown, untraceable source, possibly on MSN - for the KillApp code
'
' ALLAPI.COM        For the registry reading code.
'
' Elroy on VB forums for his Persistent debug window - no longer used but thanks anyway!
' http://www.vbforums.com/member.php?234143-Elroy
'
' Rxbagain on codeguru for his Open File common dialog code without a dependent OCX
' http://forums.codeguru.com/member.php?92278-rxbagain
'
' si_the_geek       for his special folder code
'
' Aaron Young       for his code for registering a keypress system wide
'
'                   Lots of GDI+ examples gleaned from here:
' http://read.pudn.com/downloads29/sourcecode/windows/control/93919/Use_GDI+_(1627568102003/frmMain.frm__.htm
'
' La Volpe          Routine to check return value from any GDI++ function

' Jacques Lebrun    Function to Provide resolution of shortcuts
' https://www.vbforums.com/showthread.php?445574-Reading-shortcut-information

' Fafalone for the enumerate Explorer windows code:
' https://www.vbforums.com/showthread.php?818959-VB6-Get-extended-details-about-Explorer-windows-by-getting-their-IFolderView

' Dragokas systray code
'
'
'========================================================================================================
'
' The core of this program are the routines from Olaf Schmidt that open the image files as an ADO stream of bytes and feed
' those into GDI+. These images are then converted to bitmaps and fed into dictionary objects for storage.
'
' NOTE - I do not suggest developing VB6 programs using Windows 11, it can be a painful experience. A modern Windows 7 system
' with an SSD and 16gb RAM is the perfect platform. Windows 10 can be made into a decent development platform but Win 11 is a pain.
' You may have to run VB6 elevated to avoid the annoying registry errors on startup. Disabling UAC allows you to compile directly to
' your app beneath the program files folder which otherwise Win 11 will prevent you from doing.
'
' NOTE - On the running steamydock binary, if set as compatibility mode and run as admin - causes problems on autostart on Win10, avoid that!
' Avoid setting any sort of compatibility mode - for example, when set as compatible for Win7 the dock was unable
' to obtain the processID from running binaries such as everything.exe, cpuid.exe - unless the dock ran in administrator mode. Just remove any compatibility settings
' and run without elevation.
'
' NOTE - Do not end this program within the IDE by RUN/END, do that a few times and GDI+ will consume all your memory until the IDE falls over. When this happens
' just close the IDE and re-open it. Instead, ALWAYS use the QUIT option on Steamydock's right click menu.
'
' NOTE - The keyboard capture for F11 key to hide the dock, is disabled during a debug run in the IDE.
'
' NOTE - Calls to subroutines are generally (not always) made using the obsolete CALL statement making them more obvious. I also work with
' other languages where the the use of brackets is required, it makes shifting from one language to another slightly less jarring.
' Functions are just referenced in the usual fashion, returning a value.
' Exception - Even though the GDI+ APIs are "Functions" they are run using the CALL statement. GDIP functions only return a zero or an error
' code whilst any returned pointers &c are provided as passed arguments and not as the function's return value. Having the call statement in
' place merely allows easy substitution for some error handling during debugging.

' Program Structure:
'
' There is a response timer and an animate timer.
' The responseTimer draws the small icons once and monitors the mouse position, the animateTimer runs at a high frequency and draws
' the whole dock multiple times per second providing the animation effect. The relationship of the timers is found in an Impress or Powerpoint type
' document in the documentation folder. There are several timers and they really control the operation of everything.
'
' Before those timers start, the program reads all the icon locations from the settings file and loads the icons into memory using a dictionary
' object to hold the data. The location of the objects is keyed. This occurs on startup. During runtime, the various images are
' recalled from memory and drawn to the screen using a for...loop.
'
' Only the central (n) icons are resized. This way CPU usage is minimised. Memory usage is also minimal but
' all the icons must be stored in memory so there is a natural overhead. The right-click menu sits upon an invisible form
' as GDI+ does not like a menu on the same form as the GDI+ graphics.

' All associated icon data is stored in temporary arrays so that it can be processed quickly. The program keeps track of dock-initiated processes using these arrays.

' For the background image, we do NOT retain skin compatibility with Rocketdock. This is due to Punklabs overly-complex use of GDI+ in
' RD to stretch and manipulate the single small theme image into something wider that fits the whole dock.
' Instead, we have two small right/left image and one centre image that is sized in Photoshop -
' to 2000px, then we crop the image to size as required using GDI+. This cropping occurs when the image is loaded into the dictionary
' rather than when it is displayed. As SD is FOSS, a future developer can implement Rocketdock's themeing if it is really required.
'
' The background form is transparent, the X,Y position of the mouse event, on a non-transparent part of the form (the icons),
' is captured using an API and compared to stored icon X locations to determine which icon is selected. Click-through on
' transparent parts of the icons are captured by drawing a 1% opacity background of a white square that is in itself 50% transparent.
'
'
' Running Processes:
'
' NOTE: Running processes have 'cogs'. A cog is placed above the icon triggered at process initiation.
' The continued presence of these cogs are determined using two timers, the first only analyses processes
' that have been initiated by the dock so that the running 'cog' can be quickly removed when the process ends
' (initiatedProcessTimer). The second timer loops through all processes to see which are active at any time,
' adding a cog above any icon that has a matching process name (processTimer). The isRunning function is used
' to achieve a match. There is a very similar procedure for determining running explorer windows, described next.
'
' With Explorer windows, we identify which of the icon entries is a folder, but only at runtime within runCommand.
' At that point we add the specific folder to an initiatedFolderArray and then immediately add a cog to the icon.
' A timer runs frequently and just loops through this array to monitor the state of recently initiated explorer
' instances so that the running 'cog' can be quickly removed when the Explorer window is closed, a separate timer
' loops less frequently through all open explorer windows and checks to see if any matching icon deserves a 'cog'.
' It will match CLSID entries too. It uses the enumerateExplorerWindows function to achieve a match.

' BUILD: The program runs without any Microsoft plugins.
' It requires a single typelib to be present. OLEEXP.TLB placed in sysWoW64 - required to obtain the explorer
' paths.

' oleexp.tlb should typically be located in SysWow64 (or System32 on a 32-bit Windows install). You can register it
' manually using regtlib.exe on Win 7-10 systems or the newer utility on Win 11.
'
' but it should be sufficient to let VB6 register it for you. When you first try to run or compile it will come up with the
' project references utility. Point OLEEXP to the correct location (SysWoW64). You should only have one copy installed.
' Only needed during development as the types are compiled in. Once your project is compiled, the TLB is no longer used.
' It does not need to be present on end user machines.

' Detail regarding data sources:
' C:\Users\<username>\AppData\Roaming\steamyDock\
'
' dockSettingsFile = sdAppPath & "\settings.ini" ' The dock 's settings file in user appdata
' toolSettingsFile = SpecialFolder_AppData & <utilityName> "\settings.ini" the tool's own settings file.
'
' docksettings.ini is partitioned as follows:
'
' [Software\SteamyDock\DockSettings] - the dockSettings tool writes here
' [Software\SteamyDock\IconSettings\Icons] - the iconSettings tool writes here
'
' re: toolSettingsFile - The utilities read their own config files for their own personal set up in their own folders in appdata
' Settings.ini, this is just for local settings that concern only the utility, look and feel, fonts &c
'
' eg.
' C:\Users\<username>\AppData\Roaming\dockSettings\settings.ini
'
' toolSettingsFile - Dock - the following items are currently inserted into the toolSettingsFile for the dockSettings utility
'
' [Software\SteamyDockSettings]
' defaultStrength = 400
' defaultStyle = False
' defaultFont=Centurion Light SF

' toolSettingsFile - Icons - the following items are currently inserted into the toolSettingsFile for the iconSettings utility

' [Software\SteamyDockSettings]
' defaultFolderNodeKey=C:\Program Files (x86)\SteamyDock\iconSettings\my collection ' this could be moved to the docksettings.ini later
' rdMapState = Visible ' as could this
' defaultSize = 8
' defaultStrength = False
' defaultStyle = False
' Quality = 1
' defaultFont=Centurion Light SF


'========================================================================================================
'
'    LICENCE AGREEMENTS:
'
'    Copyright � 2019 Dean Beedell
'
'    Using this program implies you have accepted the licence. The GPL licence applies to the code
'    this software Is provided 'as-is', without any express or implied warranty. In no event will the
'    author be held liable for any damages arising from the use of this software. Permission is granted to
'    anyone to use this software for any purpose, including commercial applications, and to alter it and
'    redistribute it freely, subject to the following restrictions:
'
'    1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
'    2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
'    3. This notice may not be removed or altered from any source distribution.
'
'    This program is free software; you can redistribute it and/or modify it under the terms of the
'    GNU General Public Licence as published by the Free Software Foundation; either version 2 of the
'    Licence, or (at your option) any later version.
'
'    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
'    even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
'    General Public Licence for more details.
'
'    You should have received a copy of the GNU General Public Licence along with this program; if not,
'    write to the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301
'    USA
'
'    If you use this software in any way whatsoever then that implies acceptance of the licence. If you
'    do not wish to comply with the licence terms then please remove the download, binary and source code
'    from your systems immediately.
'
'--------------------------------------------------------------------------------------------------------------


Option Explicit

Private Declare Function OLE_CLSIDFromString Lib "ole32" Alias "CLSIDFromString" (ByVal lpszProgID As Long, ByVal pCLSID As Long) As Long


Private Declare Function Ole_CreatePic Lib "olepro32" _
                Alias "OleCreatePictureIndirect" ( _
                ByRef lpPictDesc As PictDesc, _
                ByVal riid As Long, _
                ByVal fPictureOwnsHandle As Long, _
                ByRef iPic As IPicture) As Long
                
                ' API to determine whether the program is running with administrator rights
Private Declare Function IsUserAnAdmin Lib "Shell32" Alias "#680" () As Integer

Private Enum OLE_ERROR_CODES
    S_OK = 0
    E_NOINTERFACE = &H80004002
    E_POINTER = &H80004003
    E_FAIL = &H80004005
    E_UNEXPECTED = &H8000FFFF
    E_INVALIDARG = &H80070057
End Enum

' vars to obtain correct screen width (to correct VB6 bug) STARTS
Private Const HORZRES = 8
Private Const VERTRES = 10

'Private lngHeight As Long
'Private lngWidth As Long
Private lngCursor As Long
Private iconIndex As Single

Private dynamicSizeModifierPxls As Double
Private differenceFromLeftMostResizedIconPxls As Double
Private animateStep As Single
Private dockDrawingPositionPxls As Single
'Private dockTopPxls As Single '.nn
Private iconLeftmostPointPxls As Single
Private lngFont As Long
Private lngBrush As Long
Private lngFontFamily As Long
Private lngCurrentFont As Long
Private lngFormat As Long
Private iconHeightPxls As Single
'Private iconWidthPxls As Single
Private iconPosLeftPxls As Single
Private iconCurrentTopPxls As Single
Private iconCurrentBottomPxls As Single ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
Private screenHorizontalEdge As Single


Private bDrawn As Boolean
Private savApIMouseX As Long
Private savApIMouseY As Long

'general vars
Private normalDockWidthPxls As Long
Private expandedDockWidth As Long
Private leftIconSize As Long
Private dockJustEntered As Boolean
Private rdDefaultYPos As Integer
'Private saveStartLeftTwps As Long
Private saveStartLeftPxls As Long ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion



' bounce variables
Private sDBounceStep As Integer ' add to configuration later
Private sDBounceInterval As Integer
Private b1 As Double 'not all used yet
Private b2 As Double
Private B3 As Double
Private b4 As Double
Private b5 As Double
Private b6 As Double
Private b7 As Double
Private b8 As Double
Private b9 As Double
Private B0 As Double

' theme variables
Private rDThemeImage As String
Private rDThemeLeftMargin As Integer
Private rDThemeTopMargin  As Integer
Private rDThemeRightMargin  As Integer
Private rDThemeBottomMargin  As Integer
Private rDThemeOutsideLeftMargin  As Integer
Private rDThemeOutsideTopMargin  As Integer
Private rDThemeOutsideRightMargin  As Integer
Private rDThemeOutsideBottomMargin  As Integer

' Vars for

Private rDSeparatorImage As String
Private rDSeparatorTopMargin As Integer
Private rDSeparatorBottomMargin As Integer

Private xAxisModifier As Integer ' .57 DAEB 19/04/2021 frmMain.frm modifedAmountToSlide renamed to xAxisModifier for clarity's sake
Private yAxisModifier As Integer '.nn added for future Y axis animation
Private autoHideMode As String
Private autoSlideMode As String
Private dockSlidOut As Boolean
Private dockEntranceLocation As Integer
Private nMinuteExposeTimerCount As Integer

' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support
' .23 DAEB frmMain.frm 08/02/2021 Changed from an array to a single var
Private lHotKey As Long
Public lPressed As Long '.nn


Private dockZorder As String '.nn
' .58 DAEB 21/04/2021 frmMain.frm added timer and vars to check to see if the system has just emerged from sleep
Private strTimeThen As String

' .63 DAEB 29/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
Private hourglassimage As String
Private hourglassTimerCount As Integer

' .63 DAEB 29/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
Private Declare Function GetTickCount Lib "kernel32" () As Long
Private mouseDownTime As Long

' .84 DAEB 20/07/2021 frmMain.frm Added prevention of the dock returning until the hiding application is no longer running.
Private autoHideProcessName As String
Private soundtoplay As String
Private delayRunTimerCount As Integer
Private bumpFactor As Single
' We initialise all the above vars during the form_initialise phase
Private currentDockHeightPxls As Long

Private blankClickEvent As Boolean
Private lastPositionRelativeToDock As Boolean
Private outsideDock As Boolean
'Private iconGrowthModifier As Integer


Private Sub clickBlankTimer_Timer()
' In VB6 you cannot obtain a 1 millisecond timer. The clock resolution on Windows is not high enough.
' By default it increments 64 times per second. The smallest interval you can get is therefore 16 milliseconds.
    
    ' set the current icon key to that of the blank icon
    blankClickEvent = False
    clickBlankTimer.Enabled = False
End Sub

'---------------------------------------------------------------------------------------
' Procedure : clearAllMessageBoxes
' Author    : beededea
' Date      : 11/04/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub clearAllMessageBoxes()
    On Error GoTo clearAllMessageBoxes_Error

    SaveSetting App.EXEName, "Options", "Show message" & "dragAndDeleteThisIcon", 0
    SaveSetting App.EXEName, "Options", "Show message" & "deleteThisIcon", 0
    SaveSetting App.EXEName, "Options", "Show message" & "confirmEachKill", 0
    SaveSetting App.EXEName, "Options", "Show message" & "confirmEachKillPutWindowBehind", 0
    

    On Error GoTo 0
    Exit Sub

clearAllMessageBoxes_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure clearAllMessageBoxes of Form dock"
            Resume Next
          End If
    End With
    
End Sub

'---------------------------------------------------------------------------------------
' Procedure : explorerTimer_Timer
' Author    : beededea
' Date      : 10/04/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub explorerTimer_Timer()
    On Error GoTo explorerTimer_Timer_Error

    Call checkExplorerRunning

    On Error GoTo 0
    Exit Sub

explorerTimer_Timer_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure explorerTimer_Timer of Form dock"
            Resume Next
          End If
    End With
End Sub

'---------------------------------------------------------------------------------------
' Procedure : Form_Load
' Author    : beededea
' Date      : 30/01/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub Form_Load()

    ' .06 DAEB 03/03/2021 mdlMain.bas  removed the appSystrayTypes feature, no longer needed to access the systray apps
    ' .05 DAEB frmMain.frm 10/02/2021 changes to handle invisible windows that exist in the known apps systray list
    'appSystrayTypes = "GPU-Z|XWidget|Lasso|Open Hardware Monitor|CintaNotes" ' systray apps list, add to the list those apps you find that can be minimised to the systray
    
    '=========================================
    ' program starts!
    '=========================================
    
    ' comment the following function back in only when debugging
    On Error GoTo Form_Load_Error
    
    ' Clear all the message box "show again" entries in the registry
    Call clearAllMessageBoxes
    
    ' set some variable values ready for operation
    Call setSomeValues
    
    ' set debugging if required
    Call toggleDebugging
        
    ' write to the debuglog to log
    debugLog "*****************************"
    debugLog "% SteamyDock program started."
    debugLog "*****************************"
    
    ' checks whether the system is 32bit or 64bit
    sixtyFourBit = Is64bit()
    
    ' extracts all the known drive names using Windows APIs to a useful global var
    Call getAllDriveNames(sAllDrives)
        
    'if the process already exists then kill it
    Call testDockRunning
    
    ' check the state of the licence
    Call checkLicenceState
    
    ' check the Windows version
    Call testWindowsVersion(classicThemeCapable)
    
    ' turn off the option to run as administrator
    Call disableAdmin  ' .17 DAEB frmMain.frm 27/01/2021 Moved disabling admin to a separate routine

    ' we check to see if rocketdock is installed in order to know the location of the settings.ini file used by Rocketdock
    'Call checkRocketdockInstallation ' also sets rdAppPath
    
    ' check where steamyDock is installed, seems obvious but someone could be running the binary somewhere remote from its default location
    Call checkSteamyDockInstallation ' in any case it sets the sdPathPath

    ' validate all the components are in place for this program to run.
    If fValidateComponents = False Then
        ' at the moment if components are missing we do nothing, just let SD attempt to start,
    End If
    
    ' get the location of the dock's new settings file
    Call locateDockSettingsFile

    ' read the dock settings from INI or from registry
    Call readDockConfiguration
    
    ' set the hotkey toggle to the user's chosen function key
    Call setUserHotKey ' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support
    
    ' working here!
    ' no need to determine which monitor we should use, we know this from rdMonitor gleaned from readDockConfiguration above.
    ' monitor validation, despite the value set in config, we need to check again as a monitor may have been disconnected.
    If Val(rDMonitor) + 1 > GetMonitorCount Then
        rDMonitor = "0" 'validate
    End If
    
'    If Val(rDMonitor) > 0 Then
'        ' get screen bounds
'        ' position the dock onto the correct monitor using the current monitor left position plus 1
'        getDeviceHdc
'
'        ' set the device (screen) context default to primary monitor
'        If hdcScreen = 0 Then
            hdcScreen = Me.hdc
'        End If
'
'        'CenterFormOnMonitorTwo dock
'    End If
        
        
    ' check the selected monitor properties and determine the number of twips per pixel for this screen
    Call monitorProperties(dock)
    
    ' resolve VB6 sizing width bug
    Call resolveVB6SizeBug ' requires MonitorProperties to be in place above to assign a value to screenTwipsPerPixelY
    
    ' configuration private numeric vars that are easier to manipulate throughout the program than the string equivalents
    Call setLocalConfigurationVars
    
    ' get the location of the dock's theme settings file
    Call locateThemeSettingsFile
        
    ' read the background theme settings from INI
    Call readThemeConfiguration
    
    ' read the tool settings file and do some things for the first and only time
    Call readToolSettings ' program specific settings do not apply to the dock, left here just in case we need it
    
    ' Initialises GDI Plus
    Call initialiseGDIStartup
    
    ' Create the VB collection object where the image bitmaps will be stored
    Call createDictionaryObjects

    ' Resize data arrays and load the icon images into the collections
    Call prepareArraysAndCollections
    
    ' sets bmpInfo object to create a bitmap of the whole screen size and get a handle to the Device Context
    Call createGDIPlusElements
           
    ' briefly display the product splash screen if set to do so
    Call showSplashScreen ' has to be at the end of the start up as we need to read the config file but also so as to not cause a clear outline to appear where the splash screen should be
    
    'creates a bitmap section in memory that applications can write to directly
    If debugflg = 1 Then debugLog "% sub readyGDIPlus" ' the debug needs to be here
    Call readyGDIPlus
        
    ' set autohide characteristics, needs to be exactly here
    Call setAutoHide
    
    ' update the window with the appropriately sized and qualified image
    Call setWindowCharacteristics ' This is the function that actually changes the display, called by animate timers, must also be here
        
    ' set up the timers that check to see if each process is running
    Call setUpProcessTimers
    
    ' Checks each target command for validity and sets a flag in an array to place a red X on the icon.
    Call checkTargetCommandValidity
    
    ' set the sound selection for any mouse click
    Call setSounds
    
    'add to the initiated ProcessArray
    'Call checkDockProcessesRunning ' trigger a test of running processes in half a second
    'Call checkExplorerRunning
    
    debugLog "******************************"
    debugLog "% SteamyDock startup complete."
    debugLog "******************************"

    On Error GoTo 0
    Exit Sub

Form_Load_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_Load of Form dock"
            Resume Next
          End If
    End With
    
End Sub

'---------------------------------------------------------------------------------------
' Procedure : Form_MouseDown
' Author    : beededea
' Date      : 01/05/2021
' Purpose   : We handle the mouse events during mouseUp, we only set some states here
'---------------------------------------------------------------------------------------
'
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    On Error GoTo Form_MouseDown_Error
    
    ' cause the clicked icon to disappear for 20ms or less
    ' start a timer that runs and puts the current icon back to the correct filename when the timer ends, using an indicator flag
    blankClickEvent = True
    clickBlankTimer.Enabled = True
    
    ' .65 DAEB 30/04/2021 frmMain.frm Added mouseDown event to capture the time of first press and code to simulate a drag and drop of an icon from the dock
    dragFromDockOperating = False
    mouseDownTime = GetTickCount 'we do not use TimeValue(Now) as it does not count milliseconds
    
    ' .75 DAEB 12/05/2021 frmMain.frm Changed Form_MouseMove to act as the correct event to a drag and drop operating from the dock
    selectedIconIndex = iconIndex ' this is the icon we will be bouncing
    dragImageToDisplay = dictionaryLocationArray(selectedIconIndex) & "ResizedImg" & LTrim$(Str$(iconSizeLargePxls))
    
'    dock.animateTimer.Enabled = False
'    dock.responseTimer.Enabled = False

    On Error GoTo 0
    Exit Sub

Form_MouseDown_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_MouseDown of Form dock"
End Sub

' .75 DAEB 12/05/2021 frmMain.frm Changed Form_MouseMove to act as the correct event to measure a drag and drop operating from the dock
'---------------------------------------------------------------------------------------
' Procedure : Form_MouseMove
' Author    : beededea
' Date      : 12/05/2021
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim timeDiff As Long: timeDiff = 0
    Dim tickCount As Long: tickCount = 0
    
    On Error GoTo Form_MouseMove_Error

    If mouseDownTime = 0 Then Exit Sub

    ' calculates the time since the mouseDown and if no mouseup within 1/4 of a second assume it is a drag from the dock
    If mouseDownTime <> 0 Then ' time since the mouseDown event occurred
            tickCount = GetTickCount
            timeDiff = tickCount - mouseDownTime
            If Val(rDLockIcons) = 0 And timeDiff > 250 Then
                mouseDownTime = 0 ' reset
                dragFromDockOperating = True
                dragToDockOperating = True
                hourGlassTimer.Enabled = True
            End If
        End If

    On Error GoTo 0
    Exit Sub

Form_MouseMove_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_MouseMove of Form dock"

End Sub



'---------------------------------------------------------------------------------------
' Procedure : Form_Initialize
' Author    : beededea
' Date      : 28/03/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub Form_Initialize()
     Call initialiseGlobalVars ' we can call this routine from elsewhere whereas we can't easily call Form_Initialize during our program
End Sub
    

'---------------------------------------------------------------------------------------
' Procedure : initialiseGlobalVars
' Author    : beededea
' Date      : 23/04/2021
' Purpose   : All the form variable initialisation code moved to here so we can call this routine
'             from elsewhere whereas we can't call Form_Initialize directly
'---------------------------------------------------------------------------------------
'
Public Sub initialiseGlobalVars()

    On Error GoTo initialiseGlobalVars_Error
    
    ' theme variables
    rdThemeSkinFile = vbNullString
    rdThemeSeparatorFile = vbNullString
    validTheme = False
    dockHidden = False
    dockOpacity = 0
    rDThemeImage = vbNullString
    rDThemeLeftMargin = 0
    rDThemeTopMargin = 0
    rDThemeRightMargin = 0
    rDThemeBottomMargin = 0
    rDThemeOutsideLeftMargin = 0
    rDThemeOutsideTopMargin = 0
    rDThemeOutsideRightMargin = 0
    rDThemeOutsideBottomMargin = 0
    rDSeparatorImage = vbNullString
    rDSeparatorTopMargin = 0
    rDSeparatorBottomMargin = 0
    dockZorder = vbNullString '.nn
    
    ' other global variable assignments
    debugflg = 0
    screenWidthTwips = 0
    screenHeightTwips = 0
    screenWidthPixels = 0
    screenHeightPixels = 0
    inc = False
    fcount = 0
    rdIconMaximum = 0
    theCount = 0
    debugflg = 0
    readEmbeddedIcons = False
    hideDockForNMinutes = False
    forceRunNewAppFlag = False
    
    ' animation timers
    selectedIconIndex = 0 ' sets the icon to bounce index to something that will never occur
    bounceTimerRun = 0
    sDBounceStep = 0 ' we can add a slider for this in the dockSettings later
    sDBounceInterval = 0
    autoFadeOutTimerCount = 0
    autoFadeInTimerCount = 0 ' .01 DAEB 24/01/2021 Added new parameter autoFadeInTimerCount for the new fade in timer
    autoSlideOutTimerCount = 0 ' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions
    autoSlideInTimerCount = 0 ' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions
    autoHideRevealTimerCount = 0
    bounceTimerRun = 0
    animatedIconsRaised = False
    hourglassimage = vbNullString ' .63 DAEB 29/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
    hourglassTimerCount = 1
        
    ' bounce variables
    sDBounceStep = 0 ' add to configuration later
    sDBounceInterval = 0
    b1 = 0 'not all used yet
    b2 = 0
    B3 = 0
    b4 = 0
    b5 = 0
    b6 = 0
    b7 = 0
    b8 = 0
    b9 = 0
    B0 = 0
    
    'animation and positioning vars
    animationFlg = False
    animationFlg = False
    dragToDockOperating = False
    bDrawn = False
    savApIMouseX = 0
    savApIMouseY = 0
    bounceHeight = 0
    bounceCounter = 0
    bumpFactor = 0
    bounceZone = 0 ' .16 DAEB 12/07/2021 mdlMain.bas Add the BounceZone as a configurable variable.
    xAxisModifier = 0 ' .57 DAEB 19/04/2021 frmMain.frm modifedAmountToSlide renamed to xAxisModifier for clarity's sake
    yAxisModifier = 0 '.nn
    dynamicSizeModifierPxls = 0
    autoHideMode = ""
    autoSlideMode = vbNullString
    dockSlidOut = False
    animateStep = 0
    
    'animation and positioning vars
    iconHeightPxls = 0
    iconPosLeftPxls = 0
    iconCurrentTopPxls = 0
    iconCurrentBottomPxls = 0 ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
    screenHorizontalEdge = 0
    dockDrawingPositionPxls = 0
    iconLeftmostPointPxls = 0
    dockEntranceLocation = 0
    differenceFromLeftMostResizedIconPxls = 0
    normalDockWidthPxls = 0
    expandedDockWidth = 0
    leftIconSize = 0
    dockJustEntered = False
    rdDefaultYPos = 0
    saveStartLeftPxls = 0 ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    
    ' icon selection vars
    iconIndex = 0
    prevIconIndex = 0
    
    ' environment vars
    readEmbeddedIcons = False
    WindowsVer = vbNullString
    sixtyFourBit = False
    nMinuteExposeTimerCount = 0
    delayRunTimerCount = 0
    autoHideProcessName = vbNullString
    userLevel = vbNullString
    strTimeThen = vbNullString
    nMinuteExposeTimerCount = 0
    msgBoxOut = False
    msgLogOut = False
    lHotKey = 0
    lPressed = 0 '.nn
    mouseDownTime = 0
    soundtoplay = vbNullString
            
    lngCursor = 0
    lngFont = 0
    lngBrush = 0
    lngFontFamily = 0
    lngCurrentFont = 0
    lngFormat = 0
    
    currentDockHeightPxls = 0
    
    blankClickEvent = False
    lastPositionRelativeToDock = False
    outsideDock = False
    'iconGrowthModifier = 0

    On Error GoTo 0
    
    Exit Sub

initialiseGlobalVars_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure initialiseGlobalVars of Module mdlMain"
End Sub

    
' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support
'---------------------------------------------------------------------------------------
'Procedure:   setUserHotKey
'Author:      beededea
' Date      : 26/01/2021
' Purpose   : using the user's choice, set the default keypress to work system wide
'---------------------------------------------------------------------------------------
'
Private Sub setUserHotKey()
   On Error GoTo setUserHotKey_Error
   
    If debugflg = 1 Then debugLog "% sub setUserHotKey"

    ' check to see whether the program is running within the IDE - if so disable system key hooks that capture F key by default
    ' if the program is run in the IDE (Debug mode) with the system wide key hook operative, the IDE will crash shortly afterward
    If Not InIDE Then
        ' .23 DAEB frmMain.frm 08/02/2021 Changed from an array to a single var
        If rDHotKeyToggle = "F1" Then lHotKey = SetHotKey(0, vbKeyF1)
        If rDHotKeyToggle = "F2" Then lHotKey = SetHotKey(0, vbKeyF2)
        If rDHotKeyToggle = "F3" Then lHotKey = SetHotKey(0, vbKeyF3)
        If rDHotKeyToggle = "F4" Then lHotKey = SetHotKey(0, vbKeyF4)
        If rDHotKeyToggle = "F5" Then lHotKey = SetHotKey(0, vbKeyF5)
        If rDHotKeyToggle = "F6" Then lHotKey = SetHotKey(0, vbKeyF6)
        If rDHotKeyToggle = "F7" Then lHotKey = SetHotKey(0, vbKeyF7)
        If rDHotKeyToggle = "F8" Then lHotKey = SetHotKey(0, vbKeyF8)
        If rDHotKeyToggle = "F9" Then lHotKey = SetHotKey(0, vbKeyF9)
        If rDHotKeyToggle = "F10" Then lHotKey = SetHotKey(0, vbKeyF10)
        If rDHotKeyToggle = "F11" Then lHotKey = SetHotKey(0, vbKeyF11)
        If rDHotKeyToggle = "F12" Then lHotKey = SetHotKey(0, vbKeyF12)
        If rDHotKeyToggle = "Disabled" Then lHotKey = 0
    End If
   On Error GoTo 0
   Exit Sub

setUserHotKey_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure setUserHotKey of Form dock"
    End Sub
' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support

    

'---------------------------------------------------------------------------------------
' Procedure : showSplashScreen
' Author    : beededea
' Date      : 01/09/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub showSplashScreen()
   On Error GoTo showSplashScreen_Error
   
    If debugflg = 1 Then debugLog "% sub showSplashScreen"

    If sDSplashStatus = "1" Then
        splashForm.splashTimer.Enabled = True

        splashForm.Show
        splashForm.chkSplashDisable.Value = 0
    Else
        splashForm.Hide
    End If


   On Error GoTo 0
   Exit Sub

showSplashScreen_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure showSplashScreen of Form dock"

End Sub



'---------------------------------------------------------------------------------------
' Procedure : Form_MouseUp
' Author    : beededea
' Date      : 07/04/2020
' Purpose   : this is the equivalent of an icon MouseUp event, a click anywhere on the form
'---------------------------------------------------------------------------------------
'
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

   On Error GoTo Form_MouseUp_Error

    Call fMouseUp(Button) ' occasionally we want to be able to trigger this manually and you can't call a Form_MouseUp


   On Error GoTo 0
   Exit Sub

Form_MouseUp_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_MouseUp of Form dock"
End Sub

'---------------------------------------------------------------------------------------
' Procedure : fMouseUp
' Author    : beededea
' Date      : 11/04/2020
' Purpose   : you cannot directly call a form mouseUp event from anywhere else so this is the equivalent that is called by the
'             Form_MouseUp event and we can also call fMouseUp as and when we require.
'---------------------------------------------------------------------------------------
' the mouse up event handles the left button click event and the right click menu activation. It also identifies a drag to or
' from the dock. Identifying a drag from the dock cannot be done in a traditional manner as we are not dropping it onto
' any traditional VB6 control. So a drag over or drop can never be captured. Instead, if we measure the time between mousedown
' and mouse up then we have an indication of a drag from the dock in progress. A workaround.


Public Sub fMouseUp(Button As Integer)
   On Error GoTo fMouseUp_Error
   
    'Dim timeDiff As Integer:  timeDiff = 0
    'Dim tickCount As Long: tickCount = 0
    'Dim answer As VbMsgBoxResult: answer = vbNo
    Dim thisFilename As String: thisFilename = vbNullString
    Dim sourceIconIndex As Integer: sourceIconIndex = 0
    Dim targetIconIndex As Integer: targetIconIndex = 0
    Dim allowElevated As Boolean: allowElevated = False
    Dim suffix As String: suffix = vbNullString
            
    mouseDownTime = 0
    
    ' cause the clicked icon to disappear for 20ms or less
    ' start a timer that runs and puts the current icon back to the correct filename when the timer ends, using an indicator flag
'    blankClickEvent = True
'    clickBlankTimer.Enabled = True
    
    '.76 DAEB 12/05/2021 frmMain.frm Moved from the runtimer as some of the data is required before the run begins
    Call readIconSettingsIni("Software\SteamyDock\IconSettings\Icons", selectedIconIndex, dockSettingsFile)
    
    If dragToDockOperating = True Then
        hourGlassTimer.Enabled = False
        dragToDockOperating = False
    End If
    
    If Button = 2 Then 'right click to display a menu

        dragFromDockOperating = False
        
        If dragToDockOperating = True Then
            hourGlassTimer.Enabled = False ' .63 DAEB 29/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
        Else
            animateTimer.Enabled = False ' stops the animation
            responseTimer.Enabled = False ' stops the assessment of the mouse position
        End If
            
        If sDisabled <> "1" Then
            menuForm.mnuDisableIcon.Caption = "Disable This Icon"
            menuForm.mnuDisableIcon.Checked = False
        Else
            menuForm.mnuDisableIcon.Caption = "Re-enable This Icon"
            menuForm.mnuDisableIcon.Checked = True
        End If
        
        ' if the command does not have a suffix (folder) then do not allow it to run elevated
        suffix = LCase(ExtractSuffixWithDot(sCommand))
        If suffix = vbNullString Then ' NOTE: searching for a null string in any string returns a non-zero FOUND value! This handles it
            allowElevated = False
        Else
            If InStr(".exe|.bat|.msc|.cpl|.lnk", suffix) <> 0 Or InStr(sCommand, "::{") > 0 Then
                allowElevated = True
            Else
                allowElevated = False
            End If
        End If
              
        ' check the current process is running by looking into the array that contains a list of running processes using selectedIconIndex
        If processCheckArray(selectedIconIndex) = False And explorerCheckArray(selectedIconIndex) = False Then
            forceRunNewAppFlag = False

            menuForm.mnuCloseApp.Visible = False
            
            If sRunElevated = "1" And allowElevated = True Then
                menuForm.mnuRunApp.Visible = True
                menuForm.mnuRunApp.Caption = "Run this App (elevated)"
                menuForm.mnuAdmin.Visible = False
                menuForm.mnuRunNewApp.Visible = False
                menuForm.mnuRunNewAppAsAdmin.Visible = False
            Else
                menuForm.mnuRunApp.Visible = True
                menuForm.mnuRunApp.Caption = "Run this App"
                If allowElevated = True Then
                    menuForm.mnuAdmin.Visible = True
                Else
                    menuForm.mnuAdmin.Visible = False
                End If
                menuForm.mnuRunNewApp.Visible = False
                menuForm.mnuRunNewAppAsAdmin.Visible = False
            End If
            
            menuForm.mnuBlank5.Visible = False
            menuForm.mnuFocusApp.Visible = False
            menuForm.mnuBackApp.Visible = False
            
        Else
            
            ' if the process is marked as running then enable the menu options
            menuForm.mnuCloseApp.Visible = True
            If sRunElevated = "1" Then
                menuForm.mnuRunApp.Visible = True
                menuForm.mnuRunApp.Caption = "Run this App (elevated)"
                menuForm.mnuAdmin.Visible = True
'                menuForm.mnuRunNewApp.Visible = False
'                menuForm.mnuRunNewAppAsAdmin.Visible = False
                If explorerCheckArray(selectedIconIndex) = True Then
                    menuForm.mnuRunApp.Visible = True
                    menuForm.mnuRunApp.Caption = "Switch to this Explorer window"
                    menuForm.mnuAdmin.Visible = False
                    menuForm.mnuRunNewApp.Visible = False
                    menuForm.mnuRunNewAppAsAdmin.Visible = False
                Else
                    menuForm.mnuRunApp.Visible = False
                    menuForm.mnuRunApp.Caption = "Run this App"
                    menuForm.mnuAdmin.Visible = False
                    menuForm.mnuRunNewApp.Visible = True
                    menuForm.mnuRunNewAppAsAdmin.Visible = True
                End If
            End If
            If explorerCheckArray(selectedIconIndex) = True Then
                menuForm.mnuBlank5.Visible = False
                menuForm.mnuFocusApp.Visible = False
                menuForm.mnuBackApp.Visible = False
            Else
                menuForm.mnuBlank5.Visible = True
                menuForm.mnuFocusApp.Visible = True
                menuForm.mnuBackApp.Visible = True
            End If
            
        End If
        
        PopupMenu menuForm.mnuMainMenu, vbPopupMenuRightButton
        'the popupmenu event returns here and re-enables the mouse response and animation timers
        
        
        
        If hideDockForNMinutes = False Then ' re-enable timers only when the dock is operating normally and not when instructed to hide
            animateTimer.Enabled = True
            responseTimer.Enabled = True
        End If
        
        usedMenuFlag = True ' essential
        
    Else  'any normal left button click
                
        ' .79 DAEB 21/05/2021 frmMain.frm Disable any currently active bounce up or down
        bounceCounter = 0
        bounceUpTimer.Enabled = False
        bounceDownTimer.Enabled = False
    
        ' identify drag from the dock cannot be done in a traditional manner as we are not dropping it onto anything, so a drag
        ' over or drop is not initiated. Instead if we measure the time between mousedown and mouse up then we have an indication of a drag from the dock
        
        ' .75 DAEB 12/05/2021 frmMain.frm Changed Form_MouseMove to act as the correct event to a drag and drop operating from the dock
        If dragFromDockOperating = True Then
            If insideDockFlg = False Then
                Call deleteThisIcon
                Exit Sub
            End If
               
            ' at this point we drop an icon from one part of the dock to another
            If insideDockFlg = True Then 'allow a MouseUp to capture a drag from one part of the dock to another
                dragFromDockOperating = False
                dragInsideDockOperating = True 'check for dragInsideDockOperating
                If selectedIconIndex <> iconIndex Then ' cannot drop onto itself
                    ' we read the source icon details
                    sourceIconIndex = selectedIconIndex
                    targetIconIndex = iconIndex
                    
                    selectedIconIndex = targetIconIndex ' reset the selectedIconIndex
                    thisFilename = sFilename
                    
                    Call insertNewIconDataIntoCurrentPosition(thisFilename, sTitle, sCommand, sArguments, sWorkingDirectory, sShowCmd, sOpenRunning, sIsSeparator, sDockletFile, sUseContext, sUseDialog, sUseDialogAfter, sQuickLaunch, sDisabled)
                               
                    Call menuForm.addImageToDictionaryAndCheckForRunningProcess(thisFilename, sTitle)
                    
                    'delete the old icon at its new location
                    If sourceIconIndex < targetIconIndex Then
                        selectedIconIndex = sourceIconIndex
                    Else
                        selectedIconIndex = sourceIconIndex + 1
                    End If
                    Call deleteThisIcon
                    
                    'MsgBox "Dragged icon " & dragImageToDisplay & " " & selectedIconIndex & " " & sCommand & " to position " & iconIndex
                
                Else
                    
                    If Val(rDHoverFX) = 1 Then Call selectBubbleAnimation(3) ' select drawSmallStaticIcons redraw the icons if dragged to the same position
                End If

                ' we use the existing "add an icon" or icon deletion code to move the icon collection to a new temporary dock and write the new details there and then back again to the icon collection
                ' inserting as we go, the icon in its new position and not in its old
                
                Exit Sub
            End If
        End If

        ' check the current process is running by looking into the array that contains a list of running processes using selectedIconIndex
        If processCheckArray(selectedIconIndex) = False Then
            ' it would be nice to lock the x axis during the bounce animation
            If userLevel <> "runas" Then userLevel = "open"
                        
            ' the runCommand is called from within the bounceDownTimer
            
            bounceUpTimer.Enabled = True
            'animateTimer.Enabled = True
            
        Else
            ' the runCommand is called directly when the app is already running to avoid delay, no bounce
            If userLevel <> "runas" Then userLevel = "open"
            Call runCommand("run", "") ' added new parameter to allow override .68
        End If
        
        If FExists(soundtoplay) And rDSoundSelection <> "0" Then
            PlaySound soundtoplay, ByVal 0&, SND_FILENAME Or SND_ASYNC
        End If
              
    End If

   On Error GoTo 0
   Exit Sub

fMouseUp_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure fMouseUp of Form dock"

End Sub




'---------------------------------------------------------------------------------------
' Procedure : Form_OLEDragDrop
' Author    : beededea
' Date      : 15/04/2020
' Purpose   : Handles drag and drop to the dock, only file types accepted. If an image, drops it straight onto the dock.
'             If it is a binary then we use code to try to extract the embededded icons using privateExtractIcons API
'             especially when the icon is a bigger one, if it is only a low resolution icon then we give it an icon based upon its suffix.
'             direct from the icon collection.
'             If it is a special binary, msc, cpl then it is given an icon from the collection
'             If it is a shortcut we have some code to investigate the shortcut for the link details
'
'             I have made the decision not to use the embedded icons by default as for the majority of
'             Win o/ses before 10 the embedded icons are low resolution and puny. Instead we use document types from the collection.
'             This IS STEAMYDOCK!
'---------------------------------------------------------------------------------------
    'The Format numbers used in the OLE DragDrop data structure, are:
    'Text = 1 (vbCFText)
    'Bitmap = 2 (vbCFBitmap)
    'Metafile = 3
    'Emetafile = 14
    'DIB = 8
    'Palette = 9
    'Files = 15 (vbCFFiles)
    'RTF = -16639
    '
Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
   
    Dim suffix As String: suffix = vbNullString
    Dim Filename As String: Filename = vbNullString
    Dim iconImage As String: iconImage = vbNullString
    Dim iconTitle As String: iconTitle = vbNullString
    Dim iconFileName As String: iconFileName = vbNullString
    Dim iconCommand As String: iconCommand = vbNullString
    Dim iconArguments As String: iconArguments = vbNullString
    Dim iconWorkingDirectory As String: iconWorkingDirectory = vbNullString
    Dim answer As VbMsgBoxResult: answer = vbNo
    Dim nname As String: nname = vbNullString
    Dim npath As String: npath = vbNullString
    Dim ndesc As String: ndesc = vbNullString
    Dim nwork As String: nwork = vbNullString
    Dim nargs As String: nargs = vbNullString
    Dim thisShortcut As Link

    On Error GoTo Form_OLEDragDrop_Error
    
    ' if the dock is not the bottom layer then pop up a message box
    ' ie. don't pop it up if layered underneath everything as no-one will see the msgbox
    If rDLockIcons = 1 And (rDzOrderMode = "0" Or rDzOrderMode = "1") Then
        ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
        MessageBox Me.hwnd, "Sorry, the dock is currently locked, so drag and drop is disabled!", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
        '        MsgBox "Sorry, the dock is currently locked, so drag and drop is disabled!"
        Exit Sub
    End If
    
    iconImage = vbNullString
    iconTitle = vbNullString
    iconArguments = vbNullString
    iconWorkingDirectory = vbNullString
        
    selectedIconIndex = iconIndex ' this is the icon we will be bouncing
    
    ' if there is more than one file dropped reject the drop
    ' if the dock is not the bottom layer then pop up a message box
    ' ie. don't pop it up if layered underneath everything as no-one will see the msgbox
    If Data.Files.Count > 1 And (rDzOrderMode = "0" Or rDzOrderMode = "1") Then
       ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
        MessageBox Me.hwnd, "Sorry, can only accept one icon drop at a time, you have dropped " & Data.Files.Count, "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
        '        MsgBox "Sorry, can only accept one icon drop at a time, you have dropped " & Data.Files.count
        Exit Sub
    End If
    
    If Data.GetFormat(vbCFFiles) Then
        ' if it is of type 'file' then determine what to do, I have specific catch-alls and
        ' sections for each, just in case any specific tasks are required for each type.
        ' this could all be removed later as the actions seem more or less the same for each.
        
        ' Data.Files.Item
    
        iconTitle = Data.Files(1) ' set the title for all types
        iconCommand = Data.Files(1) ' set the command for all types
        
        ' is it a folder, does the folder exist
        If DirExists(iconTitle) Then
            iconFileName = App.Path & "\iconSettings\my collection\steampunk icons MKVI" & "\document-dir.png"
            If FExists(iconFileName) Then
                iconImage = iconFileName
            End If
        Else ' otherwise it is a file
    
              suffix = LCase(ExtractSuffixWithDot(Data.Files(1)))
              If InStr(1, ".exe,.bat,.msc,.cpl,.lnk", suffix) <> 0 Then
                  
                  Effect = vbDropEffectCopy
                 
                  'if an exe is dragged and dropped onto RD it is given an id, that it appends to the binary name after an additional "?"
                  ' that ? signifies what? Well, possibly it is the handle of the embedded icon only added the one time, so that when the binary is read in the future the handle is already there
                  ' and that can be used to populate image array? Untested.
                  ' in this case we just need to note the ? and then query the binary for an embedded icon handle and compare it to the id that RD has given it.
                  ' if it is the same then we can perhaps simulate the same.
                  
                  If suffix = ".exe" Then
                    ' we should, if it is a EXE dig into it to determine the icon using privateExtractIcon
                                         
                    ' However, we do not extract the icon from the shortcut as it will be useless for steamydock
                    ' VB6 not being able to extract and handle a transparent PNG form
                    ' even if it was we have no current method of making a transparent PNG from a bitmap or ICO that
                    ' I can easily transfer to the GDI collection - but I am working on it...
                    ' the vast majority of default icons are far too small for steamydock in any case.
                    ' the result of the above is that there is currently no icon extracted, though that may change.
                    
                    ' instead we have a list of apps that we can match the shortcut name against, it exists in an external comma
                    ' delimited file. The list has two identification factors that are used to find a match and then we find an
                    ' associated icon to use with a relative path.
                       
                    iconFileName = identifyAppIcons(iconCommand) ' .54 DAEB 19/04/2021 frmMain.frm Added new function to identify an icon to assign to the entry
                       
                    If FExists(iconFileName) Then
                      iconImage = iconFileName
                    Else
                      iconImage = App.Path & "\iconSettings\my collection\steampunk icons MKVI" & "\document-EXE.png"
                    End If
                    
                  End If
                  
                  If suffix = ".msc" Then
                      ' if it is a MSC then  give it a SYSTEM type icon (EVENT)
                      
                      ' if there is no icon embedded found then use the default icon
                       ' check the icon exists
                      iconFileName = App.Path & "\iconSettings\my collection\steampunk icons MKVI" & "\document-msc.png"
                      If FExists(iconFileName) Then
                          iconImage = iconFileName
                      End If
                  End If
                  
                  If suffix = ".bat" Then
                      ' if it is a BAT then give it a BATCH type icon (NOTEPAD)
                      
                      ' if there is no icon embedded found then use the default icon
                       ' check the icon exists
                      iconFileName = App.Path & "\iconSettings\my collection\steampunk icons MKVI" & "\document-bat.png"
                      If FExists(iconFileName) Then
                          iconImage = iconFileName
                      End If
                  End If
                  
                  If suffix = ".cpl" Then
                      ' if it is a CPL then give it a SYSTEM type icon (CONSOLE)
                      
                      ' if there is no icon embedded found then use the default icon
                       ' check the icon exists
                      iconFileName = App.Path & "\iconSettings\my collection\steampunk icons MKVI" & "\document-cpl.png"
                      If FExists(iconFileName) Then
                          iconImage = iconFileName
                      End If
                  End If
                  
            '       If it is a shortcut we have some code to investigate the shortcut for the link details
                  If suffix = ".lnk" Then
                        ' if it is a short cut then you can use two methods, the first is currently limited to only
                        ' producing the path alone but it does avoid using the shell method that causes FPs to occur in av tools

                        Call GetShortcutInfo(iconCommand, thisShortcut) ' .54 DAEB 19/04/2021 frmMain.frm Added new function to identify an icon to assign to the entry
                                       
                        iconTitle = getFileNameFromPath(thisShortcut.Filename)
                        
                        If Not thisShortcut.Filename = vbNullString Then
                            iconCommand = LCase(thisShortcut.Filename)
                        End If
                        iconArguments = thisShortcut.Arguments
                        iconWorkingDirectory = thisShortcut.RelPath
                        
                        ' .55 DAEB 19/04/2021 frmMain.frm Added call to the older function to identify an icon using the shell object
                        'if the icontitle and command are blank then this is user-created link that only provides the relative path
                        If iconTitle = vbNullString And thisShortcut.Filename = vbNullString And Not iconWorkingDirectory = vbNullString Then
                            Call GetShellShortcutInfo(iconCommand, nname, npath, ndesc, nwork, nargs)
                    
                            iconTitle = nname
                            iconCommand = npath
                            iconArguments = nargs
                            iconWorkingDirectory = nwork
                        End If
                       
                      ' .54 DAEB 19/04/2021 frmMain.frm Added new function to identify an icon to assign to the entry
                      
                      ' we do not extract the icon from the shortcut as it will be useless for steamydock
                      ' VB6 not being able to extract and handle a transparent PNG form
                      ' even if it was we have no current method of making a transparent PNG from a bitmap or ICO that
                      ' I can easily transfer to the GDI collection - but I am working on it...
                      ' the vast majority of default icons are far too small for steamydock in any case.
                      ' the result of the above is that there is currently no icon extracted, though that may change.
                      
                      ' instead we have a list of apps that we can match the shortcut name against, it exists in an external comma
                      ' delimited file. The list has two identification factors that are used to find a match and then we find an
                      ' associated icon to use with a relative path.
                      
                      iconFileName = identifyAppIcons(iconCommand)
                       
                      If FExists(iconFileName) Then
                        iconImage = iconFileName
                      Else
                        iconImage = App.Path & "\iconSettings\my collection\steampunk icons MKVI" & "\document-lnk.png"
                      End If
                  End If
            
              ElseIf InStr(1, ".png, .bmp, .gif, .jpg, .jpeg, .ico, .tif, .tiff", suffix) <> 0 Then
                  ' See if this is a file name ending in bmp, gif, jpg, or jpeg or tiff.
                  ' if so use the filename and drop it onto the dock
                  
                  Effect = vbDropEffectCopy
                  
                  iconImage = iconCommand
                  If Not FExists(iconImage) Then
                      Exit Sub
                  End If
              
              ElseIf InStr(1, ".zip, .7z, .arj, .deb, .pkg, .rar, .rpm, .tar, .gz, .z, .bck", suffix) <> 0 Then
                  
                '    .7z - 7-Zip compressed file
                '    .arj - ARJ compressed file
                '    .deb - Debian software package file
                '    .pkg - Package file
                '    .rar - RAR file
                '    .rpm - Red Hat Package Manager
                '    .tar.gz - Tarball compressed file
                '    .z - Z compressed file
                '    .zip - Zip compressed file
                
                ' See if this is a file name ending in the above
                ' if so use the filename and drop it onto the dock
                  
                Effect = vbDropEffectCopy
                  
                suffix = LCase$(ExtractSuffix(Data.Files(1)))
                iconImage = App.Path & "\my collection\steampunk icons MKVI\document-" & suffix & ".png"
                iconCommand = Data.Files(1)
                If Not FExists(iconImage) Then
                    iconImage = App.Path & "\my collection\steampunk icons MKVI" & "\document-zip.png"
                End If
                
                If Not FExists(iconImage) Then
                    Exit Sub
                End If
            
                      
              Else ' does not match any given type so see if we have an icon in the collection ready for it.
              
                  ' take the suffix and find a file in the collection that matches
                  ' if the file exists then add it to the menu
                  ' otherwise just do an empty default icon
                  
                  Effect = vbDropEffectCopy
                  
                  suffix = LCase(ExtractSuffix(Data.Files(1)))
                  iconImage = App.Path & "\iconSettings\my collection\steampunk icons MKVI\document-" & suffix & ".png"
                  iconCommand = Data.Files(1)
                  If Not FExists(iconImage) Then
                      iconImage = App.Path & "\nixietubelargeQ.png"
                  End If
                      
              End If
        End If
        
        ' if no specific image found
        If iconImage = vbNullString Then
            iconImage = App.Path & "\nixietubelargeQ.png"
        End If
        
        If FExists(iconImage) Then ' last check that the default ? image has not been deleted.
            Call insertNewIconDataIntoCurrentPosition(iconImage, iconTitle, iconCommand, iconArguments, iconWorkingDirectory, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString, vbNullString)
            ' .51 DAEB 08/04/2021 frmMain.frm calls mnuIconSettings_Click_Event to start up the icon settings tools and display the properties of the new icon.
            Call menuForm.addImageToDictionaryAndCheckForRunningProcess(iconImage, iconTitle)
            ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
             'MessageBox Me.hwnd, iconTitle & " dropped successfully to the dock. ", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
             '            MsgBox iconTitle & " dropped successfully to the dock. ", vbSystemModal
        Else
            ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
             'MessageBox Me.hwnd, iconImage & " missing default image, " & App.Path & "\nixietubelargeQ.png" & " drop unsuccessful. ", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
             '            MsgBox iconImage & " missing default image, " & App.Path & "\nixietubelargeQ.png" & " drop unsuccessful. ", vbSystemModal
        End If
        
        
        'Call menuForm.mnuIconSettings_Click_Event
        
    Else
        ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
        MessageBox Me.hwnd, " unknown file Object OLE dropped onto SteamyDock.", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
        'MsgBox " unknown file Object OLE dropped onto SteamyDock."
    End If
    
    dragToDockOperating = False

    On Error GoTo 0
    Exit Sub

Form_OLEDragDrop_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_OLEDragDrop of Form dock"

End Sub



'---------------------------------------------------------------------------------------
' Procedure : Form_OLEDragOver
' Author    : beededea
' Date      : 28/01/2021
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub Form_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
   On Error GoTo Form_OLEDragOver_Error

    If rDLockIcons = 0 Then
        dragToDockOperating = True
        hourGlassTimer.Enabled = True
    End If

   On Error GoTo 0
   Exit Sub

Form_OLEDragOver_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_OLEDragOver of Form dock"
End Sub



'---------------------------------------------------------------------------------------
' Procedure : Form_Unload
' Author    : beededea
' Date      : 07/04/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub Form_Unload(Cancel As Integer)
   On Error GoTo Form_Unload_Error

    Call dock.shutdwnGDI

    ' shutdown GDI
'    If lngImage Then
'        Call GdipReleaseDC(lngImage, dcMemory)
'        Call GdipDeleteGraphics(lngImage)
'    End If
'    If lngBitmap Then Call GdipDisposeImage(lngBitmap)
'    If lngGDI Then Call GdiplusShutdown(lngGDI)
    
    ' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support
'    Dim lIndex As Long
'    For lIndex = 0 To 3
'        RemoveHotKey lHotKey(lIndex) ' removes the keys set when the app ends
'    Next

    ' .23 DAEB frmMain.frm 08/02/2021 Changed from an array to a single var
     RemoveHotKey lHotKey

    ' .13 DAEB frmMain.frm 27/01/2021 Added system wide keypress support

   On Error GoTo 0
   Exit Sub

Form_Unload_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_Unload of Form dock"
End Sub






'Private Sub iconGrowthTimer_Timer()
'    ' starting at a low level we increase a sizeModifier that will allow the icon to grow rather than just appear at full size
'    iconGrowthModifier = iconGrowthModifier - 1
'    If iconGrowthModifier <= 0 Then
'        iconGrowthModifier = iconSizeLargePxls
'        iconGrowthTimer.Enabled = False
'    End If
'End Sub

'---------------------------------------------------------------------------------------
' Procedure : initiatedExplorerTimer
' Author    : beededea
' Date      : 10/07/2020
' Purpose   :
' Provides regular checking of only EXPLORER processes initiated by the dock, removes the running indicator cog.
' Explorer windows have to be enumerated differently than just comparing current open folders to existing instances of explorer processes.
' each explorer window has to be enumerated and the associated folder extracted. This also handles folders referenced
' by CLSIDs.
' An array of the same size as the main icon arrays, each dock-initiated explorer item resides in its own numbered location.
' Checking for just a few elements in an array, the empty elements can be bypassed, instead probing just these few processes
' for existence, this can be carried out much more frequently than the main timer process that occurs only once every 10-65 seconds full process check.
' If the result of the search is false then the program has completed and the cog can be removed.
' processCheckArray(useloop) - is the array that determines whether a cog is placed on an icon.
'---------------------------------------------------------------------------------------

Private Sub initiatedExplorerTimer_Timer()

    Dim useloop As Long: useloop = 0
    Dim itIs As Boolean: itIs = False
     
    On Error GoTo initiatedExplorerTimer_Error

        For useloop = 0 To rdIconMaximum
            ' instead of looping through all elements in the docksettings.ini file, we now store all the current commands in an array
            ' we loop through the array much quicker than looping through the temporary settings file.
            ' all we have to do is to remember to populate the array whenever an icon is added or deleted
            If Not initiatedExplorerArray(useloop) = vbNullString Then
                itIs = isExplorerRunning(initiatedExplorerArray(useloop))
                If itIs = False Then
                    explorerCheckArray(useloop) = False ' the cog array
                    initiatedExplorerArray(useloop) = vbNullString ' removes the entry from the test array so it isn't caught again
                Else
                    explorerCheckArray(useloop) = True ' the cog array
                End If
                ' .81 DAEB 28/05/2021 frmMain.frm Refresh the running process with a cog when the process is running, this had been removed earlier
                bDrawn = False
                If smallDockBeenDrawn = True Then
                    If Val(rDHoverFX) = 1 Then Call selectBubbleAnimation(3) ' select drawSmallStaticIcons redraw the icons if dragged to the same position
                End If
            End If
        Next useloop

   On Error GoTo 0
   Exit Sub

initiatedExplorerTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure initiatedExplorerTimer of Form dock"

End Sub



'---------------------------------------------------------------------------------------
' Procedure : initiatedProcessTimer
' Author    : beededea
' Date      : 10/07/2020
' Purpose   :
' Provides regular checking of ONLY processes initiated by the dock, removes the running indicator cog
' an array of the same size as the main icon arrays, each dock-initiated item resides in its own numbered location.
' Checking for just a few elements in an array, the empty elements can be bypassed, instead probing just these few processes
' for existence, this can be carried out much more frequently than the current once every 10-65 seconds full process check.
' If the result of the search is false then the program has completed and the cog can be removed.
' processCheckArray(useloop) - is the array that determines whether a cog is placed on an icon.
'---------------------------------------------------------------------------------------

Private Sub initiatedProcessTimer_Timer()

    Dim useloop As Long: useloop = 0
    Dim itIs As Boolean: itIs = False
     
    On Error GoTo initiatedProcessTimer_Error

        For useloop = 0 To rdIconMaximum
            ' instead of looping through all elements in the docksettings.ini file, we now store all the current commands in an array
            ' we loop through the array much quicker than looping through the temporary settings file.
            ' all we have to do is to remember to populate the array whenever an icon is added or deleted
            If Not initiatedProcessArray(useloop) = vbNullString Then
                itIs = IsRunning(initiatedProcessArray(useloop), vbNull)
                If itIs = False Then
                    processCheckArray(useloop) = False ' the cog array

                    initiatedProcessArray(useloop) = vbNullString ' removes the entry from the test array so it isn't caught again

                Else
'                    processCheckArray(useloop) = True ' the cog array
                    itIs = itIs
                    'MsgBox ""
                    'If initiatedProcessArray(useloop) = "C:\Program Files\CPUID\CPU-Z\cpuz.exe" Then MsgBox "poo"
                    
                End If
                ' .81 DAEB 28/05/2021 frmMain.frm Refresh the running process with a cog when the process is running, this had been removed earlier
                bDrawn = False
                If smallDockBeenDrawn = True Then
                    If Val(rDHoverFX) = 1 Then Call selectBubbleAnimation(3) ' select drawSmallStaticIcons redraw the icons if dragged to the same position
                End If
            End If
        Next useloop

   On Error GoTo 0
   Exit Sub

initiatedProcessTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure initiatedProcessTimer of Form dock"

End Sub




'---------------------------------------------------------------------------------------
' Procedure : positionZTimer_Timer
' Author    : beededea
' Date      : 02/03/2021
' Purpose   : .32 DAEB 03/03/2021 frmMain.frm Placing the dock back in the defined z-order
'---------------------------------------------------------------------------------------
'
Private Sub positionZTimer_Timer()
   On Error GoTo positionZTimer_Timer_Error

    If animateTimer.Enabled = True Or animatedIconsRaised = True Or menuForm.Visible = True Then
        Exit Sub
    End If
    
    If dockZorder = "high" Then
        If rDzOrderMode = "0" Then
            SetWindowPos dock.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE
        ElseIf rDzOrderMode = "1" Then
            SetWindowPos dock.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE
        ElseIf rDzOrderMode = "2" Then
            SetWindowPos dock.hwnd, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOSIZE
        End If
        dockZorder = "low"
    End If

   On Error GoTo 0
   Exit Sub

positionZTimer_Timer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure positionZTimer_Timer of Form dock"
End Sub

'
'---------------------------------------------------------------------------------------
' Procedure : responseTimer
' Author    : beededea
' Date      : 07/04/2020
' Purpose   : Determines whether to turn on the animate timer
'             It determines the position of the mouse and then if no animation required, draws the icons
'             in small size (only) when the mouse cursor leaves the dock area
'---------------------------------------------------------------------------------------
'
Private Sub responseTimer_Timer()
    On Error GoTo responseTimer_Error
    
    'Dim outsideDock As Boolean: outsideDock = False
    
    lngReturn = GetCursorPos(apiMouse) ' return the mouse position every 4 - 200ms - sufficient
        
    currentDockHeightPxls = fSetDockUpperHeightLimit()
    Call tuneResponseTimerInterval
    dockEntranceLocation = fDefineDockEntranceLocation()
    
    lastPositionRelativeToDock = outsideDock
    outsideDock = fTestCursorWithinDockYPosition()
    
    insideDockFlg = Not outsideDock '.nn Added as part of the drag and drop functionality
    
    ' the mouse has left the Max icon area
    If outsideDock = True And dragFromDockOperating = False Then
        Call stopAnimating
        Exit Sub ' leave the timer loop and do nothing else
    End If
    
     ' dragging from the dock for deletion
    If (outsideDock = True And dragFromDockOperating = True) Then
        If animateTimer = False Then Call startAnimating
        hourGlassTimer.Enabled = False
        dragToDockOperating = False
        Exit Sub
    End If
    
    ' the mouse is now within the icon area or being dragged so start animating and using cpu...
    If insideDockFlg = True Or dragFromDockOperating = True Or dragToDockOperating = True Then
        If lastPositionRelativeToDock = True Then ' we have just entered the dock so start the growth timer
            ' we cannot cause the main icon to grow on first entry to the dock as it must appear the full icon width in order
            ' for the animation to operate, a new animation method will be required, a complete rewrite
            
'            iconGrowthTimer.Enabled = True
'            lastPositionRelativeToDock = False
        End If
        
        If animateTimer = False Then Call startAnimating
        If dragFromDockOperating = True Then
            hourGlassTimer.Enabled = True
            dragToDockOperating = True
        End If
    End If
   
   On Error GoTo 0
   Exit Sub

responseTimer_Error:

    'MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure responseTimer of Form dock"
End Sub


'---------------------------------------------------------------------------------------
' Procedure : fSetDockUpperHeightLimit
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Function fSetDockUpperHeightLimit() As Long
    Dim dockHeightPxls: dockHeightPxls = 0
    
    On Error GoTo fSetDockUpperHeightLimit_Error
    
    ' 22/10/2020 .01 frmMain.frm responsetimer fix the incorrect check of the timer state to determine the dock upper limit when entering and triggering the main animation
    If animatedIconsRaised = True Then
        dockHeightPxls = iconSizeLargePxls + Val(rDvOffset) + rdDefaultYPos
    Else
        dockHeightPxls = iconSizeSmallPxls + Val(rDvOffset) + rdDefaultYPos
    End If
    
    fSetDockUpperHeightLimit = dockHeightPxls

    On Error GoTo 0
    Exit Function

fSetDockUpperHeightLimit_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure fSetDockUpperHeightLimit of Form dock"
            Resume Next
          End If
    End With

End Function

'---------------------------------------------------------------------------------------
' Procedure : tuneResponseTimerInterval
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub tuneResponseTimerInterval()
    
    ' .18 STARTS DAEB frmMain.frm 31/01/2021 reinstated checks of fade out and slide timers to set a more frequent response timer to improve animation

    If animatedIconsRaised = True Or autoFadeOutTimer.Enabled = True Or autoSlideOutTimer.Enabled = True Then ' logic to test on states needs to be refined
        responseTimer.Interval = 4 ' tests the mouse position more regularly, making dock much more responsive and fadeouts smoother
    Else
        responseTimer.Interval = 100 ' reduced to 5 times per second
    End If

End Sub

'---------------------------------------------------------------------------------------
' Procedure : defineDockEntranceLocation
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Function fDefineDockEntranceLocation() As Long

    Dim calcEntrance As Long: calcEntrance = 0
    
    ' set the area of the screen that responds to the cursor entering to be only 10 pixels from the bottom of the screen
    ' it does this on a slide out and the instant options only, giving more room to display other apps without the dock interfering
    ' And Val(sDAutoHideType) <> 0a
    
    ' Must be visible.
    'If Not (rDAutoHide = "1" And dockHidden = True) Then
        If dockPosition = vbBottom Then
            calcEntrance = screenHeightPixels - currentDockHeightPxls  ' sets the dock top to normal position
        ElseIf dockPosition = vbtop Then
            calcEntrance = currentDockHeightPxls  ' sets the dock top to normal position
        End If
    'End If
    
    fDefineDockEntranceLocation = calcEntrance
End Function

'---------------------------------------------------------------------------------------
' Procedure : fTestCursorWithinDockYPosition
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Function fTestCursorWithinDockYPosition() As Boolean
    Dim outsideDock  As Boolean: outsideDock = False
    
    ' checks the mouse Y position - ie. is the mouse outside the vertical/horizontal dock area
    If dockPosition = vbBottom Then
        outsideDock = apiMouse.y < dockEntranceLocation Or apiMouse.x < iconLeftmostPointPxls Or apiMouse.x > iconStoreLeftPixels(UBound(iconStoreLeftPixels))    ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    End If
    If dockPosition = vbtop Then
        outsideDock = apiMouse.y > dockEntranceLocation Or apiMouse.x < iconLeftmostPointPxls Or apiMouse.x > iconStoreLeftPixels(UBound(iconStoreLeftPixels)) ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    End If
    
    fTestCursorWithinDockYPosition = outsideDock ' return

End Function

'---------------------------------------------------------------------------------------
' Procedure : startHidingDockTimers
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub startHidingDockTimers()

    On Error GoTo startHidingDockTimers_Error

        If rDAutoHide = "1" Then ' if hidden dynamically restore the opacity when hoverered upon
            If Val(sDAutoHideType) = 0 Then ' fade animation
                If funcBlend32bpp.SourceConstantAlpha < 255 Then ' fade back in
                    autoHideMode = "fadein"
                    autoFadeInTimer.Enabled = True
                    bDrawn = False
                    smallDockBeenDrawn = False ' allows the dock to redraw on the next response cycle
                End If
            ElseIf Val(sDAutoHideType) = 1 Then ' slide animation as per Rocketdock
                ' check whether the dock has been slid out already
                If iconCurrentTopPxls > (screenHeightPixels) Then
                    autoSlideMode = "slidein"
                    autoSlideInTimer.Enabled = True
                    bDrawn = False
                    smallDockBeenDrawn = False ' allows the dock to redraw on the next response cycle
                End If
            ElseIf Val(sDAutoHideType) = 2 Then 'instant invisible
                ' set the opacity of the whole dock, used to display solidly and for instant autohide
                funcBlend32bpp.SourceConstantAlpha = 255 * Val(dockOpacity) / 100
                bDrawn = False
                smallDockBeenDrawn = False ' allows the dock to redraw on the next response cycle
            End If

            'dockHidden = False
        End If

    On Error GoTo 0
    Exit Sub

startHidingDockTimers_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure startHidingDockTimers of Form dock"
            Resume Next
          End If
    End With

End Sub
'---------------------------------------------------------------------------------------
' Procedure : startAnimating
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub startAnimating()
    On Error GoTo startAnimating_Error

        animatedIconsRaised = True
        dockZorder = "high"
        dockOpacity = Val(rDIconOpacity) ' the default opacity for the icons
        smallDockBeenDrawn = False
        
        animateTimer.Enabled = True
       
        SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
        
        '.nn Set the cursor to a pointer, if for some reason it has been set to anything other than a normal pointy cursor
        lngCursor = LoadCursor(0, 32512&)
        If (lngCursor > 0) Then SetCursor lngCursor

        Call startHidingDockTimers

    On Error GoTo 0
    Exit Sub

startAnimating_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure startAnimating of Form dock"
            Resume Next
          End If
    End With

End Sub
'---------------------------------------------------------------------------------------
' Procedure : stopAnimating
' Author    : beededea
' Date      : 19/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub stopAnimating()
        ' only cancel the running of the animation timer when neither of the two bounce timers are running
        ' this allows the bouncetimers to complete even if the mouse moves out of the dock area.
        ' these timers control the initiation of the chosen application so it is important that they both complete.
    On Error GoTo stopAnimating_Error

        dockJustEntered = True
        dragToDockOperating = False ' stops the middle invisible icon on the sequentialBubbleAnimation routine

        If animatedIconsRaised = False Then
            If smallDockBeenDrawn = False Then ' only draws the dock when it has not yet been drawn
                If Val(rDHoverFX) = 1 Then Call selectBubbleAnimation(3) ' select drawSmallStaticIcons redraw the icons if dragged to the same position
            End If
            If animateTimer.Enabled = True Then
                
                If bounceUpTimer.Enabled = False Or bounceDownTimer.Enabled = False Then ' .80 DAEB 28/05/2021 frmMain.frm Keep the animateTimer and therefore the bounceTimers operating in order to run the chosen app.
                    animateTimer.Enabled = False ' stops the cpu costly animation timer
                End If
            End If
        Else ' if it was true
            animatedIconsRaised = False
            dockLoweredTime = TimeValue(Now)
        End If

    On Error GoTo 0
    Exit Sub

stopAnimating_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure stopAnimating of Form dock"
            Resume Next
          End If
    End With
End Sub
'---------------------------------------------------------------------------------------
' Procedure : animateTimer
' Author    : beededea
' Date      : 07/04/2020
' Purpose   :   this is the X millisecond timer that does the animation for the dock icons
'               determines if and where exactly the mouse is in the < horizontal > icon hover area and determines the icon index
'               clears the whole previously drawn image section
'               calls the chosen animation method which animates
'---------------------------------------------------------------------------------------
'
Private Sub animateTimer_Timer()
    Dim showsmall As Boolean: showsmall = False
    Dim useloop As Integer: useloop = 0
    Dim thiskey As String: thiskey = vbNullString
    Dim textWidth As Integer: textWidth = 0
    Dim insideDock As Boolean: insideDock = False
   
    'Dim bumpFactor As Single' .61 DAEB 26/04/2021 frmMain.frm size modifier moved to the sequential bump animation
    'bumpFactor = 0' .61 DAEB 26/04/2021 frmMain.frm size modifier moved to the sequential bump animation
    
    On Error GoTo animateTimer_Error
    
    'lngReturn = GetCursorPos(apiMouse) ' not needed as it retruns a value in the response timer which is sufficient
    
    ' if the bounce or fade timere are running cause animation to continue even if the mouse is stationary.
    If bounceUpTimer.Enabled = True Or bounceDownTimer.Enabled = True Or hourGlassTimer.Enabled = True Or autoFadeOutTimer.Enabled = True Or autoFadeInTimer.Enabled = True Or autoSlideOutTimer.Enabled = True Or autoSlideInTimer.Enabled = True Then ' .nn Changed or added as part of the drag and drop functionality
        ' carry on as usual and animate when any animation timers are running
    Else ' we are only interested in analysing if there is any Y axis movement
        ' however, if the animate timers are not running and the cursor position is static then do no animation - just exit, saving CPU '
        'If savApIMouseX = apiMouse.x And savApIMouseY = apiMouse.y Then
            animateTimer.Enabled = False
            responseTimer.Enabled = True
'            Exit Sub             ' if the timer that does the bouncing is running then we need to animate even if the mouse is stationary...
        'End If
        If savApIMouseX = apiMouse.x And savApIMouseY <> apiMouse.y Then Exit Sub ' if moving in the x axis but not in the y axis we also exit
    End If

    savApIMouseY = apiMouse.y
    savApIMouseX = apiMouse.x
    
    showsmall = True
    bDrawn = False
    expandedDockWidth = 0
    
    ' determines if and where exactly the mouse is in the < horizontal > icon hover area and if so, determine the icon index
    For useloop = 0 To iconArrayUpperBound
        ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
        insideDock = apiMouse.x >= iconStoreLeftPixels(useloop) And apiMouse.x <= iconStoreRightPixels(useloop)
    
        If insideDock Then
            iconIndex = useloop ' this is the current icon number being hovered over
            Exit For ' as soon as we have the index we no longer have to stay in the loop
        End If
    Next useloop
    
    iconPosLeftPxls = iconLeftmostPointPxls ' put starting left position back again for the dock bg
    
        
    ' NOTE:
    ' if it is the first time the dock is entered then it is drawDockByCursorEntryPosition that draws all the icons into the correct location.
    ' when the icons have been ordered correctly then sequentialBubbleAnimation provides the animation from that point on.
    
    If dockJustEntered = True Then
        If Val(rDHoverFX) = 1 Then Call selectBubbleAnimation(2) ' select drawDockByCursorEntryPosition - finds horizontal start point for the dock and place icons accordingly
        ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
        saveStartLeftPxls = iconStoreLeftPixels(0) ' we now have the dock start position for sequentialBubbleAnimation to do its stuff
        dockJustEntered = False
    Else
        'none
        'bubble
        'plateau
        'flat
        'bumpy
    
        ' 27/10/2020 .04 DAEB alternative animations to zoom: Bubble enabled as options STARTS
        If Val(rDHoverFX) = 0 Then
            ' the none choice, simply bounces the small icon without growing it at all
        ElseIf Val(rDHoverFX) = 1 Then
            Call selectBubbleAnimation(1) ' select sequentialBubbleAnimation
        ElseIf Val(rDHoverFX) = 2 Then
            'Call sequentialBubbleAnimation ' the current zoom: Bubble animation
            ' the zoom plateau animation, as per the current animation makes n number of central icons assume the full size
        ElseIf Val(rDHoverFX) = 3 Then
            ' the zoom flat animation all are shown in their large mode and the mouse scrolls from right to left according to mouse position
        ElseIf Val(rDHoverFX) = 4 Then
            'Call sequentialBubbleAnimation ' the current zoom: Bubble animation
        End If
        ' 27/10/2020 .04 DAEB alternative animations to zoom: Bubble enabled as options ENDS.
    End If
    
    'stores the current icon position
    ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    iconStoreLeftPixels(UBound(iconStoreLeftPixels)) = iconPosLeftPxls
                
   On Error GoTo 0
   Exit Sub

animateTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure animateTimer of Form dock"

End Sub

Private Sub updateGDIPlus()

    Call GdipDeleteGraphics(lngImage)  'The graphics may now be deleted
    
    ' the third parameter is a pointer to a structure that specifies the new screen position of the layered window.
    ' If the current position is not changing, pptDst can be NULL. It is null. We can play with it to move the screen
    
    'Update the specified window handle (hwnd) with a handle to our bitmap (dc) passing all the required characteristics
    UpdateLayeredWindow Me.hwnd, hdcScreen, ByVal 0&, apiWindow, dcMemory, apiPoint, 0, funcBlend32bpp, ULW_ALPHA

End Sub
'
'Private Function Draw(Func As String) As Integer
'  Dim i As Integer: i = 0
'  Dim sinwave As Integer: sinwave = 0
'  Dim cen As Double: cen = 0
'
'  On Error Resume Next 'only for tan
'
'  Const pi = 3.14159265358979
'  sinwave = 0
'
'    Select Case Func
'        Case "sin"
'             sinwave = Sin(i * pi / 720)
'        Case "cos"
'        Case "tan"
'    End Select
'
'End Function

'---------------------------------------------------------------------------------------
' Procedure : sequentialBubbleAnimation
' Author    : beededea
' Date      : 01/05/2020
' Purpose   : sequentialBubbleAnimation is the main animator. It places the icons from left to right, storing the icon
'             positions in an array so the current chosen icon can be acted upon.
'             The previous drawDockByCursorEntryPosition places all the icons according to the position they find themselves in when the cursor enters the dock.
'             This routine simply takes those stored positions and then animates them sequentially from a to z
'---------------------------------------------------------------------------------------
'
Private Sub sequentialBubbleAnimation()
 
    Dim showsmall As Boolean: showsmall = False
    Dim useloop As Integer: useloop = 0
    Dim useloop2 As Integer: useloop2 = 0
    Dim thiskey As String: thiskey = ""
    Dim thiskey2 As String: thiskey2 = ""
    Dim textWidth As Integer: textWidth = 0
    Dim dockSkinStart As Long: dockSkinStart = 0
    Dim dockSkinWidth As Long: dockSkinWidth = 0
    Dim leftGrpMember As Integer: leftGrpMember = 0
        
    Dim leftmostResizedIcon As Integer: leftmostResizedIcon = 0
    Dim rightmostResizedIcon As Integer: rightmostResizedIcon = 0

    On Error GoTo sequentialBubbleAnimation_Error
    
    DeleteObject bmpMemory ' the bitmap deleted
    Call readyGDIPlus ' clears the whole previously drawn image section and the animation continues

    ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecessary twip conversion
    iconPosLeftPxls = saveStartLeftPxls

    If rDtheme <> vbNullString And rDtheme <> "Blank" Then Call applyThemeSkinToDock(dockSkinStart, dockSkinWidth)
    
    Call determineDynamicIconRangeToAnimate(leftmostResizedIcon, rightmostResizedIcon)
    
    ' .61 DAEB 26/04/2021 frmMain.frm size modifier moved to the sequential bump animation
    bumpFactor = 1.2 ' this determines the 'bumpiness' of the transition of switching from one icon to the next
    If usedMenuFlag = False Then ' only recalculate dynamicSizeModifierPxls for the bump animation when the menu has not recently been used
         ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
        
        ' this is the actual line that does the main animation
        dynamicSizeModifierPxls = ((apiMouse.x) - iconStoreLeftPixels(iconIndex)) / (bumpFactor)


    Else
        usedMenuFlag = False ' the menu causes the mouse to move far away from the icon centre and so icon sizing was massive
    End If
            
    ' resize all the icons as we run through each in the loop, display them just before the end of the loop
    For useloop = 0 To iconArrayUpperBound ' loop through all the icons one by one
        
        'Call sizeDockPositionZero(useloop, showsmall) ' no need to run this so commented out
            
        ' size all small icons to the left of the main icons, each sized as per small mode, do it just ONCE, all the other icons will take that same size without recalculating
        If useloop = 0 Then Call sizeEachSmallIconToLeft(useloop, leftmostResizedIcon, showsmall)

        ' if the the main icon is icon zero
         ' the main fullsize icon
        Call sizeFullSizeIcon(useloop, showsmall)
        
        ' the group of icons to the left of the main icon, resized dynamically
        Call sizeEachResizedIconToLeft(useloop, leftmostResizedIcon, showsmall)

        ' the group of icons to the right of the main icon, resized dynamically
        Call sizeEachResizedIconToRight(useloop, rightmostResizedIcon, showsmall)

        ' small icons to the right shown in small mode, do it just once, all the other icons will take that same size without recalculating
        If useloop = rightmostResizedIcon + 1 Then Call sizeEachSmallIconToRight(useloop, rightmostResizedIcon, showsmall)
               
        ' display the icon in the dock
        If showsmall = True Then ' display the small size icon or the red X if icon missing
            Call showSmallIcon(useloop)
        Else
            Call showLargeIconTypes(useloop) ' display the larger size icon or the
        End If

        'now draw the icon text above the selected icon
        Call drawTextAboveIcon(useloop, textWidth)
        
        ' store the icon current position in the array
        Call storeCurrentIconPositions(useloop)

        iconPosLeftPxls = iconPosLeftPxls + iconWidthPxls
   
    Next useloop

    ' .nn Changed or added as part of the drag and drop functionality
    ' 12/05/2021 .nn DAEB Displays a smaller size icon at the cursor position when a drag from the dock is underway.
    If dragFromDockOperating = True Then
        updateDisplayFromDictionary collLargeIcons, vbNullString, dragImageToDisplay, (apiMouse.x - iconSizeLargePxls / 2), (apiMouse.y - iconSizeLargePxls / 2), (iconSizeLargePxls * 0.75), (iconSizeLargePxls * 0.75)
    End If
    
    Call updateGDIPlus
    
'    If debugflg = 1 Then
'       DrawTheText "animateTimer.Enabled " & animateTimer.Enabled, 200, 50, 300, rDFontName, Val(Abs(rDFontSize))
'        DrawTheText "bounceHeight " & bounceHeight, 580, 50, 300, rDFontName, Val(Abs(rDFontSize))
'    End If
   On Error GoTo 0
   Exit Sub

sequentialBubbleAnimation_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure sequentialBubbleAnimation of Form dock"

End Sub


Private Sub determineDynamicIconRangeToAnimate(ByRef leftmostResizedIcon As Integer, ByRef rightmostResizedIcon As Integer)
    
    rDZoomWidth = 2 'override until the animation takes this into account
    If CBool(rDZoomWidth And 1) = False Then
        rDZoomWidth = rDZoomWidth + 1  ' must be 3,5,7,9 so convert to an odd number
    End If
     
    ' what is the group size? extract the index of the group and calculate the leftmost member
    leftmostResizedIcon = iconIndex - (rDZoomWidth - 1) / 2 '
    rightmostResizedIcon = iconIndex + (rDZoomWidth - 1) / 2
End Sub
Private Sub storeCurrentIconPositions(useloop)
        
        iconStoreLeftPixels(useloop) = Int(iconPosLeftPxls)
        iconStoreRightPixels(useloop) = Int(iconStoreLeftPixels(useloop) + iconWidthPxls) ' 01/06/2021 DAEB frmMain.frm Added to capture the right X co-ords of each icon
        iconStoreTopPixels(useloop) = iconCurrentTopPxls ' 01/06/2021 DAEB frmMain.frm Added to capture the top Y co-ords of each icon
        'iconStoreBottomPixels(useloop) =' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
End Sub

Private Sub sizeDockPositionZero(ByVal useloop As Integer, ByRef showsmall As Boolean)
                
        If useloop = 0 Then 'small icons to the left shown in small mode
            iconHeightPxls = iconSizeSmallPxls
            iconWidthPxls = iconSizeSmallPxls

            If dockPosition = vbBottom Then
                
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) + xAxisModifier
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls + iconSizeLargePxls)) + xAxisModifier ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) - xAxisModifier
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls + iconSizeLargePxls)) - xAxisModifier ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                Else
                    ' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
                    iconCurrentTopPxls = dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls
                    iconCurrentBottomPxls = dockDrawingPositionPxls + iconSizeLargePxls ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                End If
            End If
            
            If dockPosition = vbtop Then
                
                ' NOTE: everything is inverted...
                
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) - xAxisModifier '.nn added the slidein/out
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls)) + xAxisModifier  ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) + xAxisModifier
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls)) + xAxisModifier  ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                Else
                    iconCurrentTopPxls = dockDrawingPositionPxls '.48 DAEB 01/04/2021 frmMain.frm  removed the vertical adjustment already applied to iconCurrentTopPxls
                End If
            End If

            'If dockPosition = vbRight Then iconPosLeftPxls = iconLeftmostPointPxls + iconSizeLargePxls - iconSizeSmallPxls
            showsmall = True
            expandedDockWidth = expandedDockWidth + iconWidthPxls
        End If
End Sub


Private Sub sizeEachSmallIconToLeft(ByVal useloop As Integer, ByVal leftmostResizedIcon As Integer, ByRef showsmall As Boolean)
                
        If useloop < leftmostResizedIcon Then  'small icons to the left shown in small mode
            iconHeightPxls = iconSizeSmallPxls
            iconWidthPxls = iconSizeSmallPxls

            If dockPosition = vbBottom Then
                
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) + xAxisModifier
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls + iconSizeLargePxls)) + xAxisModifier ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) - xAxisModifier
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls + iconSizeLargePxls)) - xAxisModifier ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                Else
                    ' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
                    iconCurrentTopPxls = dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls
                    iconCurrentBottomPxls = dockDrawingPositionPxls + iconSizeLargePxls ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                End If
            End If
            
            If dockPosition = vbtop Then
                
                ' NOTE: everything is inverted...
                
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) - xAxisModifier '.nn added the slidein/out
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls)) + xAxisModifier  ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) + xAxisModifier
                    iconCurrentBottomPxls = ((dockDrawingPositionPxls)) + xAxisModifier  ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
                Else
                    iconCurrentTopPxls = dockDrawingPositionPxls '.48 DAEB 01/04/2021 frmMain.frm  removed the vertical adjustment already applied to iconCurrentTopPxls
                End If
            End If

            'If dockPosition = vbRight Then iconPosLeftPxls = iconLeftmostPointPxls + iconSizeLargePxls - iconSizeSmallPxls
            showsmall = True
            expandedDockWidth = expandedDockWidth + iconWidthPxls
        End If
End Sub

Private Sub sizeEachResizedIconToLeft(ByVal useloop As Integer, ByVal leftmostResizedIcon As Integer, ByRef showsmall As Boolean)

    Dim useloop2 As Integer: useloop2 = 0
'    Dim resizeProportion As Double: resizeProportion = 0
        
    ' the group of icons to the left of the main icon, resized dynamically
    If useloop < iconIndex And useloop >= leftmostResizedIcon Then
       For useloop2 = leftmostResizedIcon To (iconIndex - 1)
'            resizeProportion = 1 / ((rDZoomWidth - 1) / 2) ' 33, .50 &c
'            resizeProportion = 1 ' override
            
'            If useloop = 0 Then
'                iconHeightPxls = iconSizeSmallPxls - (dynamicSizeModifierPxls * resizeProportion) 'dynamicSizeModifierPxls is the difference from the midpoint of the current icon in the x axis
'                iconWidthPxls = iconSizeSmallPxls - (dynamicSizeModifierPxls * resizeProportion)
'            Else
                iconHeightPxls = iconSizeLargePxls - (dynamicSizeModifierPxls) '* resizeProportion) 'dynamicSizeModifierPxls is the difference from the midpoint of the current icon in the x axis
                iconWidthPxls = iconSizeLargePxls - (dynamicSizeModifierPxls) ' * resizeProportion)
'            End If
              
             If dockPosition = vbBottom Then
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = (dockDrawingPositionPxls + dynamicSizeModifierPxls) + xAxisModifier '.nn
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = (dockDrawingPositionPxls + dynamicSizeModifierPxls) - xAxisModifier '.nn
                Else
                    iconCurrentTopPxls = (dockDrawingPositionPxls + dynamicSizeModifierPxls) '.nn
                End If
             End If
             
            If dockPosition = vbtop Then ' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) - xAxisModifier
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) + xAxisModifier
                Else
                    iconCurrentTopPxls = dockDrawingPositionPxls
                End If
            End If
            
             'If dockPosition = vbRight Then iconPosLeftPxls = iconLeftmostPointPxls + iconSizeLargePxls - (iconSizeLargePxls - dynamicSizeModifierPxls)
            
             expandedDockWidth = expandedDockWidth + iconWidthPxls
             showsmall = False

        Next useloop2
    End If
End Sub


Private Sub sizeFullSizeIcon(ByVal useloop As Integer, ByRef showsmall As Boolean)
         ' the main fullsize icon
                     
        If useloop = iconIndex Then

'            If useloop = 0 Then
'                iconHeightPxls = iconSizeSmallPxls
'                iconWidthPxls = iconSizeSmallPxls
'            Else
                iconHeightPxls = iconSizeLargePxls
                iconWidthPxls = iconSizeLargePxls
'            End If

'            iconHeightPxls = iconHeightPxls - iconGrowthModifier
'            If iconHeightPxls >= iconSizeLargePxls Then
'                iconGrowthModifier = 0
'                iconGrowthTimer.Enabled = False
'            End If
'            iconWidthPxls = iconHeightPxls
            
            If dockPosition = vbBottom Then
                
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = dockDrawingPositionPxls + xAxisModifier
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = dockDrawingPositionPxls - xAxisModifier
                Else
                    ' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
                    iconCurrentTopPxls = dockDrawingPositionPxls
                End If
                
                If selectedIconIndex = iconIndex Then
                    iconCurrentTopPxls = iconCurrentTopPxls - bounceHeight
                End If
            End If
            
            If dockPosition = vbtop Then ' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
                
                '.nn added the slidein/out
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) - xAxisModifier
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) + xAxisModifier
                Else
                    iconCurrentTopPxls = dockDrawingPositionPxls
                End If
                
                If selectedIconIndex = iconIndex Then iconCurrentTopPxls = dockDrawingPositionPxls + bounceHeight
            End If
        
            'If dockPosition = vbRight Then iconPosLeftPxls = iconLeftmostPointPxls + iconSizeLargePxls - iconSizeLargePxls
'            If useloop = 0 Then
                showsmall = False
'            Else
'                showsmall = False
'            End If
            expandedDockWidth = expandedDockWidth + (iconWidthPxls)
    End If
End Sub
Private Sub sizeEachResizedIconToRight(ByVal useloop As Integer, ByVal rightmostResizedIcon As Integer, ByRef showsmall As Boolean)
    If useloop > iconIndex And useloop <= rightmostResizedIcon Then

    
        iconHeightPxls = iconSizeSmallPxls + dynamicSizeModifierPxls
        iconWidthPxls = iconSizeSmallPxls + dynamicSizeModifierPxls
    
        If dockPosition = vbBottom Then
            
            If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                iconCurrentTopPxls = (dockDrawingPositionPxls + iconSizeLargePxls - (iconSizeSmallPxls + dynamicSizeModifierPxls)) + xAxisModifier
            ElseIf autoSlideMode = "slidein" Then
                iconCurrentTopPxls = (dockDrawingPositionPxls + iconSizeLargePxls - (iconSizeSmallPxls + dynamicSizeModifierPxls)) - xAxisModifier
            Else
                ' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
                iconCurrentTopPxls = (dockDrawingPositionPxls + iconSizeLargePxls - (iconSizeSmallPxls + dynamicSizeModifierPxls))
            End If
            'If selectedIconIndex = iconIndex + 1 Then iconCurrentTopPxls = iconCurrentTopPxls - bounceHeight
        End If
        
        If dockPosition = vbtop Then ' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
            
            '.nn added the slidein/out
            If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) - xAxisModifier
            ElseIf autoSlideMode = "slidein" Then
                iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) + xAxisModifier
            Else
                iconCurrentTopPxls = dockDrawingPositionPxls
            End If
        End If
        
        'If dockPosition = vbRight Then iconPosLeftPxls = iconLeftmostPointPxls + iconSizeLargePxls - (iconSizeSmallPxls + dynamicSizeModifierPxls)
        expandedDockWidth = expandedDockWidth + iconWidthPxls
        showsmall = False
    End If
End Sub

Private Sub sizeEachSmallIconToRight(ByVal useloop As Integer, ByVal rightmostResizedIcon As Integer, ByRef showsmall As Boolean)
            
        If useloop > rightmostResizedIcon Then 'small icons to the right

            iconHeightPxls = iconSizeSmallPxls
            iconWidthPxls = iconSizeSmallPxls

            If dockPosition = vbBottom Then
                
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) + xAxisModifier
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) - xAxisModifier
                Else
                    ' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls))
                End If
            End If
            
            If dockPosition = vbtop Then ' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
                
                '.nn added the slidein/out
                If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) - xAxisModifier
                ElseIf autoSlideMode = "slidein" Then
                    iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeSmallPxls)) + xAxisModifier
                Else
                    iconCurrentTopPxls = dockDrawingPositionPxls
                End If
            End If

            'If dockPosition = vbRight Then iconPosLeftPxls = iconLeftmostPointPxls + iconSizeLargePxls - iconSizeSmallPxls
            expandedDockWidth = expandedDockWidth + iconWidthPxls
            showsmall = True
        End If
End Sub


'---------------------------------------------------------------------------------------
' Procedure : showSmallIcon
' Author    : beededea
' Date      : 14/01/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub showSmallIcon(ByVal useloop As Integer)
    Dim thiskey As String: thiskey = ""
    Dim thisDisabled As String: thisDisabled = ""
    
    '   check the recently disabled flag and display the transparent version instead
    If disabledArray(useloop) = 1 Then
        thiskey = dictionaryLocationArray(useloop) & "TransparentImg" & LTrim$(Str$(iconSizeSmallPxls))
    Else
        thiskey = dictionaryLocationArray(useloop) & "ResizedImg" & LTrim$(Str$(iconSizeSmallPxls))
    End If
    
    updateDisplayFromDictionary collSmallIcons, vbNullString, thiskey, (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
    If rDShowRunning = "1" Then
        If (processCheckArray(useloop) = True Or explorerCheckArray(useloop) = True) Then
            'updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls)
            If dockPosition = vbBottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls) '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
            If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls)
         End If
    End If
    ' .87 DAEB 08/12/2022 frmMain.frm Target command validity flag places a red X on the icon
    If targetExistsArray(useloop) = 1 Then ' redxResizedImg64
        If dockPosition = vbBottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "redxResizedImg64", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls / 2), (iconSizeSmallPxls / 2) '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
        If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "redxResizedImg64", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls + (iconSizeSmallPxls / 5)), (iconSizeSmallPxls / 2), (iconSizeSmallPxls / 2)
    End If
End Sub

Private Sub showLargeIconTypes(ByVal useloop As Integer)
    Dim thiskey As String: thiskey = ""
    
    '   check the recently disabled flag and display the transparent version instead
    If disabledArray(useloop) = 1 Then
        thiskey = dictionaryLocationArray(useloop) & "TransparentImg" & LTrim$(Str$(iconSizeLargePxls))
    Else
        thiskey = dictionaryLocationArray(useloop) & "ResizedImg" & LTrim$(Str$(iconSizeLargePxls))
    End If
        
    
    ' add a 1% opaque background to the expanded image to catch click-throughs, blankresizedImg128 is the key name
    updateDisplayFromDictionary collLargeIcons, vbNullString, "blankresizedImg128", (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconWidthPxls)

    ' Added a faded red background when dragged .56 DAEB 19/04/2021 frmMain.frm Added a faded red background to the current image when the drag and drop is in operation.
    If dragToDockOperating = True And useloop = iconIndex Then
        updateDisplayFromDictionary collLargeIcons, vbNullString, "redresizedImg256", (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
    End If
    
    ' show the icon image itself
    If selectedIconIndex = useloop And blankClickEvent = True Then
            updateDisplayFromDictionary collLargeIcons, vbNullString, "blankresizedImg128", (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
    Else
            updateDisplayFromDictionary collLargeIcons, vbNullString, thiskey, (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
    End If
                         
    ' a small rotating hourglass for 'running' actions ' .63 DAEB 29/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
    If dragToDockOperating = True And useloop = iconIndex Then
        If hourglassimage = vbNullString Then hourglassimage = "hourglass1resizedImg128"
        updateDisplayFromDictionary collLargeIcons, vbNullString, hourglassimage, (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
    End If
    
    ' add the small white cog to indicate a running process
    If rDShowRunning = "1" Then
        If (processCheckArray(useloop) = True Or explorerCheckArray(useloop) = True) Then
            If dockPosition = vbBottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeLargePxls / 2) - 3), (iconCurrentTopPxls - (iconSizeLargePxls / 5)), (iconWidthPxls), (iconHeightPxls) '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
            If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeLargePxls / 2) - 3), (iconCurrentTopPxls + (iconSizeLargePxls / 2)), (iconWidthPxls), (iconHeightPxls)
        End If
    End If
    
    ' add a red X for invalid command ' .87 DAEB 08/12/2022 frmMain.frm Target command validity flag places a red X on the icon
    If targetExistsArray(useloop) = 1 Then ' redxResizedImg64
            If dockPosition = vbBottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "redxResizedImg64", (iconPosLeftPxls + (iconSizeLargePxls / 2) - 3), (iconCurrentTopPxls - (iconSizeLargePxls / 5)), (iconWidthPxls / 2), (iconHeightPxls / 2) '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
            If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "redxResizedImg64", (iconPosLeftPxls + (iconSizeLargePxls / 2) - 3), (iconCurrentTopPxls + (iconSizeLargePxls / 5)), (iconWidthPxls / 2), (iconHeightPxls / 2)
    End If
End Sub

Private Sub drawTextAboveIcon(ByVal useloop As Integer, ByVal textWidth As Integer)
        
        If useloop = iconIndex Then ' this section is located here to ensure the text is above the icon image
            'now draw the icon text above the selected icon
            If rDHideLabels = "0" Then
                
                If Not namesListArray(iconIndex) = "Separator" Then
                    textWidth = iconSizeLargePxls
                    If dockPosition = vbtop Then
                        DrawTheText namesListArray(iconIndex), iconCurrentTopPxls + iconSizeLargePxls, iconPosLeftPxls, textWidth, rDFontName, Val(Abs(rDFontSize))
                    ElseIf dockPosition = vbBottom Then
                        ' puts the text 10% +10 px above the icon
                        DrawTheText namesListArray(iconIndex), (screenHorizontalEdge - ((iconSizeLargePxls / 10) + 40)) - iconSizeLargePxls, iconPosLeftPxls, textWidth, rDFontName, Val(Abs(rDFontSize))
                        'DrawTheText textToDisplay, (screenHorizontalEdge - ((iconSizeLargePxls / 10) + 40)) - iconSizeLargePxls, iconPosLeftPxls, textWidth, rDFontName, Val(Abs(rDFontSize))
                    End If
                End If
            End If
        End If


End Sub

'---------------------------------------------------------------------------------------
' Procedure : drawDockByCursorEntryPosition
' Author    : beededea
' Date      : 01/05/2020
' Purpose   : draws the icons once starting with the current MAIN icon and then positioning the others to the right or left of this first entry point icon.
'             This runs just ONCE before each animation period. The main function is to determine the leftmost position of the dock
'             in relation to the current icon highlighted. This is important as when one of the left or rightmost icons is selected
'             a sequential drawing of the icons might place the chosen icon off screen. We want to avoid that by focussing on the main icon.
'---------------------------------------------------------------------------------------
'
Private Sub drawDockByCursorEntryPosition()
    Dim showsmall As Boolean: showsmall = False
    Dim textWidth As Integer: textWidth = 0
    Dim leftmostResizedIcon As Integer: leftmostResizedIcon = 0
    Dim rightmostResizedIcon As Integer: rightmostResizedIcon = 0
    
    Dim useloop As Integer: useloop = 0
    Dim rightIconWidthPxls As Integer: rightIconWidthPxls = 0
    Dim mainIconWidthPxls  As Integer: mainIconWidthPxls = 0
    Dim thiskey As String: thiskey = vbNullString
    Dim dockSkinStart As Long: dockSkinStart = 0
    Dim dockSkinWidth As Long: dockSkinWidth = 0
    Dim offsetPxls As Integer: offsetPxls = 0
    Dim offsetProportion As Double: offsetProportion = 0
    
    On Error GoTo drawDockByCursorEntryPosition_Error
    'If debugflg = 1 Then debugLog "%drawDockByCursorEntryPosition"
    
    ' the small icon dock placement is inevitably incorrect at this point as the left most position of the dock, icon one,
    ' has not yet been calculated. However the code to theme the dock needs to be placed here as it is drawn first before the dock icons are drawn.
    ' this will be replaced by an animation timer that redraws the dock from the old to the current size.
    
    DeleteObject bmpMemory ' the bitmap deleted
    Call readyGDIPlus ' clears the whole previously drawn image section and the animation continues
    
    If rDtheme <> vbNullString And rDtheme <> "Blank" Then Call applyThemeSkinToDock(dockSkinStart, dockSkinWidth)
    
    Call determineDynamicIconRangeToAnimate(leftmostResizedIcon, rightmostResizedIcon)

    ' the main fullsize icon
    Call sizeAndShowFullSizeIconByCEP(iconIndex, showsmall)
    mainIconWidthPxls = iconWidthPxls
    
    ' what should be the group of icons to the left of the main icon, resized dynamically, currently caters only for one
    Call sizeAndShowSingleMainIconToLeftByCEP(iconIndex, leftmostResizedIcon, showsmall)

    ' what should be the group of icons to the right of the main icon, resized dynamically, currently caters only for one
    Call sizeAndShowSingleMainIconToRightByCEP(iconIndex, rightmostResizedIcon, mainIconWidthPxls, showsmall)
    rightIconWidthPxls = iconWidthPxls

    ' small icons to the left shown in small mode
    Call sizeAndShowSmallIconsToLeftByCEP(iconIndex, leftmostResizedIcon, showsmall)

    ' small icons to the right shown in small mode
    Call sizeAndShowSmallIconsToRightByCEP(iconIndex, rightmostResizedIcon, rightIconWidthPxls, showsmall)
   
    Call updateGDIPlus
   
   On Error GoTo 0
   Exit Sub

drawDockByCursorEntryPosition_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure drawDockByCursorEntryPosition of Form dock"
End Sub
Private Sub sizeAndShowFullSizeIconByCEP(ByVal thisIconIndex As Integer, ByRef showsmall As Boolean)

    Dim mainIconWidthPxls  As Integer: mainIconWidthPxls = 0
    Dim textWidth As Integer: textWidth = 0

    '===================
    ' the main fullsize icon
    '==================
    iconHeightPxls = iconSizeLargePxls
    iconWidthPxls = iconSizeLargePxls
    mainIconWidthPxls = iconWidthPxls
    
    Call sizeFullSizeIcon(thisIconIndex, showsmall)

    ' the following two lines  position the main icon initially to the main icon's leftmost start point when small
    ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    iconPosLeftPxls = iconStoreLeftPixels(iconIndex)
    
    Call storeCurrentIconPositions(thisIconIndex)
    
    ' display the icon in the dock
    Call showLargeIconTypes(thisIconIndex) ' display the larger size icon or the

    'now draw the icon text above the selected icon
    Call drawTextAboveIcon(thisIconIndex, textWidth)
    
End Sub
Private Sub sizeAndShowSingleMainIconToLeftByCEP(ByVal thisIconIndex As Integer, ByVal leftmostResizedIcon As Integer, ByRef showsmall As Boolean)

    '===================
    ' one icon to the left, resized dynamically
    '==================
    If thisIconIndex > 0 Then 'check it isn't trying to animate a non-existent icon before the first icon
        
        ' the icon to the left is currently sized full as the other on the right hand side is sized small.
        iconHeightPxls = iconSizeLargePxls
        iconWidthPxls = iconSizeLargePxls

        If dockPosition = vbBottom Then
            iconCurrentTopPxls = dockDrawingPositionPxls
        End If

        If dockPosition = vbtop Then
           iconCurrentTopPxls = dockDrawingPositionPxls
        End If

        iconPosLeftPxls = iconPosLeftPxls - iconWidthPxls
        
        Call storeCurrentIconPositions(thisIconIndex - 1)
        
        ' display the icon in the dock
        Call showLargeIconTypes(thisIconIndex - 1)
    End If

     ' iconLeftmostPointPxls = iconPosLeftPxls
End Sub

Private Sub sizeAndShowSingleMainIconToRightByCEP(ByVal thisIconIndex As Integer, ByVal rightmostResizedIcon As Integer, ByVal mainIconWidthPxls As Integer, ByRef showsmall As Boolean)
    Dim rightIconWidthPxls As Integer: rightIconWidthPxls = 0

    '===================
    ' one icon to the right, resized dynamically
    '==================
   If thisIconIndex <= rightmostResizedIcon And thisIconIndex < rdIconMaximum Then  '    If iconIndex > 0 Then 'check it isn't trying to animate a non-existent icon before the first icon
        
        ' the icon to the left is currently sized in small mode as the other on the left hand side is sized in full.
        iconHeightPxls = iconSizeSmallPxls
        iconWidthPxls = iconSizeSmallPxls

        rightIconWidthPxls = iconWidthPxls
         
        If dockPosition = vbBottom Then
            iconCurrentTopPxls = dockDrawingPositionPxls + iconSizeLargePxls - (iconSizeSmallPxls) '.nn removal of dynamicSizeModifierPxls
        End If

        If dockPosition = vbtop Then ' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
            iconCurrentTopPxls = dockDrawingPositionPxls
        End If
        
        iconPosLeftPxls = (iconStoreLeftPixels(thisIconIndex)) + mainIconWidthPxls

        Call storeCurrentIconPositions(thisIconIndex + 1)

        Call showLargeIconTypes(thisIconIndex + 1)

    End If
End Sub

Private Sub sizeAndShowSmallIconsToLeftByCEP(ByVal thisIconIndex As Integer, ByRef leftmostResizedIcon As Integer, ByRef showsmall As Boolean)
    Dim leftLoop As Integer: leftLoop = 0
    Dim thiskey As String: thiskey = vbNullString

    ' all icons to the left
    '==================
    If thisIconIndex > 0 Then 'check it isn't trying to animate a non-existent icon before the first icon
        ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
        iconPosLeftPxls = iconStoreLeftPixels(thisIconIndex - 1)

        For leftLoop = thisIconIndex - 2 To 0 Step -1
'            iconHeightPxls = iconSizeSmallPxls
'            iconWidthPxls = iconSizeSmallPxls
'
'            If dockPosition = vbbottom Then
'                ' .46 DAEB 01/04/2021 frmMain.frm Ensured that there is a line to calculate iconCurrentTopPxls now that autoSlideMode is now undefined at startup
'                iconCurrentTopPxls = dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls
'        ' .50 DAEB 01/04/2021 frmMain.frm Pruned all the redundant code for positioniong according to the slideIn/Out state, not done here
'            End If
'
'            If dockPosition = vbtop Then ' .48 DAEB 01/04/2021 frmMain.frm removed the vertical adjustment already applied to iconCurrentTopPxls
'                iconCurrentTopPxls = dockDrawingPositionPxls
'            End If

            ' small icons to the left shown in small mode, we only need to do this on the first small icon
            If leftLoop = 0 Then Call sizeEachSmallIconToLeft(leftLoop, leftmostResizedIcon, showsmall)

            iconPosLeftPxls = iconPosLeftPxls - iconWidthPxls
'            iconStoreLeftPixels(leftLoop) = iconPosLeftPxls ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
'            iconStoreRightPixels(leftLoop) = iconStoreLeftPixels(leftLoop) + iconWidthPxls ' 01/06/2021 DAEB frmMain.frm Added to capture the right X co-ords of each icon             ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
'            iconStoreTopPixels(leftLoop) = iconCurrentTopPxls ' 01/06/2021 DAEB frmMain.frm Added to capture the top Y co-ords of each icon

            Call storeCurrentIconPositions(leftLoop)

            Call showSmallIcon(leftLoop)
        Next leftLoop
    End If
End Sub
Private Sub sizeAndShowSmallIconsToRightByCEP(ByVal thisIconIndex As Integer, ByRef rightmostResizedIcon As Integer, ByRef rightIconWidthPxls As Integer, ByRef showsmall As Boolean)
    Dim rightLoop As Integer: rightLoop = 0
    Dim thiskey As String: thiskey = vbNullString
    '====================
    ' icons to the right
    '====================
    If thisIconIndex < rdIconMaximum Then   'check it isn't trying to animate a non-existent icon after the last icon

        ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
       iconPosLeftPxls = (iconStoreLeftPixels(iconIndex + 1)) + rightIconWidthPxls
       
       For rightLoop = thisIconIndex + 2 To iconArrayUpperBound

            Call sizeEachSmallIconToRight(rightLoop, rightmostResizedIcon, showsmall)

            iconPosLeftPxls = iconPosLeftPxls + iconWidthPxls
        
            Call storeCurrentIconPositions(rightLoop)

'            thiskey = rightLoop & "ResizedImg" & LTrim$(Str$(iconSizeSmallPxls))
'            updateDisplayFromDictionary collSmallIcons, vbNullString, thiskey, (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
'            If rDShowRunning = "1" Then
'                If processCheckArray(rightLoop) = True Then
'                    If dockPosition = vbbottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls) '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
'                    If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconSizeSmallPxls + (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls)
'                End If
'            End If
'            ' .87 DAEB 08/12/2022 frmMain.frm Target command validity flag places a red X on the icon
'            If targetExistsArray(rightLoop) = 1 Then  ' redxResizedImg64
'                    If dockPosition = vbbottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "redxResizedImg64", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls / 2), (iconSizeSmallPxls / 2) '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
'                    If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "redxResizedImg64", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconSizeSmallPxls + (iconSizeSmallPxls / 5)), (iconSizeSmallPxls / 2), (iconSizeSmallPxls / 2)
'            End If

            Call showSmallIcon(rightLoop)
            
        Next rightLoop
    End If

End Sub

'---------------------------------------------------------------------------------------
' Procedure : loadTheImageIntoGDIPlus
' Author    : beededea
' Date      : 18/06/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
'Private Sub loadTheImageIntoGDIPlus(ByVal iconIndexToShow As Single)
'    Dim thiskey As String: thiskey = vbNullString
'
'    On Error GoTo loadTheImageIntoGDIPlus_Error
'
'    thiskey = iconIndexToShow & "ResizedImg" & LTrim$(Str$(iconSizeLargePxls))
'    ' add a 1% opaque background to the expanded image to catch click-throughs
'    updateDisplayFromDictionary collLargeIcons, vbNullString, "blankresizedImg128", (iconPosLeftPxls), (iconCurrentTopPxls), (128), (128)
'    ' the current image itself
'    updateDisplayFromDictionary collLargeIcons, vbNullString, thiskey, (iconPosLeftPxls), (iconCurrentTopPxls), (iconWidthPxls), (iconHeightPxls)
'    If rDShowRunning = "1" Then
'        If processCheckArray(iconIndexToShow) = True Then
'            'updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeLargePxls / 2) - 3), (iconCurrentTopPxls - (iconSizeLargePxls / 5)), (iconSizeLargePxls), (iconSizeLargePxls)
'            If dockPosition = vbBottom Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconCurrentTopPxls - (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls)  '.69 DAEB 06/05/2021 frmMain.frm Draw the small cog in the right place for the vbtop position
'            If dockPosition = vbtop Then updateDisplayFromDictionary collLargeIcons, vbNullString, "tinycircleResizedImg128", (iconPosLeftPxls + (iconSizeSmallPxls / 2) - 3), (iconSizeSmallPxls + (iconSizeSmallPxls / 5)), (iconSizeSmallPxls), (iconSizeSmallPxls)
'        End If
'
'    End If
'
'   On Error GoTo 0
'   Exit Sub
'
'loadTheImageIntoGDIPlus_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure loadTheImageIntoGDIPlus of Form dock"
'
'End Sub
'---------------------------------------------------------------------------------------
' Procedure : drawTheLabel
' Author    : beededea
' Date      : 18/06/2020
' Purpose   : now draw the icon text above the selected icon
'---------------------------------------------------------------------------------------
'
Private Sub drawTheLabel(ByVal iconIndexToShow As Single)
    Dim textWidth As Integer: textWidth = 0
    
   On Error GoTo drawTheLabel_Error

    If rDHideLabels = "0" Then
        Dim textToDisplay As String
        textToDisplay = iconCurrentTopPxls
        If Not namesListArray(iconIndexToShow) = "Separator" Then
            textWidth = iconSizeLargePxls
            If dockPosition = vbtop Then
                'DrawTheText textToDisplay, iconCurrentTopPxls + iconSizeLargePxls, iconPosLeftPxls, textWidth, rDFontName, Val(Abs(rDFontSize))
                DrawTheText namesListArray(iconIndexToShow), iconCurrentTopPxls + iconSizeLargePxls, iconPosLeftPxls, textWidth, rDFontName, Val(Abs(rDFontSize))
            ElseIf dockPosition = vbBottom Then
                ' puts the text 10% +10 px above the icon
                ' .73 DAEB 11/05/2021 frmMain.frm  sngBottom renamed to screenHorizontalEdge
                DrawTheText namesListArray(iconIndexToShow), (screenHorizontalEdge - ((iconSizeLargePxls / 10) + 40)) - iconSizeLargePxls, iconPosLeftPxls, textWidth, rDFontName, Val(Abs(rDFontSize))
            End If
        End If
    End If

   On Error GoTo 0
   Exit Sub

drawTheLabel_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure drawTheLabel of Form dock"
    
End Sub

'---------------------------------------------------------------------------------------
' Procedure : runCommand
' Author    : beededea
' Date      : 19/09/2019
' Purpose   : this routine passes the user-defined command to execute to an 'execute' routine
'             dependent upon the type of command. Note this routine is executed on a timer
'---------------------------------------------------------------------------------------
' .53 DAEB 11/04/2021 frmMain.frm changed all occurrences of sCommand to thisCommand to attain more compatibility with rdIconConfigFrm menuRun_click
' .68 DAEB 05/05/2021 frmMain.frm cause the docksettings utility to reopen if it has already been initiated

Public Sub runCommand(ByVal runAction As String, ByVal commandOverride As String) ' added new parameter to allow override .68
    
    On Error GoTo runCommand_Error
    
    Dim testURL As String: testURL = vbNullString
    Dim validURL As Boolean: validURL = False
    Dim answer As VbMsgBoxResult: answer = vbNo
    Dim folderPath As String: folderPath = vbNullString
    Dim thisCommand As String: thisCommand = vbNullString
    Dim rmessage As String: rmessage = vbNullString ' .19 DAEB frmMain.frm 02/02/2021 added sArguments field to the confirmation dialog
    Dim userprof As String: userprof = vbNullString
    Dim intShowCmd As Integer: intShowCmd = 0
    Dim checki As Boolean: checki = False
    Dim arrStr() As String 'cannot initialise arrays in VB6
    Dim strCnt As Integer: strCnt = 0
    Dim suffix As String: suffix = vbNullString
    Dim listOfTypes As String: listOfTypes = vbNullString
    Dim useloop As Integer: useloop = 0

    'If debugflg = 1 Then debugLog "%runCommand"
    
    If sRunElevated = "1" Then
        userLevel = "runas"
    Else
        userLevel = "open"
    End If

    'by default read the selected icon's data and set the command to execute
    If commandOverride = vbNullString Then
        'Call readIconData(selectedIconIndex) '.nn DAEB 12/05/2021 frmMain.frm Moved from the runtimer as some of the data is required before the run begins
        thisCommand = sCommand
    Else
        ' .68 DAEB 05/05/2021 frmMain.frm cause the docksettings utility to reopen if it has already been initiated
        
        thisCommand = commandOverride 'Not using the icon in the dock but the over-ridden command provided as a parameter
        ' therefore we must zero all the parameters, set from the last icon read, to empty values
        Call zeroAllIconCharacteristics
    End If
    
    If sIsSeparator = "1" Then
        Exit Sub
    End If
    
    intShowCmd = Val(sShowCmd) 'View mode application window (normal=1, hide=0, 2=Min, 3=max, 4=restore, 5=current, 7=min/inactive, 10=default)
    If sShowCmd = "0" Then
        intShowCmd = 1
    End If

'    hTray = FindWindow_NotifyTray() ' .33 DAEB 03/03/2021 frmMain.frm New systray code from Dragokas
'    hOverflow = FindWindow_NotifyOverflow() ' .33 DAEB 03/03/2021 frmMain.frm New systray code from Dragokas

    ' bring an already running process to the fore and then exit
    If rDOpenRunning = "1" And forceRunNewAppFlag = False Or sOpenRunning = "1" Then

    ' when the index is 999 this means that the cursor has left the area of the selected icon and is now 'browsing' the
    ' rest of the dock. Normally, this could not happen and would not matter - but for the additional second app that has
    ' a delayed start it is a normal condition. In this case we do not want to attempt to run an already-opened application so
    ' we bypass the process checking of the array and do not add this application to the list of running apps.
    
        If selectedIconIndex <> 999 Then
            
            checki = checkWindowIconisationZorder(thisCommand, selectedIconIndex, commandOverride, runAction)
            If checki = True Then Exit Sub
            
            'Exit Sub ' if the app can be switched to successfully then do nothing else
        End If ' 999
    End If ' rDOpenRunning = "1"
    
    forceRunNewAppFlag = False
    
    If sDisabled = "1" Then
        rmessage = "This command is currently disabled " & vbCr & thisCommand
        If sArguments <> vbNullString Then rmessage = rmessage & " " & sArguments
        'answer = MsgBox(rmessage, vbOKOnly)
        answer = msgBoxA(rmessage, vbOKOnly, "SteamyDock Confirmation Message", False)

        Exit Sub
    End If
    
    ' run the selected program
    If sUseDialog = "1" Then
        ' .19 DAEB frmMain.frm 02/02/2021 added sArguments field to the confirmation dialog
        ' .21 DAEB frmMain.frm 07/02/2021 slight improvement to the confirmation dialog
        rmessage = "Are you sure you wish to run the following command - " & sTitle & "?" & vbCr & thisCommand
        If sArguments <> vbNullString Then rmessage = rmessage & " " & sArguments
        ' must be a modal pop up
        'answer = MsgBox(rmessage, vbYesNo)
        answer = msgBoxA(rmessage, vbYesNo, "SteamyDock Confirmation Message", False)
        If answer = vbNo Then
            Exit Sub
        End If
    End If
    
    ' contains "shutdown"
    If InStr(thisCommand, "shutdown.exe") <> 0 Then
        Call shellExecuteWithDialog(userLevel, Environ$("windir") & "\SYSTEM32\shutdown", sArguments, 0&, intShowCmd)
        Exit Sub
    End If
    
    ' is the target a URL?
    testURL = Left$(thisCommand, 3)
    If testURL = "htt" Or testURL = "www" Then
        validURL = True
        Call shellExecuteWithDialog(userLevel, thisCommand, vbNullString, vbNullString, intShowCmd)
        Exit Sub
    End If

    ' control panel
    If thisCommand = "control" Then
        Call shellCommand("rundll32.exe shell32.dll,Control_RunDLL", intShowCmd) 'change to call new function as part of .16
        Exit Sub
    End If

    ' Rocketdock quit compatibility
    If thisCommand = "[Quit]" Then
        Call dock.shutdwnGDI
        End
    End If
    ' Rocketdock settings compatibility
    If thisCommand = "[Settings]" Then
        Call menuForm.mnuDockSettings_Click
        Exit Sub
    End If
    ' Rocketdock settings compatibility
    If thisCommand = "[Icons]" Then
        Call menuForm.mnuIconSettings_Click_Event
        Exit Sub
    End If
    
    ' .35 DAEB 03/03/2021 frmMain.frm check whether the prefix command required to access a Windows class ID is present
    If InStr(thisCommand, "explorer.exe /e,::{") Then
        Call shellCommand(thisCommand, intShowCmd, "folder")
        Exit Sub
    End If
    
    ' .36 DAEB 03/03/2021 frmMain.frm check whether the prefix is present that indicates a Windows class ID is present
    ' this allows SD to act like Rocketdock which only needs the CLSID to operate eg. ::{7be9d83c-a729-4d97-b5a7-1b7313c39e0a}
    If InStr(thisCommand, "::{") Then
        Call shellCommand("explorer.exe /e," & thisCommand, intShowCmd, "folder")
        Exit Sub
    End If
    
'    If InStr(inputData, "[defaultDockLocation]") Then
'        s = Replace(inputData, "[defaultDockLocation]", sdAppPath)
'    End If
    
    If InStr(thisCommand, "%userprofile%") Then
        userprof = Environ$("USERPROFILE")
        thisCommand = Replace(thisCommand, "%userprofile%", userprof)
    End If
    
    ' .91 DAEB 08/12/2022 frmMain.frm SteamyDock responds to %systemroot% environment variables during runCommand
    If InStr(thisCommand, "%systemroot%") Then
        userprof = Environ$("SYSTEMROOT")
        thisCommand = Replace(thisCommand, "%systemroot%", userprof)
    End If
    
    ' recycle bin
    If thisCommand = "[RecycleBin]" Then
        Call shellCommand("explorer.exe /e,::{645ff040-5081-101b-9f08-00aa002f954e}", intShowCmd, "folder")
        Exit Sub
    End If
    
    ' cpanel files with cpl suffix can be called from the command line
    If InStr(thisCommand, ".cpl") <> 0 Then
        Call shellCommand("rundll32.exe shell32.dll,Control_RunDLL " & thisCommand, intShowCmd)
        Exit Sub
    End If
     
    ' admin tools with msc suffix (management console controls) can be called from the command line
    If InStr(thisCommand, ".msc") <> 0 Then
        If FExists(thisCommand) Then ' if the file exists and is valid - run it
            Call shellExecuteWithDialog(userLevel, thisCommand, sArguments, vbNullString, intShowCmd)
            Exit Sub ' .89 DAEB 08/12/2022 frmMain.frm Fixed duplicate run of .msc files.
        Else
            folderPath = getFolderNameFromPath(thisCommand)  ' extract the default folder from the full path

            ' .45 DAEB 01/04/2021 frmMain.frm Changed the logic to remove the code around a folder path existing...
            If Not DirExists(folderPath) Then
                 ' if there is no folder path provided then attempt it on its own hoping that the windows PATH will find it
                On Error GoTo tryMSCFullPAth ' apologies for this GOTO - testing to see if it is in the path, then it will run.
                Call shellExecuteWithDialog(userLevel, thisCommand, sArguments, sWorkingDirectory, intShowCmd)
                Exit Sub
tryMSCFullPAth:
                On Error GoTo runCommand_Error
                ' now run it in the system32 folder
                Call shellExecuteWithDialog(userLevel, Environ$("windir") & "\SYSTEM32\" & getFileNameFromPath(thisCommand), sArguments, sWorkingDirectory, intShowCmd)
                Exit Sub
            End If

        End If
    End If
    

    ' task manager
    If thisCommand = "taskmgr" Then
        Call shellExecuteWithDialog(userLevel, Environ$("windir") & "\SYSTEM32\taskmgr", 0&, 0&, intShowCmd)
        Exit Sub
    End If
    
    ' RocketdockEnhancedSettings.exe (the .NET version of this program)
    If getFileNameFromPath(thisCommand) = "RocketdockEnhancedSettings.exe" Then
        Call shellExecuteWithDialog(userLevel, thisCommand, sArguments, sWorkingDirectory, intShowCmd)
         Exit Sub
    End If

    ' bat files
    If ExtractSuffixWithDot(UCase$(thisCommand)) = ".BAT" Then
        'If debugflg = 1 Then debugLog "ShellExecute " & thisCommand
        thisCommand = """" & sCommand & """" ' put the command in quotes so it handles spaces in the path
        'folderPath = getFolderNameFromPath(thisCommand)  ' extract the default folder from the batch full path
        If FExists(sCommand) Then
            Call shellExecuteWithDialog(userLevel, thisCommand, sArguments, sWorkingDirectory, intShowCmd)
        Else
            ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
            MessageBox Me.hwnd, thisCommand & " - this batch file does not exist", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
            ' MsgBox (thisCommand & " - this batch file does not exist")
        End If
        Exit Sub
    End If
    
    'anything else remaining
    If FExists(thisCommand) Then ' checks the current filename for the named target
        'If debugflg = 1 Then debugLog "ShellExecute " & thisCommand
        If sWorkingDirectory <> vbNullString Then
            Call shellExecuteWithDialog(userLevel, thisCommand, sArguments, sWorkingDirectory, intShowCmd)
            Exit Sub
        Else
            Call shellExecuteWithDialog(userLevel, thisCommand, sArguments, vbNullString, intShowCmd)
            Exit Sub
        End If
    ElseIf DirExists(thisCommand) Then ' checks if a folder of the same name exists in the current folder
        Call shellExecuteWithDialog("open", thisCommand, sArguments, sWorkingDirectory, intShowCmd, "folder")
        Exit Sub
    End If
    
    ' items with no suffix not found in default folder - look in system32
    suffix = LCase(ExtractSuffixWithDot(thisCommand))
    If suffix = "" Then
        listOfTypes = ".exe|.msc|.cpl|.lnk|.bat"
        arrStr = Split(listOfTypes, "|")
        strCnt = UBound(arrStr) + 1
        
        For useloop = 0 To strCnt - 1
            userprof = Environ$("SYSTEMROOT") & "\system32\" & thisCommand & arrStr(useloop)
            If FExists(userprof) Then ' ' checks the windows system 32 folder for the named target
                Call shellExecuteWithDialog(userLevel, userprof, sArguments, sWorkingDirectory, intShowCmd)
                Exit Sub
            ElseIf validURL = False Then
                ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
                MessageBox Me.hwnd, thisCommand & " - That isn't valid as a target file or a folder, or it doesn't exist - so SteamyDock can't run it.", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
            End If
        Next useloop
    End If
    
    On Error GoTo 0
    Exit Sub

runCommand_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure runCommand of Form dock"
End Sub



'---------------------------------------------------------------------------------------
' Procedure : shellExecuteWithDialog
' Author    : beededea
' Date      : 31/01/2021
' Purpose   : handler for shellexecute allowing a subsequent dialog to be inititated
'---------------------------------------------------------------------------------------
'
Private Sub shellExecuteWithDialog(ByRef userLevel As String, ByVal sCommand As String, ByVal sArguments As String, ByVal sWorkingDirectory As String, ByVal windowState As Integer, Optional ByRef targetType As String = "none")

    Dim ans As VbMsgBoxResult: ans = vbNo
    
    On Error GoTo shellExecuteWithDialog_Error
   
   
   If windowState = 0 Then windowState = 1 ' .67 DAEB 01/05/2021 frmMain.frm Added creation of Windows in the states as provided by sShowCmd value in RD
   
    '.nn Added new check box to allow autohide of the dock prior to launch of the chosen app
    If sAutoHideDock = "1" Then
        'MessageBox Me.hwnd, sTitle & " Hiding the dock ", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
        ' store the process name that caused the dock to auto hide
        autoHideProcessName = sCommand ' .84 DAEB 20/07/2021 frmMain.frm Added prevention of the dock returning until the hiding application is no longer running.
        Call HideDockNow
        
        '.85 Added new timer to allow auto-reveal of the dock once the chosen app has closed within 1.5 secs
        forceHideRevealTimer.Enabled = True
        
    Else
       autoHideProcessName = vbNullString
    End If
   
    ' run the selected program
    Call ShellExecute(hwnd, userLevel, sCommand, sArguments, sWorkingDirectory, windowState) ' .67 DAEB 01/05/2021 frmMain.frm Added creation of Windows in the states as provided by sShowCmd value in RD
            
    userLevel = "open" ' return to default
    
    If selectedIconIndex <> 999 Then
        If targetType = "none" Then
            initiatedProcessArray(selectedIconIndex) = sCommandArray(selectedIconIndex)
            Call checkDockProcessesRunning ' trigger a test of all running processes
        Else
            initiatedExplorerArray(selectedIconIndex) = sCommandArray(selectedIconIndex)
            explorerCheckArray(selectedIconIndex) = True
            Call checkExplorerRunning
        End If
    End If
    
    
    ' call up a dialog box if required
    If sUseDialogAfter = "1" Then
        'MsgBox sTitle & " Command Issued - " & sCommand, vbSystemModal + vbExclamation, "SteamyDock Confirmation Message"
        ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
        'MessageBox Me.hwnd, sTitle & " Command Issued - " & sCommand, "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
        ans = msgBoxA(sTitle & " Command Issued - " & sCommand, vbOKOnly, "SteamyDock Confirmation Message", False)
    End If
    
    
   On Error GoTo 0
   Exit Sub

shellExecuteWithDialog_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure shellExecuteWithDialog of Form dock"
End Sub


'---------------------------------------------------------------------------------------
' Procedure : shellCommand
' Author    : beededea
' Date      : 31/01/2021
' Purpose   : handler for shell command allowing a subsequent dialog to be initiated
'---------------------------------------------------------------------------------------
'
Private Sub shellCommand(ByVal shellparam1 As String, Optional ByVal windowState As Integer = 1, Optional targetType As String = "none")

   On Error GoTo shellCommand_Error
        
    '.nn Added new check box to allow autohide of the dock prior to launch of the chosen app
    If sAutoHideDock = "1" Then
        'MessageBox Me.hwnd, sTitle & " Hiding the dock ", "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
        Call HideDockNow
    End If
    
    ' .67 DAEB 01/05/2021 frmMain.frm Added creation of Windows in the states as provided by sShowCmd value in RD
    ' run the selected program
    If windowState = 0 Then windowState = 1
    If windowState = 1 Then Call Shell(shellparam1, vbNormalFocus)
    If windowState = 2 Then Call Shell(shellparam1, vbMinimizedFocus)
    If windowState = 3 Then Call Shell(shellparam1, vbMaximizedFocus)
    
    userLevel = "open" ' return to default
    
    ' add the process to a list of processes initiated by the dock
    If targetType = "none" Then
        initiatedProcessArray(selectedIconIndex) = sCommandArray(selectedIconIndex)
        Call checkDockProcessesRunning ' trigger a test of all running processes
    Else
        initiatedExplorerArray(selectedIconIndex) = sCommandArray(selectedIconIndex)
        explorerCheckArray(selectedIconIndex) = True
        Call checkExplorerRunning
    End If

    ' call up a dialog box if required
    If sUseDialogAfter = "1" Then
        ' .43 DAEB 01/04/2021 frmMain.frm Replaced the modal msgbox with the non-modal form
        MessageBox Me.hwnd, sTitle & " Command Issued - " & sCommand, "SteamyDock Confirmation Message", vbOKOnly + vbExclamation
    End If

   On Error GoTo 0
   Exit Sub

shellCommand_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure shellCommand of Form dock"
End Sub

'---------------------------------------------------------------------------------------
' Procedure : DrawTheText
' Author    : beededea
' Date      : 07/04/2020
' Purpose   : draws any text onto the device with the characteristics required
'---------------------------------------------------------------------------------------
'
Private Sub DrawTheText(ByVal strText As String, ByVal yTop As Single, ByVal xLeft As Single, ByVal textWidth As Integer, Optional ByVal strFont As String = "Tahoma", Optional ByVal bytFontSize As Byte, Optional ByVal bytBorderSize As Byte = 1)
    Dim borderRGBColour As Long: borderRGBColour = 0
    Dim borderARGBColour As Long: borderARGBColour = 0
    Dim borderOpacity As Integer: borderOpacity = 0
    Dim strFontRGBColour As String: strFontRGBColour = vbNullString
    Dim strBorderRGBColour As String: strBorderRGBColour = vbNullString
    Dim strShadowRGBColour As String: strShadowRGBColour = vbNullString
    Dim fontRGBColour As Long: fontRGBColour = 0
    Dim fontARGBColour As Long: fontARGBColour = 0
    Dim shadowRGBColour As Long: shadowRGBColour = 0
    Dim shadowARGBColour As Long: shadowARGBColour = 0
    Dim shadowOpacity As Integer: shadowOpacity = 0
    Dim fontOpacity As Integer: fontOpacity = 0
    Dim rctTextBottom As Integer: rctTextBottom = 0
    
    On Error GoTo DrawTheText_Error
    
    rctTextBottom = 64
        
    Call GdipCreateFromHDC(dcMemory, lngFont)
    Call GdipCreateFontFamilyFromName(StrConv(strFont, vbUnicode), 0, lngFontFamily)
    
    ' if the font has bold then we can handle that here
    Call GdipCreateFont(lngFontFamily, bytFontSize, FontStyleRegular, UnitPoint, lngCurrentFont)
    
    Call GdipCreateStringFormat(0, 0, lngFormat)
    Call GdipSetStringFormatAlign(lngFormat, StringAlignmentCenter)
    Call GdipSetStringFormatLineAlign(lngFormat, StringAlignmentNear)
    
     
    'do the shadow first
    ' convert decimal colour to ARGB (opacity then RGB)
    shadowRGBColour = rDFontShadowColor
    shadowOpacity = 255 * Val(rDFontShadowOpacity) / 100
    shadowARGBColour = Color_RGBtoARGB(shadowRGBColour, shadowOpacity) 'shadowOpacity)

    Call GdipCreateSolidFill(shadowARGBColour, lngBrush)
    rctText.Left = xLeft + 3
    rctText.Top = yTop + 3
    rctText.Right = textWidth ' Me.ScaleWidth
    rctText.Bottom = rctTextBottom
    Call GdipDrawString(lngFont, StrConv(strText, vbUnicode), Len(strText), lngCurrentFont, rctText, lngFormat, lngBrush)


    ' Draw the border around the text

    ' set the colour for all the borders
    ' convert decimal colour to ARGB (opacity then RGB)
    borderRGBColour = rDFontOutlineColor ' an RGB long required by GDI conversion tools
    borderOpacity = 255 * Val(rDFontOutlineOpacity) / 100
    borderARGBColour = Color_RGBtoARGB(borderRGBColour, borderOpacity) ' borderOpacity)

    Call GdipCreateSolidFill(borderARGBColour, lngBrush)  ' This API requires ARGB format

    ' border to the left
    rctText.Left = xLeft - bytBorderSize
    rctText.Top = yTop
    rctText.Right = textWidth
    rctText.Bottom = rctTextBottom
    Call GdipDrawString(lngFont, StrConv(strText, vbUnicode), Len(strText), lngCurrentFont, rctText, lngFormat, lngBrush)

    ' border to the right
    rctText.Left = xLeft + bytBorderSize
    rctText.Top = yTop
    rctText.Right = textWidth
    rctText.Bottom = rctTextBottom
    Call GdipDrawString(lngFont, StrConv(strText, vbUnicode), Len(strText), lngCurrentFont, rctText, lngFormat, lngBrush)

    ' border to the top
    rctText.Left = xLeft
    rctText.Top = yTop - bytBorderSize
    rctText.Right = textWidth
    rctText.Bottom = rctTextBottom
    Call GdipDrawString(lngFont, StrConv(strText, vbUnicode), Len(strText), lngCurrentFont, rctText, lngFormat, lngBrush)

    ' border to the bottom
    rctText.Left = xLeft
    rctText.Top = yTop + bytBorderSize
    rctText.Right = textWidth
    rctText.Bottom = rctTextBottom
    Call GdipDrawString(lngFont, StrConv(strText, vbUnicode), Len(strText), lngCurrentFont, rctText, lngFormat, lngBrush)
    



    ' Now draw the text
    
    ' set the colour for the text itself
    ' convert RD decimal colour to ARGB (opacity followed by RGB)
                    
    fontRGBColour = rDFontColor ' an RGB long required by GDI conversion tools
    fontOpacity = 255 * Val(sDFontOpacity) / 100
    fontARGBColour = Color_RGBtoARGB(fontRGBColour, fontOpacity) ' wants a RGB long and gives a long.
        
    Call GdipCreateSolidFill(fontARGBColour, lngBrush)
    
    rctText.Left = xLeft
    rctText.Top = yTop
    rctText.Right = textWidth
    rctText.Bottom = rctTextBottom
    
    'legend =      graphic bitmap, StringToDraw, lengthOfTheStringToDraw, chosenFont, layoutRectangle, StringFormat As Long, brush As Long
    Call GdipDrawString(lngFont, StrConv(strText, vbUnicode), Len(strText), lngCurrentFont, rctText, lngFormat, lngBrush)
    
    Call GdipDeleteStringFormat(lngFormat)
    Call GdipDeleteFont(lngCurrentFont)
    Call GdipDeleteFontFamily(lngFontFamily)
    Call GdipDeleteBrush(lngBrush)
    Call GdipDeleteGraphics(lngFont)

   On Error GoTo 0
   Exit Sub

DrawTheText_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure DrawTheText of Form dock"

End Sub





        
'---------------------------------------------------------------------------------------
' Procedure : startRunTimer
' Author    : beededea
' Date      : 09/02/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
 Public Sub startRunTimer()
    Dim answer As VbMsgBoxResult: answer = vbNo
    Dim rmessage As String: rmessage = vbNullString
    
    On Error GoTo startRunTimer_Error
    
    ' if the process to kill is named then kill it before running the main process associated with the icon
    
    If sAppToTerminate <> vbNullString Then
        If FExists(sAppToTerminate) Then
            checkAndKill sAppToTerminate, False, False
        End If
    End If
    
    ' if there is a second app to run beforehand
    ' run the second app
     If sSecondApp <> vbNullString And sRunSecondAppBeforehand = "1" Then
        If sUseDialog = "1" Then
            rmessage = "Are you sure you wish to run the associated second application? - " & sTitle & "?" & vbCr & sSecondApp
            answer = MsgBox(rmessage, vbYesNo)
            'answer = msgBoxA(rmessage, vbYesNo, "SteamyDock Confirmation Message", False)
            
            If answer = vbNo Then
                Exit Sub
            End If
        End If
        If FExists(sSecondApp) Then ' .78 DAEB 21/05/2021 frmMain.frm Added new field for second program to be run
            delayRunTimer.Enabled = True
        End If
    End If

    ' commence the runTimer to activate the main program
    runTimer.Enabled = True
    '
    ' if there is a second app to run afterward
    ' run the selected program
    If sSecondApp <> vbNullString And sRunSecondAppBeforehand <> "" Then
        If sUseDialog = "1" Then
            rmessage = "Are you sure you wish to run the associated second application? - " & sTitle & "?" & vbCr & sSecondApp
            answer = MsgBox(rmessage, vbYesNo)
            'answer = msgBoxA(rmessage, vbYesNo, "SteamyDock Confirmation Message", False)
            If answer = vbNo Then
                Exit Sub
            End If
        End If
        If FExists(sSecondApp) Then ' .78 DAEB 21/05/2021 frmMain.frm Added new field for second program to be run
            delayRunTimer.Enabled = True
        End If
    End If
    
    responseTimer.Enabled = True
    animateTimer.Enabled = True
    
    On Error GoTo 0
    Exit Sub

startRunTimer_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure startRunTimer of Form dock"
            Resume Next
          End If
    End With
 End Sub

        
'---------------------------------------------------------------------------------------
' Procedure : runTimer
' Author    : beededea
' Date      : 07/04/2020
' Purpose   : calls the subroutine that runs the actual command from the selected icon
'---------------------------------------------------------------------------------------
'
Private Sub runTimer_Timer()

    On Error GoTo runTimer_Error
    
    runTimer.Enabled = False
    Call runCommand("run", "")  ' added new parameter to allow override ref: .68

    selectedIconIndex = 999 ' sets the icon to bounce index to something that will never occur

   On Error GoTo 0
   Exit Sub

runTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure runTimer of Form dock"
End Sub

'---------------------------------------------------------------------------------------
' Procedure : delayRunTimer_Timer
' Author    : beededea
' Date      : 22/12/2022
' Purpose   : The timer is 3 seconds, starts the secondary program after the first run.
'---------------------------------------------------------------------------------------
'
Private Sub delayRunTimer_Timer()
    On Error GoTo delayRunTimer_Timer_Error

    delayRunTimerCount = delayRunTimerCount + 1
    If delayRunTimerCount >= 1 Then
        delayRunTimer.Enabled = False
        delayRunTimerCount = 0
        Call runCommand("run", sSecondApp)
    End If

    On Error GoTo 0
    Exit Sub

delayRunTimer_Timer_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure delayRunTimer_Timer of Form dock"
            Resume Next
          End If
    End With
End Sub

' .72 DAEB 06/05/2021 frmMain.frm Created two timers that controls the bouncing when the icon is clicked, replacing the old timers
'---------------------------------------------------------------------------------------
' Procedure : bounceDownTimer_Timer
' Author    : beededea
' Date      : 11/05/2021
' Purpose   : 'timer that controls the bounce Downward when the icon is clicked
'---------------------------------------------------------------------------------------
'
Private Sub bounceDownTimer_Timer()
    Dim bvalue As Double: bvalue = 0

    On Error GoTo bounceDownTimer_Timer_Error
    
    ' first type of animation using a tall double bounce
    If rDIconActivationFX = "1" Then

        bounceCounter = bounceCounter - 4
    
        bvalue = BounceIn(bounceCounter / bounceZone) ' uses the same bounce IN type as the bounce IN
        bounceHeight = bounceZone * bvalue
    
        If bounceCounter <= 0 Then
            bounceHeight = 0
            bounceCounter = 0
            bounceDownTimer.Enabled = False
            If Val(sQuickLaunch) = 0 Then
                ' .11 DAEB 21/05/2021 common.bas Added new field for second program to be run
                'runTimer.Enabled = True
                Call startRunTimer
            End If
        End If
    End If

    ' second type of animation, a simple bounce up and down
    If rDIconActivationFX = "2" Then
        bounceDownTimer.Interval = 30
        bounceCounter = bounceCounter - sDBounceStep
        If bounceTimerRun = 2 Then bounceUpTimer.Interval = sDBounceInterval * 3
        If bounceTimerRun = 4 Then bounceUpTimer.Interval = sDBounceInterval * 4
        bounceHeight = bounceCounter
        If bounceCounter <= 0 And bounceTimerRun = 2 Then
            bounceTimerRun = bounceTimerRun + 1
            If Val(sQuickLaunch) = 0 Then
                ' .11 DAEB 21/05/2021 common.bas Added new field for second program to be run
                 Call startRunTimer
                 ' runTimer.Enabled = True  ' .77 DAEB 20/05/2021 frmMain.frm Added new check box to allow a quick launch of the chosen app
            End If
            bounceUpTimer.Enabled = True
            bounceDownTimer.Enabled = False
        End If
    
        If bounceCounter <= 0 And bounceTimerRun = 4 Then
            bounceCounter = 0
            bounceTimerRun = bounceTimerRun + 1
            bounceUpTimer.Enabled = True
            bounceDownTimer.Enabled = False
        End If
    End If



    On Error GoTo 0
    Exit Sub

bounceDownTimer_Timer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure bounceDownTimer_Timer of Form dock"
End Sub
' .72 DAEB 06/05/2021 frmMain.frm Created two timers that controls the bouncing when the icon is clicked, replacing the old timers
'---------------------------------------------------------------------------------------
' Procedure : bounceUpTimer
' Author    : beededea
' Date      : 07/04/2020
' Purpose   : timer that controls the bounceUpward when the icon is clicked
'---------------------------------------------------------------------------------------
'
Private Sub bounceUpTimer_Timer()
   On Error GoTo bounceUpTimer_Error
   
    Dim bvalue As Double: bvalue = 0
    
    If rDIconActivationFX = "0" Then ' no icon animation at all
        bounceUpTimer.Enabled = False
        Call startRunTimer
        'runTimer.Enabled = True
        Exit Sub
    End If
    
    If Val(sQuickLaunch) = 1 Then
        ' .11 DAEB 21/05/2021 common.bas Added new field for second program to be run
         bounceUpTimer.Enabled = False
         Call startRunTimer
         'runTimer.Enabled = True  ' .77 DAEB 20/05/2021 frmMain.frm Added new check box to allow a quick launch of the chosen app
         Exit Sub
    End If

    If rDIconActivationFX = "1" Then
        
        bounceCounter = bounceCounter + 4
    
        bvalue = BounceIn(bounceCounter / bounceZone)
        bounceHeight = bounceZone * bvalue
    
        If bounceCounter >= bounceZone Then
            bounceUpTimer.Enabled = False
            bounceDownTimer.Enabled = True
'            If Val(sQuickLaunch) = 1 Then
'                runTimer.Enabled = True  ' .77 DAEB 20/05/2021 frmMain.frm Added new check box to allow a quick launch of the chosen app
'            End If
        End If
    End If
    
    
    If rDIconActivationFX = "2" Then
        bounceUpTimer.Interval = 30
        bounceCounter = bounceCounter + sDBounceStep
        If bounceTimerRun = 3 Then bounceUpTimer.Interval = sDBounceInterval * 5
        bounceHeight = bounceCounter
        
        If bounceCounter >= 50 Then
            bounceTimerRun = bounceTimerRun + 1
            bounceUpTimer.Enabled = False
            bounceDownTimer.Enabled = True
        End If
    
        If bounceTimerRun = 5 Then
            bounceCounter = 0
            bounceTimerRun = 1
            bounceUpTimer.Enabled = False
            bounceDownTimer.Enabled = False
            bounceUpTimer.Interval = 10
            bounceDownTimer.Interval = 10
'            If Val(sQuickLaunch) = 1 Then
'                runTimer.Enabled = True  ' .77 DAEB 20/05/2021 frmMain.frm Added new check box to allow a quick launch of the chosen app
'            End If
        End If
    End If
    
    

   On Error GoTo 0
   Exit Sub

bounceUpTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure bounceUpTimer of Form dock"
    
End Sub


''---------------------------------------------------------------------------------------
'' Procedure : bounceDownTimer
'' Author    : beededea
'' Date      : 19/04/2020
'' Purpose   :
''---------------------------------------------------------------------------------------
''
'Private Sub bounceDownTimer_Timer()
'   On Error GoTo bounceDownTimer_Error
'   'If debugflg = 1 Then debugLog "%bounceDownTimer"
'
''    bounceCounter = bounceCounter - sDBounceStep
''    If bounceTimerRun = 2 Then bounceUpTimer.Interval = sDBounceInterval * 3
''    If bounceTimerRun = 4 Then bounceUpTimer.Interval = sDBounceInterval * 4
''
''    If bounceCounter <= 0 And bounceTimerRun = 2 Then
''        bounceTimerRun = bounceTimerRun + 1
''        runTimer.Enabled = True ' the runtimer start used to be here but occasionally an app will take time to start and a delay is introduced into the bounce animation
''        bounceUpTimer.Enabled = True
''        bounceDownTimer.Enabled = False
''    End If
''
''    If bounceCounter <= 0 And bounceTimerRun = 4 Then
''        bounceCounter = 0
''        bounceTimerRun = bounceTimerRun + 1
''        bounceUpTimer.Enabled = True
''        bounceDownTimer.Enabled = False
''    End If
'
'   On Error GoTo 0
'   Exit Sub
'
'bounceDownTimer_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure bounceDownTimer of Form dock"
'
'End Sub

'
'---------------------------------------------------------------------------------------
' Procedure : setInitialStartPoint
' Author    : beededea
' Date      : 07/04/2020
' Purpose   : used to determine the initial dock start position for the small icon display only
'---------------------------------------------------------------------------------------
'
Private Sub setInitialStartPoint()

    Dim proportionalOffset As Long: proportionalOffset = 0
    Dim hOffsetPxls As Long: hOffsetPxls = 0
    Dim dockUpPartPxls As Long: dockUpPartPxls = 0
    
    ' set the starting point for the icons to be drawn
    On Error GoTo setInitialStartPoint_Error

    'If debugflg = 1 Then debugLog "%" & "setInitialStartPoint"


    If dockPosition = vbBottom Then
        screenHorizontalEdge = screenHeightPixels ' .73 DAEB 11/05/2021 frmMain.frm  sngBottom renamed to screenHorizontalEdge
        
        If dockSlidOut = True Then
            dockDrawingPositionPxls = (screenHeightPixels - 10) ' 10 pixels above the bottom of the screen ' .nn
        Else
            '  taking into account the largest icons size
            dockUpPartPxls = (screenHeightPixels) - iconSizeLargePxls
            ' the dock expanded (uppermost) position taking into account the dock vertical offset as defined by the user
            dockDrawingPositionPxls = dockUpPartPxls - (Val(rDvOffset)) - rdDefaultYPos
        End If

    End If
    
    If dockPosition = vbtop Then ' .nn STARTS
        screenHorizontalEdge = 0 ' .nn 'the top of the screen, position 0
        
        If dockSlidOut = True Then ' if the dock has slid out then we need to expose just the first 10 pixels of the dock
            dockDrawingPositionPxls = 10
        Else
            ' the dock furthest out position from the top of the screen taking into account the dock vertical offset as defined by the user
            dockDrawingPositionPxls = Val(rDvOffset) + rdDefaultYPos
            
        End If
         ' .nn ENDS
    End If
    

    normalDockWidthPxls = (rdIconMaximum * iconSizeSmallPxls)
    hOffsetPxls = ((screenWidthPixels - normalDockWidthPxls) / 2)
    proportionalOffset = hOffsetPxls + (hOffsetPxls * (Val(rDOffset) / 100))
    iconLeftmostPointPxls = proportionalOffset

    iconPosLeftPxls = iconLeftmostPointPxls ' rDOffset


   On Error GoTo 0
   Exit Sub

setInitialStartPoint_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure setInitialStartPoint of Form dock"
End Sub




'---------------------------------------------------------------------------------------
' Procedure : shutdwnGDI
' Author    : beededea
' Date      : 08/04/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Public Sub shutdwnGDI()
   On Error GoTo shutdwnGDI_Error

    If lngImage Then
        Call GdipReleaseDC(lngImage, dcMemory)
        Call GdipDeleteGraphics(lngImage)
    End If
    If lngBitmap Then Call GdipDisposeImage(lngBitmap)
    If lngGDI Then Call GdiplusShutdown(lngGDI)

   On Error GoTo 0
   Exit Sub

shutdwnGDI_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure shutdwnGDI of Form dock"

End Sub




'---------------------------------------------------------------------------------------
' Procedure : processTimer
' Author    : beededea
' Date      : 11/04/2020
' Purpose   : checks whether the listed processes are currently running every 5-65 secs (10 by default)
'---------------------------------------------------------------------------------------
'
Private Sub processTimer_Timer()
   On Error GoTo processTimer_Error
   
   Call checkDockProcessesRunning

   On Error GoTo 0
   Exit Sub

processTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure processTimer of Form dock"
End Sub






'---------------------------------------------------------------------------------------
' Procedure : checkQuestionMark
' Author    : beededea
' Date      : 16/04/2021
' Purpose   :
'---------------------------------------------------------------------------------------
'
Public Sub checkQuestionMark(ByVal key As String, ByRef Filename As String, ByVal Size As Byte)
    Dim filestring As String: filestring = vbNullString
    Dim suffix As String: suffix = vbNullString
    Dim qPos As Integer: qPos = 0

    ' does the string contain a ? if so it probably has an embedded .ICO
   On Error GoTo checkQuestionMark_Error

    qPos = InStr(1, Filename, "?")
    If qPos <> 0 Then
        ' extract the string before the ? (qPos)
        filestring = Mid$(Filename, 1, qPos - 1)
    End If
    
    ' test the resulting filestring exists
    If FExists(filestring) Then
        ' extract the suffix
        suffix = ExtractSuffixWithDot(filestring)
        ' test as to whether it is an .EXE or a .DLL
        If InStr(1, ".exe,.dll", LCase(suffix)) <> 0 Then
            Call displayEmbeddedIcons(key, filestring, hiddenForm.hiddenPicbox, Size)
        Else
            ' the file may have a ? in the string but does not match otherwise in any useful way
            Filename = sdAppPath & "\icons\" & "help.png" ' .12 25/01/2021 DAEB Change to sdAppPath
        End If
    Else
        Exit Sub
    End If

   On Error GoTo 0
   Exit Sub

checkQuestionMark_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure checkQuestionMark of Form dock"
End Sub





'---------------------------------------------------------------------------------------
' Procedure : GetShortcutInfoNET
' Author    : beededea
' Date      : 17/04/2021
' Purpose   :
'---------------------------------------------------------------------------------------
'
Public Function GetShortcutInfoNET(ByVal ShortcutPath As String) As String

    Dim Begin As Long: Begin = 0
    Dim EndV As Long: EndV = 0
    Dim FileInfoStartsAt As Long: FileInfoStartsAt = 0
    Dim FileOffset As Long: FileOffset = 0
    Dim FirstPart As String: FirstPart = vbNullString
    Dim flags As Long: flags = 0
    Dim fileH As Long: fileH = 0
    Dim Offset As Integer: Offset = 0
    Dim Link As String: Link = vbNullString
    Dim LinkTarget As String: LinkTarget = vbNullString
    Dim PathLength As Long: PathLength = 0
    Dim SecondPart As String: SecondPart = vbNullString
    Dim TotalStructLength As Long: TotalStructLength = 0

   On Error GoTo GetShortcutInfoNET_Error

   fileH = FreeFile()
   If Dir$(ShortcutPath, vbNormal) = vbNullString Then Error 53
   
   Open ShortcutPath For Binary Lock Read Write As fileH
      Seek #fileH, &H15
      Get #fileH, , flags
      If (flags And &H1) = &H1 Then
         Seek #fileH, &H4D
         Get #fileH, , Offset
         Seek #fileH, Seek(fileH) + Offset
      End If

      FileInfoStartsAt = Seek(fileH) - 1
      Get #fileH, , TotalStructLength
      Seek #fileH, Seek(fileH) + &HC
      Get #fileH, , FileOffset
      Seek #fileH, FileInfoStartsAt + FileOffset + 1
      
      PathLength = (TotalStructLength + FileInfoStartsAt) - Seek(fileH) - 1
      LinkTarget = Input$(PathLength, fileH)
      Link = LinkTarget
      
      Begin = InStr(Link, vbNullChar & vbNullChar)
      If Begin > 0 Then
         EndV = InStr(Begin + 2, Link, "\\")
         EndV = InStr(EndV, Link, vbNullChar) + 1
       
         FirstPart = Mid$(Link, 1, Begin - 1)
         SecondPart = Mid$(Link, EndV)
 
         GetShortcutInfoNET = FirstPart & SecondPart
         Exit Function
      End If

      GetShortcutInfoNET = Link
      Exit Function
   Close fileH

GetShortcutInfoNET = vbNullString

   On Error GoTo 0
   Exit Function

GetShortcutInfoNET_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure GetShortcutInfoNET of Form dock"
End Function


'---------------------------------------------------------------------------------------
' Procedure : displayEmbeddedAllIcons
' Author    : beededea
' Date      : 05/07/2019
' Purpose   : The program extracts icons embedded within a DLL or an executable
'             you pass the name of the picbox you require and the image is displayed there
'             it should return all and not only the 16 and 32 bit icons
'
'---------------------------------------------------------------------------------------
'
Public Sub displayEmbeddedIcons(ByVal key As String, ByVal Filename As String, ByRef targetPicBox As PictureBox, ByVal IconSize As Integer)
    
'    Dim sExeName As String: sExeName = vbNullString
'    Dim lIconIndex As Long: lIconIndex = 0
'    Dim xSize As Long: xSize = 0
'    Dim ySize As Long: ySize = 0
'    Dim hIcon() As Long: 'hIcon() = 0  cannot initialise
'    Dim hIconID() As Long: 'hIconID() = 0  cannot initialise
'    Dim nIcons As Long: nIcons = 0
'    Dim Result As Long: Result = 0
'    Dim flags As Long: flags = 0
'    Dim i As Long: i = 0
'    Dim pic As IPicture: 'pic cannot initialise
'    Dim thiskey As String: thiskey = vbNullString
'    Dim bytesFromFile() As Byte
'    Dim Strm As stdole.IUnknown '  cannot initialise
'    Dim img As Long: img = 0
'    Dim dx As Long: dx = 0
'    Dim dy As Long: dy = 0
'    Dim strFilename As String: strFilename = vbNullString
'    Dim opacity As String: opacity = vbNullString
'
'
'    On Error Resume Next
'
'    sExeName = Filename
'    lIconIndex = 0
'
'    i = 2 ' need some experimentation here
'
'    'the boundaries of the icons you wish to extract, can be set to somethink like 256, 256 but that is all
'    ' you will extract, just the one icon
'    xSize = make32BitLong(CInt("256"), CInt("16"))
'    ySize = make32BitLong(CInt("256"), CInt("16"))
'
'    flags = LR_LOADFROMFILE
'
'    ' Get the total number of Icons in the file.
'    Result = PrivateExtractIcons(sExeName, lIconIndex, xSize, ySize, ByVal 0&, ByVal 0&, 0&, 0&)
    
    ' The sExeName is the resource string/filepath.
    ' lIconIndex Index is the index.
    ' xSize and ySize are the desired sizes.
    ' phicon is the returned array of icon handles.
    ' So you could call it with phicon set to nothing and it will return the number of icons in the file.
    
    ' piconid ?
    
    ' nicons is just the number of icons you wish to extract.
    ' Then you call it again with nicon set to this number and niconindex=0. Then it will extract ALL icons in one go.
    ' flags
    '
    '    LR_DEFAULTCOLOR
    '    LR_CREATEDIBSECTION
    '    LR_DEFAULTSIZE
    '    LR_LOADFROMFILE
    '    LR_LfsOADMAP3DCOLORS
    '    LR_LOADTRANSPARENT
    '    LR_MONOCHROME
    '    LR_SHARED
    '    LR_VGACOLOR
    '
    ' eg. PrivateExtractIcons ('C:\Users\Public\Documents\RAD Studio\Projects\2010\Aero Colorizer\AeroColorizer.exe', 0, 128, 128, @hIcon, @nIconId, 1, LR_LOADFROMFILE)
    ' PrivateExtractIcons(sExeName, nIcon, cxIcon, cyIcon, phicon, piconid, nicons, 0)

'    nIcons = 2 ' Result
'
'    ' Dimension the arrays to the number of icons.
'    ReDim hIcon(lIconIndex To lIconIndex + nIcons * 2 - 1)
'    ReDim hIconID(lIconIndex To lIconIndex + nIcons * 2 - 1)

'  Rocketdock always uses the same ID for the same exe

'   C:\Program Files (x86)\Microsoft Visual Studio\VB98\VB6.EXE?5063424
'   E:\games\World_of_Tanks_NA\WorldOfTanks.exe?184608432

' if an exe is dragged and dropped onto RD it is given an id, it is appended to the binary name after an additional "?"
' that question mark signifies what? Possibly the handle of the embedded icon only added the first time,
' so that when the binary is read in the future the handle is already there?
' and that can be used to populate image array? Untested.
' in this case we just need to note the ? and then query the binary for an embedded icon and compare it to the id that RD has given it.
        
    ' use the undocumented PrivateExtractIcons to extract the icons we require
'    Result = PrivateExtractIcons(sExeName, lIconIndex, xSize, _
'                            ySize, hIcon(LBound(hIcon)), _
'                            hIconID(LBound(hIconID)), _
'                            nIcons * 2, flags)
'
'    ' create an icon with a handle so we can test the result
'    Set pic = CreateIcon(hIcon(i + lIconIndex - 1))
'
'    ' Draw the icon as normal
'    lRet = DrawIconEx(.hdc, 0, 0, hIcon(LBound(hIcon)), IconSize, IconSize, 0, 0, DI_NORMAL)  '
'
'    ' get rid of the icons we created
'    Call DestroyIcon(hIcon(i + lIconIndex - 1))
    'Call DestroyIcon(hIcon(LBound(hIcon))

    ' create a bitmap
    ' GdipCreateBitmapFromHICON - loses transparency
    
'Public Sub CreateFromHICON(ByVal HICON As Long)
'    Dim bm As Long
'    Dispose
'    SetStatus GdipCreateBitmapFromHICON(HICON, bm)
'    m_img.fInit bm, m_lastResult
'End Sub
    
'1. Build an icon parser.
'-- All icons (except embedded PNGs) are in DIB format within the icon format.
'2. Create a 32bpp DIB section
'3. Transfer the 32bpp icon bits to the DIB section
'4. Destroy the icon, have GDI+ load DIB via GdipCreateBitmapFromScan0
'5. Don't destroy the DIB till you use gdipDisposeImage on the gdi+ bitmap

' If the icon is 32bpp, you have access to the bits right after the bitmapinfo structure. You can literally copy the bytes to the DIB via CopyMemory, then load DIB into GDI+
    



End Sub



'---------------------------------------------------------------------------------------
' Procedure : drawSmallStaticIcons
' Author    : beededea
' Date      : 28/07/2020
' Purpose   : Displays small icon images from the small collection.
'---------------------------------------------------------------------------------------
'
Public Sub drawSmallStaticIcons()
'    Dim a As Integer: a = 0
    Dim useloop As Integer: useloop = 0
    Dim dockHeight As Long: dockHeight = 0
    Dim thiskey As String: thiskey = vbNullString
    Dim dockSkinStart As Long: dockSkinStart = 0
    Dim dockSkinWidth As Long: dockSkinWidth = 0
    
    On Error GoTo drawSmallStaticIcons_Error

    Call setInitialStartPoint ' return the dock start point when small
    
    ' Check bDrawn so the program doesn't redraw the whole icon picture more than once
    If bDrawn = False Then
        iconPosLeftPxls = iconLeftmostPointPxls
        normalDockWidthPxls = 0
        iconHeightPxls = iconSizeSmallPxls
        iconWidthPxls = iconSizeSmallPxls
                    
        'Call drawSmallIconDockWithFadeEffects
                                            
        DeleteObject bmpMemory ' the bitmap deleted
        Call readyGDIPlus ' clears the whole previously drawn image section and the animation continues
    
        If rDtheme <> vbNullString And rDtheme <> "Blank" Then Call applyThemeSkinToDock(dockSkinStart, dockSkinWidth, True)
                
        ' this loop redraws all the icons at the same small size after the mouse has left the icon area
        For useloop = 0 To rdIconMaximum  'File1.ListCount - 1
            
            'Call sizeDockPositionZero(useloop, showsmall)
            
            ' all small icons to the left shown in small mode, do it just once, all the other icons will take that same size without recalculating
            If useloop = 0 Then Call sizeEachSmallIconToLeft(useloop, rdIconMaximum, True)
            
            ' display the small size icons
            Call showSmallIcon(useloop)
                            
            ' store the icon current position in the array
            Call storeCurrentIconPositions(useloop)
                    
            iconPosLeftPxls = iconPosLeftPxls + iconWidthPxls
            
        Next useloop
                                            
         ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    '            iconStoreLeftPixels(UBound(iconStoreLeftPixels)) = iconPosLeftPxls
    '            iconStoreRightPixels(UBound(iconStoreRightPixels)) = iconStoreLeftPixels(UBound(iconStoreLeftPixels)) + iconWidthPxls ' 01/06/2021 DAEB frmMain.frm Added to capture the right X co-ords of each icon
    '            iconStoreTopPixels(UBound(iconStoreRightPixels)) = iconCurrentTopPxls ' 01/06/2021 DAEB frmMain.frm Added to capture the top Y co-ords of each icon
                    
        Call storeCurrentIconPositions(UBound(iconStoreLeftPixels))
        
        Call updateGDIPlus
            
        smallDockBeenDrawn = True
        bDrawn = True
    
    End If

   On Error GoTo 0
   Exit Sub

drawSmallStaticIcons_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure drawSmallStaticIcons of Form dock"

End Sub


''---------------------------------------------------------------------------------------
'' Procedure : drawSmallIconDockWithFadeEffects
'' Author    : beededea
'' Date      : 04/05/2020
'' Purpose   : Starting at a set LEFT hand side, it loops through each element in the small dictionary and adds each icon to the
''             combined image for display - no animation performed. This runs in conjunction with the responseTimer that operates
''             at a much reduced rate to avoid overuse of the CPU.
''             It only displays small icon images from the small collection.
''---------------------------------------------------------------------------------------
''
'Public Sub drawSmallIconDockWithFadeEffects()
'    Dim useloop As Integer
'    Dim thiskey As String: thiskey = vbNullString
'    Dim dockSkinStart As Long: dockSkinStart = 0
'    Dim dockSkinWidth As Long: dockSkinWidth = 0
'
'    iconWidthPxls = iconSizeSmallPxls
'
'    On Error GoTo drawSmallIconDockWithFadeEffects_Error
'   'If debugflg = 1 Then debugLog "%drawSmallIconDockWithFadeEffects"
'
'            DeleteObject bmpMemory ' Now the bitmap may be deleted
'            Call readyGDIPlus
'
'            If rDtheme <> vbNullString And rDtheme <> "Blank" Then Call applyThemeSkinToDock(dockSkinStart, dockSkinWidth)
'
'            ' this loop redraws all the icons at the same small size after the mouse has left the icon area
'            For useloop = 0 To rdIconMaximum  'File1.ListCount - 1
'
''                If dockPosition = vbbottom Then
''                    If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
''                        iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) + xAxisModifier
''                    ElseIf autoSlideMode = "slidein" Then
''                        iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) - xAxisModifier
''                    Else
''                        iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) '.nn
''                    End If
''                End If
''                If dockPosition = vbtop Then
''                    ' .nn
''                    If autoSlideMode = "slideout" Then 'slideout is the default but if the slider timer is not running then xAxisModifier = 0
''                        'iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) + xAxisModifier
''                    ElseIf autoSlideMode = "slidein" Then
''                        iconCurrentTopPxls = dockDrawingPositionPxls - xAxisModifier
''                        'iconCurrentTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) - xAxisModifier
''                    Else
''                        iconCurrentTopPxls = dockDrawingPositionPxls - xAxisModifier
''                    End If
''
''                End If
'
'                ' NOTE: re-using the subroutine that is normally used to put small icons to the left shown in small mode
'                ' used here instead to resize all icons
'
'                Call sizeEachSmallIconToLeft(useloop, rdIconMaximum, True)
'
'                ' display the small size icons
'                Call showSmallIcon(useloop)
'
'                ' store the icon current position in the array
'                Call storeCurrentIconPositions(useloop)
'
'                iconPosLeftPxls = iconPosLeftPxls + iconWidthPxls
'            Next useloop
'
''       DrawTheText "responseTimer.Enabled " & responseTimer.Enabled, 440, 50, 300, rDFontName, Val(Abs(rDFontSize))
''       DrawTheText "responseTimer.interval " & responseTimer.Interval, 460, 50, 300, rDFontName, Val(Abs(rDFontSize))
'
'
'   On Error GoTo 0
'   Exit Sub
'
'drawSmallIconDockWithFadeEffects_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure drawSmallIconDockWithFadeEffects of Form dock"
'End Sub


'            'section width in pixels
'            animSectPixelWidth = (rDZoomWidth * (rdIconMax / 2)) / 2 ' the max icon pixel width /2 multiplied by the number of animated icons
'            animSectTwipWidth = animSectPixelWidth * screenTwipsPerPixelX  '
'
'            ' distance of the current icon from the centre of the section in twips
'            h = (apiMouse.X * screenTwipsPerPixelX) - iconPosLeftTwips(startAnimSec)
'
'            'proportion of the current icon from the centre of the section
'            animateStep = h / animSectTwipWidth
'            If animateStep >= 1 Then animateStep = 1
'
'            'the closer to the centre of the section the larger the icon until reaches maxbytesize
'            'no smaller than minbytesize
'
'            'animateStep = ( / (2 * screenTwipsPerPixelX)
'
'            iconHeightPxls = iconSizeLargePxls * animateStep 'animateStep is the difference from the midpoint of the current icon in the x axis
'            iconWidthPxls = iconSizeLargePxls * animateStep
'
'            If dockPosition = vbBottom Then
'                iconCurrentTopPxls = dockDrawingPositionPxls + iconSizeLargePxls - (iconSizeLargePxls * animateStep)
'            End If
'
'            If selectedIconIndex = iconIndex Then
'                iconCurrentTopPxls = iconCurrentTopPxls - bounceCounter
'            End If





'---------------------------------------------------------------------------------------
' Procedure : prepareArraysAndCollections
' Author    : beededea
' Date      : 02/05/2020
' Purpose   : resize arrays and load the images into the collections
'---------------------------------------------------------------------------------------
'
Public Sub prepareArraysAndCollections()
    Dim useloop As Integer: useloop = 0
    Dim partialStringKey As String: partialStringKey = vbNullString
    Dim largeKey As String: largeKey = vbNullString
    Dim smallKey As String: smallKey = vbNullString
    Dim overallIconOpacity As Integer
    Dim thisOpacity As Integer
    Dim thisDisabled As String
    
    'sDSkinSize = 30
    
    ' redimension the arrays to cater for the number of icons in the dock
    On Error GoTo prepareArraysAndCollections_Error
    If debugflg = 1 Then debugLog "% sub prepareArraysAndCollections"

    ReDim fileNameArray(rdIconMaximum) As String ' the file location of the original icons
    ReDim dictionaryLocationArray(rdIconMaximum) As String ' the file location of the original icons
    ReDim namesListArray(rdIconMaximum) As String ' the name assigned to each icon
    ReDim sCommandArray(rdIconMaximum) As String ' the Windows command or exe assigned to each icon
    ReDim targetExistsArray(rdIconMaximum) As Integer ' .88 DAEB 08/12/2022 frmMain.frm Array for storing the state of the target command
    ReDim processCheckArray(rdIconMaximum) As Boolean ' the array that contains true/false according to the running state of the associated process
    ReDim explorerCheckArray(rdIconMaximum) As Boolean ' the array that contains true/false according to the running state of the associated process
    ReDim initiatedProcessArray(rdIconMaximum) As String ' the array containing the binary name of any process initiated by the dock
    ReDim initiatedExplorerArray(rdIconMaximum) As String ' the array containing the binary name of any process initiated by the dock
    
    ReDim disabledArray(rdIconMaximum) As Integer ' the array

    Call loadAdditionalImagestoDictionary ' the additional images need to be added to the dictionary
    
    ' extract filenames from Rocketdock registry or settings.ini
    For useloop = 0 To rdIconMaximum
        'readIconData (useloop)
        readIconSettingsIni "Software\SteamyDock\IconSettings\Icons", useloop, dockSettingsFile

        partialStringKey = LTrim$(Str$(useloop))
        
        ' read the two main icon variables into arrays, one for each
        fileNameArray(useloop) = sFilename
        dictionaryLocationArray(useloop) = useloop
        namesListArray(useloop) = sTitle
        sCommandArray(useloop) = sCommand
        
        overallIconOpacity = Val(rDIconOpacity) ' overall icon opacity of all icons

        ' check if the icon is ALREADY disabled, if so we create both transparent and opaque versions of the image
        ' all dynamically disabled images are created on the fly
        
        If sDisabled = "1" Then
            ' reduce the opacity
            
            thisOpacity = overallIconOpacity / 4
            disabledArray(useloop) = 1
            
            ' create keys for transparent images in the collLargeIcons/collSmallIcons collections
            largeKey = dictionaryLocationArray(useloop) & "TransparentImg" & LTrim$(Str$(iconSizeLargePxls))
            smallKey = dictionaryLocationArray(useloop) & "TransparentImg" & LTrim$(Str$(iconSizeSmallPxls))
            
            ' here is the code to cache the images to the collection transparently at a small size
            If FExists(sFilename) Then
                resizeAndLoadImgToDict collSmallIcons, partialStringKey, fileNameArray(useloop), sDisabled, (0), (0), (iconSizeSmallPxls), (iconSizeSmallPxls), smallKey, thisOpacity
            ElseIf InStr(sFilename, "?") And readEmbeddedIcons = True Then ' Note: the question mark is an illegal character and test for a valid file will fail in VB.NET despite working in VB6 so we test it as a string instead
                checkQuestionMark partialStringKey, fileNameArray(useloop), iconSizeSmallPxls ' if the question mark appears in the icon string - test it for validity and an embedded icon
            Else ' if the image is not found display an 'x'
                resizeAndLoadImgToDict collSmallIcons, partialStringKey, App.Path & "\red-X.png", sDisabled, (0), (0), (iconSizeSmallPxls), (iconSizeSmallPxls), smallKey, thisOpacity
            End If
                        
            ' now cache all the images to the collection transparently at the larger size
            If FExists(sFilename) Then
                resizeAndLoadImgToDict collLargeIcons, partialStringKey, fileNameArray(useloop), sDisabled, (0), (0), (iconSizeLargePxls), (iconSizeLargePxls), largeKey, thisOpacity
            ElseIf InStr(sFilename, "?") And readEmbeddedIcons = True Then  ' Note: the question mark is an illegal character and test for a valid file will fail in VB.NET despite working in VB6 so we test it as a string instead
                checkQuestionMark partialStringKey, fileNameArray(useloop), iconSizeLargePxls ' if the question mark appears in the icon string - test it for validity and an embedded icon
            Else
                resizeAndLoadImgToDict collLargeIcons, partialStringKey, App.Path & "\red-X.png", sDisabled, (0), (0), (iconSizeLargePxls), (iconSizeLargePxls), largeKey, thisOpacity
            End If
        End If
    
    
        ' cache the images to the collection at a small size at full opacity
        If FExists(sFilename) Then
            resizeAndLoadImgToDict collSmallIcons, partialStringKey, fileNameArray(useloop), sDisabled, (0), (0), (iconSizeSmallPxls), (iconSizeSmallPxls), , overallIconOpacity
        ElseIf InStr(sFilename, "?") And readEmbeddedIcons = True Then ' Note: the question mark is an illegal character and test for a valid file will fail in VB.NET despite working in VB6 so we test it as a string instead
            checkQuestionMark partialStringKey, fileNameArray(useloop), iconSizeSmallPxls ' if the question mark appears in the icon string - test it for validity and an embedded icon
        Else ' if the image is not found display an 'x'
            resizeAndLoadImgToDict collSmallIcons, partialStringKey, App.Path & "\red-X.png", sDisabled, (0), (0), (iconSizeSmallPxls), (iconSizeSmallPxls), , overallIconOpacity
        End If
        
        ' now cache all the images to the collection at the larger size
        If FExists(sFilename) Then
            resizeAndLoadImgToDict collLargeIcons, partialStringKey, fileNameArray(useloop), sDisabled, (0), (0), (iconSizeLargePxls), (iconSizeLargePxls), , overallIconOpacity
        ElseIf InStr(sFilename, "?") And readEmbeddedIcons = True Then  ' Note: the question mark is an illegal character and test for a valid file will fail in VB.NET despite working in VB6 so we test it as a string instead
            checkQuestionMark partialStringKey, fileNameArray(useloop), iconSizeLargePxls ' if the question mark appears in the icon string - test it for validity and an embedded icon
        Else
            resizeAndLoadImgToDict collLargeIcons, partialStringKey, App.Path & "\red-X.png", sDisabled, (0), (0), (iconSizeLargePxls), (iconSizeLargePxls), , overallIconOpacity
        End If
        
        ' check to see if each process is running and store the result away - this is also run on a 10s timer
        explorerCheckArray(useloop) = isExplorerRunning(sCommand)
        processCheckArray(useloop) = IsRunning(sCommand, vbNull)

    Next useloop
    
    'redimension the array that is used to store all of the icon current positions
    ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    ReDim Preserve iconStoreLeftPixels(theCount)
    ReDim Preserve iconStoreRightPixels(theCount) ' 01/06/2021 DAEB frmMain.frm Added to capture the right X co-ords of each icon
    ReDim Preserve iconStoreTopPixels(theCount) ' 01/06/2021 DAEB frmMain.frm Added to capture the top Y co-ords of each icon
    ReDim Preserve iconStoreBottomPixels(theCount) ' 01/06/2021 DAEB frmMain.frm Added to capture the bottom Y co-ords of each icon
    
    iconArrayUpperBound = rdIconMaximum
    dictionaryLocationArrayUpperBound = rdIconMaximum

   On Error GoTo 0
   Exit Sub

prepareArraysAndCollections_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure prepareArraysAndCollections of Form dock"

End Sub






'---------------------------------------------------------------------------------------
' Procedure : readToolSettings
' Author    : beededea
' Date      : 20/06/2019
' Purpose   : read this utilties' own settings.ini file and do some things using the data - unused
'---------------------------------------------------------------------------------------
'
Private Sub readToolSettings()
    Dim sfirst As String: sfirst = vbNullString

    On Error GoTo readToolSettings_Error
    'If debugflg = 1 Then debugLog "%" & "readToolSettings"
   
    If Not FExists(toolSettingsFile) Then Exit Sub ' does the tool's own settings.ini exist?
    
    'test to see if the tool has ever been run before
    sfirst = GetINISetting("Software\SteamyDockSettings", "First", toolSettingsFile)
    
    If sfirst = "True" Then
    
        sfirst = "False"
        
        'write the updated test of first run to false
        PutINISetting "Software\SteamyDockSettings", "First", sfirst, toolSettingsFile
        
    End If

'    If IsUserAnAdmin() = 0 And requiresAdmin = True Then
'        MsgBox "This tool requires to be run as administrator on Windows 8 and above in order to function. Admin access is NOT required on Win7 and below. If you aren't entirely happy with that then you'll need to remove the software now. This is a limitation imposed by Windows itself. To enable administrator access find this tool's exe and right-click properties, compatibility - run as administrator. YOU have to do this manually, I can't do it for you."
'    End If
    
   On Error GoTo 0
   Exit Sub

readToolSettings_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure readToolSettings of Form rDIconConfigForm"
    
End Sub

''---------------------------------------------------------------------------------------
'' Procedure : locateDockSettingsFile
'' Author    : beededea
'' Date      : 17/10/2019
'' Purpose   : get this tool's settings file
''---------------------------------------------------------------------------------------
''
'Private Sub locateDockSettingsFile()
'    Dim dockSettingsDir As String
'
'    On Error GoTo locateDockSettingsFile_Error
'    'If debugflg = 1 Then debugLog "%locateDockSettingsFile"
'
'    dockSettingsDir = SpecialFolder(SpecialFolder_AppData) & "\steamyDock" ' just for this user alone
'    dockSettingsFile = dockSettingsDir & "\docksettings.ini" ' the third config option for steamydock alone
'
'    'if the folder does not exist then create the folder
'    If Not DirExists(dockSettingsDir) Then
'        MkDir dockSettingsDir
'    End If
'
'    'if the settings.ini does not exist then create the file by copying
'    If Not FExists(dockSettingsFile) Then
'        If FExists(App.Path & "\defaultDockSettings.ini") Then
'            FileCopy App.Path & "\defaultDockSettings.ini", dockSettingsFile
'            MsgBox ("Creating default sample dock, feel free to Edit/Delete items as you require.")
'        End If
'    End If
'
'    'confirm the settings file exists, if not use the version in the app itself
'    If Not FExists(dockSettingsFile) Then
'            dockSettingsFile = App.Path & "\settings.ini"
'    End If
'
'   On Error GoTo 0
'   Exit Sub
'
'locateDockSettingsFile_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure locateDockSettingsFile of Form dockSettings"
'
'End Sub





    
'---------------------------------------------------------------------------------------
' Procedure : readThemeConfiguration
' Author    : beededea
' Date      : 09/07/2020
' Purpose   : ' read the background theme settings from INI
'---------------------------------------------------------------------------------------
'
Private Sub readThemeConfiguration()

    On Error GoTo readThemeConfiguration_Error
    'If debugflg = 1 Then debugLog "%readThemeConfiguration"
    
    'background.ini
    
'    [Background]
'    Image = Milk2.png
'    LeftMargin = 8
'    TopMargin = 8
'    RightMargin = 8
'    BottomMargin = 8
'    Outside-LeftMargin = 8
'    Outside-TopMargin = 8
'    Outside-RightMargin = 8
'    Outside-BottomMargin = 8

    If validTheme = False Then Exit Sub

    rDThemeImage = GetINISetting("Background", "Image", rdThemeSkinFile)
    rDThemeLeftMargin = Val(GetINISetting("Background", "LeftMargin", rdThemeSkinFile))
    rDThemeTopMargin = Val(GetINISetting("Background", "TopMargin", rdThemeSkinFile))
    rDThemeRightMargin = Val(GetINISetting("Background", "RightMargin", rdThemeSkinFile))
    rDThemeBottomMargin = Val(GetINISetting("Background", "BottomMargin", rdThemeSkinFile))
    rDThemeOutsideLeftMargin = Val(GetINISetting("Background", "Outside-LeftMargin", rdThemeSkinFile))
    rDThemeOutsideTopMargin = Val(GetINISetting("Background", "Outside-TopMargin", rdThemeSkinFile))
    rDThemeOutsideRightMargin = Val(GetINISetting("Background", "Outside-RightMargin", rdThemeSkinFile))
    rDThemeOutsideBottomMargin = Val(GetINISetting("Background", "Outside-BottomMargin", rdThemeSkinFile))
    
    'validate the inputs
    
'    rDThemeImage ' must not be empty, set to a default
     'If rDThemeImage = "" Then
'    rDThemeLeftMargin ' must be a n ineteger value less than 20
'    rDThemeTopMargin ' must be an integer value less than 20
'    rDThemeRightMargin  ' must be an integer value less than 20
'    rDThemeBottomMargin  ' must be an integer value less than 20
'    rDThemeOutsideLeftMargin  ' must be an integer value less than 20
'    rDThemeOutsideTopMargin  ' must be an integer value less than 20
'    rDThemeOutsideRightMargin  ' must be an integer value less than 20
'    rDThemeOutsideBottomMargin ' must be an integer value less than 20

    ' separator.ini
    
'    [Separator]
'    Image = Separator.png
'    TopMargin = 3
'    BottomMargin = 3
    
    rDSeparatorImage = GetINISetting("Separator", "Image", rdThemeSeparatorFile)
    rDSeparatorTopMargin = Val(GetINISetting("Separator", "TopMargin", rdThemeSeparatorFile))
    rDSeparatorBottomMargin = Val(GetINISetting("Separator", "BottomMargin", rdThemeSeparatorFile))

'    rDSeparatorImage  '  must not be empty
'    rDSeparatorTopMargin  ' must be an integer value less than 20
'    rDSeparatorBottomMargin  ' must be an integer value less than 20

    ' the skin size is validated here as it is a skin variable, however, it is stored in the main configuration file and currently not the theme file.
    ' I am unsure whether we will continue to support the RD theme methods.
    
    If Val(rDSkinSize) <= 0 Or Val(rDSkinSize) > 177 Then
        sDSkinSize = 1
    End If

On Error GoTo 0
   Exit Sub

readThemeConfiguration_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure readThemeConfiguration of Form dock"
End Sub


'---------------------------------------------------------------------------------------
' Procedure : locateThemeSettingsFile
' Author    : beededea
' Date      : 09/07/2020
' Purpose   : get the location of the dock's theme settings file
'---------------------------------------------------------------------------------------
'
Private Sub locateThemeSettingsFile()

    validTheme = False

    On Error GoTo locateThemeSettingsFile_Error
    'If debugflg = 1 Then debugLog "%readThemeConfiguration"
    
    ' read the default theme name from the setting file
    If rDtheme = vbNullString Then
        MsgBox ("Theme not set")
        Exit Sub
    End If
    
    ' if it exists set the theme file to the settings file found
    rdThemeSkinFile = App.Path & "\Skins\" & rDtheme & "\background.ini"
    rdThemeSeparatorFile = App.Path & "\Skins\" & rDtheme & "\separator.ini"
    ' test existence of the set theme file
    If Not FExists(rdThemeSkinFile) Then
        validTheme = False
        Exit Sub
    End If
    If Not FExists(rdThemeSeparatorFile) Then
        validTheme = False
        Exit Sub
    End If
 
    validTheme = True ' if we arrived this far the theme exists
    If validTheme = False Then
        MsgBox ("Selected Theme " & rDtheme & " does not exist within Steamydock")
    End If
    On Error GoTo 0
   Exit Sub

locateThemeSettingsFile_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure locateThemeSettingsFile of Form dock"
End Sub






' test on Win10
'
'    Dim ab As String
'    Dim b As Boolean
'
'    ab = "true"
'    b = CBool(ab)
'
'    ab = "True"
'    b = CBool(ab)
'
'    ab = "True"
'    b = CBool(LCase(ab))


'---------------------------------------------------------------------------------------
' Procedure : applyThemeSkinToDock
' Author    : beededea
' Date      : 13/08/2020
' Purpose   : draw the theme or skin behind the icons this method is not compatible with Rocketdock skins
'---------------------------------------------------------------------------------------
'
' Rocket Dock themeing method described for future implementation and improvement.
'
' In Rocketdock, the bg is used thusly;
' Starting from the original 118x 118 image it extracts a left hand crop of approx. 37 pixels and uses that as the left hand image
' then it takes a small sliver of three or so pixels from that same crop and scales it (stretches it rightward) for 150 pixels or so
' it appears that this image is blended or a gradient fade out is applied to the right hand portion
' it appears as if this is place on top of image 2 and the left is blended...
' from the original image the central section is taken, approx. another 18-20 pixels from the left hand side to the middle of the image
' this is then stretched to the centre of the dock.
' Either all of these GDI+ functions are carried out or these stetching, blending operations are carried out using a 3rd party graphics library
' the same is then performed for the right hand side of the dock.

' Needless overkill, it has been replaced with a left hand image, a right hand image and a centre image, rectangular and 2000px wide that is cropped to fit.

Private Sub applyThemeSkinToDock(ByVal dockSkinStart As Long, ByVal dockSkinWidth As Long, Optional ByRef shortdock As Boolean = False)
    
    Dim thiskey As String: thiskey = vbNullString
    Dim bgThemeTopPxls As Long: bgThemeTopPxls = 0
    Dim themeSkinLeft  As Long: themeSkinLeft = 0
    Dim themeSkinWidth  As Long: themeSkinWidth = 0
    Dim themeSkinRight  As Long: themeSkinRight = 0
    Dim themeSkinTop  As Long: themeSkinTop = 0
    
    On Error GoTo applyThemeSkinToDock_Error
    
    dockSkinStart = iconPosLeftPxls - (sDSkinSize)
    If shortdock = False Then
        dockSkinWidth = (rdIconMaximum * iconSizeSmallPxls) + iconSizeLargePxls * 2
    Else
        dockSkinWidth = (rdIconMaximum * iconSizeSmallPxls)
    End If
    
    ' .49 DAEB 01/04/2021 frmMain.frm added the vertical adjustment for sliding in and out STARTS
    If autoSlideMode = "slideout" Then
        If dockPosition = vbtop Then
            ' set the skin to a position above the icons and modified in the Y axis by the slideTimer
            bgThemeTopPxls = (dockDrawingPositionPxls) - xAxisModifier '.nn
        Else ' dockPosition = vbBottom
            ' set the skin to a position above the small icons and modified in the Y axis by the slideTimer if the slider timer is running
            bgThemeTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) + xAxisModifier
        End If
    ElseIf autoSlideMode = "slidein" Then
        If dockPosition = vbtop Then
            ' set the skin to a position above the icons and modified in the Y axis by the slideTimer
            bgThemeTopPxls = (dockDrawingPositionPxls) + xAxisModifier '.nn
        Else ' dockPosition = vbBottom
            ' set the skin to a position above the small icons and modified in the Y axis by the slideTimer if the slider timer is running
            bgThemeTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls)) - xAxisModifier
        End If
    Else
        If dockPosition = vbtop Then
            ' set the skin to a position above the icons
            bgThemeTopPxls = (dockDrawingPositionPxls)  '.nn
        Else ' dockPosition = vbBottom
            ' set the skin to a position above the small icons
            bgThemeTopPxls = ((dockDrawingPositionPxls + iconSizeLargePxls - iconSizeSmallPxls))
        End If
    End If
    ' .49 DAEB 01/04/2021 frmMain.frm added the vertical adjustment for sliding in and out ENDS
    
    themeSkinLeft = (dockSkinStart + sDSkinSize)
    themeSkinWidth = dockSkinWidth
    themeSkinRight = themeSkinLeft + dockSkinWidth
    themeSkinTop = ((bgThemeTopPxls + iconSizeSmallPxls / 2) - sDSkinSize / 2)

    ' display the start theme left hand
    thiskey = "sDSkinLeft" & "ResizedImg" & LTrim$(Str$(sDSkinSize))
    updateDisplayFromDictionary collLargeIcons, vbNullString, thiskey, (dockSkinStart), themeSkinTop, (sDSkinSize), (sDSkinSize)
    
    ' display the middle theme background
    thiskey = "sDSkinMid" & "ResizedImg" & LTrim$(Str$(sDSkinSize))
    updateDisplayFromDictionary collLargeIcons, vbNullString, thiskey, themeSkinLeft, themeSkinTop, dockSkinWidth, sDSkinSize
 
    ' display the end theme background
    thiskey = "sDSkinRight" & "ResizedImg" & LTrim$(Str$(sDSkinSize))
    '                           thisCollection, strFilename ,  key,      Left          Top            Width,        Height
    updateDisplayFromDictionary collLargeIcons, vbNullString, thiskey, themeSkinRight, themeSkinTop, sDSkinSize, sDSkinSize

   On Error GoTo 0
   Exit Sub

applyThemeSkinToDock_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure applyThemeSkinToDock of Form dock"

End Sub


'---------------------------------------------------------------------------------------
' Procedure : BounceIn
' Author    : Olaf Schmidt
' Date      : 13/09/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Function BounceIn(ByVal t As Double)
   On Error GoTo BounceIn_Error

  BounceIn = 1 - BounceOut(1 - t) ' return

   On Error GoTo 0
   Exit Function

BounceIn_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure BounceIn of Form dock"
End Function
'---------------------------------------------------------------------------------------
' Procedure : BounceOut
' Author    : Olaf Schmidt
' Date      : 13/09/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Function BounceOut(ByVal t As Double)
   On Error GoTo BounceOut_Error

  If (t < (1 / 2.75)) Then BounceOut = 7.5625 * t ^ 2: Exit Function
  If (t < (2 / 2.75)) Then t = t - 1.5 / 2.75: BounceOut = 7.5625 * t ^ 2 + 0.75: Exit Function
  If (t < (2.5 / 2.75)) Then t = t - 2.25 / 2.75: BounceOut = 7.5625 * t ^ 2 + 0.9375: Exit Function
  t = t - 2.625 / 2.75: BounceOut = 7.5625 * t ^ 2 + 0.984375 ' return

   On Error GoTo 0
   Exit Function

BounceOut_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure BounceOut of Form dock"
End Function

'Function BounceOut2(t)

' The above function runs faster than this one...

'    If (t < 1 / 2.75) Then BounceOut2 = 7.5625 * t * t: Exit Function
'    If (t < 2 / 2.75) Then BounceOut2 = 7.5625 * (t = t - 1.5 / 2.75) * t + 0.75: Exit Function
'    If (t < 2.5 / 2.75) Then BounceOut2 = 7.5625 * (t = t - 2.25 / 2.75) * t + 0.9375: Exit Function
'    BounceOut2 = 7.5625 * (t = t - 2.625 / 2.75) * t + 0.984375: Exit Function


'End Function




''---------------------------------------------------------------------------------------
'' Procedure : BounceInOut
'' Author    : Olaf Schmidt
'' Date      : 13/09/2020
'' Purpose   :
''---------------------------------------------------------------------------------------
''
'Function BounceInOut(t)
'   On Error GoTo BounceInOut_Error
'
'  If t < 0.5 Then BounceInOut = BounceIn(t * 2) / 2 Else BounceInOut = (BounceOut(t * 2 - 1) + 1) / 2
'
'   On Error GoTo 0
'   Exit Function
'
'BounceInOut_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure BounceInOut of Form dock"
'End Function






'---------------------------------------------------------------------------------------
' Procedure : resolveVB6SizeBug
' Author    : beededea
' Date      : 18/09/2020
' Purpose   : VB6 has a bug - it should return 28800 on my screen but often returns 16200 when a game runs full screen, changing the resolution
'             the screen width determination is incorrect, the API call below resolves this.
'             NOTE: the dock program is the size of the whole screen
'---------------------------------------------------------------------------------------
'
Private Sub resolveVB6SizeBug()

   On Error GoTo resolveVB6SizeBug_Error
   
    If debugflg = 1 Then debugLog "% sub resolveVB6SizeBug"


'    screenWidthTwips = 0 ' private wide vars
'    screenHeightTwips = 0
'    screenWidthPixels = 0
'    screenHeightPixels = 0
    
'    Me.Height = Screen.Height '16200 correct
'    Me.Width = Screen.Width ' 16200 < VB6 bug here

    screenHeightTwips = GetDeviceCaps(dock.hdc, VERTRES) * screenTwipsPerPixelY
    screenWidthTwips = GetDeviceCaps(dock.hdc, HORZRES) * screenTwipsPerPixelX
    
    screenHeightPixels = GetDeviceCaps(dock.hdc, VERTRES)
    screenWidthPixels = GetDeviceCaps(dock.hdc, HORZRES)
    
    oldScreenHeightPixels = screenHeightPixels
    oldScreenWidthPixels = screenWidthPixels
        
    'set the main form upon which the dock resides to the size of the whole monitor, has to be done in twips
    Me.Height = screenHeightTwips
    Me.Width = screenWidthTwips

    'Me.Left = 1000
    
   On Error GoTo 0
   Exit Sub

resolveVB6SizeBug_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure resolveVB6SizeBug of Form dock"
End Sub



'---------------------------------------------------------------------------------------
' Procedure : setLocalConfigurationVars
' Author    : beededea
' Date      : 18/09/2020
' Purpose   : configuration private numeric vars that are easier to manipulate throughout the program than the string equivalents
'---------------------------------------------------------------------------------------
'
Private Sub setLocalConfigurationVars()
   On Error GoTo setLocalConfigurationVars_Error
   
    If debugflg = 1 Then debugLog "% sub setLocalConfigurationVars"

    iconSizeSmallPxls = Val(rDIconMin) ' in dock icon size to display
    iconSizeLargePxls = Val(rdIconMax)  ' maximum dock icon size to display
    
    'iconGrowthModifier = iconSizeLargePxls

   On Error GoTo 0
   Exit Sub

setLocalConfigurationVars_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure setLocalConfigurationVars of Form dock"

End Sub



'---------------------------------------------------------------------------------------
' Procedure : initialiseGDIStartup
' Author    : beededea
' Date      : 18/09/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub initialiseGDIStartup()
    ' Initialises GDI Plus
   On Error GoTo initialiseGDIStartup_Error
   
    If debugflg = 1 Then debugLog "% sub initialiseGDIStartup"

    gdipInit.GdiplusVersion = 1
    If GdiplusStartup(lngGDI, gdipInit, ByVal 0&) <> 0 Then
        MsgBox "Error loading GDI+", vbCritical
        Unload Me
    End If

   On Error GoTo 0
   Exit Sub

initialiseGDIStartup_Error:

    If debugflg = 1 Then debugLog "Error " & Err.Number & " (" & Err.Description & ") in procedure initialiseGDIStartup of Form dock"

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure initialiseGDIStartup of Form dock"

End Sub


'---------------------------------------------------------------------------------------
' Procedure : createDictionaryObjects
' Author    : beededea
' Date      : 18/09/2020
' Purpose   :  This initialises each VB collection object where the image bitmaps will be stored
'              This method of using the scripting dictionary as an object collection was suggested by Olaf Schmidt.
'---------------------------------------------------------------------------------------
'

Private Sub createDictionaryObjects()
    
   On Error GoTo createDictionaryObjects_Error
   
    If debugflg = 1 Then debugLog "% sub createDictionaryObjects"
   
    ' dictionary for the larger icons
    Set collLargeIcons = CreateObject("Scripting.Dictionary")
    collLargeIcons.CompareMode = 1 'case-insenitive Key-Comparisons
    
    'dictionary for the smaller icons
    Set collSmallIcons = CreateObject("Scripting.Dictionary")
    collSmallIcons.CompareMode = 1 'case-insenitive Key-Comparisons
    
'    'third temporary dictionary that is used for temporary storage whilst generating large sized, transparent disabled images on the fly
'    Set collLargeTransparentIcons = CreateObject("Scripting.Dictionary")
'    collLargeTransparentIcons.CompareMode = 1 'case-insenitive Key-Comparisons
'
'    'third temporary dictionary that is used for temporary storage whilst generating small sized, transparent disabled images on the fly
'    Set collSmallTransparentIcons = CreateObject("Scripting.Dictionary")
'    collSmallTransparentIcons.CompareMode = 1 'case-insenitive Key-Comparisons

   On Error GoTo 0
   Exit Sub

createDictionaryObjects_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure createDictionaryObjects of Form dock"
End Sub



'---------------------------------------------------------------------------------------
' Procedure : createGDIPlusElements
' Author    : beededea
' Date      : 18/09/2020
' Purpose   : sets bmpInfo object to create a bitmap the whole screen size and get a handle to the Device Context
'---------------------------------------------------------------------------------------
'
Private Sub createGDIPlusElements()
    ' sets the bmpInfo object containing data to create a bitmap the whole screen size
    ' used later when creating DIB section of the correct size, width &c
    On Error GoTo createGDIPlusElements_Error
   
    If debugflg = 1 Then debugLog "% sub createGDIPlusElements"

    bmpInfo.bmpHeader.Size = Len(bmpInfo.bmpHeader)
    bmpInfo.bmpHeader.BitCount = 32
    bmpInfo.bmpHeader.Height = Me.ScaleHeight
    
    bmpInfo.bmpHeader.Width = screenWidthPixels  ' .59 DAEB 26/04/2021 frmMain.frm changed to use pixels alone, removed all unnecesary twip conversion
    
    bmpInfo.bmpHeader.Planes = 1
    bmpInfo.bmpHeader.SizeImage = bmpInfo.bmpHeader.Width * bmpInfo.bmpHeader.Height * (bmpInfo.bmpHeader.BitCount / 8)
    
    ' A handle to the Device Context (HDC) is obtained before output is written and then released after elements have been written.
    ' Get a device context compatible with the screen
    dcMemory = CreateCompatibleDC(hdcScreen)

    ' A device context is a generalized rendering abstraction. It serves as a proxy between your rendering code and the output device.
    ' It allows you to use the same rendering code, regardless of the destination; the low-level details are handled for you,
    ' depending on the output device, including clipping, scaling, and viewport translation.
    
   On Error GoTo 0
   Exit Sub

createGDIPlusElements_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure createGDIPlusElements of Form dock"

End Sub


'---------------------------------------------------------------------------------------
' Procedure : setAutoHide
' Author    : beededea
' Date      : 18/09/2020
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub setAutoHide()
    ' allows the autohide check timer to lower the dock after a short delay during startup
   On Error GoTo setAutoHide_Error
   
    If debugflg = 1 Then debugLog "% sub setAutoHide"

    If rDAutoHide = "1" Then
        autoHideChecker.Interval = 1
        dockLoweredTime = TimeValue(Now)
    End If

   On Error GoTo 0
   Exit Sub

setAutoHide_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure setAutoHide of Form dock"
End Sub



'---------------------------------------------------------------------------------------
' Procedure : setUpProcessTimers
' Author    : beededea
' Date      : 18/09/2020
' Purpose   : set up the timers that check to see if each process is running
'---------------------------------------------------------------------------------------
'
Private Sub setUpProcessTimers()
    
    ' start the 10s timer that checks to see if each process is running
   On Error GoTo setUpProcessTimers_Error
   
    If debugflg = 1 Then debugLog "% sub setUpProcessTimers"

    processTimer.Interval = Val(rDRunAppInterval) * 1000
    explorerTimer.Interval = Val(rDRunAppInterval) * 1000
    If rDShowRunning = "1" Then
        processTimer.Enabled = True
        explorerTimer.Enabled = True
    Else
        processTimer.Enabled = False
        explorerTimer.Enabled = False
    End If
    
    initiatedProcessTimer.Enabled = True ' this was enabled by default on a 5 second timer but is now here with a reduced interval, this manual start giving time to the whole
                                         ' tool to get its stuff done before it runs.
    initiatedExplorerTimer.Enabled = True
                                         
    targetExistsTimer.Enabled = True
    
   On Error GoTo 0
   Exit Sub

setUpProcessTimers_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure setUpProcessTimers of Form dock"

End Sub



'---------------------------------------------------------------------------------------
' Procedure : GetMonitorCount
' Author    : beededea
' Date      : 02/03/2020
' Purpose   : The number of monitors is known by RD
'---------------------------------------------------------------------------------------
'
Private Function GetMonitorCount() As Integer

    ' variables declared
   Dim NumberOfMonitors As Integer: NumberOfMonitors = 0


   NumberOfMonitors = 1

   On Error GoTo GetMonitorCount_Error
   'If debugflg = 1 Then debugLog "%GetMonitorCount"

   NumberOfMonitors = GetSystemMetrics(SM_CMONITORS)

   GetMonitorCount = NumberOfMonitors

   On Error GoTo 0
   Exit Function

GetMonitorCount_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure GetMonitorCount of Form dockSettings"

End Function



'---------------------------------------------------------------------------------------
' Procedure : autoHideChecker_Timer
' Author    : beededea
' Date      : 01/05/2020
' Purpose   : checks to see if the dock needs to be hidden, if so, initiates one of the hider timers
'             runs from the outset on a half second interval controls when the dock is lowered
'---------------------------------------------------------------------------------------
'
Private Sub autoHideChecker_Timer()
   Dim secondDiff As Long: secondDiff = 0
   'On Error GoTo autoHideChecker_Error
   ''If debugflg = 1 Then debugLog "%autoHideChecker"

        If rDAutoHide = "1" And animatedIconsRaised = False And dockHidden = False Then
            autoHideChecker.Interval = 500
            If dockLoweredTime <> "00:00:00" Then
                secondDiff = DateDiff("s", dockLoweredTime, TimeValue(Now))
            End If
            ' time since the dock was lowered
            If secondDiff > (Val(rDAutoHideDelay) / 1000) Then
                If Val(sDAutoHideType) = 0 Then ' fade animation
                    autoHideMode = "fadeout"
                    autoFadeOutTimer.Enabled = True ' .nn
                ElseIf Val(sDAutoHideType) = 1 Then ' slide animation as per Rocketdock
                    'xAxisModifier = 0 ' .nn not needed and commented out to prevent slider oscillating
                    autoSlideMode = "slideout"
                    autoSlideOutTimer.Enabled = True
                ElseIf Val(sDAutoHideType) = 2 Then 'instant invisible
                    ' set the opacity of the whole dock, used to display solidly and for instant autohide
                    funcBlend32bpp.SourceConstantAlpha = 0
                    bDrawn = False
                    smallDockBeenDrawn = False ' allows the dock to redraw on the next response cycle
                    Exit Sub
                End If
            End If
        End If

   On Error GoTo 0
   Exit Sub

autoHideChecker_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure autoHideChecker of Form dock"
End Sub
' 24/01/2021 .09 DAEB created a separate fade in timer and function
'---------------------------------------------------------------------------------------
' Procedure : autoFadeInTimer
' Author    : beededea
' Date      : 18/05/2020
' Purpose   : the timer's interval is set as a slider within dock settings
'             this routine simply gradually sets the opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha
'---------------------------------------------------------------------------------------
'
Private Sub autoFadeInTimer_Timer()
    Dim newDockOpacity As Integer: newDockOpacity = 0
    Dim autoHideGranularity  As Double: autoHideGranularity = 0
    
    On Error GoTo autoFadeInTimer_Error
    
    newDockOpacity = 0
    dockOpacity = 100
    
    autoHideChecker.Enabled = False
    autoFadeOutTimer.Enabled = False
    
    responseTimer.Interval = 4  ' this frequency is also maintained within the responseTimer event. This event does the animation that actually
                                ' accomplishes the fade
                                ' it stays at this frequency until the fadeTimer is done when it reverts to 200
                                ' it is important as this maintains the smoothness of the fadeout.
    autoFadeInTimerCount = autoFadeInTimerCount + 10  ' .10 DAEB 25/01/2021 Added new parameter autoFadeInTimerCount for the new fade in timer

    If rDPopupDelay = 0 Then rDPopupDelay = 1 ' .24 DAEB frmMain.frm 09/02/2021 handling any potential divide by zero

    autoHideGranularity = dockOpacity / rDPopupDelay ' set the factor by which the timer should decrease the opacity
    newDockOpacity = 1 + (autoFadeInTimerCount * autoHideGranularity) ' .10 DAEB 25/01/2021 Added new parameter autoFadeInTimerCount for the new fade in timer
    
    If newDockOpacity > 100 Then newDockOpacity = 100 ' funcBlend32bpp.SourceConstantAlpha does not like values less than 0
    
    ' set the increasingly increased opacity of the whole dock
    funcBlend32bpp.SourceConstantAlpha = 255 * newDockOpacity / 100
    
    If autoFadeInTimerCount >= Val(rDPopupDelay) Then ' .10 DAEB 25/01/2021 Added new parameter autoFadeInTimerCount for the new fade in timer
        ' ensure the opacity of the whole dock is solid
        funcBlend32bpp.SourceConstantAlpha = 255
        dockHidden = False
    
        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
        autoFadeInTimer.Enabled = False
        autoFadeInTimerCount = 0 ' .10 DAEB 25/01/2021 Added new parameter autoFadeInTimerCount for the new fade in timer
        autoHideChecker.Enabled = True
    End If
    
    bDrawn = False
    smallDockBeenDrawn = False ' set a flag to allow the animation to redraw
            
   On Error GoTo 0
   Exit Sub

autoFadeInTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure autoFadeInTimer of Form dock"
    
End Sub

' .01 24/01/2021 DAEB modified to handle the new timer name
'---------------------------------------------------------------------------------------
' Procedure : autoFadeOutTimer
' Author    : beededea
' Date      : 18/05/2020
' Purpose   : the timer's interval is set as a slider within dock settings
'             this routine simply gradually sets the opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha
'---------------------------------------------------------------------------------------
'
Private Sub autoFadeOutTimer_Timer()

    Dim newDockOpacity As Integer: newDockOpacity = 0
    Dim autoHideGranularity  As Double: autoHideGranularity = 0
    
    On Error GoTo autoFadeOutTimer_Error
    
    newDockOpacity = 0
    dockOpacity = 100
    
    autoHideChecker.Enabled = False
    
    If animatedIconsRaised = True Then
        autoFadeOutTimer.Enabled = False
        Exit Sub
    End If
    
    If autoFadeInTimer.Enabled = True Then
        autoFadeOutTimer.Enabled = False
        Exit Sub
    End If
        
    responseTimer.Interval = 4  ' this frequency is also maintained within the responseTimer event. This event does the animation that actually
                                ' accomplishes the fade
                                ' it stays at this frequency until the fadeTimer is done when it reverts to 200
                                ' it is important as this maintains the smoothness of the fadeout.
    autoFadeOutTimerCount = autoFadeOutTimerCount + 10
    If rDAutoHideTicks = 0 Then rDAutoHideTicks = 1 ' .24 DAEB frmMain.frm 09/02/2021 handling any potential divide by zero
    autoHideGranularity = dockOpacity / rDAutoHideTicks ' set the factor by which the timer should decrease the opacity
    
    ' 24/01/2021 .08 DAEB removed the fade in functions from the fade out subroutine

    newDockOpacity = 100 - (autoFadeOutTimerCount * autoHideGranularity)
    If newDockOpacity < 0 Then newDockOpacity = 0 ' funcBlend32bpp.SourceConstantAlpha does not like values less than 0
    
    ' set the increasingly reduced/increased opacity of the whole dock
    funcBlend32bpp.SourceConstantAlpha = 255 * newDockOpacity / 100
    
    If autoFadeOutTimerCount >= Val(rDAutoHideTicks) Then
        ' ensure the opacity of the whole dock is zero
        funcBlend32bpp.SourceConstantAlpha = 0
        dockHidden = True
    
        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
        autoFadeOutTimer.Enabled = False
        autoFadeOutTimerCount = 0
        'autoHideChecker.Enabled = True
        
        dockEntranceLocation = screenHeightPixels - 10
    End If
    
    bDrawn = False
    smallDockBeenDrawn = False ' set a flag to allow the animation to redraw
            
   On Error GoTo 0
   Exit Sub

autoFadeOutTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure autoFadeOutTimer of Form dock"
    
End Sub
''---------------------------------------------------------------------------------------
'' Procedure : autoFadeOutTimer
'' Author    : beededea
'' Date      : 18/05/2020
'' Purpose   : the timer's interval is set as a slider within dock settings
''             this routine simply gradually sets the opacity of the dock when triggered using funcBlend32bpp.SourceConstantAlpha
''---------------------------------------------------------------------------------------
''
'Private Sub autoFadeOutTimer_Timer()
'
'    Dim newDockOpacity As Integer : = 0
'    Dim autoHideGranularity  As double: = 0
'
'    On Error GoTo autoFadeOutTimer_Error
'
'
'    newDockOpacity = 0
'    dockOpacity = 100
'
'    If autoHideMode = "fadeout" And animatedIconsRaised = True Then
'        autoHideMode = "fadein" 'if the cursor enters the dock during a fade out this will turn it into a fade in
'    End If
'
'    responseTimer.Interval = 5  ' this frequency is also maintained within the responseTimer event. This event does the animation that actually
'                                ' accomplishes the fade
'                                ' it stays at this frequency until the fadeTimer is done when it reverts to 200
'                                ' it is important as this maintains the smoothness of the fadeout.
'    autoFadeOutTimerCount = autoFadeOutTimerCount + 10
'    autoHideGranularity = dockOpacity / rDAutoHideTicks ' set the factor by which the timer should decrease the opacity
'
'    If autoHideMode = "fadeout" Then
'        newDockOpacity = 100 - (autoFadeOutTimerCount * autoHideGranularity)
'    Else
'        newDockOpacity = 1 + (autoFadeOutTimerCount * autoHideGranularity)
'    End If
'
'    If newDockOpacity < 0 Then newDockOpacity = 0 ' funcBlend32bpp.SourceConstantAlpha does not like values less than 0
'    If newDockOpacity > 100 Then newDockOpacity = 100 ' funcBlend32bpp.SourceConstantAlpha does not like values less than 0
'
'    ' set the increasingly reduced/increased opacity of the whole dock
'    funcBlend32bpp.SourceConstantAlpha = 255 * newDockOpacity / 100
'
'    If autoFadeOutTimerCount >= Val(rDAutoHideTicks) Then
'        If autoHideMode = "fadeout" Then
'            ' ensure the opacity of the whole dock is zero
'            funcBlend32bpp.SourceConstantAlpha = 0
'            dockHidden = True
'        Else
'            ' ensure the opacity of the whole dock is solid
'            funcBlend32bpp.SourceConstantAlpha = 255
'            dockHidden = False
'        End If
'
'        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
'        autoFadeOutTimer.Enabled = False
'        autoFadeOutTimerCount = 0
'    End If
'
'    bDrawn = False
'    smallDockBeenDrawn = False ' set a flag to allow the animation to redraw
'
'   On Error GoTo 0
'   Exit Sub
'
'autoFadeOutTimer_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure autoFadeOutTimer of Form dock"
'
'End Sub

' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions STARTS
'---------------------------------------------------------------------------------------
' Procedure : autoSlideOutTimer
' Author    : beededea
' Date      : 25/09/2020
' Purpose   : slide the dock in the Y axis
'---------------------------------------------------------------------------------------
'
Private Sub autoSlideOutTimer_Timer()
    Dim autoSlideGranularity  As Double: autoSlideGranularity = 0
    Dim amountToSlidePxls As Integer: amountToSlidePxls = 0
    
    amountToSlidePxls = 25

    On Error GoTo autoSlideOutTimer_Error

    autoHideChecker.Enabled = False

    If animatedIconsRaised = True Then
        autoSlideOutTimer.Enabled = False
        Exit Sub
    End If
    
    If autoSlideInTimer.Enabled = True Then
        autoSlideOutTimer.Enabled = False
        Exit Sub
    End If
        
    amountToSlidePxls = 25

    'If animatedIconsRaised = True Then autoSlideMode = "slidein" 'if the cursor enters the dock during a fade out this will turn it into a fade in

    responseTimer.Interval = 4  ' this frequency is also maintained within the responseTimer event. This event does the animation that actually
                                ' accomplishes the fade
                                ' it stays at this frequency until the fadeTimer is done when it reverts to 200
                                ' it is important as this maintains the smoothness of the slideout.
    autoSlideOutTimerCount = autoSlideOutTimerCount + 5  '10ms
    If rDAutoHideTicks = 0 Then rDAutoHideTicks = 1 ' .24 DAEB frmMain.frm 09/02/2021 handling any potential divide by zero
    autoSlideGranularity = amountToSlidePxls / rDAutoHideTicks ' set the factor by which the timer should slide out the dock
    
    ' modify the whole dock in the Y axis here using
    xAxisModifier = xAxisModifier + (autoSlideOutTimerCount * autoSlideGranularity)
    
    ' check whether the sliding dock is below the level of the screen
    If iconCurrentTopPxls - 10 > (screenHeightPixels) Then ' the extra 10 pixels is to ensure the theme is off screen too
        autoSlideOutTimer.Enabled = False
        autoSlideOutTimerCount = 0
        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
        dockSlidOut = True ' we need a flag to state that the dock has 'slidden' to determine the position just the first 10 pixels of the dock
        dockHidden = True
    End If
    
    If autoSlideOutTimerCount >= Val(rDAutoHideTicks) Then
        ' ensure the opacity of the whole dock is zero
        'funcBlend32bpp.SourceConstantAlpha = 0
        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
        autoSlideOutTimer.Enabled = False
        autoSlideOutTimerCount = 0
        dockSlidOut = True ' we need a flag to state that the dock has 'slidden'
        dockHidden = True
    End If

    bDrawn = False
    smallDockBeenDrawn = False ' set a flag to allow the animation to redraw

    On Error GoTo 0
    Exit Sub

autoSlideOutTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure autoSlideOutTimer_ of Form dock"

End Sub
' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions ENDS


' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions STARTS
'---------------------------------------------------------------------------------------
' Procedure : autoSlideInTimer_Timer
' Author    : beededea
' Date      : 25/09/2020
' Purpose   : slide the dock in the Y axis
'---------------------------------------------------------------------------------------
'
Private Sub autoSlideInTimer_Timer()
    Dim autoSlideGranularity  As Double: autoSlideGranularity = 0
    Dim amountToSlidePxls As Integer: amountToSlidePxls = 0
    
    On Error GoTo autoSlideInTimer_Error
    
    amountToSlidePxls = 25
    autoSlideOutTimer.Enabled = False
    dockSlidOut = False
 
    autoHideChecker.Enabled = False
 
    'animateTimer.Enabled = True
 
    responseTimer.Interval = 4  ' this frequency is also maintained within the responseTimer event. This event does the animation that actually
                                ' accomplishes the fade
                                ' it stays at this frequency until the fadeTimer is done when it reverts to 200
                                ' it is important as this maintains the smoothness of the slideout.
    autoSlideInTimerCount = autoSlideInTimerCount + 5  '10ms
    If rDAutoHideTicks = 0 Then rDAutoHideTicks = 1 ' .24 DAEB frmMain.frm 09/02/2021 handling any potential divide by zero

    autoSlideGranularity = amountToSlidePxls / rDAutoHideTicks ' set the factor by which the timer should slide out the dock
    
    If iconCurrentTopPxls < 860 Then ' .nn this is the bug just here
        iconCurrentTopPxls = 860 '.nn
        autoSlideInTimer.Enabled = False
        autoSlideInTimerCount = 0
        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
        dockHidden = False
        autoSlideMode = vbNullString 'nn Set to nothing to ensure that the modifiedslide position is not taken into account when redrawing the static loop
    Else
        ' modify the whole dock in the Y axis here using .nn
        xAxisModifier = xAxisModifier + (autoSlideInTimerCount * autoSlideGranularity)
    End If
    
    If autoSlideInTimerCount >= Val(rDAutoHideTicks) Then
        ' ensure the opacity of the whole dock is zero
        'funcBlend32bpp.SourceConstantAlpha = 0
        responseTimer.Interval = 200 ' return the responseTimer interval to normal, may not be necessary here
        autoSlideInTimer.Enabled = False
        autoSlideInTimerCount = 0
        dockSlidOut = True ' we need a flag to state that the dock
        dockHidden = True
    End If

    bDrawn = False
    smallDockBeenDrawn = False ' set a flag to allow the animation to redraw

    On Error GoTo 0
    Exit Sub

autoSlideInTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure autoSlideInTimer of Form dock"

End Sub
' .28 DAEB frmMain.frm 16/02/2021 Seperated the autoSlide Timers to in and out versions ENDS


' .14 DAEB frmMain.frm 27/01/2021 Add new subroutine to make the dock transparent and shutdown timers
'---------------------------------------------------------------------------------------
' Procedure : HideDockNow
' Author    : beededea
' Date      : 25/01/2021
' Purpose   : hides the dock when the user presses F11 or when the menu option is selected to hide, sets the alpha and
'             stops all timers
'---------------------------------------------------------------------------------------
'
Public Sub HideDockNow()
   On Error GoTo HideDockNow_Error
    
    dock.nMinuteExposeTimer.Enabled = True ' timers are associated with forms, stupid VB6
    hideDockForNMinutes = True
    
    funcBlend32bpp.SourceConstantAlpha = 0
    
    Call GdipDeleteGraphics(lngImage)  'The graphics may now be deleted

    'Update the specified window handle (hwnd) with a handle to our bitmap (dc) passing all the required characteristics
    UpdateLayeredWindow Me.hwnd, hdcScreen, ByVal 0&, apiWindow, dcMemory, apiPoint, 0, funcBlend32bpp, ULW_ALPHA
    
    dockHidden = True
    
    responseTimer.Enabled = False
    animateTimer.Enabled = False
    autoFadeOutTimer.Enabled = False
    autoFadeInTimer.Enabled = False
    autoSlideOutTimer.Enabled = False
    autoSlideInTimer.Enabled = False

   On Error GoTo 0
   Exit Sub

HideDockNow_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure HideDockNow of Form dock"
    
End Sub
' .14 DAEB frmMain.frm 27/01/2021 Add new subroutine to make the dock transparent and shutdown timers

' .15 frmMain.frm STARTS DAEB 27/01/2021 Add new subroutine to show the dock after it has been manually hidden by the user
'---------------------------------------------------------------------------------------
' Procedure : ShowDockNow
' Author    : beededea
' Date      : 26/01/2021
' Purpose   : Shows the dock after it has been manually hidden by the user
'---------------------------------------------------------------------------------------
'
Public Sub ShowDockNow()
   On Error GoTo ShowDockNow_Error

        nMinuteExposeTimer.Enabled = False ' timers are associated with forms, stupid VB6
        nMinuteExposeTimerCount = 0
        hideDockForNMinutes = False
        
        funcBlend32bpp.SourceConstantAlpha = 255
        
        Call GdipDeleteGraphics(lngImage)  'The graphics may now be deleted

        'Update the specified window handle (hwnd) with a handle to our bitmap (dc) passing all the required characteristics
        UpdateLayeredWindow Me.hwnd, hdcScreen, ByVal 0&, apiWindow, dcMemory, apiPoint, 0, funcBlend32bpp, ULW_ALPHA
        
        responseTimer.Enabled = True

   On Error GoTo 0
   Exit Sub

ShowDockNow_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure ShowDockNow of Form dock"
End Sub
' .15 frmMain.frm ENDS DAEB 27/01/2021 Add new subroutine to show the dock after it has been manually hidden by the user


'---------------------------------------------------------------------------------------
' Procedure : nMinuteExposeTimer
' Author    : beededea
' Date      : 25/01/2021
' Purpose   : Causes the dock to re-appear in its default state after N mins
'             Shows the dock after it has been manually hidden by the user
'---------------------------------------------------------------------------------------
'
Private Sub nMinuteExposeTimer_Timer()
    Dim itIs As Boolean: itIs = False         ' .84 DAEB 20/07/2021 frmMain.frm Added prevention of the dock returning until the hiding application is no longer running.

    On Error GoTo nMinuteExposeTimer_Error

    ' when a timer is initiated it runs immediately, we want it to do nothing until the 10 mins is up
    
    ' the default timer interval is 60000 milliseconds or 60 seconds,
    ' every 60 seconds it increments the nMinuteExposeTimerCount by one
    
    ' reason for this is that a VB6 timer can only extend up to 65 secs/65000 millisecs,
    
    ' .52 DAEB 09/04/2021 frmMain.frm add code to increase the timer to 120 minutes
        
    ' if both the timer set value is greater than 65 and the current count is at the max then
    ' stop and restart the timer
    If Val(sDContinuousHide) >= 65 And nMinuteExposeTimerCount = 65 Then
        nMinuteExposeTimer.Enabled = False
        nMinuteExposeTimerCount = 0
        nMinuteExposeTimer.Enabled = True
        Exit Sub ' exit as the timer will start immediately and the count will be incremented on that very same run
    End If

    If nMinuteExposeTimerCount <= Val(sDContinuousHide) - 1 Then  ' .16 DAEB frmMain.frm 27/01/2021 Added the user set parameter sDContinuousHide
        If Not nMinuteExposeTimerCount = 65 Then     ' .52 DAEB 09/04/2021 frmMain.frm add code to increase the timer to 120 minutes
            nMinuteExposeTimerCount = nMinuteExposeTimerCount + 1
        End If
        Exit Sub
    Else
        ' .84 DAEB 20/07/2021 frmMain.frm Added prevention of the dock returning until the hiding application is no longer running.
        
        ' .nn DAEB 16/04/2022 frmMain.frm was the dock hidden by the running of a utility with the hide dock flag set?
        If autoHideProcessName <> vbNullString Then
            ' check to see if the process that hid the dock is still running
            ' the dock will not automatically appear until the process that hid it has finished (full screen games)
            itIs = IsRunning(autoHideProcessName, vbNull)
            If itIs = True Then
                ' the timer will continue to run
                Exit Sub
            Else
                autoHideProcessName = vbNullString
                Call ShowDockNow
            End If
        Else
            Call ShowDockNow ' normal timed run, just show the dock
        End If
    End If
    

   On Error GoTo 0
   Exit Sub

nMinuteExposeTimer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure nMinuteExposeTimer of Form dock"
    
End Sub




'---------------------------------------------------------------------------------------
' Procedure : disableAdmin
' Author    : beededea
' Date      : 28/01/2021
' Purpose   : turn off the run as administrator option for XP
'---------------------------------------------------------------------------------------
'
Private Sub disableAdmin()
   On Error GoTo disableAdmin_Error
   
    If debugflg = 1 Then debugLog "% sub disableAdmin"

    If InStr(WindowsVer, "Windows XP") <> 0 Then
        menuForm.mnuAdmin.Enabled = False
    End If

   On Error GoTo 0
   Exit Sub

disableAdmin_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure disableAdmin of Form dock"
End Sub





'---------------------------------------------------------------------------------------
' Procedure : Retn
' Author    : La Volpe
' Date      : 22/02/2021
' Purpose   : ' .31 DAEB 03/03/2021 frmMain.frm Check return value from any GDI++ function
'---------------------------------------------------------------------------------------
'
'Private Sub Retn(GdipReturn As Long)
'    ' Just to check for any errors.
'    '
'   On Error GoTo Retn_Error
'
'    If GdipReturn = OK Then Exit Sub
'                                        Debug.Print "GDI+ Error:  ";
'    Select Case GdipReturn
'    Case GenericError:                  Debug.Print "Generic Error"
'    Case InvalidParameter:              Debug.Print "Invalid Parameter/Argument"
'    Case OutOfMemory:                   Debug.Print "Out Of Memory"
'    Case ObjectBusy:                    Debug.Print "Object Busy, already in use in another thread"
'    Case InsufficientBuffer:            Debug.Print "Insufficient Buffer, buffer specified as an argument in the API call is not large enough"
'    Case NotImplemented:                Debug.Print "Method Not Implemented"
'    Case Win32Error:                    Debug.Print "Win32 Error"
'    Case WrongState:                    Debug.Print "Wrong State"
'    Case Aborted:                       Debug.Print "Method Aborted"
'    Case FileNotFound:                  Debug.Print "File Not Found"
'    Case ValueOverflow:                 Debug.Print "Value Overflow, arithmetic operation that produced a numeric overflow"
'    Case AccessDenied:                  Debug.Print "Access Denied"
'    Case UnknownImageFormat:            Debug.Print "Unknown Image Format"
'    Case FontFamilyNotFound:            Debug.Print "Font Family Not Found"
'    Case FontStyleNotFound:             Debug.Print "Font Style Not Found"
'    Case NotTrueTypeFont:               Debug.Print "Not TrueType Font"
'    Case UnsupportedGdiplusVersion:     Debug.Print "Unsupported Gdiplus Version"
'    Case GdiplusNotInitialized:         Debug.Print "Gdiplus Not Initialized"
'    Case PropertyNotFound:              Debug.Print "Property Not Found, does not exist in the image"
'    Case PropertyNotSupported:          Debug.Print "Property Not Supported, not supported by the format of the image"
'    Case ProfileNotFound:               Debug.Print "Profile Not Found, color profile required to save an image in CMYK format was not found"
'    Case Else:                          Debug.Print "Error Not Specified"
'    End Select
'    '
'    Stop
'
'   On Error GoTo 0
'   Exit Sub
'
'Retn_Error:
'
'    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Retn of Form dock"
'End Sub




'
'
'
'
'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
'<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0" xmlns:asmv3="urn:schemas-microsoft-com:asm.v3">
'    <assemblyIdentity
'        Version = "2002.10.0.25"
'        processorArchitecture = "X86"
'        name = "vb6.exe"
'        type="win32" />
'    <description>WindowsExecutable</description>
'    <dependency>
'        <dependentAssembly>
'            <assemblyIdentity
'                type="win32"
'                name = "Microsoft.Windows.Common-Controls"
'                Version = "6.0.0.0"
'                processorArchitecture = "X86"
'                publicKeyToken = "6595b64144ccf1df"
'                language="*" />
'        </dependentAssembly>
'    </dependency>
'    <asmv3:application>
'        <asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
'            <dpiAware>true</dpiAware>
'        </asmv3:windowsSettings>
'    </asmv3:application>
'    <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
'        <application>
'            <supportedOS Id="{e2011457-1546-43c5-a5fe-008deee3d3f0}" />
'            <supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}" />
'            <supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}" />
'            <supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}" />
'            <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
'        </application>
'    </compatibility>
'</assembly>

'Private Sub sleepTimer_Timer()
'        ' .nn
'    ' The device went to sleep with the use of the sleep command, therefore
'    ' the dock has been raised but when the system restarted the mouse ended up outside
'    ' of the dock area. So, lower dock by redrawing the small icons.
'    If outsideDock = True And animatedIconsRaised = True Then
'        If msgCnt = 0 Then MsgBox "1. just woke from sleep"
'        msgCnt = 1
'    End If
'End Sub




'Private Function WindowProc(ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
'
'   ' // capture messages //
'
'   Select Case wMsg
'
'         Case WM_POWERBROADCAST ' Sent to an application to notify it of power-management events.
'
'            ' show messages in listbox for testing
'            'FMsgSink.List1.AddItem "WM_POWERBROADCAST, wParam = " & wParam & " lParam = " & lParam
'
'            ' coming out of sleep mode would be...?
'            If wParam = enPowerBroadcastType.PBT_APMRESUMESUSPEND Then
'                ' do something here
'                'MsgBox "2. just woke from sleep"
'            End If
'
'            ' going in to sleep mode would be...?
'            If wParam = enPowerBroadcastType.PBT_APMSUSPEND Then
'
'
'                ' do something here
'            End If
'
'            ' .Do Not Remove!
'            WindowProc = DefWindowProc(hWnd, wMsg, wParam, lParam)
'
'      Case Else
'         ' Default processing...Do Not Remove!
'         WindowProc = DefWindowProc(hWnd, wMsg, wParam, lParam)
'
'   End Select
'
'End Function








' .58 DAEB 21/04/2021 frmMain.frm added timer and vars to check to see if the system has just emerged from sleep
'---------------------------------------------------------------------------------------
' Procedure : sleepTimer_Timer
' Author    : beededea
' Date      : 21/04/2021
' Purpose   : timer that stores the last time
' if the current time is greater than the last time stored by more than 30 seconds we can assume the system
' has been sent to sleep, if the two are significantly different then we reorganise the dock
'---------------------------------------------------------------------------------------
'
Private Sub sleepTimer_Timer()
    Dim strTimeNow As String: strTimeNow = vbNullString 'set a variable to compare for the NOW time
    Dim lngSecondsGap As Long: lngSecondsGap = 0  ' set a variable for the difference in time
    
    On Error GoTo sleepTimer_Timer_Error

    strTimeNow = Now()
    
    lngSecondsGap = DateDiff("s", strTimeThen, strTimeNow)

    If lngSecondsGap > 30 Then
        'MsgBox "System has just woken up from a sleep"
        MessageBox Me.hwnd, "System has just woken up from a sleep - animatedIconsRaised =" & animatedIconsRaised, "SteamyDock Information Message", vbOKOnly

        ' at this point we should lower the dock and redraw the small icons.
        'If animatedIconsRaised = True Then
        
        ' the dock thinks the animatedIconsRaised is false!
        'Call sequentialBubbleAnimation 'here deanie
        Call animateTimer_Timer
        strTimeThen = Now
    Else
        strTimeThen = Now
    End If
    

    On Error GoTo 0
    Exit Sub

sleepTimer_Timer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure sleepTimer_Timer of Form dock"

End Sub


'---------------------------------------------------------------------------------------
' Procedure : transit
' Author    : beededea
' Date      : 17/05/2021
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub transit(fromX, fromY, toX, toY)

    On Error GoTo transit_Error

    

    On Error GoTo 0
    Exit Sub

transit_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure transit of Form dock"
End Sub

' .86 DAEB 08/12/2022 frmMain.frm Added new timer to inspect each target command in turn and highlight if missing.
'---------------------------------------------------------------------------------------
' Procedure : targetExistsTimer_Timer
' Author    : beededea
' Date      : 08/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Sub targetExistsTimer_Timer()
    On Error GoTo targetExistsTimer_Timer_Error

    Call checkTargetCommandValidity

    On Error GoTo 0
    Exit Sub

targetExistsTimer_Timer_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure targetExistsTimer_Timer of Form dock"
            Resume Next
          End If
    End With
End Sub
' .86 DAEB 08/12/2022 frmMain.frm Added new timer to inspect each target command in turn and highlight if missing.
'---------------------------------------------------------------------------------------
' Procedure : checkTargetCommandValidity
' Author    : beededea
' Date      : 08/12/2022
' Purpose   : Checks each target command for validity and sets a flag in an array to place a red X on the icon.
'             Written using GOTOs as VB6 does not have a CONTINUE command, I will rewrite this.
'---------------------------------------------------------------------------------------
'
Private Sub checkTargetCommandValidity()
    
    On Error GoTo checkTargetCommandValidity_Error

    Dim useloop As Integer: useloop = 0
    Dim thisCommand As String: thisCommand = vbNullString
    Dim userprof As String: userprof = vbNullString
    Dim folderPath As String: folderPath = vbNullString
    Dim fileSuffixArray() As String: ' fileSuffixArray() = vbNullString
    Dim executableFileString As String: executableFileString = vbNullString
    Dim suffixElement As Variant
    Dim testURL As String: testURL = vbNullString
    Dim pathString As String: pathString = vbNullString
    Dim pathArray() As String: ' pathArray() = vbNullString
    Dim pathElement As Variant ' you cannot initialise a variant
    Dim currentCommand As String: currentCommand = vbNullString
    
    executableFileString = "com cmd msc cpl bat exe"
    pathString = Environ$("path")
    
    For useloop = 0 To rdIconMaximum
        targetExistsArray(useloop) = 0

        ' instead of looping through all the command stored in the docksettings.ini file, we now store all the current commands in an array
        ' we loop through the array much quicker than looping through the temporary settings file and extracting the commands from each

        ' if the array location is empty then use GOTO to jump to the next iteration, ' sorry! VB6 has no continue.
        If sCommandArray(useloop) = vbNullString Then GoTo l_next_iteration
        thisCommand = sCommandArray(useloop)

        If FExists(thisCommand) Then
            GoTo l_next_iteration ' when we match a condition we loop over the subsequent conditions to iterate over the next item.
        End If
                    
        If DirExists(thisCommand) Then         ' is it a folder?
            GoTo l_next_iteration
        End If

        If InStr(thisCommand, "::{") Then      ' is it a folder?
            GoTo l_next_iteration
        End If
                        
        If InStr(thisCommand, "%userprofile%") Then
            userprof = Environ$("USERPROFILE")
            thisCommand = Replace(thisCommand, "%userprofile%", userprof)
            If FExists(thisCommand) Then
                GoTo l_next_iteration
            End If
        End If
        
        If InStr(thisCommand, "%systemroot%") Then
            userprof = Environ$("SYSTEMROOT")
            thisCommand = Replace(thisCommand, "%systemroot%", userprof)
            If FExists(thisCommand) Then
                GoTo l_next_iteration
            End If
        End If
        
        If DirExists(thisCommand) Then         ' is it a folder? for the second time
            GoTo l_next_iteration
        End If
        
        ' Rocketdock commands compatibility
        If thisCommand = "[Quit]" Then
            GoTo l_next_iteration
        End If

        If thisCommand = "[Settings]" Then
            GoTo l_next_iteration
        End If

        If thisCommand = "[Icons]" Then
            GoTo l_next_iteration
        End If

        If thisCommand = "[RecycleBin]" Then
            GoTo l_next_iteration
        End If
        
        ' is the target a URL?
        testURL = Left(thisCommand, 3)
        If testURL = "htt" Or testURL = "www" Then
            GoTo l_next_iteration
        End If

        ' check in the windows folder, this is also done in the PATH check below but this one is quicker.
        If DirExists(Environ$("windir") & thisCommand) Then
            GoTo l_next_iteration
        End If
        
        ' these next two splits are meant to be at this location, to minimise them occurring
        
        'Use Split function to divide up the individual parts of the environment PATH string
        ' we do not want to do this every time, only when necessary and only once.
        If Not IsArrayInitialized(pathArray) Then pathArray = Split(pathString, ";")
        
        ' Use Split function to divide up the component parts of the suffix string
        ' we do not want to do this every time, only when necessary and only once.
        If Not IsArrayInitialized(fileSuffixArray) Then fileSuffixArray = Split(executableFileString)

        'iterate through the array created to work on each value, admin tools ends with .msc, .cpl, bat or exe
        For Each suffixElement In fileSuffixArray
            ' extract the suffix
            ' if the suffix is valid
            
            If InStr(thisCommand, "." & suffixElement) = 0 Then
                currentCommand = thisCommand & "." & suffixElement
            Else
                currentCommand = thisCommand
            End If
            
            If FExists(currentCommand) Then ' if the file exists and is valid
                    GoTo l_next_iteration
            Else
                For Each pathElement In pathArray
                    If FExists(pathElement & "\" & currentCommand) Then
                        GoTo l_next_iteration
                    End If
                Next pathElement
            End If
        Next suffixElement

l_set_flag:
        ' set a flag to enable a small 'x' on this icon
        targetExistsArray(useloop) = 1

l_next_iteration:
    Next useloop
    
    On Error GoTo 0
    Exit Sub

checkTargetCommandValidity_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure checkTargetCommandValidity of Form dock"
            Resume Next
          End If
    End With

End Sub
' .90 DAEB 08/12/2022 frmMain.frm Added routine to check for an array that has already been initialised
'---------------------------------------------------------------------------------------
' Procedure : IsArrayInitialized
' Author    : beededea
' Date      : 09/12/2022
' Purpose   :
'---------------------------------------------------------------------------------------
'
Function IsArrayInitialized(arr As Variant) As Boolean
    On Error GoTo IsArrayInitialized_Error

    If Not IsArray(arr) Then Err.Raise 13
    On Error Resume Next
    IsArrayInitialized = (LBound(arr) <= UBound(arr))

    On Error GoTo 0
    Exit Function

IsArrayInitialized_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure IsArrayInitialized of Form dock"
            Resume Next
          End If
    End With
End Function



'---------------------------------------------------------------------------------------
' Procedure : ScreenResolutionTimer_Timer
' Author    : beededea
' Date      : 17/05/2021
' Purpose   : This t
'---------------------------------------------------------------------------------------
'
Private Sub ScreenResolutionTimer_Timer()

    On Error GoTo ScreenResolutionTimer_Timer_Error
    
    screenHeightPixels = GetDeviceCaps(dock.hdc, VERTRES)
    screenWidthPixels = GetDeviceCaps(dock.hdc, HORZRES)
    
    If Not (screenHeightPixels = oldScreenHeightPixels) Or Not (screenWidthPixels = oldScreenWidthPixels) Then
        ' only restart the dock if the resolution has changed and the dock has not been deliberately hidden
        ' this prevents SD restarting and taking focus when a game changes the screen resolution.
        If dockHidden = False Then
            Call restartSteamydock
        End If
    End If
    
    On Error GoTo 0
    Exit Sub

ScreenResolutionTimer_Timer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure ScreenResolutionTimer_Timer of Form dock"
End Sub


'---------------------------------------------------------------------------------------
' Procedure : hourglassTimer_Timer
' Author    : beededea
' Date      : 30/04/2021
' Purpose   : ' .63 DAEB 29/04/2021 frmMain.frm load a small rotating hourglass image into the collection, used to signify running actions
'---------------------------------------------------------------------------------------
'
Private Sub hourglassTimer_Timer()
' load a small rotating hourglass image into the collection, used to signify running actions
    On Error GoTo hourglassTimer_Timer_Error

    hourglassTimerCount = hourglassTimerCount + 1
    If hourglassTimerCount > 5 Then hourglassTimerCount = 1
    
    hourglassimage = "hourglass" & hourglassTimerCount & "resizedImg128"

    On Error GoTo 0
    Exit Sub

hourglassTimer_Timer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure hourglassTimer_Timer of Form dock"

End Sub

'---------------------------------------------------------------------------------------
' Procedure : fValidateComponents
' Author    : beededea
' Date      : 21/12/2022
' Purpose   : exits immediately if a component is missing
'---------------------------------------------------------------------------------------
'
Private Function fValidateComponents() As Boolean
    On Error GoTo fValidateComponents_Error

    ' folder checks
    fValidateComponents = reportMissingDir(sdAppPath & "\sounds")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingDir(sdAppPath & "\icons")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingDir(sdAppPath & "\skins")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingDir(sdAppPath & "\dockSettings")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingDir(sdAppPath & "\help")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingDir(sdAppPath & "\iconSettings")
    If fValidateComponents = False Then Exit Function
'    fValidateComponents = reportMissingDir(sdAppPath & "\arse")
'    If fValidateComponents = False Then Exit Function
'
    
    fValidateComponents = reportMissingFile(sdAppPath & "\appIdent.csv")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\busy-F1-32x32x24.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\busy-F2-32x32x24.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\busy-F3-32x32x24.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\busy-F4-32x32x24.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\busy-F5-32x32x24.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\busy-F6-32x32x24.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\red.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\SteamyDock-splash.jpg")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\red-X.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\blank.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\separator.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\tinyCircle.png")
    If fValidateComponents = False Then Exit Function
    fValidateComponents = reportMissingFile(sdAppPath & "\nixietubelargeQ.png")
    If fValidateComponents = False Then Exit Function
    
    On Error GoTo 0
    Exit Function

fValidateComponents_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure fValidateComponents of Form dock"
            Resume Next
          End If
    End With
End Function


'---------------------------------------------------------------------------------------
' Procedure : reportMissingDir
' Author    : beededea
' Date      : 09/01/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Function reportMissingDir(ByVal folderToCheck As String) As Boolean
    On Error GoTo reportMissingDir_Error

    reportMissingDir = True
    If Not DirExists(folderToCheck) Then
        MsgBox "Essential component missing. Unable to find this folder: " & vbCr & vbCr & folderToCheck & vbCr & _
             vbCr & "Please re-install as some functions may not work properly." & _
             vbCr & "SteamyDock will now attempt to run but you may have to kill the steamydock process manually."
        reportMissingDir = False
    End If

    On Error GoTo 0
    Exit Function

reportMissingDir_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure reportMissingDir of Form dock"
            Resume Next
          End If
    End With
End Function


'---------------------------------------------------------------------------------------
' Procedure : reportMissingFile
' Author    : beededea
' Date      : 09/01/2023
' Purpose   :
'---------------------------------------------------------------------------------------
'
Private Function reportMissingFile(ByVal fileToCheck As String) As Boolean
    On Error GoTo reportMissingFile_Error

    reportMissingFile = True
    If Not FExists(fileToCheck) Then
        MsgBox "Essential component missing. Unable to find this folder: " & vbCr & vbCr & fileToCheck & vbCr & _
             vbCr & "Please re-install as some functions may not work properly." & _
             vbCr & "SteamyDock will now attempt to run but you may have to kill the steamydock process manually."
        reportMissingFile = False
    End If

    On Error GoTo 0
    Exit Function

reportMissingFile_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure reportMissingFile of Form dock"
            Resume Next
          End If
    End With
End Function

'---------------------------------------------------------------------------------------
' Procedure : selectBubbleAnimation
' Author    : beededea
' Date      : 09/01/2023
' Purpose   : there are three animation subroutines for the bubble animation
'---------------------------------------------------------------------------------------
'
Private Sub selectBubbleAnimation(ByVal animationType As Integer)

    On Error GoTo selectBubbleAnimation_Error

    Select Case animationType
        Case 1
            Call sequentialBubbleAnimation
        Case 2
            Call drawDockByCursorEntryPosition
        Case 3
            Call drawSmallStaticIcons
    End Select

    On Error GoTo 0
    Exit Sub

selectBubbleAnimation_Error:

    With Err
         If .Number <> 0 Then
            MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure selectBubbleAnimation of Form dock"
            Resume Next
          End If
    End With
    
End Sub



' .nn DAEB 16/04/2022 frmMain.frm new timer to force reveal the dock when the hiding process has ended
'---------------------------------------------------------------------------------------
' Procedure : forceHideRevealTimer_Timer
' DateTime  : 16/04/2022 12:59
' Author    : beededea
' Purpose   : Reveals the dock 0 - 1.5 secs after the hiding process has ended
'---------------------------------------------------------------------------------------
'
Private Sub forceHideRevealTimer_Timer()
    Dim itIs As Boolean: itIs = False

   On Error GoTo forceHideRevealTimer_Timer_Error

        'if the dock has been manually revealed by the user and another app has been run in the meantime
        ' then the autoHideProcessName will be blank
        If autoHideProcessName = vbNullString Then
            forceHideRevealTimer.Enabled = False
            Exit Sub
        End If
        
        ' check to see if the process that hid the dock is still running
        ' the dock will not automatically appear until the process that hid it has finished (full screen games)
        itIs = IsRunning(autoHideProcessName, vbNull)
        If itIs = True Then
            ' the timer will continue to run
            Exit Sub
        Else
            autoHideProcessName = vbNullString
            forceHideRevealTimer.Enabled = False
            Call ShowDockNow
        End If

   On Error GoTo 0
   Exit Sub

forceHideRevealTimer_Timer_Error:

    MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure forceHideRevealTimer_Timer of Form dock"
    
End Sub


Private Sub setSounds()
    
    If rDSoundSelection = "0" Then
        soundtoplay = vbNullString
    ElseIf rDSoundSelection = "1" Then
        soundtoplay = sdAppPath & "\sounds\ting.wav"
    ElseIf rDSoundSelection = "2" Then
        soundtoplay = sdAppPath & "\sounds\click.wav"
    End If
End Sub


Private Sub setSomeValues()
    dockOpacity = 100
    dockLoweredTime = Now
    rdDefaultYPos = 6
    dockJustEntered = True
    bounceZone = 75 ' .82 DAEB 12/07/2021 frmMain.frm Add the BounceZone as a configurable variable.
    msgBoxOut = True
    msgLogOut = True
    strTimeThen = Now
    autoHideMode = "fadeout"
    selectedIconIndex = 999 ' sets the icon to bounce index to something that will never occur
    bounceTimerRun = 1
    sDBounceStep = 4 ' we can add a slider for this in the dockSettings later
    sDBounceInterval = 5
    
End Sub
