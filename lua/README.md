# Lua

Lua! The first language in the book. Tables and global variables, and arrays that are hashes, and hashes that are tables.

## Chapter 1

First

The chapter opens with the author discussing the limitations of csv's. He says writing configuration files is burdensome

> Here’s the problem: CSV doesn’t support collections or constraints. You’d have to work around these limitations by adding extra columns you seldom use, or by rolling (and supporting!) your own dialect.

Or, you know, by not using CSV. I'm hoping at this point that this is a straw man, because I don't seriously think that anyone uses CSV's this way. Could be wrong.

Oh nice, Lua has tables.

Oh nice, Lua is basically _just_ tables.

This is a table:

```lua
Square{
  side = 10
}
```

Yes it _does_ look like a hash.

> Lua’s tables lend themselves really well to the prototype style of object-oriented programming.

And

> in a prototype system, you create a single instance that looks like the objects you need in your program. Then, you clone this one instance a bunch of times and customize each clone.

* shudders whilst thinking about javascript *

### Install

```sh
brew install lua
```

REPL:

`lua` into the console

> Lua doesn’t print the value by default.

It does.

### Syntax Basics

Lua is dynamic.
Whitespace doesnt matter.

Strings `"as you'd expect"`
Numbers, well:

> In a typical Lua installation, 64-bit floating-point numbers are the only choice

I dont quite know what that means, as if I type `10` in the repl I get `10` not `10.0`...
Apparently this is just like javascript, which is a horrible thing to say about a language.

This is a nice resource:

[https://learnxinyminutes.com/docs/lua/](https://learnxinyminutes.com/docs/lua/)

```lua
s = 'walternate'  -- Immutable strings like Python.
t = "double-quotes are also fine"
u = [[ Double brackets
       start and end
       multi-line strings.]]
t = nil  -- Undefines t; Lua has garbage collection.

-- Undefined variables return nil.
-- This is not an error:
foo = anUnknownVariable  -- Now foo = nil.

```

you can do
```lua
#"string"
```
And it returns you the length of the string. So there's that.

Usual `and` `or` `not` keywords, math stuff like addition etc. And booleans.

```lua
~=
```

^ this means not equal.

### Functions

It has them.

```lua
function triple(num)
  return 3 * num
end

triple(8)
```

Yes that's an explicit return inside the function. I know, I know, but it's not all bad because you could not name the function and write it like this:

```lua
(function(num) return 3 * num end)(2)​
```
So I guess that's good?

Functions are first class. It has tail call optimization, if anyone can remember what that is.

Here's the mad bit.

> What happens when you try to call a function with too few arguments? Some languages shut you down with an error message. Others, like Haskell, return a new function. Lua simply assigns a value of nil to all the unused parameters

Because why not! In fact this is a general theme in lua, there seems to be gratuitous use of nil. If you give it too many params, things are ignored.

You can do closures though.

```lua
-- Closures and anonymous functions are ok:
function adder(x)
  -- The returned function is created when adder is called, and remembers the
  -- value of x:
  return function (y) return x + y end
end
a1 = adder(9)
a2 = adder(36)
print(a1(16))  --> 25
print(a2(64))  --> 100
```


```lua
-- Functions are first-class, may be local/global. These are the same:
function f(x) return x * x end
f = function (x) return x * x end

-- And so are these:
local function g(x) return math.sin(x) end
local g = function(x) return math.sin(x) end
```

You can also return multiple things from a function:

```lua
function fruit() do
  return "apple", "pears"
end


```

### Tables

You can delete a key by setting its value to nil

```lua
table = {key = 'value'}

table.key = nil
```

More later

### Variables

> One quirk of Lua is that variables are global by default:

Ha ha, yes... So quirky.

> You’d probably prefer that our temporary a2 variable not leak outside the function. Fortunately, all we have to do is preface our local variable definitions with the local keyword

So it's all fine.


### Running Scripts

Save your files with a `.lua` extension, you can pass a script to the reply by doing

```sh
lua mys_cript.lua
```



