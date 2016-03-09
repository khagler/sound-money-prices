#tag Window
Begin ContainerControl CoinPreference
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   20
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   145
   Begin CheckBox CoinCheckbox
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
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
      Top             =   0
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   145
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Constructor(newCoin As Coin)
		  self.CoinForPreference = newCoin
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CoinForPreference As Coin
	#tag EndProperty


#tag EndWindowCode

#tag Events CoinCheckbox
	#tag Event
		Sub Action()
		  // Add or remove the coin from the list of coins being used by CoinList, depending on the
		  // checkbox state.
		  If GoldCoinSet(index).Value Then
		    CoinList.AddCoin("gold", self.GoldCoinForCheckBox(index).Value("name"), self.GoldCoinForCheckBox(index).Value("weight"))
		  Else
		    CoinList.RemoveCoin("gold", self.GoldCoinForCheckBox(index).Value("weight"))
		  End If
		  
		  // Now update the preferences. To do this we have to get the prefs array for this coin type
		  // from the prefs, modify our local copy of the array, then set the prefs value to our
		  // modified array.
		  Dim prefsStates() As Boolean = self.VariantArrayToBooleanArray(App.Prefs.Value("GoldCoinPrefs", self.GoldDefaultPrefs))
		  prefsStates(index) = GoldCoinSet(index).Value
		  App.Prefs.Value("GoldCoinPrefs") = prefsStates
		  App.Prefs.Sync
		  
		  // Set the fiat price in PriceWindow to itself to force a recalculation using the changed prefs.
		  App.Prices.FiatPrice.Text = App.Prices.FiatPrice.Text
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  // We need to check the preferences to see which coin checkboxes should be
		  // checked. There is an array in the prefs for the type of coin, with boolean
		  // values that correspond to the checkboxes with the same index in their
		  // respective control sets.
		  
		  // Set up the arrays used for the checkbox control sets in PreferencesWindow. We
		  // have to do this in the Open handler for both control sets because we can't be
		  // sure which will be called first.
		  self.InitCheckBoxArrays
		  
		  // Next set up the default array to use if this pref was never set before.
		  Dim controlSetSize As Integer = 7
		  self.GoldDefaultPrefs = self.PopulateDefaultPrefs(controlSetSize)
		  
		  Dim prefsStates() As Boolean = self.VariantArrayToBooleanArray(App.Prefs.Value("GoldCoinPrefs", self.GoldDefaultPrefs))
		  
		  // Check if the saved states from the prefs is the same as the control set size.
		  // If it's not, the number of checkboxes in the control set has changed since the
		  // pref was written. We'll replace the prefs with the default prefs since there's
		  // no way to know exactly which checkbox was added or removed.
		  If prefsStates.Ubound <> self.GoldDefaultPrefs.Ubound Then
		    prefsStates = self.VariantArrayToBooleanArray(self.GoldDefaultPrefs)
		    App.Prefs.Value("GoldCoinPrefs") = prefsStates
		  End If
		  
		  GoldCoinSet(index).Value = prefsStates(index)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
