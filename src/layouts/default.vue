<template>
  <q-layout view="lHh Lpr lFf">
    <q-layout-header>
      <q-toolbar
        color="primary"
        :glossy="$q.theme === 'mat'"
        :inverted="$q.theme === 'ios'"
      >
        <q-btn
          flat
          dense
          round
          @click="leftDrawerOpen = !leftDrawerOpen"
          aria-label="Menu"
        >
          <q-icon name="menu" />
        </q-btn>

        <q-toolbar-title>
          <a href="/" style="text-decoration: none; color: white;">HyperFund</a>
          <div slot="subtitle">Quickly Fund Outcomes</div>
        </q-toolbar-title>

        <q-toolbar-title style="float: right; text-align: right;">
          Balance: Ξ {{ balance }} ETH
          <div slot="subtitle">Account: {{ account }}</div>
        </q-toolbar-title>
      </q-toolbar>
    </q-layout-header>

    <q-layout-drawer
      v-model="leftDrawerOpen"
      :content-class="$q.theme === 'mat' ? 'bg-grey-2' : null"
    >
      <q-list
        no-border
        link
        inset-delimiter
      >
        <q-list-header>Menu</q-list-header>
        <q-item to='/create'>
          <q-item-side icon="library_add" />
          <q-item-main label="Create Proposal"
            sublabel="Create a new proposal contract"
          />
        </q-item>
        <q-item to='/proposals'>
          <q-item-side icon="library_books" />
          <q-item-main label="View Proposals"
            sublabel="View all proposal contracts" />
        </q-item>
        <!-- <q-item to='/account'>
          <q-item-side icon="account_box" />
          <q-item-main label="Your Account"/>
        </q-item> -->
      </q-list>
    </q-layout-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import Web3 from 'web3';

const web3 = new Web3(window.web3.currentProvider);

export default {
  name: 'LayoutDefault',
  data() {
    return {
      leftDrawerOpen: this.$q.platform.is.desktop,
      account: 'Please connect to MetaMask',
      balance: 'Waiting to connect...',
    };
  },
  methods: {
    getAccount() {
      web3.eth.getAccounts().then((_accounts) => {
        [this.account] = _accounts;
      });
    },
    getBalance() {
      web3.eth.getBalance(this.account).then((_balance) => {
        const amountInEther = web3.utils.fromWei(_balance);
        this.balance = amountInEther;
      });
    },
  },
  watch: {
    // whenever question changes, this function will run
    account() {
      this.balance = 'Retrieving...';
      this.getBalance();
    },
  },
  mounted() {
    this.getAccount();
  },
};
</script>

<style>
</style>
