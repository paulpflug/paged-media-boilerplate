createLink = (href, innerHTML) ->
  a = document.createElement("a")
  a.setAttribute "href", href
  a.innerHTML = innerHTML
  return a
window.generateTOC = () ->
  i2 = 0
  i3 = 0
  i4 = 0
  toc = document.getElementById("toc")
  toc = toc.appendChild(document.createElement("ul"))
  i = 0
  while i < document.body.childNodes.length
    node = document.body.childNodes[i]
    tagName = node.nodeName.toLowerCase()
    if tagName is "h4"
      ++i4
      if i4 is 1
        toc.lastChild.lastChild.lastChild.appendChild document.createElement("ul")  
      section = i2 + "." + i3 + "." + i4
      node.id = "section" + section
      li = document.createElement("li")
      att = document.createAttribute("class")
      att.value = "toc subsection"
      li.setAttributeNode att
      li.appendChild createLink("#section" + section, section+" "+node.innerHTML)
      toc.lastChild.lastChild.lastChild.lastChild.appendChild li
    else if tagName is "h3"
      ++i3
      i4 = 0
      if i3 is 1
        toc.lastChild.appendChild document.createElement("ul")  
      section = i2 + "." + i3
      node.id = "section" + section
      li = document.createElement("li")
      att = document.createAttribute("class")
      att.value = "toc section"
      li.setAttributeNode att
      li.appendChild createLink("#section" + section, section+" "+node.innerHTML)
      toc.lastChild.lastChild.appendChild li
    else if tagName is "h2"
      ++i2
      i3 = 0
      i4 = 0
      section = i2
      node.id = "section" + section
      li = document.createElement("li")
      att = document.createAttribute("class")
      att.value = "toc chapter"
      li.setAttributeNode att
      li.appendChild createLink("#section" + section, section+" "+node.innerHTML)
      toc.appendChild li
    ++i
