SVG Anims
=====

Allows you to see a live preview of your animations when creating them with Inkscape (or any other SVG editor).<br/>
See http://www.ludumdare.com/compo/2014/08/28/inkscape-animations/

Installation
=====

Put `index.html`, `anim.swf` and `anim.js` in the same folder.<br/>
I put them in `/var/svg` (with `crossdomain.xml` if needed) and create a virtual host to make `http://svg-anims.dev/` point to this folder.<br/>
Edit `index.html` to point to the correct host so flash can find your svgs.

Put `default.xml` in `~/.config/inkscape/keys` if you want to create a shortcut to the "Resize page to selection" command (Ctrl+Alt+Shift + S).


Usage
=====

Resize your svg file to the spritesheet you're editing, and save it.

Open `index.html` (a dual screen helps a lot), fill the fields with informations (svg file name without the extension, frame width/height, fps) and click on "Load animations".<br/>
The preview will instantly update whenever you change (and save) your svg file.