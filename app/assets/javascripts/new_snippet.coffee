$(document).ready ->
  $textarea = $('#snippet_body')
  $textarea.hide()

  editor = ace.edit("editor")
  editor.setTheme("ace/theme/github")

  editor.getSession().on('change',() ->
    $textarea.val(editor.getSession().getValue())
  )
