createLink = (href, innerHTML) ->
  a = document.createElement("a")
  a.setAttribute "href", href
  a.innerHTML = innerHTML
  return a
window.generateTOC = () ->
  toc = document.getElementById("toc")
  toc = toc.appendChild(document.createElement("ul"))
  $(":not(.front-matter) > h2").each (chapter) ->
    chapter++
    $(this).attr("id","chapter" + chapter)
    li = document.createElement("li")
    att = document.createAttribute("class")
    att.value = "toc chapter"
    li.setAttributeNode att
    li.appendChild createLink("#chapter" + chapter, chapter+" "+$(this).html())
    toc.appendChild li
    ulchapter = document.createElement("ul")
    li.appendChild ulchapter
    $(this).nextUntil("h2","h3").each (section) ->
      section++
      section = chapter + "."+ section
      $(this).attr("id","section" + section)
      li = document.createElement("li")
      att = document.createAttribute("class")
      att.value = "toc section"
      li.setAttributeNode att
      li.appendChild createLink("#section" + section, section+" "+$(this).html())
      ulchapter.appendChild li
      ulsection = document.createElement("ul")
      li.appendChild ulsection
      $(this).nextUntil("h3","h4").each (subsection) ->
        subsection++
        subsection = section+"." +subsection
        $(this).attr("id","subsection" + subsection)
        li = document.createElement("li")
        att = document.createAttribute("class")
        att.value = "toc subsection"
        li.setAttributeNode att
        li.appendChild createLink("#subsection" + subsection, subsection+" "+$(this).html())
        ulsection.appendChild li
