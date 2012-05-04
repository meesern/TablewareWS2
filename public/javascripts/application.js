// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function drawmarker(code)
{
  var width = 200,
      height = 200,
      format = d3.format(",d");

  var pack = d3.layout.pack()
      .size([width - 4, height - 4])
      .value(function(d) { return 1; }); /* Was d.size */

  var vis = d3.select("#c"+code.gsub(":","-")).append("svg:svg")
      .attr("width", width)
      .attr("height", height)
      .attr("class", "pack");

  var visg = vis.append("g")
      .attr("transform", "translate(2, 2)");

  var circles = [];
  var vertices = [];
  var big_vertices = [];
  var hull = [];
  var big_hull = [];
  var casing = [];

  var json = makejson(code);

  var node = vis.data([json]).selectAll("g.node")
      .data(pack.nodes)
    .enter().append("g")
      .attr("class", function(d) { return d.children ? "node" : "leaf node"; })
      .attr("id", function(d) { return d.depth==0 ? "root" : "" })
      .attr("transform", function(d) {
                                if (d.depth==1){
                                circles.push( {'x': d.x,'y': d.y,'r': d.r}); };
                                return "translate(" + d.x + "," + d.y + ")"; });
  node.append("circle")
      .attr("r", function(d) { 
           var border = d.children ? 0:4;
           return d.r - border; }); /*RNM try removing 4 from pack's calculation*/

  circles.map( function(c) {
    r = c.r+4;
    br = c.r+20;  /* Big radius out of which to form the larger convex hull */
    segs = 16;
    for (i = 0; i<segs; i++)
    {
      th = 2*i*Math.PI/segs;
      x = c.x + Math.sin(th)*r;
      y = c.y + Math.cos(th)*r;
      vertices.push([x,y]);
      bx = c.x + Math.sin(th) * br;
      by = c.y + Math.cos(th) * br;
      big_vertices.push([bx,by]);
    }
  });
  
  hull = d3.geom.hull(vertices);
  big_hull = d3.geom.hull(big_vertices);
  for (i = 0; i< hull.length; i++)
  {
    /*make the bezier control points from the large hull and the points from the small */
    casing.push([big_hull[i][0],big_hull[i][1],hull[i][0],hull[i][1]]);
  }

  visg.selectAll("path")
      .data([hull])
      .attr("d", function(d) {
           curves = d
             return "M" + curves.join("S") + "Z"; })
	  .enter().insert("path")
	    .attr("d", function(d) {
               return "M" + casing.join("S") + "Z"; });

};

// Code like "1:1:3"
function makejson(code)
{
  var list = code.split(':').map( function(region) {
    blobs = [];
    for (i = 0; i < parseInt(region); i++)
    {
      blobs.push({"size":1});
    }
    return {"children": blobs };
  });
  
  return { "children": list };
}

