# Contributing to Sheerpaper

Bug reports and pull requests are welcome on [RidgestoneLabs/sheerpaper](https://github.com/RidgestoneLabs/sheerpaper). The [README](README.md#building) covers building and running the tests. Please run the tests before opening a pull request.

The coding style below comes from MacDown, and the existing code follows it.

## Coding Style

All style rules apply everywhere except external dependencies.

### Objective-C

#### The 80-column Rule

All code should obey the 80-column rule.

Exception: a URL in a comment may go over the limit. This happens a lot with Apple's documentation. Many sites offer shorter permanent forms of their URLs, though. For example:

* The title slug in Stack Overflow (and other Stack Exchange sites) URLs can be omitted. These two are equivalent:

    `http://stackoverflow.com/questions/13155612/how-does-one-eliminate-objective-c-try-catch-blocks-like-this`
    `http://stackoverflow.com/questions/13155612`

* The commit hash in a GitHub commit URL can be shortened. These are all equivalent:

    `https://github.com/RidgestoneLabs/sheerpaper/commit/1612abb9dbd24113751958777a49cffc6767989c`
    `https://github.com/RidgestoneLabs/sheerpaper/commit/1612abb9dbd24`
    `https://github.com/RidgestoneLabs/sheerpaper/commit/1612abb`

#### Code Blocks

* Braces go on separate lines. ([Allman style](http://en.wikipedia.org/wiki/Indent_style#Allman_style).)
* If a block contains only one statement, omit the braces unless...
    * It's part of an if-(else if-)else structure. All branches in the same structure should match: either none or all of them omit braces.

#### Statements Inside `if`, `while`, etc.

* Prefer implicit boolean conversion when it makes sense.
    * `if (str.length)` is better than `if (str.length != 0)` if you want to know whether a string is empty.
    * The same applies when checking whether an object is `nil`.
    * If you're comparing against *zero as a number* rather than checking for emptiness, such as an `NSRange` position or `NSPoint` coordinates, *do* use `== 0`/`!= 0`.

* If a condition spans multiple lines, put the logical operators at the *beginning* of each line.

    Yes:
    ```c
    while (this_is_very_long
           || this_is_also_very_long)
    {
        // ...
    }
    ```

    No:
    ```c
    while (this_is_very_long ||
           this_is_also_very_long)
    {
        // ...
    }
    ```

* If the alignment is ambiguous, add extra indentation.

    Yes:
    ```c
    if (this_is_very_long
            || this_is_also_very_long)
        foo++;
    ```

    No:
    ```c
    if (this_is_very_long
        || this_is_also_very_long)
        foo++;
    ```

    This is recommended but not enforced when the block has braces. It helps when a statement is hard to fit in 80 columns.

    Okay:
    ```c
    if (this_is_very_long
        || this_is_very_very_truly_long)
    {
        foo++;
        bar--;
    }
    ```

#### Invisible Characters

Always indent with *four spaces*, not tabs. Remove trailing whitespace; Xcode's **Automatically trim trailing whitespace** option does this for you.

End every file with a trailing newline.

## Version Control

### Commit Messages

[General rules](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) apply. If you really need to, the first line can run to 72 characters instead of 50, but no longer.

Xcode's commit window doesn't show whether a message is well formed. If GitHub truncates the first line of your commit after you push, it's too long.

### Pull Requests

Rebase your branch onto `main` before opening the pull request. Git can produce nagging merge bugs in files that aren't code, particularly `.xib` and project files. When in doubt, split changes into smaller commits so a broken merge doesn't mean redoing your work.

A maintainer may ask you to rebase or squash after you open the pull request, or do it when merging. You keep full credit for your contribution either way.

### Translations

Localized strings live in `Sheerpaper/Localization/<language>.lproj`. Edit them directly and send a pull request.
