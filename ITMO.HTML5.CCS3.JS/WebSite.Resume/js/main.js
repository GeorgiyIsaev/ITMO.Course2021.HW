

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

  

    function getCssH2(){
        return "style=\"color:green;margin-bottom:6px;margin-left:30px;\"";
    }
   

    $("#go-button").on("click",function(){   
        /*Функция для нажатия клавиши */     
        console.log("Наведение на кнопку");
        var inputs =  document.getElementsByClassName("my-input");
        console.log("inputs", inputs);
        console.log("inputs[0].value",  inputs[0].value);
        inputs[0].value

        var fullAnket = "\n<h2 "+ getCssH2()+">ОРГАНИЗАЦИЯ: </h2>\n";
        fullAnket +="<b>Название организации: </b>" + inputs[0].value + "</br>\n";
        fullAnket +="<b>Направление деятельность: </b>"+ inputs[2].value + "</br>\n";
        fullAnket +="<b>Отдел: </b>"+ inputs[1].value + "</br>\n";        
        fullAnket +="<b>Город: </b>"+ inputs[3].value + "\n";
        fullAnket +="\n<h2 "+ getCssH2()+">ТРЕБОВАНИЯ: </h2>\n";
        fullAnket +="<b>Требуемый язык программировании: </b>"+ inputs[4].value + "</br>\n";
        fullAnket +="<b>Набор технологий: </b>"+ inputs[5].value + "</br>\n";
        fullAnket +="<b>Доп. навыки: </b>"+ inputs[6].value + "</br>\n";
        fullAnket +="\n<h2 "+ getCssH2()+">КОНТАКТНАЯ ИНФОРМАЦИЯ:</h2>\n";
        fullAnket +="<b>E-mail: </b>"+ inputs[7].value + "</br>\n";
        fullAnket +="<b>Телефон: </b>"+ inputs[8].value + "</br>\n";
        fullAnket +="<b>ФИО рекрутера:</b> "+ inputs[9].value + "</br>\n";


        console.log("fullAnket",  fullAnket);
        /*alert("Анкета отправлена: \n" + fullAnket);*/
       /* saveToPC(fullAnket);*/
        var tema = "Анктеа от Рекрутера [" + inputs[0].value + "]";
        window.open('mailto:Georgiyelbaf@gmail.com?subject='+tema+'&body=' + fullAnket);

    })
       
    function countFullProgect(){
        /*Функиця для подсчета открытых проектов*/
        var articleGit =  $(".article-git");
       /* console.log("articleGit:", articleGit);*/
        var countFullProgect = articleGit.length;
   

        var articleNone =  $(".nonepr");  
        console.log("articleNone:", articleNone);    
        var countFullProgectN = articleNone.length;     

        return countFullProgect -countFullProgectN;
    }

    function prNoneFull(){
        /*Функция что бы скрыть все прокты */
       /* $('.article-git').hover(function () {
              $(this).addClass('nonepr');
        });*/
        $('.article-git').css('display', 'none');
        console.log("функция c добавлением none:");
    }
    function prAllFull(){    
        /*$(".nonepr").removeClass('nonepr');*/  
        $('.article-git').css('display', 'inline-block');
        console.log("функция c возвратом всех эл-тов:");
    }


    $("#count-progect").text(countFullProgect()); //Исправить кол-во проктов

    $('#prlang').on('change', function (e) {
        var optionSelected = $("option:selected", this);
        console.log("optionSelected:", optionSelected);
        var valueSelected = this.value;
        console.log("valueSelected:", valueSelected);

        var selectValprlang = $("#prlang option:selected").val();
        console.log("selectValprlang", selectValprlang);

        if(selectValprlang == "all"){          
            prAllFull();
            $("#count-progect").text( $(".article-git").length); //Исправить кол-во проктов
        }
        else if(selectValprlang == "cs"){       
            prNoneFull();      
            $('.cs').css('display', 'inline-block');
            $("#count-progect").text( $(".cs").length); //Исправить кол-во проктов
        }else if(selectValprlang == "cpp"){            
            prNoneFull();   
            $('.cpp').css('display', 'inline-block');  
            $("#count-progect").text( $(".cpp").length); //Исправить кол-во проктов
        }   
        else if(selectValprlang == "java"){            
            prNoneFull();   
            $('.java').css('display', 'inline-block');  
            $("#count-progect").text( $(".java").length); //Исправить кол-во проктов
        }  
        else if(selectValprlang == "python"){            
            prNoneFull();   
            $('.python').css('display', 'inline-block');  
            $("#count-progect").text( $(".python").length); //Исправить кол-во проктов
        }          
        else if(selectValprlang == "none"){      
            prNoneFull();
            $("#count-progect").text(0);
        }else if(selectValprlang == "top"){            
            prNoneFull();   
            $('.top').css('display', 'inline-block');  
            $("#count-progect").text( $(".top").length); //Исправить кол-во проктов
        } else if(selectValprlang == "web"){            
            prNoneFull();   
            $('.web').css('display', 'inline-block');  
            $("#count-progect").text( $(".web").length); //Исправить кол-во проктов
        } 
        else if(selectValprlang == "bd"){            
            prNoneFull();   
            $('.bd').css('display', 'inline-block');  
            $("#count-progect").text( $(".bd").length); //Исправить кол-во проктов
        } 
    });


   

        
});