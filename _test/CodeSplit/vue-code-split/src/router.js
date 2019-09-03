/**
 * Created by mapbar_front on 2019-09-03.
 */
import Router from 'vue-router';
import Hello from './components/HelloWorld';

const router = new Router({
    routes: [
        {
            path: '/',
            name: 'Index',
            component: Hello
        },
    ]
})
