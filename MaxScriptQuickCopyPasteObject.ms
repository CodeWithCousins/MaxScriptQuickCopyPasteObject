struct MaxScriptQuickCopyPasteObject
(
	fn CopyObjects =
	(
		local selectedObjects = selection as array
		local selectedObjectsName = (for selectedObject in selectedObjects collect selectedObject.name) as string
		local dnGuidClass = DotNetClass "System.Guid"
		local maxFileNameWithoutExt = (dnGuidClass.NewGuid()).ToString()
			
		for str in #("#","(",")","\"") do 
		(
			selectedObjectsName = substituteString selectedObjectsName str ""
		)
		
		selectedObjectsName = substituteString selectedObjectsName ", " "?"
		print (selectedObjectsName as string)
		
		local tmpMaxFilePath = pathConfig.appendPath (Sysinfo.tempdir) (maxFileNameWithoutExt + ".max")
		
		local clipBoardText = tmpMaxFilePath+","+selectedObjectsName
		
		clipBoardText = "xCopy_"+clipBoardText
		print clipBoardText
		
		local isFileGenerated = saveNodes (GetCurrentSelection()) tmpMaxFilePath quiet:true
		
		if(isFileGenerated) then
		(
			setclipboardText clipBoardText		
		)
		else
		(
			messageBox "Unable To Copy Selected Nodes" title:"Copy Failed" 
			format "Copy Failed.error : [%]" (getCurrentException())
		)
		return isFileGenerated
	),
	
	fn PasteObjects =
	(
		local filePathAndObjectName = getclipboardText()
		local isPasteSuccess = false;
		local isPatternMatch = MatchPattern filePathAndObjectName pattern:"xCopy_*"
		if(isPatternMatch)then
		(
			filePathAndObjectName = substituteString filePathAndObjectName "xCopy_" ""
			local filePathAndObjectNameSep = filterString filePathAndObjectName ","
			local objectNames = filterstring filePathAndObjectNameSep[2] "?"
			local tempMaxFilePath = filePathAndObjectNameSep[1]
			format "%\n" objectNames
			print tempMaxFilePath
			isPasteSuccess = mergemaxfile tempMaxFilePath objectNames #select #noRedraw #autoRenameDups #alwaysReparent #renameMtlDups quiet:true
			
		)
		else
		(
			MessageBox "Unable To Pate Objects" title:"Pattern Match Failed"
		)
		return isPasteSuccess
	)
)