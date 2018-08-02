<template>
  <div>
    <q-field helper="Title of the Proposal">
      <q-input
        type="text"
        float-label="Proposal"
        v-model="title"
      />
    </q-field>
    <q-field v-for="(outcome, index) of outcomes" :key="index"
      helper="Describe the potential outcome to be funded."
      :count="120"
    >
      <q-input
        type="textarea"
        float-label="Outcome"
        v-model="outcome.description"
      />
    </q-field>
    <q-btn class="q-mt-xl" label="Add Outcome" @click="addOutcome()" />
    <q-btn class="q-mt-xl" label="Create Proposal" @click="createProposal()" />
  </div>
</template>

<style>
</style>

<script>
import { proposalsRef } from '../plugins/firebase';

export default {
  name: 'CreateProposal',
  data() {
    return {
      title: '',
      outcomes: [
        {
          description: '',
          amountFunded: 0,
        },
      ],
    };
  },
  methods: {
    addOutcome() {
      this.outcomes.push({
        description: '',
        amountFunded: 0,
      });
    },
    createProposal() {
      proposalsRef.push({
        title: this.title,
        outcomes: this.outcomes,
        edit: false,
      });
      this.$router.push('/proposals');
    },
  },
};
</script>
