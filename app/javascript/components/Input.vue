<template>
  <div>
    <input
      :type="type"
      :class="[errors || errorMessage ? 'border-red-500' : 'border-teal-300', inputClass]"
      :value="value"
      @input="$emit('input', $event.target.value)"
      :name="name"
      ref="input"
    />
    <p class="text-red-600 text-sm text-center italic mb-1" v-for="error in errors">{{error}}</p>
  </div>
</template>

<script>
export default {
  props: {
    type: {
      type: String,
      default: "text"
    },
    inputClass: {
      type: String,
      default:
        "w-full h-8 p-1 text-md bg-gray-200 border-2 border-solid  rounded focus:outline-none"
    },
    value: [String, Number],
    name: String,
    errors: [String, Array],
    errorMessage: Boolean
  }
};
</script>
