let date= new Date("Dec 1, 2022 12:00:00")
		
let CountDay=document.getElementById("Days")
let CountHour=document.getElementById("Hours")
let CountMinutes=document.getElementById("Minutes")
let CountSeconds=document.getElementById("Seconds")
let Int=setInterval(UpdateTime,1)

function UpdateTime(){
let Now= new Date().getTime()
let distance= date - Now

CountDay.innerHTML=Math.floor(distance / (1000 * 60 * 60 * 24));

CountHour.innerHTML= Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));

CountMinutes.innerHTML= Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

CountSeconds.innerHTML= Math.floor((distance % (1000 * 60)) / 1000);
if(distance<0){
 clearInterval(Int)
 document.getElementById("Days").innerHTML="0";
 document.getElementById("Hours").innerHTML="0";
 document.getElementById("Minutes").innerHTML="0";
 document.getElementById("Seconds").innerHTML="0"
 
}


}

