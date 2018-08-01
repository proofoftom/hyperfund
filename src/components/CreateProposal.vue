<template>
  <div class="flex flex-center column">
    <h2>Create a Proposal</h2>
    <q-field helper="Name the potential outcome to be funded.">
      <q-input
        type="text"
        float-label="Title"
        v-model="title"
      />
    </q-field>
    <q-field
      helper="Describe the potential outcome to be funded."
      :count="120"
    >
      <q-input
        type="textarea"
        float-label="Proposal"
        v-model="description"
      />
    </q-field>
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
      description: '',
    };
  },
  methods: {
    createProposal() {
      proposalsRef.push({
        title: this.title,
        description: this.description,
        amountFunded: 0,
        edit: false,
      });
      this.$router.push('/proposals');
    },
  },
};
</script>
