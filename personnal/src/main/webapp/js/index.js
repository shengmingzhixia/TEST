function checkNum(value,pageNo) {
    if(isNaN(value)){
        alert("请输入数字");
        return false;
    }
    if (value > pageNo || value <= 0){
        alert("超出页数范围，请重新输入！");
        return false;
    }
    return true;
}
