<template>
  <p class="text-red-600 text-sm italic text-center mb-1">{{ errorMessage }}</p>
</template>

<script>
export default {
  props: {
    errorMessage: String
  }
};
</script>

<style lang="scss" scoped></style>
