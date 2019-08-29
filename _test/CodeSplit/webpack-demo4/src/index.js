/**
 * Created by mapbar_front on 2019-08-26.
 */
function getId(id) {
    return document.getElementById(id)
}
getId("btn1").onclick = function () {
    require.ensure([],function () {
        let btn1 = require('./btn1.js');
        console.log(btn1);
        getId('box').innerHTML = btn1.text;
    }, function (error) {
        console.log(error)
    }, 'btn1')
}
getId("btn2").onclick = function () {
    require.ensure([], function () {
        let btn2 = require('./btn2.js');
        console.log(btn2);
        getId('box').innerHTML = btn2.text;
    }, 'btn2')
}
