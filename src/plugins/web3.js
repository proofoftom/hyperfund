import Vue from 'vue';
import Web3 from 'web3';
import VueWeb3 from 'vue-web3';

Vue.use(VueWeb3, { web3: new Web3(web3.currentProvider) });
