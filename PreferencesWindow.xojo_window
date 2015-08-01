#tag Window
Begin Window PreferencesWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   316
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Preferences"
   Visible         =   True
   Width           =   539
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Default Fiat Currency:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   139
   End
   Begin PopupMenu DefaultCurrencyPopupMenu
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   171
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   166
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   52
      Visible         =   True
      Width           =   539
   End
   Begin GroupBox GoldGroupBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Gold Coins to Use"
      Enabled         =   True
      Height          =   108
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   68
      Underline       =   False
      Visible         =   True
      Width           =   499
      Begin CheckBox OneOzGoldCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "1 ounce gold coin"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GoldGroupBox"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   104
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox HalfOzGoldCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "½ ounce gold coin"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GoldGroupBox"
         Italic          =   False
         Left            =   197
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   104
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox QuarterOzGoldCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "½ ounce gold coin"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GoldGroupBox"
         Italic          =   False
         Left            =   354
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   104
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox TenthOzGoldCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "⅒ ounce gold coin"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GoldGroupBox"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   136
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox GoldSovereignCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "gold sovereign"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GoldGroupBox"
         Italic          =   False
         Left            =   197
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   136
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox GoldDinarCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "gold dinar"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GoldGroupBox"
         Italic          =   False
         Left            =   354
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   136
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
   End
   Begin GroupBox SilverGroupBox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Silver Coins to Use"
      Enabled         =   True
      Height          =   108
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   188
      Underline       =   False
      Visible         =   True
      Width           =   499
      Begin CheckBox OneOzSilverCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "1 ounce silver coin"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SilverGroupBox"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   224
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox SilverHalfDollarCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "silver half dollar"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SilverGroupBox"
         Italic          =   False
         Left            =   197
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   224
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox SilverQuarterCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "silver quarter"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SilverGroupBox"
         Italic          =   False
         Left            =   354
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   224
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox SilverDirhamCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "silver dirham"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SilverGroupBox"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   256
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox SilverDimeCheckBox
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "silver dime"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "SilverGroupBox"
         Italic          =   False
         Left            =   197
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   1
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   256
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   145
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileCloseWindow() As Boolean Handles FileCloseWindow.Action
			self.Close
			
			Return True
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events DefaultCurrencyPopupMenu
	#tag Event
		Sub Open()
		  App.PopulateCurrencyPopup(me)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  // macoslib relies on a Cocoa function behind the scenes to covert strings into CFStrings, and it's
		  // expecting the string to have an encoding. This was the cause of the failure to set bug, as the strings
		  // in the RowTags didn't have encodings and macoslib wasn't handling the missing encoding
		  // properly. To be safe, I'm passing the value of the RowTag as a string with an assigned encoding
		  // now instead of just passing it along as a Variant.
		  App.Prefs.Value("Currency") = me.RowTag(me.ListIndex).StringValue.DefineEncoding(Encodings.ASCII)
		  App.Prefs.Sync
		End Sub
	#tag EndEvent
#tag EndEvents
