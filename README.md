# minix2 mined

This is Minix 2.0 mined, massaged to compile (maybe even work!) on Linux systems
in 2019.

Why would I do something so foolish? To prove that I can, I guess, and as part
of my ongoing crusade to fill my github account with every editor I can get my
grubby little paws on.

Also, ples no flame for porting a sacred Minix program to a filthy monolithic
kernel :)

## differences

For the full gory details, check out mined-diff, which is the minimum necessary
change to get it to compile. The short version is:

- Expand `_PROTOTYPE` macro inline. I actually hate this macro, it's the bane of
  my existance. Just write it out properly ffs! If you're really writing ancient
  C that can't handle writing it out properly, do an `#ifdef`! Argh! Anyways, if
  you also hate yourself, here's a sed incantation that'll handle single-line
  invocations of this hellish macro (pull requests for a multi-line version
  welcomed with open arms):
  `sed -i -e 's/_PROTOTYPE( *\([^,]*\), *\(([^)]*)\).*/\1 \2;/g' *`
- Remove some Minix-specific cruft; include config.h inline in source tree.
- `void main` → `int main` (modern style)
- Include `term.h` and link against `ncurses`
- Rename paramaters and variables `lines` → `lns`, since something about 
  including `term.h` borks these.

### enhancements

Here's what I've changed after the initial commit.

- Modify mined to support xterm escape sequences.

## copying

In what will hopefully be read as good faith, I'm including the original
license as I found it [at upstream](https://github.com/davidgiven/minix2) and
avoiding taking any credit for anything more than some sed-hacking and
compilation fixes.

[Please support Andrew Tanenbaum by donating to the development of Minix 3 and
buying the book!](http://www.minix3.org/)
