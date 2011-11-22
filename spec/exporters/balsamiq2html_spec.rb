#!/usr/bin/env ruby
      
# Copyright (c) 2009 Cory Ondrejka. All rights reserved.
# See License.txt for licensing details.

unless Object.const_defined?("BalsamiqControl")
  require "mockup/balsamiq/control"
end

unless Object.const_defined?("BalsamiqControlParser")
  require "mockup/balsamiq/controlparser"
end

unless Object.const_defined?("BalsamiqControlSymbols")
  require "mockup/symbols/balsamiq-control-symbols"
end

require "mockup/exporters/balsamiq2html"


describe BalsamiqExportHTML do
  it "sets up defailt values correctly" do
    export = BalsamiqExportHTML.new
    export.start("foo")
    export.filename.should == "foo"
    export.html_preamble.should ==  <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!-- Generated by Balsamiq Exporter -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link rel="stylesheet" type="text/css" href="reset.css" />
  EOF
  
    export.html_header.should ==  <<-EOF
    <title>Balsamiq</title>
    <script type="text/javascript">
  EOF
    export.html_body.should == "    </script>\n  </head>\n\n  <body>\n"
    export.html_footer.should == <<-EOF
  </body>
</html>
      EOF

    export.css_reset.should ==  <<-EOF
/* Generated by Balsamiq Exporter */
* {
  vertical-align: baseline;
  font-weight: inherit;
  font-family: inherit;
  font-style: inherit;
  font-size: 100%;
  border: 0 none;
  outline: 0;
  padding: 0;
  margin: 0;
}

strong, b {
  font-weight:bold;
}

em, i {
  font-style:italic;
}

body {
  background-color: #f8f4ed;
  font-family: "Comic Sans MS", Arial,sans-serif;
  color: #010101;
}

div {
  background-color: #ffffff;
  outline: 2px solid #202028;
  text-align: center;
}

a {
  color:#0101ff;
}

a:link {
  color:#0101ff;
}

a:hover {
  color:#FD0101;
}
      EOF

    export.css.should ==  ""
    export.js_basic.should ==  <<-EOF
/* Generated by Balsamiq Exporter
/* Simon Willison's cool hack to build out multiple onload events */
function addLoadEvent(func) 
{
  var oldonload = window.onload;
  if (typeof window.onload != 'function') 
  {
    window.onload = func;
  } 
  else 
  {
    window.onload = function() 
    {
      if (oldonload) 
      {
        oldonload();
      }
      func();
    }
  }
}
  EOF
    export.js.should == ""
  end
  
  it "routes unknown elements method_missing" do
    export = BalsamiqExportHTML.new
    export.start("foo")
    c = Hash.new(nil)
    export.thisMethodDoesntExist(c)
    export.html_body.should == "    </script>\n  </head>\n\n  <body>\n    <div\n        style=\"position: absolute; left: px; top: px; \n        width: px; height: px;>\n      <h3></h3>\n      <p> </p>\n    </div>\n"
  end
end
