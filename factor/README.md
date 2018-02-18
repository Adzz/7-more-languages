# Factor

### Opening Remarks

> Factor is unlike any other language you’ve tried

Here we go then.

Factor is all about function composition. The syntax is.... sparse.

Here is some function composition in factor:

```factor
42 f g h
```

...

Apparently that means take 42, put it into the function f, then take that result (called a _word_ in factor because why not) and pump it into g, then take _that_ result and pass it to h.

To me, this looks like a pipe?

```factor
42 f g h
```

That's a pipe right?

> It’s implied that the result of calling one function (called a word in Factor) is made available to the next word

This is handled automatically using a stack, which is a container that holds values. Words take their input from the stack and push their result onto the stack, making the result available to the next ~function~, sorry I mean word.

Apparently unlike every other programming language ever, Factor is not applicative, because instead of applying ~functions~ WORDS, you simply concatenate them. Function composition is the default, there is no other option.

This is called a `concatenative` language, just like all those other famous concatenative languages. You know, Forth, Joy, PostScript, CAT, Om, Retro, and KITTEN. All concatenative.

Or should I say.. conCATenative. Ammiright.😺

You're right I shouldn't.

### Install

Download the binary.

Cannot run because not a trusted developer. Nice one.

Brew cask was also not successful...

Until [a hero appeared](https://github.com/caskroom/homebrew-cask/pull/44089)

You should be good on a mac with homebrew to do this:

```sh
brew upgrade && brew cask install factor
```

### REPL

Factor has a repl, but it ships with a listner which is perhaps better. This thing will autocomplete function names, and more importantly show you the state of the stack as you do things.

When you have installed you should see a programme in your applications folder. This `Factor.app` is the listner, open it. Obligatory

```factor
"Wello horld" print
```

Here's the rub. We might look at that and think that the string gets passed to the `print` function. What actually happens is the string gets pushed on to the stack, then the print function just gets whatever is on the stack. To demonstrate that try this:

```factor
"Hi"
```

Then try just the `print`. We will see that using a primitive just bashes that thing onto the stack, and all a ~function~ word does is pull whatever is on the stack off and consumes it.

This has some interesting consequences...

> When running a Factor program, the net effect of all the words assembled together should be consistent, with each word having at least as many values on the stack as they expect to pull out, and pushing out as many values as they claim to. When the stack contains more values than a word needs to use, the extra values simply remain on the stack.

That means if you add one number on to the stack, then try to use `+` you're gonna have a bad time. There is no currying, it will try and get two things off the stack, when there's only one.

One last tip, `.` is a pretty print function, it's nice to use in the listner at the end.

### Day 1

Things are pushed on to the stack right to left. and the words are called from right to left. That means operator precedence isn't really a thing, you just write them in the correct order.

#### Data Types

#### Booleans

represented as `t` and `f`. Other functions can return these values:

```factor
4 2 = .
f
```

> any value other than f is considered as true, including zero, empty strings, and empty sequences.

#### Sequences

you can create lists and maps.

Lists:

```factor
{ 1 2 3 }
```

NOTE the lack of commas, and the whitespace around the things inside the list. They are needed, otherwise it thinks you are talking about a word.

Maps:

```factor
{ { "this" "is" } { "men" "tal" } } .
```
Yes maps are just nested arrays, with even number of elements.






