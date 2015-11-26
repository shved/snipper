$(document).ready ->
  if $('#editor').length > 0
    $textarea = $('#snippet_body')
    $textarea.hide()

    editor = ace.edit("editor")
    editor.setTheme("ace/theme/github")

    editor.getSession().on('change',() ->
      $textarea.val(editor.getSession().getValue())
    )
