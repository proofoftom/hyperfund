<template>
  <q-page class="flex flex-center column">
    <h3>HyperFund</h3>
    <h4>Quickly Fund Outcomes</h4>
    <ul style="text-align: center; list-style-type: none;">
      <li>List your proposal and its potential outcomes.</li>
      <li>Funders race to vote in favor of one of the potential outcomes.</li>
      <li>
        When a proposal's funding cap is reached,
        the contract pays out in favor of the winning outcome.
      </li>
    </ul>
  </q-page>
</template>

<style scoped>
h3 {
  margin: 0;
}

ul {
  padding: 0 1em;
}

li {
  margin-bottom: 1em;
}
</style>

<script>
export default {
  name: 'PageIndex',
};
</script>
