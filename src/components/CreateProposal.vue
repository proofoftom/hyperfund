<template>
  <div class="flex flex-center column">
    <h2>Create a Proposal</h2>
    <q-field
      helper="Describe the potential outcome to be funded."
      :count="120"
    >
      <q-input
        type="textarea"
        float-label="Proposal"
        v-model="proposal"
      />
    </q-field>
    <q-btn class="q-mt-xl" label="Create Proposal" />
  </div>
</template>

<style>
</style>

<script>
export default {
  name: 'CreateProposal',
  data() {
    return {
      proposal: '',
    };
  },
};
</script>
