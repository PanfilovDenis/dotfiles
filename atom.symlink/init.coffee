# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)



# we need a reference to the snippets package
snippetsPackage = require(atom.packages.getLoadedPackage('snippets').path)

# we need a reference to the original method we'll monkey patch
__oldGetSnippets = snippetsPackage.getSnippets

snippetsPackage.getSnippets = (editor) ->
  snippets = __oldGetSnippets.call(this, editor)

  # we're only concerned by ruby files
  return snippets unless editor.getGrammar().scopeName is 'source.ruby'

  # snippets is an object where keys are the snippets's prefixes and the values
  # the snippets objects
  console.log snippets

  newSnippets = {}
  excludedPrefixes = ['your','prefixes','exclusion','list']

  for prefix, snippet of snippets
    newSippets[prefix] = snippet unless prefix in excludedPrefixes

  newSnippets
