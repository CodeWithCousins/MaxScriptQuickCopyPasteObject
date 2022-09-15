FileIn "MaxScriptQuickCopyPasteObject.ms"

try(Destroydialog MaxScriptQuickCopyPasteObjectUI) catch()

rollout MaxScriptQuickCopyPasteObjectUI "Merge Object"
(
	
	local QuickCopyPasteObject = MaxScriptQuickCopyPasteObject()
	
	button btnMergeObject "Copy Object" width:290
	button btnPaste "Paste Object"  width:290
	
	on btnMergeObject pressed do
	(
		clearListener()
		
		local MergeData = QuickCopyPasteObject.CopyObjects()
	)
	
	on btnPaste pressed do
	(
		local s = QuickCopyPasteObject.PasteObjects()
	)
	
)
CreateDialog MaxScriptQuickCopyPasteObjectUI width:300