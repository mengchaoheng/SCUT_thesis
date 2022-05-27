## Enumitem 3.9

This package provides most of the flexibility you may want to customize
the three basic list environments (`enumerate`, `itemize` and
`description`) and to design your own lists, with a `<key>=<value>`
syntax.

### Latest changes

```
3.9  2019-06-20
   - \DrawEnumitemLabel rewritten
3.8  2019-02-04
   - Fix - calc stopped working if loaded after.
   - Improved \DrawEnumitemLabel
3.7  2019-01-14
   - Option series=override, to overcome some backwards
     incompatibilities.
   - Extension to \setlist for sizes (\setlist<size>)
   - \SetEnumitemSize, for size dependent settings.
   - \EnumitemId, with a unique numeric identifier for eash list.
3.6  2018-11-30
   - New key 'left', for fast, tab-like positioning of the label.
   - The key 'widest' now works with 'itemize' and 'description'.
   - New key 'first', for code at the beginning of the list body.
   - \DrawEnumitemLabel, for visual debugging of the label position.
   - Extended settings for trivlist, with a new package option 
     'includedisplayed'.
   - Size dependent lengths (first steps).
   - Fix - 'format'/'font' was not taken into account when computing 
     'widest'.
```

License:     MIT

Repository:  https://github.com/jbezos/enumitem

________
Javier Bezos --- http://www.texnia.com

2019/06/20
