## Step 1 : Create Index File

In the views folder create a file called 'index.haml', then add the following:

<pre><code>
  <span style='color:orange'>.container_12</span>
    <span style='color:orange'>.grid_4</span>
      <span style='color:green'>%h1</span> Mercury Example
    <span style='color:orange'>.clear</span>
    <span style='color:orange'>.grid_12</span>
      <span style='color:green'>%p</span>
        Lorem ipsum dolor sit amet, 
        consectetur adipisicing elit, 
        sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. 
    <span style='color:orange'>.clear</span>
</code></pre>
  
You are using the 960 grid system to make you layout.

## Step 2: Add some sass

Create a sass file called 'default.sass' in your views directory.

<pre><code>
<span style='color:orange'>body</span>
  <span style='color:green'>font-family:</span> arial
  <span style='color:green'>background-color:</span> whitesmoke
  
<span style='color:orange'>h1</span>
  <span style='color:green'>color:</span> cyan
  
<span style='color:orange'>p</span>
  <span style='color:green'>color:</span> green

</code></pre>


<pre><code>
  <span style='color:yellow'>= sass :default</span>
  <span style='color:orange'>.container_12</span>
    <span style='color:orange'>.grid_4</span>
      <span style='color:green'>%h1</span> Mercury Example
    <span style='color:orange'>.clear</span>
    <span style='color:orange'>.grid_12</span>
      <span style='color:green'>%p</span>
        Lorem ipsum dolor sit amet, 
        consectetur adipisicing elit, 
        sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. 
    <span style='color:orange'>.clear</span>
</code></pre>

## Step 3: Add some coffee-script

create a file called 'default.coffee' in the views directory

<pre><code>

<span style='color:green'>$(</span><span style='color:yellow'>'document'</span><span style='color:green'>).ready -></span>
  <span style='color:green'>$(<span style='color:yellow'>'.grid_4'</span><span style='color:green'>).css</span> <span style='color:orange'>'background-color'</span>, <span style='color:orange'>'gray'</span>
  
</code></pre>

And attach it to your index.haml file

<pre><code>
  <span style='color:yellow'>= sass :default</span>
  <span style='color:yellow'>= coffee :default</span>  
  <span style='color:orange'>.container_12</span>
    <span style='color:orange'>.grid_4</span>
      <span style='color:green'>%h1</span> Mercury Example
    <span style='color:orange'>.clear</span>
    <span style='color:orange'>.grid_12</span>
      <span style='color:green'>%p</span>
        Lorem ipsum dolor sit amet, 
        consectetur adipisicing elit, 
        sed do eiusmod tempor incididunt 
        ut labore et dolore magna aliqua. 
    <span style='color:orange'>.clear</span>
</code></pre>
  