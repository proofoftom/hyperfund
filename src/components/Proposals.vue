<template>
  <div class="flex justify-center">
    <q-card
      inline
      v-for="proposal of proposals"
      :key="proposal['.key']"
      class="col-11 col-md-3 q-pa-lg q-ma-md"
    >
      <Proposal :proposal="proposal" />
    </q-card>
  </div>
</template>

<style scoped>

</style>

<script>
import { proposalsRef } from '../plugins/firebase';
import Proposal from './Proposal.vue';

export default {
  name: 'Proposals',
  firebase: {
    proposals: proposalsRef,
  },
  components: {
    Proposal,
  },
};
</script>
