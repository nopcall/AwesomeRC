local xdg_mime = function (prg)
    local desktop = prg .. ".desktop"
    local cmd = {
        "xdg-mime default " ..
            desktop ..
            " `grep 'MimeType=' /usr/share/applications/" ..
            desktop ..
            " | sed -e 's/.*=//' -e 's/;/ /g'` ",}
    os.execute(table.concat(cmd, ";"))
end

xdg_mime(browser)
xdg_mime(pdfviewer)
xdg_mime(picviewer)
xdg_mime(videoplayer)
