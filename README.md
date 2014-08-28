SVG Anims
=====

Allows you to see a live preview of your animations when creating them with Inkscape (or any other SVG editor).

Installation
=====

Put `index.html`, `anim.swf` and `anim.js` in the same folder.
I put them in `/var/svg` (with `crossdomain.xml` if needed) and create a virtual host to make `http://svg-anims.dev/` point to this folder.

Put `default.xml` in `~/.config/inkscape/keys` if you want to create a shortcut to the "Resize page to selection" command (Ctrl+Alt+Shift + S).