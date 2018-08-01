<template>
  <q-page class="flex flex-center column">
    <h3>Create a Proposal</h3>
    <CreateProposal/>
  </q-page>
</template>

<style>
</style>

<script>
import CreateProposal from '../components/CreateProposal.vue';

export default {
  name: 'PageCreate',
  components: { CreateProposal },
};
</script>
