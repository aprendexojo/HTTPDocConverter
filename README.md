# HTTPDocConverter
Multiplatform Xojo Class that uses the DocConverter API to convert from text plain, HTML or Markdown to PDF, ePUB, Mobi, DOCX and RTF

## How to use
Copy the HTTPDocConverter Class to your Xojo project. In order to convert a file to the specified format you have to create a new instance, using the Constructor of the class to indicate the target format, source FolderItem, and the method you want to be called once the process has finished:
```
Dim sourceFile As FolderItem = GetOpenFolderItem("")
If f <> Nil Then
  Dim post As New HTTPDocConverter(HTTPDocConverter.kPDF, sourceFile, AddressOf MyCallbackMethod)
  post.getConvertedFile
End If
```
Then in your `MyCallbackMethod` you can do the thing you want with the already converted file. This method receives the converted data (as String) and the converted format type (also as String). You can save it to a file on disk, for example:
```
Dim f As FolderItem = GetSaveFolderItem("", "ConvertedFile." + documentType)
If f <> Nil Then
  Dim tof As TextOutputStream = TextOutputStream.Create(f)
  If tof <> Nil Then
    tof.Write convertedData
    tof.Flush
    tof.Close
  End If
End If
```
In order to avoid errors, you can use the HTTPDocConverter constants to indicate the target file format:
+ kDOCX. "docx" file format.
+ kePUB. "ePub" file format.
+ kMOBI. "mobi" file format.
+ kRTF. "rtf" file format.

You can read the article in [English-language](https://blog.xojo.com/2018/02/06/pdf-file-generation-there-is-an-api-for-that/) or [Spanish-language](https://www.aprendexojo.com/2018/02/creacion-archivos-pdf-una-app-i/) in order to ger additional information about how it works.
