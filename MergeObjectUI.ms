FileIn "CopyObject.ms"

try(Destroydialog MergeObjectUI) catch()

rollout MergeObjectUI "Merge Object"
(
	local copiedTempDir = Sysinfo.tempdir
	local varcopyPasteObject = CopyObject()
	
	button btnMergeObject "Copy Object" width:290
	button btnPaste "Paste Object"  width:290
	
	on btnMergeObject pressed do
	(
		clearListener()
		
		local MergeData = varcopyPasteObject.CopyObjectFunc copiedTempDir
	)
	
	on btnPaste pressed do
	(
		local s = varcopyPasteObject.PasteObj()
	)
	
)
CreateDialog MergeObjectUI width:300