# hxaroma

Haxe externs for [Leafo](https://github.com/leafo)'s [Aroma](https://leafo.net/aroma)

### Install and Usage

1. Download [Aroma](https://leafo.net/aroma)
2. Use `haxelib install hxaroma` to install the externs!
3. Make sure you add `-D lua_vanilla` and `-L hxaroma` to your HXML file targeting Lua
4. Code the Lua side:

```haxe
// Game.hx
// The game code (Lua side)
package;
import hxaroma.Aroma;

class Game {
    public static function main() {
        Aroma.keypressed = function(key_name: String, key_code: Int) {
            trace("Key: " + key_name + ", Code: " + key_code);
        }
    }
}
```

5. Build targeting Lua using `Game` class for example as main via `--main Game`
6. Now it's time to JavaScript side (Container), So gonna create `Main.hx` for this...

```haxe
// Main.hx
// JavaScript side (Game Container)
package;
import hxaroma.AromaGame;

class Main {
    public static function main() {
        var game: AromaGame = new AromaGame("game_container", 640, 480);
    }
}
```

7. Create another HXML file targeting JavaScript, And set `Main.hx` as main via `--main Main` and don't forget to add `-L hxaroma`
8. Build with second HXML
9. Create `index.html` and add JavaScript output via `<script>` tags, Then make sure Aroma files exist beside the `index.html` then add `main.lua` beside files (Or let output there...)

### Changes

1. `aroma.` changed to `Aroma.` in Lua side.
2. Now you would use `new AromaGame` instead of `new Aroma` to create game container in JavaScript side with same stuff...

### License

```
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```
