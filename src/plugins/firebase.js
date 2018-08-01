import Vue from 'vue';
import VueFire from 'vuefire';
import { initializeApp } from 'firebase';

Vue.use(VueFire);

const app = initializeApp({
  apiKey: 'AIzaSyAg_SaAlEiUUUkI6dVnD4ReLzhFp3wV-J8',
  authDomain: 'dukes-crowdfund-app.firebaseapp.com',
  databaseURL: 'https://dukes-crowdfund-app.firebaseio.com',
  projectId: 'dukes-crowdfund-app',
  storageBucket: '',
  messagingSenderId: '425425298016',
});

export const db = app.database();
export const proposalsRef = db.ref('proposals');
