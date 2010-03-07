Mercury is a gem that makes it simple to work with haml, sass, jquery and other tools and technologies without the hassle.

## Installation

<pre><code>
$ gem install mercury
</code></pre>

## Create a Mercury Project

<pre><code>
$ gem install mercury
</code></pre>

## Run your Mercury Project

<pre><code>
$ cd project_awesome
$ mercury
</code></pre>

<div class="highlight"><pre><span class="nb">require</span> <span class="s1">&#39;sinatra&#39;</span> 
<span class="nb">require</span> <span class="s1">&#39;haml&#39;</span> 
<span class="nb">require</span> <span class="s1">&#39;sass&#39;</span> 
<span class="nb">require</span> <span class="s1">&#39;fileutils&#39;</span> 
<span class="nb">require</span> <span class="s1">&#39;faker&#39;</span> 
 
<span class="k">begin</span> 
  <span class="nb">require</span> <span class="s1">&#39;rdiscount&#39;</span> 
  <span class="c1"># ^^ that sets a Markdown constant</span> 
<span class="k">rescue</span> <span class="no">LoadError</span> 
  <span class="nb">require</span> <span class="s1">&#39;bluecloth&#39;</span> 
  <span class="no">Markdown</span> <span class="o">=</span> <span class="no">BlueCloth</span> 
<span class="k">end</span>
</pre></div>
