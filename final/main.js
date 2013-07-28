var io = new RocketIO().connect("http://linda.shokai.org");
var linda = new Linda(io);
var ts = new linda.TupleSpace("abs");

users = ["abs", "user2", "user3", "web", "chat"];
alert( users.length);


io.on("connect", function(){
    alert(io.type+" connect");

    for( var i = 0; i < users.length; i++ ) {
	ts.watch( [users[i]], function(tuple){
	    $("#log").prepend(
		$("<p>").text("[" + tuple[0] + "]   " + tuple[1])
	    );
	});
    }
})

$(function(){
    $("#btn_send").click(function(){
	var m = $("#message").val();
	var i = $("#ID").val();
	if( users.indexOf(i) == -1 ) {
	    users.push(i);
	    ts.write([i, m]);
	}
	ts.write([i, m]);
    });
});


