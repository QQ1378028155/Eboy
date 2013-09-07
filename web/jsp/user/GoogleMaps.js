function displaySpot(spotname,pin){
    
    var geocoder = new google.maps.Geocoder();
    var pinColor="ED1846";
    geocoder.geocode({address:spotname},function(results,status){
        if (status==google.maps.GeocoderStatus.OK){
            var spot = results[0].geometry.location;
            var point = new google.maps.Marker({
                position: spot,
                animation: google.maps.Animation.DROP,
                icon: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+pin+"|" + pinColor,
                draggable:false
            });
            point.setMap(map);
        }
    });

}

function displayRoute(spots)
{
	spot_cnt=spots.length;
    if (spot_cnt<2){
    	if (spot_cnt==1)
    		displaySpot(spots[0],"起");
    	return;
    }

    var cnt=0;
    var locationArr=new Array();
    for (var i=1;i<spot_cnt-1;i++){
        locationArr[cnt] = {location:spots[i], stopover:true};
        cnt++;
    }
    
    var markerOptions = {
        animation: google.maps.Animation.DROP,
        draggable:false
    };
    
    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer({ map: map, markerOptions: markerOptions });  
    var directionsRequest={
        origin: spots[0],
        destination: spots[spot_cnt-1],
        travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
    if (cnt>0)
        directionsRequest.waypoints = locationArr;
    directionsService.route(directionsRequest,
        function(result,status){
            if (status == google.maps.DirectionsStatus.OK){
                directionsDisplay.setDirections(result);
            }
        });
}

function displayGoogleMaps(waypoints,destination)
{
	var addresses=waypoints.split("|");
    google.maps.event.addDomListener(window, 'load', function(){
        var mapOptions = {
            center: new google.maps.LatLng(31.294981,121.472654),
            zoom: 9,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(/*window.frames["gMap"].*/document.getElementById("map-canvas"),mapOptions);
        
        displaySpot(destination,"终");
        displayRoute(addresses);
    });
}
