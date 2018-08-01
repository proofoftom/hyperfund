<template>
  <div v-if="proposal.edit">
    <textarea v-model="proposal.title"/>
    <q-slider
      v-model="proposal.amountFunded"
      :min="0"
      :max="8"
      :decimals="4"
      :step=".0001"
    />
    <p>Ξ {{ proposal.amountFunded }}</p>
    <q-btn @click="saveUpdateProposal(proposal)">Save</q-btn>
    <q-btn @click="cancelUpdateProposal(proposal['.key'])">Cancel</q-btn>
  </div>
  <div v-else>
    <q-card-title>{{ proposal.title }}</q-card-title>
    <q-slider
      v-model="proposal.amountFunded"
      @input="updateProposal(proposal['.key'])"
      :min="0"
      :max="8"
    />
    <p>Ξ {{ proposal.amountFunded }}</p>
    <q-btn @click="updateProposal(proposal['.key'])">Edit</q-btn>
    <q-btn @click="cancelProposal(proposal['.key'])">Delete</q-btn>
  </div>
</template>

<style>
  .q-btn {
    margin-right: 10px;
  }
</style>

<script>
import { proposalsRef } from '../plugins/firebase';

export default {
  name: 'Proposal',
  props: {
    proposal: Object,
  },
  methods: {
    cancelProposal(_key) {
      proposalsRef.child(_key).remove();
    },
    updateProposal(_key) {
      proposalsRef.child(_key).update({ edit: true });
    },
    cancelUpdateProposal(_key) {
      proposalsRef.child(_key).update({ edit: false });
    },
    saveUpdateProposal(_proposal) {
      const key = _proposal['.key'];
      proposalsRef.child(key).update({
        title: _proposal.title,
        amountFunded: _proposal.amountFunded,
        edit: false,
      });
    },
  },
};
</script>
