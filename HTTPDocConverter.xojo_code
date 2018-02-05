#tag Class
Protected Class HTTPDocConverter
Inherits httpsocket
	#tag Event
		Sub Error(code as integer)
		  MsgBox str(code)
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  If  registeredCallback <> Nil Then
		    
		    registeredCallback.Invoke content, convertedToType
		    
		  End If
		End Sub
	#tag EndEvent


	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub callback(content as string, documentType as string)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub ClearRequestHeaders()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(convertDataTo as string, inputFile as folderitem, notification as callback)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From HTTPSocket
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor
		  
		  registeredCallback = notification
		  
		  encodeRequest( inputFile, convertDataTo )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EncodeFormData(form as dictionary) As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub encodeRequest(inputFile as FolderItem, convertdataTo as String)
		  Dim formData As New Dictionary
		  
		  formData.Value("input_files[]") = inputFile
		  formData.value("from") = "html"
		  formData.value("to") = convertDataTo
		  
		  convertedToType = convertDataTo
		  
		  Dim boundary As String = ""
		  
		  
		  Boundary = "--" + Right(EncodeHex(MD5(Str(Microseconds))), 24) + "-reQLimIT"
		  
		  
		  Static CRLF As String = EndOfLine.Windows
		  
		  Dim data As New MemoryBlock(0)
		  Dim out As New BinaryStream(data)
		  
		  For Each key As String In FormData.Keys
		    out.Write("--" + Boundary + CRLF)
		    If VarType(FormData.Value(Key)) = Variant.TypeString Then
		      out.Write("Content-Disposition: form-data; name=""" + key + """" + CRLF + CRLF)
		      out.Write(FormData.Value(key) + CRLF)
		    Elseif FormData.Value(Key) IsA FolderItem Then
		      Dim file As FolderItem = FormData.Value(key)
		      out.Write("Content-Disposition: form-data; name=""" + key + """" + "; filename="""+inputFile.Name+""""+ CRLF)
		      out.Write("Content-Type: text/html" + CRLF + CRLF)
		      Dim bs As BinaryStream = BinaryStream.Open(File)
		      out.Write(bs.Read(bs.Length) + CRLF)
		      bs.Close
		    End If
		  Next
		  
		  out.Write("--" + Boundary + "--" + CRLF)
		  out.Close
		  
		  Super.SetRequestContent(data, "multipart/form-data; boundary=" + Boundary)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EOF() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ErrorCode() As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Flush()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Get(url as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Get(url as string, file as folderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Get(URL as string, file as folderitem, timeout as integer) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Get(URL as string, timeout as integer) As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getConvertedFile()
		  Super.post("http://c.docverter.com/convert")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetHeaders(url as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetHeaders(url as string, timeout as integer) As internetHeaders
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HTTPStatusCode() As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Listen()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Lookahead(encoding As TextEncoding = Nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PageHeaders() As internetHeaders
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Poll()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub post(url as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Post(url as string, file as folderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Post(url as string, file as folderitem, timeout as integer) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Post(url as string, timeout as integer) As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Purge()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Read(byteCount As Integer, encoding As TextEncoding = Nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadAll(encoding As TextEncoding = Nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadError() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendRequest(method as string, url as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendRequest(method as string, url as string, file as folderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SendRequest(method as string, url as string, file as folderitem, timeout as integer) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SendRequest(method as string, url as string, timeout as integer) As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFormData(form as dictionary)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetPostContent(content as string, contentType as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetRequestContent(content as string, contentType as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetRequestHeader(name as string, value as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Write(Text As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WriteError() As Boolean
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private convertedToType As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private receivedData As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private registeredCallback As callback
	#tag EndProperty


	#tag Constant, Name = kDOCX, Type = String, Dynamic = False, Default = \"docx", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kePUB, Type = String, Dynamic = False, Default = \"ePub", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kMOBI, Type = String, Dynamic = False, Default = \"mobi", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kPDF, Type = String, Dynamic = False, Default = \"pdf", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRTF, Type = String, Dynamic = False, Default = \"rtf", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesAvailable"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLeftToSend"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyAddress"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyPort"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yield"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
