/**
 * Created by mapbar_front on 2019-08-26.
 */
function getComponent() {
    return import(/* webpackChunkName: "lodash" */'lodash').then(_ => {
        var element = document.createElement('div');
        element.innerHTML = _.join(['Hello', 'webpack'], ' ');
        return element;
    }).catch(error => 'An error occurred while loading the component');
}
getComponent().then(component => {
    document.body.appendChild(component);
});
function getId(id) {
    return document.getElementById(id)
}
getId("btn1").onclick = function () {
    console.log("btn1")
    console.log('test');
    import(/* webpackChunkName: "common" */'./btn1.js').then(text => {
        console.log(text);
        getId("box").innerHTML = text.text;
    })
}
getId("btn2").onclick = function () {
    console.log("btn2")
    console.log('test2')
    import(/* webpackChunkName: "common" */'./btn2.js').then(text => {
        console.log(text);
        getId("box").innerHTML = text.text;
    })
}
