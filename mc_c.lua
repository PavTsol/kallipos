function Image(img)
  if img.classes:find('mc_c',1) then
    local f = io.open("mc_c/" .. img.src, 'r')
    local doc = pandoc.read(f:read('*a'))
    f:close()
    local caption = pandoc.utils.stringify(doc.meta.caption) or "Epigraph has not been set"
    local student = pandoc.utils.stringify(doc.meta.student) or "Student has not been set"
    local studentid = pandoc.utils.stringify(doc.meta.studentid) or "Student ID has not been set"
    local credentials = "Student: " .. student .. " (" .. studentid .. ")"
    local comment = "> _" .. caption .. "_  \n> " .. "**" .. credentials .. "**"
    return pandoc.RawInline('markdown',comment)
  end
end
