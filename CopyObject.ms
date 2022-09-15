struct CopyObject
(
	fn CopyObjectFunc outputDir =
	(
		extType=".max"

		local selectedObjects = selection as array
	
		for selectedObject in selectedObjects do
		(
			format "hi [%]\n" selectedObject
			local toBeCopiedFileDir = outputDir + "\\" + selectedObject.name + extType
			if extType == ".max" then
			(
				local copiedFileDir = toBeCopiedFileDir +","+selectedObject.name
				setclipboardText copiedFileDir
				saveNodes selectedObject toBeCopiedFileDir quiet:true
				
			)
		)
	),
	
	fn PasteObj =
	(
		local filePathAndObjectName = getclipboardText()
		local filePathAndObjectNameSep = filterString filePathAndObjectName ","
		
		print filePathAndObjectNameSep[1]+"\\"+filePathAndObjectNameSep[2]
		mergemaxfile filePathAndObjectNameSep[1] #(filePathAndObjectNameSep[2])
		
	)
)