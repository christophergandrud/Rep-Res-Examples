Example R Presentation 
===

## Christopher Gandrud

## 1 July 2015

Access the Code
===

The code to create the following figure is available online.

To access it we type:


```r
# Access and run the code to create a caterpillar plot 

devtools::source_url("http://bit.ly/VRKphr")
```

Caterpillar Plot
===

![plot of chunk unnamed-chunk-2](ExampleRPresentation-figure/unnamed-chunk-2-1.png) 

Fertilizer Consumption Map
===

<!-- GeoChart generated in R 3.1.2 by googleVis 0.5.7 package -->
<!-- Fri Dec 26 11:11:54 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID43006c937643 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "AE",
6.8 
],
[
 "AF",
1.2 
],
[
 "AL",
4.6 
],
[
 "AR",
3.7 
],
[
 "AT",
5.7 
],
[
 "AU",
3.8 
],
[
 "BB",
4.4 
],
[
 "BD",
5.1 
],
[
 "BE",
5.7 
],
[
 "BG",
5 
],
[
 "BH",
4.6 
],
[
 "BN",
4.6 
],
[
 "BR",
5 
],
[
 "CA",
4.1 
],
[
 "CH",
5.3 
],
[
 "CL",
5.8 
],
[
 "CN",
5.9 
],
[
 "CO",
5.8 
],
[
 "CY",
5.1 
],
[
 "CZ",
4.5 
],
[
 "DE",
5.4 
],
[
 "DK",
4.9 
],
[
 "DO",
4 
],
[
 "EC",
5.1 
],
[
 "EE",
4.3 
],
[
 "EG",
6.4 
],
[
 "ES",
5.2 
],
[
 "FI",
4.8 
],
[
 "FR",
5.4 
],
[
 "GB",
5.7 
],
[
 "GH",
1.9 
],
[
 "GR",
5.1 
],
[
 "GT",
4.5 
],
[
 "HK",
5.9 
],
[
 "HN",
4 
],
[
 "HR",
5.7 
],
[
 "HU",
4.6 
],
[
 "ID",
4.9 
],
[
 "IE",
6.3 
],
[
 "IL",
5.6 
],
[
 "IN",
4.7 
],
[
 "IS",
4.8 
],
[
 "IT",
5.2 
],
[
 "JM",
4.7 
],
[
 "JO",
6.8 
],
[
 "JP",
5.8 
],
[
 "KE",
3.5 
],
[
 "KR",
6.2 
],
[
 "LK",
5.6 
],
[
 "LT",
5 
],
[
 "LU",
5.6 
],
[
 "LV",
3.9 
],
[
 "MA",
4 
],
[
 "MK",
3.5 
],
[
 "MT",
4.5 
],
[
 "MW",
3.4 
],
[
 "MX",
4.2 
],
[
 "MY",
7.2 
],
[
 "NG",
1.8 
],
[
 "NI",
3.5 
],
[
 "NL",
6.1 
],
[
 "NO",
5.4 
],
[
 "NZ",
7.7 
],
[
 "OM",
6 
],
[
 "PE",
4.4 
],
[
 "PH",
5.2 
],
[
 "PL",
4.9 
],
[
 "PT",
5.2 
],
[
 "SA",
4.8 
],
[
 "SE",
4.6 
],
[
 "SG",
9.4 
],
[
 "SI",
6 
],
[
 "SK",
4.4 
],
[
 "SV",
4.4 
],
[
 "TH",
5 
],
[
 "TR",
4.4 
],
[
 "UG",
0.5 
],
[
 "US",
4.8 
],
[
 "VN",
5.8 
],
[
 "ZA",
4 
],
[
 "ZM",
3.3 
] 
];
data.addColumn('string','iso2c');
data.addColumn('number','LogConsumption');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID43006c937643() {
var data = gvisDataGeoChartID43006c937643();
var options = {};
options["width"] = "780px";
options["height"] = "500px";
options["colors"] = ['#ECE7F2', '#A6BDDB', '#2B8CBE'];

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID43006c937643')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID43006c937643);
})();
function displayChartGeoChartID43006c937643() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID43006c937643"></script>
 
<!-- divChart -->
  
<div id="GeoChartID43006c937643" 
  style="width: 780px; height: 500px;">
</div>
