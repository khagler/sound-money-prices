#tag Class
Protected Class CocoaMenuItemUndo
Inherits CocoaMenuItem
	#tag Event
		Function ActionSelectorName() As String
		  return "undo:"
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Undo", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Undo"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Widerrufen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE5\x8F\x96\xE3\x82\x8A\xE6\xB6\x88\xE3\x81\x99"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Annuler"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Annulla"
		#Tag Instance, Platform = Any, Language = bn, Definition  = \"\xE0\xA6\xAA\xE0\xA7\x82\xE0\xA6\xB0\xE0\xA7\x8D\xE0\xA6\xAC\xE0\xA6\xBE\xE0\xA6\xAC\xE0\xA6\xB8\xE0\xA7\x8D\xE0\xA6\xA5\xE0\xA6\xBE\xE0\xA7\x9F \xE0\xA6\xAB\xE0\xA7\x87\xE0\xA6\xB0\xE0\xA6\xBE\xE0\xA6\xA8\xE0\xA7\x8B"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Herstel"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
