#  Hints and Tips

Hints
1. Economy is valuable in coding. The easiest way to ensure a bug-free line of code is not to write that line of code at all. This entire assignment (not including Extra Credit) can be done in a few dozen lines of code beyond what was shown in lecture (probably less than two dozen), so if you find yourself writing more than 100 lines of code, you are almost certainly on the wrong track.
2. Example themes: animals (🐼 🐔 🦄 ), sports (🏀 🏈 ⚾ ), faces (😀 😢 😉 ).
3. If you flipped over a 🐧 + 👻 , then flipped over a ✏ + 🏀 , then flipped over two 👻 s, your score would be 2 because you’d have scored a match (and no penalty would be incurred for the flips involving 🐧 , ✏ or 🏀 because they have not (yet) been involved in a mismatch, nor was the 👻 ever involved in a mismatch). If you then flipped over a 🐧 + 🐼 , then flipped 🏀 + 🐧 , your score would drop 3 full points down to -1 overall because the 🐧 had already been seen (on the very first flip) and subsequently was involved in two separate mismatches (scoring -1 for each mismatch) and the 🏀 was also involved in a mismatch after already having been seen (-1). If you then flip 🐧 + 🐧 , you’d get 2 points for a match and be back up to 1 total point.
4. If you’d like an Array containing all the keys in a Dictionary (called foo in this example), use ... 
	let fooKeys = Array(foo.keys)
