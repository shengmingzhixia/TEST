function checkPhone() {
    var phone = document.getElementById("phoneNow").value;
    var reg1 = /^[1-9]\d{10}$/;
    if (!reg1.test(phone)) {
        document.getElementById("td1").innerText = "请输入11位的电话号码";
        document.getElementById("td1").style.color = "red";
        $(".button1").attr("disabled", true);

    } else {
        document.getElementById("td1").innerText = ""
        $(".button1").removeAttr("disabled");
    }
}
function checkReceiverNull() {
    var receiver = document.getElementById("receiverNow").value;
    //var reg1 = /^[1-9]\d{10}$/;
    if (receiver == "") {
        document.getElementById("td0").innerText = "请输入你的收货人";
        document.getElementById("td0").style.color = "red";
        $(".button1").attr("disabled", true);

    } else {
        document.getElementById("td0").innerText = ""
        $(".button1").removeAttr("disabled");
    }
}
function checkAdressNull() {
    var address = document.getElementById("addressNow").value;
    //var reg1 = /^[1-9]\d{10}$/;
    if (address == "") {
        document.getElementById("td2").innerText = "请输入你的地址";
        document.getElementById("td2").style.color = "red";
        $(".button1").attr("disabled", true);

    } else {
        document.getElementById("td2").innerText = ""
        $(".button1").removeAttr("disabled");
    }
}