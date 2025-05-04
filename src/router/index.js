import { createRouter, createWebHistory } from 'vue-router';
import Pagina1 from '../views/Pagina1.vue';

const routes = [
  { path: '/pagina1', component: Pagina1 }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
