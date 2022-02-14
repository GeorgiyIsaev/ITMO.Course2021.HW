

$(document).ready(function(){
    console.log("jQuery запущен");

    $("#go-button").on("click",function(){        
        console.log("Нажатие кнопки");
        var inputs =  document.getElementsByClassName("my-input");
        console.log("inputs", inputs);
        console.log("inputs[0].value",  inputs[0].value);
        inputs[0].value

    })

    
    $("#go-button").on("mouseover",function(){

        console.log("Нажатие кнопки");
        var inputs =  document.getElementsByClassName("my-input");
        console.log("inputs", inputs);
        console.log("inputs[0].value",  inputs[0].value);
        inputs[0].value

        var fullAnket = "ОРГАНИЗАЦИЯ: \n";
        fullAnket += "Название организации: " + inputs[0].value + "\n";
        fullAnket +="Отдел: "+ inputs[1].value + "\n";
        fullAnket +="Направление деятельность: "+ inputs[2].value + "\n";
        fullAnket +="Город: "+ inputs[3].value + "\n";
        fullAnket = "ТРЕБОВАНИЯ: \n";
        fullAnket +="Требуемый язык программировании: "+ inputs[4].value + "\n";
        fullAnket +="Набор технологий: "+ inputs[5].value + "\n";
        fullAnket +="Доп. наывыки: "+ inputs[6].value + "\n";
        fullAnket = "КОНТАКТНАЯ ИНФОРМАЦИЯ: \n";
        fullAnket +="E-mail: "+ inputs[7].value + "\n";
        fullAnket +="Телефон: "+ inputs[8].value + "\n";
        fullAnket +="ФИО рекурутера: "+ inputs[9].value + "\n";


        console.log("fullAnket",  fullAnket);
       /* <input class="my-input" placeholder="Отдел.." />
        <input class="my-input" placeholder="Направление деятельность.." />
        <input class="my-input" placeholder="Город.." />

        <h3>Требования:</h3>
        <input class="my-input" placeholder="Требуемый язык программировании..."/>          
        <textarea class="my-input my-textarea" placeholder="Основной набор технологий, с которым необходимо уметь работать..."></textarea>
        <textarea class="my-input my-textarea" placeholder="Дополнительные навыки..."></textarea>

        <h3>Контактная информация:</h3>
        <input class="my-input" placeholder="E-mail...">
        <input class="my-input" placeholder="Телефон..."/>    
        <input class="my-input" placeholder="ФИО Рекрутера..."/>   */

    })

});