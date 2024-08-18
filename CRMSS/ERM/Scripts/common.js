

function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + ((finalDate.getMonth() + 1) < 10 ? ("0" + (finalDate.getMonth() + 1)) : (finalDate.getMonth() + 1)) + '-' + finalDate.getDate();
}
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}
function nFormatter(num) {

    if (num >= 1000000000000) {
        return (num / 1000000000000).toFixed(1).replace(/\.0$/, '') + 'T';
    }
    else if (num >= 1000000000) {
        return (num / 1000000000).toFixed(1).replace(/\.0$/, '') + 'B';
    }
    else if (num >= 1000000) {
        return (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M';
    }
    else if (num >= 1000) {
        return (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
    }
    return num;
}
function removeSpace(str) {
    return str.replace(/ /g, '');
}

function numberWithCommas(number) {
    var parts = number.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}
function fixedtwo(num) {
    var new_num = parseFloat(num).toFixed(2);
    return new_num
}