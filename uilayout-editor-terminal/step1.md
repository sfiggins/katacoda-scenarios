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

## New Files for Editor

Create a new file in uieditorpath via the CLI:
`touch /test/newFile.js`{{execute}}

This can then be opened:
`newFile.js`{{open}}

Test multiple dots:

`touch /test/test.html.etb`{{execute}}

`test.html.etb`{{open}}

## Open in Editor File Paths

Known issue:

Editor paths are relative to "uieditorpath". Files do not open as expected when
given a full path. This is because paths for the editor are always appended to
the "uieditorpath." The default value for uieditor path is in most cases `root`.
For this scenario, "uieditorpath" has been set to `/test/`.

Workarounds for opening files outside of "uiedtorpath" are to use relative
pathing, symlink the file to the path, or use VS Code layouts which do not share
this limitation.

### Files with full path

`echo '/etc' > /etc/test`{{execute}}

This will not work:

`/etc/test`{{open}}

### Files with relative path

This will open the file under /etc, but the file will not show up in the file
tree to the left of the editor.

`../etc/test`{{open}}

### Files in /root

`echo 'myfilein' > /root/myfileinroot`{{execute}}

Root is the default in most cases for "uieditorpath". This would work had we not
set the "uieditorpath" to `/test/`

`myfileinroot`{{open}}

### Files in uieditor path

`echo 'myfilein' > /test/myfileintest`{{execute}}

Paths that can be found relative to the "uieditorpath" will work as expected:

`myfileintest`{{open}}

### Files that don't exist

You can open a file that does not exist. Any directories in its path must exist and be
given relative to the uieditorpath.

### Under the uieditorpath

`touchless`{{open}}

### Outside uieditorpath

You can create files outside the uieditorpath this way, but they will not show
up in the editor's directory tree.

`../etc/etctouchless`{{open}}

### Non-existent Path

This should not work:

`../tmp/nonexistentdirectory/notouchless`{{open}}
