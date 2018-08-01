<template>
  <q-page class="flex flex-center column">
    <h3>Proposals</h3>
    <Proposals/>
  </q-page>
</template>

<style>
</style>

<script>
import Proposals from '../components/Proposals.vue';

export default {
  name: 'PageProposals',
  components: { Proposals },
};
</script>
