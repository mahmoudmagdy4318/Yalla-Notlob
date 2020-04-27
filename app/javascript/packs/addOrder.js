var friendsName =document.querySelectorAll(".nameee");
var search=$("#search")
var i=0;
let friendsarr=[];
 console.log(friendsName);
 
friendsName.forEach(element => {
    friendsarr.push(element.innerText);
    
});


search.on("keyup", function(){
    $("#searchReslt").text("");
    i++;
    if(i==1){ 
        search.after( `<div id='searchReslt' class="bg-secondary text-light" style="border-radius:5px"></div>` );}
    for(j=0;j<friendsarr.length;j++){
      if(friendsarr[j].search(this.value)!=-1 && !friendsarr[j].match(/[0-9]/g)){
        $( "#searchReslt" ).append( `<li  >${friendsarr[j]}</li>` );
        $("li").on("click",event=>{
            console.log(event.target.innerText);
            let card=document.getElementById
            (`${event.target.innerText}`).parentElement
            document.getElementById("friendinvited")
            .appendChild(document.getElementById
                (`${event.target.innerText}`).parentElement)
            document.getElementById("friendsInput").value+=`${card.id}:`;

            document.getElementById
                (`${event.target.innerText}`).parentElement.style.display="inline-block";

        }
        )

      }
    }
    
  });
$(".friendsElement").on("click",event=>{
    event.target.parentElement.style.display="none";
    document.getElementById("parentForFriends")
    .appendChild(event.target.parentElement)
    document.getElementById("friendsInput").value=
    document.getElementById("friendsInput").value
    .replace(`${ event.target.parentElement.id}:`,"");



})