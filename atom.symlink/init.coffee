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
  excludedPrefixes = ['i','f','r','b']

  for prefix, snippet of snippets
    newSippets[prefix] = snippet unless prefix in excludedPrefixes

  newSnippets
