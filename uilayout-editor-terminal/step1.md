## Tree View

Generate large number of files to test tree view...

`mkdir -p l1_{1..10}/l2_{1..20}/l3_{1..20}`{{execute}}

`mkdir -p l1_{1..20}/l2_{1..20}/l3_{1..20}`{{execute}}

`mkdir -p l1_{1..30}/l2_{1..20}/l3_{1..20}`{{execute}}

## Snippets
The following snippet will replace the contents of the editor:

<pre class="file" data-filename="app.js" data-target="replace">var http = require('http');
var requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

var server = http.createServer(requestListener);
server.listen(3000, function() { console.log("Listening on port 3000")});

#TODO-insert
</pre>

<pre class="file" data-filename="app.js" data-target="insert" data-marker="#TODO-insert">
console.log("Inserted value using the data-marker attribute...")
</pre>

The following snippet will prepend the contents of the editor:

<pre class="file" data-filename="app.js" data-target="prepend">console.log("Starting...")
</pre>

The following snippet will append the contents of the editor:

<pre class="file" data-filename="app.js" data-target="append">console.log("Finishing...")
</pre>

## HTML Snippets

<pre class="file" data-filename="app.js" data-target="append">
<pre class="file" data-filename="app.js" data-target="append">

</pre>
</pre>

## New Files

Create a new file via the CLI:
`touch newFile.js`{{execute}}

This can then be opened:
`newFile.js`{{open}}

Test multiple dots:

`touch test.html.etb`{{execute}}

`test.html.etb`{{open}}


## Open Root Files

Known issue:

Files outside of the user root directory can't be opened. This is never going to be supported. Workarounds are use VS Code or symlink the file to the path.

`echo '/etc' > /etc/test`{{execute}}

`/etc/test`{{open}}

`echo 'myfilein' > /root/myfileinroot`{{execute}}

`/root/myfileinroot`{{open}}

Full paths also appear to fail, even if they are in the same directory as the editor. This should work.

`/test/myfileinroot`{{open}}

In would be the same as doing: 

`myfileinroot`{{open}}