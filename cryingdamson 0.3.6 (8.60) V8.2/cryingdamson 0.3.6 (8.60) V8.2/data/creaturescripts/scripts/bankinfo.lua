function onTextEdit(cid, item, newText)
     if item.itemid == 1951 then
         doBroadcastMessage(getPlayerName(cid)..": "..newText)
         doRemoveItem(item.uid, 1)
     end
     return true
end
 