var vidasTotales = 3;
	var vidasActuales = vidasTotales;
	
	var cartaPremiada = parseInt(Math.random() * 6);
	//alert(cartaPremiada)
	
	var lasCartas = document.getElementsByName ("cartas");
	
	var lasVidas = document.getElementsByName("heart");
	
	var partidasPerdidas = 0;
	
	var partidasGanadas = 0;
	


	
	function f_contadorVidas(){
		document.getElementById("vidas").innerHTML = vidasTotales;
		
		var arrayVidas = new Array ("heart", "heart", "heart");
		
		for (var i = 0; i < lasVidas.length; i++){
			lasVidas[i].innerHTML =
				"<img src='imagenes/" + arrayVidas[i] + ".png'/>"
		}
	}
	
	function f_inicio(){
		var arrayCartas = new Array("carta_reverso", "carta_reverso", "carta_reverso", "carta_reverso", "carta_reverso", "carta_reverso");
		
		document.getElementById("ganadas").innerHTML = partidasGanadas;
		document.getElementById("perdidas").innerHTML = partidasPerdidas;
			
			for (var indice = 0; indice < lasCartas.length; indice++) {
                lasCartas[indice].innerHTML =
                        "<img src='imagenes/" + arrayCartas[indice]
                            + ".png'/>";
			}
	}
	
	function f_quienFue(quien) {
		
		var cartaElegida = quien.id;
		
		if(cartaPremiada == cartaElegida){
			lasCartas[cartaElegida].innerHTML = "<img src='imagenes/mundo.jpg'/>";
			
			alert("GANASTE!! PULSA LA LUNA PARA JUGAR OTRA VEZ");
			
			f_finPartida(cartaElegida);
			
		} else {
			lasCartas[cartaElegida].innerHTML = "<img src='imagenes/carta_luna.jpg'/>";
			f_restarVidas(cartaElegida);
		}
		
		//document.getElementById("mostrarTodo").visibility = "visible";
	}
	
	function f_nuevaPartida(){
 		
	}
	
	function f_finPartida(cartaElegida){
		
		for (var indice=0; indice<lasCartas.length; indice++){
			lasCartas[indice].onclick = null;
		}
		
		partidasGanadas += 1;
		document.getElementById("ganadas").innerHTML = partidasGanadas;
	}
	
	function f_restarVidas(cartaElegida){
		
		vidasActuales = vidasTotales -= 1;
		
		document.getElementById("vidas").innerHTML = vidasActuales;
		f_vidasPantalla()
		

	}
	
	function f_vidasPantalla(){
		if(vidasActuales == 0){
			
			partidasPerdidas += 1;
			document.getElementById("perdidas").innerHTML = partidasPerdidas;
			
			alert("PERDISTE!! FIN DE LA PARTIDA!!");
			lasVidas[0].innerHTML="<img src='imagenes/empty_heart.png'/>";
			f_finPartida();
		}else{
			lasVidas[vidasActuales].innerHTML="<img src='imagenes/empty_heart.png'/>";
		}
		
	}
	
	function f_nuevoJuego(){
		alert("!!! NUEVO JUEGO !!! ");
        location.reload(); 
	}