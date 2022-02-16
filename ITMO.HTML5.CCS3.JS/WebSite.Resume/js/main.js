

$(document).ready(function(){
    console.log("jQuery запущен");

    function saveToPC(str){
        /*Функиця для сохранения текста в файл*/
        let blob = new Blob([str], {type: "text/plain"});
        let link = document.createElement("a");
        link.setAttribute("href", URL.createObjectURL(blob));
        link.setAttribute("download", Date.now()+"");
        link.click();
    }


    $("#go-button").on("click",function(){   
        /*Функция для нажатия клавиши */     
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
       
    function countFullProgect(){
        /*Функиця для подсчета открытых проектов*/
        var articleGit =  $(".article-git");
        console.log("articleGit:", articleGit);
        var countFullProgect = articleGit.length;
        console.log("countFullProgect", countFullProgect);


        var articleNone =  $(".nonepr");
        console.log("articleNone:", articleNone);
        var countFullProgectN = articleNone.length;
        console.log("countFullProgectN", countFullProgectN);
        return countFullProgect -countFullProgectN;
    }



    $('#prlang').on('change', function (e) {
        var optionSelected = $("option:selected", this);
        console.log("optionSelected:", optionSelected);
        var valueSelected = this.value;
        console.log("valueSelected:", valueSelected);

        var selectValprlang = $("#prlang option:selected").val();
        console.log("selectValprlang", selectValprlang);

        $("#count-progect").text(countFullProgect());
    });
        
});