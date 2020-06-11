# Image Search + Auto Clicker

This is basically a fork of the [Image Search UDF 2.0.2.0](https://www.autoitscript.com/forum/files/file/471-image-search-udf/). It lets you select an image by drawing a rectangle using your cursor on the screen, moves the mouse towards the location of the image, and clicks. 

I modified the code to add pseudo-random timeouts and mouse movement after each click, so that the macro is less detectable when used in games that have some sort of anti-bot security controls.

## Usage

In this demonstration, I will be using it to click a button in a web game.

You can either run the script in the AutoIT script editor if you want to change some global variables, such as: `$Ask_On_Found = 1` to prompt the you when a match was found, or `$Timeout_Upper_Limit` if you aren't concerned about stealth. Or you can just run the executable.

Once ran, drag the rectangular area of the screen that the program should look for. After that, the program will click on any areas of the screen that match with the area you selected. This value changes every time you run the script. 

To stop the script at any time, just press escape.

<img src="gifs/demo-1.gif">