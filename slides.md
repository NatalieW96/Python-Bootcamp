---
marp: true
author: Natalie Williams
theme: gaia
pageinate: true
---

<!-- style: |
  section {
    font-family: "Helvetica", serif;
  }
-->
![bg right:40%](./potsdam.png)

# Python Bootcamp
## Universität Potsdam
### Winter 2025

```python
print("Hello world!")
```
<br>

###### Dr. Natalie Williams  
###### natalie.williams@uni-potsdam.de
---
## Logistics
- This course is a one week intensive course designed to teach basic Python programming 
- The course is aimed at complete beginners to Python or programming in general, or those that want to brush up before the semester kicks in
- Each day will consist of two sessions: one lecture from 10:15 - 12:30, and one seminar from 13:15 - 15:30
- All sessions will take place here in room xxx

---
## Course content

#### What this course will cover
- Basic shell usage, conda and virtual environments
- Python basics: Variables, input/output, operators, data types
- Control flow: conditional statements, boolean logic, error handling
- Loops, strings, functions and classes
- Data structures: Lists, tuples, dictionaries, sets
- Plotting with `matplotlib`
- Modules: `numpy`, `scipy`
---
#### What this course won't cover
- Shell scripting
- Linux system administration or remote access tools
- Advanced Python (generators, lambda functions, decorators)
- Graphical user interfaces or animations
- Modules such as `pandas`, `seaborn`
- Using git
- Other programming languages
---
## What is Python?
- Python is a high level, interpreted programming language
- As an interpreted language it is easy to run and does not require a separate compiler such as with C/C++
- It is known for its ease of use and clear syntax
- Python is widely used in the scientific community, particularly for data analysis
- It lets you use packages and code written by others easily, so you can build powerful programs without starting from scratch
---
### 
### Pros of Python
- Easy to read and write, very intuitive and easily debugged
- Huge community and libraries available
- Versatile, used in many industries
### Cons of Python 
- Slower than compiled languages such as C/C++
- Can be inefficient with memory
- Dynamically changing libraries can lead to outdated code
---
# Session 1: Using the Terminal
```bash
williams@Natalie:~/Documents$ pwd
/home/williams/Documents

williams@Natalie:~/Documents$ ls
mycode.py  Downloads  Music    

williams@Natalie:~/Documents$ cd Music

williams@Natalie:~/Documents$ echo Hello world!
Hello World!

```
---
## The terminal
- Before we look at Python, we need to understand how to navigate our computer system using the **terminal**
- The terminal is a text based interface which allows us to interact with the computer
- This may seem unnecessary when we have a file explorer - however using the terminal provides much more flexibility, and as you become proficient at coding it will become easier and necessary to use the terminal
---
## Opening the terminal
Linux & macOS:
Search in applications for "Terminal"

Windows:
Search in applications for "Powershell" or "Windows Terminal"
Download WSL (once) with 
```bash
wsl --install
```
Open WSL from Powershell or Windows Terminal with
```bash
wsl
```
---
## Where am I?
- When opening the terminal, we see the **command line**
- In the command line it shows `user_name@computer_name:location$`
```bash
Natalie@mylinux:~$
```
- We are in a location, our home **directory** (folder), denoted by `~`.
- To check where you currently are in the computer, you can use the command  `pwd` to print our current location (or **path**)

```bash
Natalie@mylinux:~$ pwd
/home/Natalie
```

---

## The file system

![width:1100px](./linux-file-system-edited.png)

---
## Commands
- We will explore some of the most useful **commands** that can be used on the command line and their functionality
- Each command may have many options, these can be listed for most commands by using `man *command*` or `*command* --help`

```bash
Natalie@mylinux:~$ pwd --help
```
```bash
Natalie@mylinux:~$ man pwd
```
- **Top tip**: Use the up and down arrowkeys to cycle through previous commands rather than typing them out again
---

## Looking around
<style>
.term-dir { color: blue; }
.term-exe { color: green; }
.term-zip { color: red; }
.term-symlink { color: orange; }
.term-hidden { color: gray; }
</style>

- The contents of the location we are in can be viewed with `ls`

```bash
Natalie@mylinux:~$ ls
Documents   mycode.py  
```
- These file types are colour-coded as normal files, <span class="term-dir">documents</span>, and <span class="term-exe">executable files</span>.
- Hidden files (files that start with `.` and are hidden from the user) can be shown with `ls -a`

```bash
Natalie@mylinux:~$ ls -a
.  ..  .bashrc mycode.py  Documents  .jupyter  .ssh
```

---

## Looking around

- To view more details on the files we use `ls -l` with form 
```
permissions | # of hard links | Owner | Group | File size (bytes)| Last modified | Name
```
```bash
Natalie@mylinux:~$ ls -l
drwxr-xr-x  6 Natalie Natalie    4096 Feb 20 14:32  Documents
-rw-rw-r--  1 Natalie Natalie       5 Mar 27 14:34  mycode.py
```
- Permissions are laid out as d<span class="term-dir">rwx</span><span class="term-exe">rwx</span><span class="term-zip">rwx</span> where d - directory, r - read, w - write, x - execute for <span class="term-dir">user</span>, <span class="term-exe">group</span> and <span class="term-zip">others</span> users
- Permissions can be changed with `chmod` ie. `chmod u+x mycode.py`
---
## Moving around
- To move to another directory from your current location use `cd`

```bash
Natalie@mylinux:~$ cd Documents
Natalie@mylinux:~/Documents$ ls
Computing    myfile1.txt    myfile2.txt
```
- **Top tip**: use tab to autocomplete file and directory names
- We denote one directory back with `..`, and the current with `.` 
```bash
Natalie@mylinux:~/Documents$ cd ..
Natalie@mylinux:~$ cd .
Natalie@mylinux:~$
```

---

## Moving around
- When only running `cd`, it takes you back to your home directory, this is the equivalent of `cd ~`
- We can pass **relative paths** from the current position

```bash
Natalie@mylinux:~$ cd Documents/Computing
Natalie@mylinux:~/Documents/Computing$ cd ../Computing
```
- We can also pass **absolute paths** to anywhere on system
```bash
Natalie@mylinux:~$ cd /home/Natalie/Documents/Computing
Natalie@mylinux:~/Documents/Computing$ cd ~/Documents
Natalie@mylinux:~/Documents$ cd /usr/bin
```
---
## Creating and deleting directories
- We make new directories using `mkdir` 
```bash
Natalie@mylinux:~$ mkdir Masters
Natalie@mylinux:~$ ls
Documents   Masters   mycode.py  
Natalie@mylinux:~$ cd Masters
Natalie@mylinux/Masters:~$
```
- Directories can be deleted with `rm -r` (only need `rm`  for files)
```bash
Natalie@mylinux:~$ rm -r Masters
Natalie@mylinux:~$ ls
Documents   mycode.py
```
---
## Copying and moving files/directories
- We can copy a file/directory using `cp` 
```bash
Natalie@mylinux:~$ cp mycode.py ./Documents
Natalie@mylinux:~$ ls ./Documents
Computing    mycode.py    myfile1.txt    myfile2.txt 
Natalie@mylinux:~$ cp mycode.py mycode_copy.py
Natalie@mylinux:~$ ls
Documents   mycode.py   mycode_copy.py 
```
- We can move/rename a file/directory with `mv`
```bash
Natalie@mylinux:~$ mv mycode.py ./Documents/Computing
Natalie@mylinux:~$ mv mycode_copy.py mycode_renamed.py
```

---
## Creating files and text editing
- We can create a new file with `touch`
```bash
Natalie@mylinux:~$ touch newfile.txt
Natalie@mylinux:~$ ls
Documents   mycode.py   newfile.txt
```
- We can also create a file using a text editor (emacs, nano, vim)
```bash
Natalie@mylinux:~$ vim newfile.txt
Natalie@mylinux:~$ emacs newfile.txt &
```
Here vim opens in the terminal, emacs in the background (with `&` )

---
## Using vim
- We use vim as an example - after opening the file press `i` to start editing
```bash
This is my text file


--INSERT--                                                   1,1         All
```
- After finishing press `esc` and enter `:wq` to write and quit, or `:q!` to quit without saving and go back to the terminal
- Vim can be used to write Python files with, ie. `vim myscript.py`

---

# Session 2: Python basics
```python
x = 5
y = 10

print('Doing some maths!')

result = x + y

print('Sum:', result)

```
---
## Installing python
Everything for this course is set up on the lab computers, however you can do the exercises on your personal laptops if you wish.

You will need to make sure Python is installed - you can download Python [here](https://www.python.org/downloads/).

All exercises will be done through jupyter notebooks - for now this is easiest done by downloading and launching [Anaconda navigator](https://www.anaconda.com/products/navigator).

---
## How does Python run code?
- Python execute your code **one line at a time**, from top to bottom
- This means
```python
This line runs first
Then this one
And so on...
```
- If there's an error on a line, Python **stops running**, and shows an error, reading no more code
- This makes it easy for us to debug code

---
## Ways to run Python
- On the terminal line by line
```bash
Natalie@mylinux:~$ python
>>> print('Hello world')
Hello world
```
- Through a prewritten python script (`.py` file) via the terminal
```bash
Natalie@mylinux:~$ python myscript.py
```
- Through an interactive development environment (Spyder, PyCharm, Visual Studio Code, Jupyter notebooks/lab)
---

## Print
- The `print()` function displays output to the screen
- You can print text, numbers or variables
- Use quotes `""` or `''` for text (strings)
```python
print('Hello world!') 
```
Output: 

```bash
Hello world!
```

---

## Comments
- Comments allow us to add text to our code which is **not read** by the code
- This allows us to explain what the code is doing, which is very useful for long and complex code
- You are **highly encouraged** to comment your code - both for yourself looking back at code and anyone marking your code to understand what you did
- Comments are added by inserting a `#` followed by the comment
```python
print('Hello world!') # This line outputs 'Hello world!'
```

---
## Variables
- Variables are names chosen by the coder to store values
- We **assign** values to variables with `=`
- Variable names can include letters, numbers and underscores, but **cannot** start with a number or contain spaces
- Variables can be overwritten (be careful!)
- Multiple variables can be assigned at once
```python
x = 5
y, z = x, 0.3
x = 2
print(x, y, z) # This will print: 2 5 0.3
```
---
## Data Types
- There are several distinct data types we use in Python
- These include `int` (integers), `float` (decimals), `string` (text), `bool` (true or false)
- We can convert data types where allowed

```python
x = 5 # int -> integer
factor = 2.4 # float -> decimal
greeting = 'hello' # string -> text
mybool = True

y = 2. # this is a float = 2.0
a = 1.5e-3 # this is a float = 0.0015
```
---
## Casting
- We can specify the data type we would like, and where allowed, convert between them
```python
x, y, z = int(3), int(2.8), int('5') # x is 3, y is 2, z is 5  

x, y, z = float(3), float(2.8), float('5') # x is 3.0, y is 2.8, z is 5.0

x, y, z = str('hello'), str(3), str(2.8) # x is 'hello', y is '3', z is '3.8'

x = 4.7
y = int(x) # y is 4
z = 'hello'
int(z) # raises ValueError -> letters cannot be converted to numbers
```
---
## Operations
- Python is built in with simple operations
- These include add `+`, minus `-`, times `*`, divide `/`, power `**`, modulus (remainder)`%` and floor division `//`

```python
x = 5
y = (6 - x)**2 / x # y is 0.2
z = y + x # z = 5.2
```

Note that during operations data types may be implicitly converted ie. `x` is implicitly converted from `int` to `float` in this last line

---

## Assignment operators
- In this previous slide the variables are never altered (`x` stays 5, `y` stays 0.2 etc)
- Variables can be altered, this is commonly done with assignment operators which take the form `*operator*=`

```python
x = 5
x +=3 # equivalent to x = x + 3, x is now 8
x *=2 # equivalent to x = x * 2, x is now 16
x //= 3 # equivalent to x = x // 3, x is now 5
```
---

## Conditional Operators
- Conditional operators are used to compare values
- They return a **boolean** (data type `bool`) value `True` or `False`, which if treated as integers are equal to 1 and 0 respectively
- Examples include equal `==`, not equal `!=`, greater than `>`, less than `<`, greater or equal to `>=`, less than or equal to `<=`
```python
x, y = 5, 5.0
x == y # True -> implicitly converts x to a float to compare
x <= 10 # True
greeting, another_greeting  = 'hello', 'hello '
greeting == another_greeting # False - how are they not the same?
a = x != greeting # a = True, we are allowed to compare different data types
```

---
## Logical Operators
- Logical operators combine conditional operators
- These are `and` (returns `True` if both statements are true), `or` (returns `True` if one statement is true) and `not` (reverses the result, returns `False` if `True` and vice versa)

```python
x, y = 2, 7
x < 5 and y > 5 # True
x >= 10 or y != 3 # True
not(x >= 10 and y != 3) # False
```

---
## Indexing strings
- We can also use the `+` operator to concatenate strings
```python
name, message = 'Natalie', 'Hello, '
greeting = message + name + '!'
print(greeting) # 'Hello, Natalie!'
```
- We use `stringname[i]` to **index** the i-th component of a string
- **Important**: In Python indexing starts a 0, **not** 1
```python
print(name[0]) # first component -> 'N'
print(name[2]) # third component -> 't'
print(name[-1]) # last component -> 'e'
print(name[-3]) # third last component -> 'l'
```
---

## Slicing strings
- Slicing can be used to index multiple components of a string with notation `stringname[start:stop:step]` with defaults of `start = 0`, `stop = -1` and `step = 1`
```python
name = 'Natalie'
print(name[2:5]) # 3rd to 5th -> 'tal'
print(name[:5]) # 1st to 5th -> 'Natal'
print(name[5:]) # 5th to end -> 'ie'
print(name[1:6:2]) # every 2nd letter 2nd to 7th -> 'aai'
print(name[::3]) # every 3rd letter -> 'Nae'
```
- We can also use `len` to get the length of a string ie. `len(name`)

---
## Modifying strings
- Here is a selection of useful **methods** used to modify strings
```python
x = ' Hello, World! '

print(x.upper()) # returns string in upper case -> ' HELLO, WORLD! '

print(x.lower()) # returns string in lower case -> ' hello, world! '

print(x.strip()) # removes whitespace -> 'Hello, World!'

print(x.replace('H', 'J')) # replaces one string with another -> ' Jello, World! '

print(x.split(',')) # returns a list of strings split by ',' -> '[' Hello', 'World! ']'

```

---
## Formatting strings
- We can combine strings and numbers easily by using **f-strings**
- This requires `f` to be placed before the string, and number variables placed as `{num}`
```python
num = 42
txt = f'The answer to Life, the Universe and Everything is {num}'
print(txt) # 'The answer to Life, the Universe and Everything is 42'
```
- Specify the number `n` of decimals to display `x` with `x:.nf`
```python
pi = 3.14159265359
print(f'Pi is {pi:.2f}') # 'Pi is 3.14'
```

---
## User input
- We use the function `input` to take an input from the user
```python
name = input('Enter your name')
print(f'Hello {name}')
```
- Input **always** takes the input as a string, so if you require a number this needs to be manually converted
```python
x = input('Enter a number')
print(x + 5) # returns TypeError: can only concatenate str (not "int") to str
x = int(input('Enter a number'))
print(x + 5) # returns expected value
```
---
# Session 3: Lists, Tuples, Sets & Dictionaries
---
# Session 4: Control Flow & Error Handling
---
# Session 5: Functions
---
# Session 6: Classes
---
# Session 7: Arrays & `numpy`
---
# Session 8: `scipy` and `pandas`
---
# Session 9: Plotting with `matplotlib`
---
# Session 10: File I/O and Virtual Environments
