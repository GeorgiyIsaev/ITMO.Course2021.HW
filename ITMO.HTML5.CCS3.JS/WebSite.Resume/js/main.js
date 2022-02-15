

$(document).ready(function(){
    console.log("jQuery запущен");

    function saveToPC(str){
        let blob = new Blob([str], {type: "text/plain"});
        let link = document.createElement("a");
        link.setAttribute("href", URL.createObjectURL(blob));
        link.setAttribute("download", Date.now()+"");
        link.click();
     }


    $("#go-button").on("click",function(){        
        console.log("Наведение на кнопку");
        var inputs =  document.getElementsByClassName("my-input");
        console.log("inputs", inputs);
        console.log("inputs[0].value",  inputs[0].value);
        inputs[0].value

        var fullAnket = "<h2>ОРГАНИЗАЦИЯ: </h2>\n";
        fullAnket +="<b>Название организации: </b>" + inputs[0].value + "</br>\n";
        fullAnket +="<b>Направление деятельность: </b>"+ inputs[2].value + "</br>\n";
        fullAnket +="<b>Отдел: </b>"+ inputs[1].value + "</br>\n";        
        fullAnket +="<b>Город: </b>"+ inputs[3].value + "\n";
        fullAnket +="<h2>ТРЕБОВАНИЯ: </h2>\n";
        fullAnket +="<b>Требуемый язык программировании: </b>"+ inputs[4].value + "</br>\n";
        fullAnket +="<b>Набор технологий: </b>"+ inputs[5].value + "</br>\n";
        fullAnket +="<b>Доп. навыки: </b>"+ inputs[6].value + "</br>\n";
        fullAnket +="<h2>КОНТАКТНАЯ ИНФОРМАЦИЯ:</h2>\n";
        fullAnket +="<b>E-mail: </b>"+ inputs[7].value + "</br>\n";
        fullAnket +="<b>Телефон: </b>"+ inputs[8].value + "</br>\n";
        fullAnket +="<b>ФИО рекрутера:</b> "+ inputs[9].value + "</br>\n";


        console.log("fullAnket",  fullAnket);
        /*alert("Анкета отправлена: \n" + fullAnket);*/
       /* saveToPC(fullAnket);*/
        window.open('mailto:Georgiyelbaf@gmail.com?subject=Анктеа_от_Рекрутера&body=' + fullAnket);

    })

    
   /* $("#go-button").on("mouseover",function(){

        console.log("Наведение на кнопку");
        var inputs =  document.getElementsByClassName("my-input");
        console.log("inputs", inputs);
        console.log("inputs[0].value",  inputs[0].value);
        inputs[0].value

        var fullAnket = "-- ОРГАНИЗАЦИЯ: \n";
        fullAnket +="Название организации: " + inputs[0].value + "\n";
        fullAnket +="Отдел: "+ inputs[1].value + "\n";
        fullAnket +="Направление деятельность: "+ inputs[2].value + "\n";
        fullAnket +="Город: "+ inputs[3].value + "\n";
        fullAnket +=" -- ТРЕБОВАНИЯ: \n";
        fullAnket +="Требуемый язык программировании: "+ inputs[4].value + "\n";
        fullAnket +="Набор технологий: "+ inputs[5].value + "\n";
        fullAnket +="Доп. наывыки: "+ inputs[6].value + "\n";
        fullAnket +="-- КОНТАКТНАЯ ИНФОРМАЦИЯ: \n";
        fullAnket +="E-mail: "+ inputs[7].value + "\n";
        fullAnket +="Телефон: "+ inputs[8].value + "\n";
        fullAnket +="ФИО рекурутера: "+ inputs[9].value + "\n";


        console.log("fullAnket",  fullAnket);
        alert("Анкета отправлена: \n" + fullAnket);

    })/*/

});