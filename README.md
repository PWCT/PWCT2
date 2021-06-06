# Programming Without Coding Technology (PWCT)

## Version 2.0 (Developed using the Ring programming language!)

If you want to learn programming, create applications/systems or get some new ideas
about visual programming in the practice then you are in the right place. The goal
of this project is to present programming to every computer users, whether they are
beginners or professionals. Beginners means that the tools of programming must be
accessible � must be easy. So I decided to take coding out of programming. And 
presenting programming to professional developers requires a tool that is productive
and unlimited and can be extended. 

The domain of the problem is called "Visual Programming Languages." There are many
projects in this domain, but most of these languages are domain-specific languages
that are used in education, But with respect to general-purpose visual programming
languages, there are few of them. PWCT don't use the Drag-and-Drop method. PWCT 
provide a new method based on Automatic Steps Tree Generation and Update in 
response to interaction with components that provide to the user simple 
data entry forms. The idea behind this new method is to mix between 
programming using Diagrammatic approach and programming using Form-based 
approach where the integration between the two approaches are done 
seamlessly through an Automatic Visual Representation Generation process. 
This is just the basic idea and many other ideas are developed around 
this concept to get a practical general purpose visual programming 
language for real world tasks. 

# Contents:

- [Introduction](#introduction)
- [The First Generation](#the-first-generation)
  - [The Concept of the First Generation](#the-concept-of-the-first-generation)
  - [The Disadvantages of the First Generation](#the-disadvantages-of-the-first-generation)
- [The Second Generation](#the-second-generation)
  - [Improving the Concept](#improving-the-concept)
    - [Interactive Visualizations](#interactive-visualizations)
    - [Import Textual Source Code Files](#import-textual-source-code-files)
  - [Improving the Implementation](#improving-the-implementation)
    - [64-bit version](#64-bit-version)
    - [Open Many Files](#open-many-files)
    - [Inserting Steps](#inserting-steps)
    - [Web and Mobile versions](#web-and-mobile-versions)
    - [Translation (Arabic Version)](#translation-arabic-version)
  - [The Release Date](#the-release-date)

# The First Generation

## The Concept of The First Generation

Fifteen years ago (In Dec. 2005) I started to think about developing PWCT.

I started with many ideas and I tested each idea through practical development

In 2007, The core idea was very simple (Goal Designer instead of Code Editor)

We see this in the next screen shot, Instead of writing textual code directly, we follow
a procedure of four simple steps

1. Select a component 

2. Enter the data required for this component 

3. Interact with the steps tree (If you need this)

4. Run the program

The next diagram demonstrates something similar to what I wrote using a pen and paper to explain the idea to my
friends (The diagram uses screen shots from PWCT 2.0 that doesn't exist at that time).

![concept](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/Hello.png)

At that time, the advantages were very clear

* Selecting components means we can explore the programming system and start using it without previous knowledge.

* Separating data from instructions through the data-entry forms provide the ability for quick reuse 

* Using a GUI to program means easy support for translation (Arabic, English, French, etc.)

* No Syntax Errors (Happy experience for beginners)

* The generated steps tree (instead of source code) provides a chance for Maximum Readability

* The generated steps could replace many lines of source code (Higher Abstraction)

* The generated steps could be in many locations at the same time 

* Interaction with a tree (Steps Tree) provide the ability to control many nodes (Parent & Children) together (Faster)

* The same component could generate different steps based on the data that we enter through data-entry forms 

This design was enough to attract a few thouands of developers until 2009

from 2009 to 2013, We improved the system with the next features 

1. Using Keyboard Shortcuts to improve the writability 

2. Adding Colors & Customization to the Steps Tree 

3. Improving a domain-specific language that are used for developing the components

4. Supporting more programming languages in the code generation layer

5. Show/Hide steps based on the context

6. Two modes (Syntax Directed Editor OR Free Editor + VPL Compiler)

7. Automatic Documentation (Generate HTML Files from Visual Programs)

8. Optional automatic update of programs after components update 

9. Adding the Time Dimension 

Using the Time Dimension we can

* Move to a point in the past during development and run the program

* Play programs as movies to learn how to create a program step by step

For example, the next program print numbers from 1 to 10 and print the Three message after the number 3.

![tm1](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/tm1.png)

Using the Time Machine slider, we can move to the past and run the program before adding the if statement that print the Three message.

![tm2](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/tm2.png)

The previous screen shots uses PWCT 2.0 but, the same idea is implemented in the first generation of PWCT from 2011 (PWCT 1.8)

These updates were enough to attract hundered thousands of developers to download the product and try it!

## The Disadvantages of the First Generation

It's all about the implementation and the missing features!

The concept is very good, that attracted many developers with different background and they started asking about many things!

And Yes! some developers asked about improving the concept itself! (More innovation is required)

1. Some developers reported that using Code Editors is too much flexibile and faster in some situtations 

2. Slow performance when using large visual source files 

3. Visual Source Files are database files (not textual) which is not good for Version Control software

4. Support importing the source code (Convert source code files to Visual Source Files)

5. Opening many files and quick nagivation

6. Multiplatform support (Windows, Linux & macOS)

7. Support Web & Mobile development 

8. Support more programming languages

9. Translation & Unicode 

10. Modern Form Designer

11. Support powerful libraries and frameworks

12. More educational resources!

I started to think about all of these issues and feature requests and how I can implement them.

I discovered that I need a new programming language (Ring) that could help me to do all of this in an efficient way

# The Second Generation

The second generation (PWCT 2.0) is under development using the Ring programming language

Our goal is to provide a more powerful version of the software that satisfy two conditions

(1) To be an easy tool to start learning about real programming concepts

(2) To be a better replacement for Textual Code Editors 

In the first generation we tried to achive the same goals but, we did a lot of mistakes, we 
learned from them and developed new ideas then we implemented these ideas in PWCT 2.0

I could be brave and say that after PWCT 2.0 development, I don't see any reason to use a Textual Code Editor
when developing Ring applications. The same could be applied for other textual programming languages when we 
support them.

## Improving the Concept

1- The Ring textual language is designed for high writability

2- The PWCT visual language is designed for high readability 

3- We can use them together at the same time using (Ring2PWCT) 

3.1 - We can write Ring code directly and get the Visual Representation 

3.2 - We can import textual source code files and complete projects written in Ring

### Interactive Visualizations

In the Goal Designer we can type Ring code directly and PWCT will do the visualization

The next Ring code create an object and a class in one line.

![ft1](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft1.png)

We get the visual output in the Steps Tree 

![ft2](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft2.png)

We can continue and write more code, for example using a (For Loop) and (If statement)

![ft3](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft3.png)

Again, we see the output in the steps tree 

![ft4](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft4.png)

We can define three functions (one, two & three)

![ft5](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft5.png)

The steps tree are updated 

![ft6](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft6.png)

We can call these functions 

![ft7](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft7.png)

So, if you are a Ring programmer and know how to write textual Code, You can reuse this knowledge and PWCT will not get in your way!

![ft8](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/ft8.png)

### Import Textual Source Code Files

PWCT 2.0 comes with Ring2PWCT that can import any textual source code file.

We imported all of the Ring applications and samples

For example the next screen shots for the Flappy Bird 3000 game

![flappybird1](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/flappybird1.png)

![flappybird2](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/flappybird2.png)

## Improving the Implementation

In the second generation of PWCT, we worked on solving all of the reported problems in the design and implementation of the first generation. Also we implemented most feature requests that are useful and improve the flexibility of the product.  

### 64-bit version

PWCT 2.0 will comes with 64-bit version (no longer limited to ~4gb of memory)

### Open Many Files

PWCT 2.0 Support opening many visual source files at the same time

![manyfiles](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/openmanyfiles.png)

### Inserting Steps

PWCT 2.0 support starting new interactions at any location in the steps tree (Not just Start Here steps)

The new steps will be inserted in the right location

This feature is supported while using components, Ring2PWCT and Paste operations

### Web and Mobile versions

We can use PWCT on Desktop, Web & Mobile platforms.

The next screen shot for the Mobile & Web versions

The Web version uses (Qt For WebAssembly) and the Mobile version uses (Qt for Android)

Most software developers uses the Desktop platforms and I belive that this is too much
better and practical. but we added the support to these platforms for two reasons

1- We can easily support them (Thanks to the powerful Ring language & Qt framework)

2- At some situations, these platforms are very useful. 

2.1 - Some Users don't have Desktop computers but have Mobile devices.

2.2 - At some places we could have only our Mobile devices and some free time for programming.

The Mobile screen is small, typing using the touch screen is slow
compared to using a large keyboard.

Using foldable smartphones and Tablets provide better experience.

![webandmobile](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/WebAndMobile.png)

### Translation (Arabic Version)

One of the advantages of using Visual Programming and GUI over textual code editors is the easy translation of these User Interfaces to other natural languages.

PWCT 2.0 will comes with an Arabic version, other languages could be added in the future.

![arabicversion](https://github.com/mahmoudfayed/pwct2/blob/master/docimages/Arabic.jpg)

## The Release Date

Since we already have the first generation of the product (PWCT 1.9) we decided that in
the second generation we will focus on the quality and accept the high costs (Development Time).

Until now the product is usable and a lot of useful ideas are implemented and we are happy with
the product, It's too much better than the first generation but, we are going to invest 
more time to provide many useful resources around the software.

Once we have a fixed release date we will update this document.

The more we are investing our time in the development of this product, the more we save
your time when you use it.


