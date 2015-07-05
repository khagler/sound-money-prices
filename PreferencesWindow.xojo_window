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
   Height          =   60
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
   Width           =   357
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
End
#tag EndWindow

#tag WindowCode
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
