![Chika Cute Dance](https://media.tenor.com/images/4fd49de4149a6d348e04f2465a3970af/tenor.gif)

# Amethyst Arcade

## Project Links

- [github.com/zackvuldin](https://github.com/zackvuldin/Amethyst-Arcade)

---

## Project Schedule

| Day   | Deliverable                                          | Status |
| :---- | :--------------------------------------------------- | :----- |
| Day 1 | Project Approval / wire-framing  | [x]    |
| Day 2 | div collision focus for snake (MVP) | [x]    |
| Day 3 | implementing div collision and adding functionality (MVP) | [x]    |
| Day 4 | functionality + object design with snake (MVP) | [x]    |
| Day 5 | object design + authentication | [x]    |
| Day 6 | finalizing authentication | [x]    |
| Day 7* | functionality + object design with snake (MVP) part 2 | [x]    |
| Day 8* | movement + controls with snake (MVP) | [x]    |
| Day 9* | movement + controls with snake (MVP) part 2 | [x]    |
| Day 10*| Focus on finishing Snake game + affixes(pMVP) | [x]    |
| Day 11* | MVP + pMVP + authentication debugging       | [x]    |
| Day 12 | Deadline: Presentation                               | [ ]    |

| * = partial break days (less time to work on project)

---

## Project Description

Amethyst Arcade is an application that will have access to many classic games, but with a twist! I will be focusing on creating Snake as my MVP and learning how div collision works. I will have MANY Post MVP such as having the food the snake eats have different affixes like increasing snake speed or increasing length by 2. Other Post MVPS will be to create other games like other classics such as pong or hanoi tower. I also want to be creative and make a pre-alpha version of a platformer or OSU!

---

## Wireframes

- [Snake](https://www.figma.com/file/VIwKzYfr4WN2xe2GDzPUeW/Amethyst-Arcade-Snake?node-id=0%3A1)

---

## MVP Time-Frame

| Component                      | Priority | Estimated Time | Actual Time |
| :----------------------------- | :------- | :------------- | :---------- |
| Snake (div collision) | H | 5 hrs | |
| Snake (functionality) | H | 5 hrs | |
| Snake (object design) | H | 4 hrs | |
| Snake (movement) | H | 5 hrs | |
| Snake (controls) | H | 4 hrs | |
| Game Logic + math | H | 5 hrs | |
| Authentication | M | 6 hrs | |
| Total | H | 34 hrs | |

## PostMVP Time-Frame

| Component                              | Priority | Estimated Time | Actual Time |
| :------------------------------------- | :------- | :------------- | :---------- |
| aim_trainer | H | 8 hrs | |
| hanoi_tower | M | 12 hrs | |
| pong | M | 12 hrs | |
| platformer | L | 14 hrs | |
| asteroids | L | 10 hrs | |
| Total | H | 56 hrs | |

### MVP

- Snake
- Authentication

### PostMVP

- aim_trainer
- hanoi_tower
- pong
- platformer
- asteroids

---

## Game Folders

| Component     |                     Description                      |
| ------------- | :--------------------------------------------------: |
| Snake           | My MVP that I will be focusing on, the classic snake game with twists!     |
| hanoi_tower | very math intensive game because of puzzle mentality |
| aim_trainer | like the aim trainers on steam or OSU! (music game) |
| pong | classic pong game and working on how AI will work |
| platformer | like mario and have objects to dodge or go through |
| asteroids | classic asteroids came with more div collision |

---

## Additional Libraries

- Ruby
- Ruby 2D
- fontAwesome
- Gosu
- Firebase
- React
- ElectronJS

---

## Code Snippet

Use this section to include a brief code snippet of functionality that you are proud of an a brief description. Code snippet should not be greater than 10 lines of code.

```javaScript
function reverse(string) {
	// here is the code to reverse a string of text
}
```

---

## Issues and Resolutions

making sure to call functions currently
```
box_detection.rb:45:in `block in collision_detected?': undefined local variable or method `square' for #<Box:0x00000000065ac228> (NameError)
```

learning process on Ruby syntax and end positioning.
aka: 
sometimes it not the end but the syntaxes IN that function ending with "end"
```
box_detection.rb:62: syntax error, unexpected `end'
box_detection.rb:80: syntax error, unexpected end-of-input, expecting `end'

```

order matters
```
Traceback (most recent call last):
        12: from box_detection.rb:80:in `<main>'
        11: from D:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/ruby2d-0.9.4/lib/ruby2d/dsl.rb:32:in `show'
        10: from D:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/ruby2d-0.9.4/lib/ruby2d/window.rb:153:in `show'
         9: from D:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/ruby2d-0.9.4/lib/ruby2d/window.rb:392:in `show'
         8: from D:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/ruby2d-0.9.4/lib/ruby2d/window.rb:392:in `ext_show'
         7: from D:/Ruby27-x64/lib/ruby/gems/2.7.0/gems/ruby2d-0.9.4/lib/ruby2d/window.rb:368:in `update_callback'
         6: from box_detection.rb:72:in `block in <main>'
         5: from box_detection.rb:72:in `each'
         4: from box_detection.rb:74:in `block (2 levels) in <main>'
         3: from box_detection.rb:37:in `check_for_collisions'
         2: from box_detection.rb:44:in `collision_detected?'
         1: from box_detection.rb:44:in `any?'

```