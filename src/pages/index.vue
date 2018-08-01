<template>
  <q-page class="flex flex-center column">
    <h3>HyperFund</h3>
    <h4>Quickly Fund Outcomes</h4>
    <ol style="text-align: center">
      <li>List your proposal and its potential outcomes.</li>
      <li>Funders race to vote in favor of one of the potential outcomes.</li>
      <li>
        When a proposal's funding cap is reached,
        the contract pays out in favor of the winning outcome.
      </li>
    </ol>
  </q-page>
</template>

<style scoped>
h3 {
  margin: 0;
}

li {
  line-height: 2em;
}
</style>

<script>
export default {
  name: 'PageIndex',
};
</script>
