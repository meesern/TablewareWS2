// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function drawathing()
{
  /*drawmarker([1,3,3]);*/
  pack();
}

function drawmarker(code)
{
var width  = 160,
    height = 160,
    st     = 3;

var pack = d3.layout.pack()
    .size([width - 4, height - 4])
    .value(function(d) { return 1; });
    
var vis = d3.select("#chart").append("svg")
    .attr("width", width)
    .attr("height", height)
    .attr("class", "pack")
  .append("g")
    .attr("transform", "translate(2, 2)");

  json = {
  };
  var node = vis.data(json).selectAll("g.node")
      .data(pack.nodes)
    .enter().append("g")
      .attr("class", function(d) { return d.children ? "node" : "leaf node"; })
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")";});


      node.append("circle")
          .attr("r", function(d) { return 10; });

/*
vis = d3.select("#chart").append("svg")
      .attr("width", width)
      .attr("height", height)
      .attr("class", "marker");
    vis.append("circle")
      .attr("cx",width/2)
      .attr("cy",height/2)
      .attr("r", (Math.min(width,height)/2)-2)
      .attr("fill","black")
      .attr("stroke","white")
      .attr("stroke-width",st)
      ;
    vis.append("circle")
      .attr("cx",width/2)
      .attr("cy",height/2)
      .attr("r", 40)
      .attr("fill","white")
      .attr("stroke","black")
      .attr("stroke-width",st)
      ;
    vis.append("circle")
      .attr("cx",width/2)
      .attr("cy",height/2)
      .attr("r", 8)
      .attr("fill","black")
      .attr("stroke","white")
      .attr("stroke-width",st)
      ;
      */
}

function pack(){
var width = 160,
    height = 160,
    format = d3.format(",d");

var pack = d3.layout.pack()
    .size([width - 4, height - 4])
    .value(function(d) { return d.size; });

var vis = d3.select("#chart").append("svg")
    .attr("width", width)
    .attr("height", height)
    .attr("class", "pack")
  .append("g")
    .attr("transform", "translate(2, 2)");

/*d3.json("/codegen/codes", function(json) {*/
d3.json("/codegen/codes", function(json) {
  var node = vis.data([json]).selectAll("g.node")
      .data(pack.nodes)
    .enter().append("g")
      .attr("class", function(d) { return d.children ? "node" : "leaf node"; })
      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });

  node.append("title")
      .text(function(d) { return d.name + (d.children ? "" : ": " + format(d.size)); });

  node.append("circle")
      .attr("r", function(d) { return d.r; });

  node.filter(function(d) { return !d.children; }).append("text")
      .attr("text-anchor", "middle")
      .attr("dy", ".3em")
      .text(function(d) { return d.name.substring(0, d.r / 3); });
});
}
