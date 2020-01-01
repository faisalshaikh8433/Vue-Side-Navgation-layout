<template>
  <tr class="hover:bg-teal-200 font-bold">
    <td class="border px-4 py-2">{{ item.name }}</td>
    <td class="border px-4 py-2">{{ item.active ? "Yes" : "No" }}</td>
    <td class="border px-4 py-2">
      <router-link
        :to="`/items/edit/${item.id}`"
        class="p-2 rounded bg-blue-400 hover:bg-black hover:text-white font-bold"
      >Edit</router-link>
    </td>
    <td class="border px-4 py-2">
      <button
        class="p-2 rounded bg-red-400 hover:bg-black hover:text-white font-bold"
        @click="deleteItem"
      >Delete</button>
    </td>
  </tr>
</template>

<script>
import api from "../../api";
export default {
  props: ["item"],
  methods: {
    deleteItem() {
      if (confirm("Are sure you want to delete ?")) {
        api
          .delete(`api/v1/items/${this.item.id}`)
          .then(response => {
            if (response.data.success) {
              this.$emit("deleteItem");
            }
          })
          .catch(error => console.log(error.response.data.errors));
      }
    }
  }
};
</script>

<style scoped></style>
