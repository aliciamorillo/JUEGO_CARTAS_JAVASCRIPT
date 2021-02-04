<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>TRILEROS - ZELDA</title>
		
	<!-- IMPORTACIÓN DE UN FICHERO JAVASCRIPT -->
	<script type="text/javascript" src="js/ficheroExternojs.js"></script>
	
	<script>

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
	
	</script>
	
	<!-- IMPORTACIÓN DE UN FICHERO DE ESTILOS EXTERNO -->
	<link rel="stylesheet" type="text/css" href="estilos/style.css">
		
	</head>
	
	
	<body onload="f_contadorVidas(); f_inicio();" style="background-image: url('imagenes/landscape.jpg');">
	
		<div align="center" class="wraper">
		
		<header class="center">
			<h1>- ELIGE LA CARTA GANADORA - </h1>
			
			<a href="">
				<img class="luna_encabezado" src="imagenes/luna_encabezado.png" title="PULSAR - RESET" onclick="f_nuevoJuego();"/>
			</a>
			RESETEAR PARTIDA
		</header>
		
		<div class="mainWeb">
			
			<aside class="center">
				<p>VIDAS DISPONIBLES:</p>
				
				<span id="vidas" style="color:red; font-size:1cm;"></span>
				
				<div id="capaVidas">
					<div id="vida01" class="enLinea" name="heart"></div>
					<div id="vida02" class="enLinea" name="heart"></div>
					<div id="vida03" class="enLinea" name="heart"></div>
				</div>
				
			<aside class=center">
				<div>
					<table border="1" style="margin-left:20px; background-color: grey;">
					
						<tr>
							<th colspan="2">MARCADOR</th>
						</tr>
						<tr>
							<td>GANADAS</td>
							<td>PERDIDAS</td>
						</tr>
						
						<tr>
							<td id="ganadas"></td>
							<td id="perdidas"></td>
						</tr>
					
					</table>
				
				</div>
			
			</aside>
				
			</aside>
			
			<section class="center">
				
					<div class="enLinea" name="cartas" id="0" onclick="f_quienFue(this);"></div> 
						
					<div class="enLinea" name="cartas" id="1" onclick="f_quienFue(this);"></div>
						
					<div class="enLinea" name="cartas" id="2" onclick="f_quienFue(this);"></div>
					
					<div class="enLinea" name="cartas" id="3" onclick="f_quienFue(this);"></div>
					
					<div class="enLinea" name="cartas" id="4" onclick="f_quienFue(this);"></div>
					
					<div class="enLinea" name="cartas" id="5" onclick="f_quienFue(this);"></div>
				
			</section>
		
		</div>
		
			<footer class="center">
	            
	            <button class="myButton" type="button" id="nuevaPartida" onclick="f_nuevaPartida();" title="TRAMPOSO!">
	                NUEVA PARTIDA                
	            </button>
	            
	        </footer>
			
		</div>
	
	</body>
	
</html>