$(document).ready ->
  $snippetBody = $('#snippet_body')

  if $('#editor').length > 0
    editor = ace.edit('editor')
    editor.setTheme('ace/theme/github')
    editor.$blockScrolling = Infinity
    editor.setShowPrintMargin(false)

  if $('#editor').data('action') == 'new'
    editor.getSession().on('change',() ->
      $snippetBody.val(editor.getValue())
    )

  if $('#editor').data('action') == 'show'
    editor.setReadOnly(true)
    editor.setValue($snippetBody.val(), -1)
